---------------------------------------------------------------------------------------
-- Title : Wishbone slave core for i2c
---------------------------------------------------------------------------------------
-- File  : i2c_wishbone_controller.vhd

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library work;
  use work.wishbone_types.all;

/*
package i2c_wb_pkg is
-- Input registers (user design -> WB slave)
  
type t_lbk_in_registers is record
    dmac_l_i                                 : std_logic_vector(31 downto 0);
    dmac_h_i                                 : std_logic_vector(15 downto 0);
    rcv_cnt_i                                : std_logic_vector(31 downto 0);
    drp_cnt_i                                : std_logic_vector(31 downto 0);
    fwd_cnt_i                                : std_logic_vector(31 downto 0);
end record;
  
 
    -- Output registers (WB slave -> user design)
    
    type t_lbk_out_registers is record
      mcr_ena_o                                : std_logic;
      mcr_clr_o                                : std_logic;
      mcr_fdmac_o                              : std_logic;
      dmac_l_o                                 : std_logic_vector(31 downto 0);
      dmac_l_load_o                            : std_logic;
      dmac_h_o                                 : std_logic_vector(15 downto 0);
      dmac_h_load_o                            : std_logic;
      rcv_cnt_o                                : std_logic_vector(31 downto 0);
      rcv_cnt_load_o                           : std_logic;
      drp_cnt_o                                : std_logic_vector(31 downto 0);
      drp_cnt_load_o                           : std_logic;
      fwd_cnt_o                                : std_logic_vector(31 downto 0);
      fwd_cnt_load_o                           : std_logic;
    end record;
end package;

package body i2c_wb_pkg is

end package body;

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library work;
  use work.i2c_wb_pkg.all;
*/

entity i2c_wishbone_controller is
  generic (
    UC_ADDRESS  : std_logic_vector(15 downto 0):= "0000000000000000";
    ADDR_WIDTH  : positive := 32;  -- Determines the size of the RAM (num. of words = 2**ADR_WIDTH)
    DATA_WIDTH  : positive := 32;  -- Must be a multiple of GRANULARITY
    GRANULARITY : positive :=  8   -- Usually 8 (for byte granularity) 
  );
  port (
    rst_n_i    : in    std_logic;
    clk_sys_i  : in    std_logic;
    wb_adr_i   : in    std_logic_vector((ADDR_WIDTH - 1) downto 0);
    wb_dat_i   : in    std_logic_vector((DATA_WIDTH - 1) downto 0);
    wb_dat_o   : out   std_logic_vector((DATA_WIDTH - 1) downto 0);
    wb_cyc_i   : in    std_logic;
    wb_sel_i   : in    std_logic_vector(3 downto 0);
    wb_stb_i   : in    std_logic;
    wb_we_i    : in    std_logic;
    wb_ack_o   : out   std_logic;
    wb_stall_o : out   std_logic;

    irq        : out   std_logic;
    dtack      : out   std_logic;

    -- Internal I2C Bus Registers
    -- Address Register (Contains slave address)
    madr       : inout std_logic_vector(7 downto 0);

    -- Control Register		
		men      : inout std_logic;  -- I2C Enable bit
		mien     : inout std_logic;	-- interrupt enable
		msta     : inout std_logic;	-- Master/Slave bit
		mtx      : inout std_logic;	-- Master read/write
		txak     : inout std_logic;	-- acknowledge bit
		rsta     : inout std_logic;	-- repeated start
	
		mbcr_wr  : out   std_logic;	-- indicates that the control reg has been written
		rsta_rst : in    std_logic;	-- resets the repeated start bit in the control register

    -- Status Register
		mcf           : in    std_logic;	-- end of data transfer
		maas          : in    std_logic;	-- addressed as slave
		mbb           : in    std_logic;	-- bus busy
		mal           : in    std_logic;	-- arbitration lost
		-- 
		srw           : in    std_logic;	-- slave read/write
		mif           : in    std_logic;	-- interrupt pending
		rxak          : in    std_logic;	-- received acknowledge

		mal_bit_reset : out   std_logic;	-- indicates that the MAL bit should be reset
		mif_bit_reset : out   std_logic;	-- indicates that the MIF bit should be reset
		msta_rst	    : in    std_logic;	-- resets the MSTA bit if arbitration is lost

    -- Data Register
		mbdr_micro    : inout std_logic_vector(7 downto 0);
		mbdr_i2c      : in    std_logic_vector(7 downto 0);

		mbdr_read     : out   std_logic --;

    --regs_i   : in     t_lbk_in_registers;
    --regs_o   : out    t_lbk_out_registers
  );
end i2c_wishbone_controller;

architecture syn of i2c_wishbone_controller is

signal lbk_mcr_ena_int   : std_logic;
signal lbk_mcr_clr_dly0  : std_logic;
signal lbk_mcr_clr_int   : std_logic;
signal lbk_mcr_fdmac_int : std_logic;
signal ack_sreg          : std_logic_vector(9 downto 0);
signal rddata_reg        : std_logic_vector((DATA_WIDTH - 1) downto 0);
signal wrdata_reg        : std_logic_vector((DATA_WIDTH - 1) downto 0);
signal bwsel_reg         : std_logic_vector(3 downto 0);
signal rwaddr_reg        : std_logic_vector((ADDR_WIDTH - 1) downto 0);
signal ack_in_progress   : std_logic;
signal wr_int            : std_logic;
signal rd_int            : std_logic;
signal allones           : std_logic_vector((DATA_WIDTH - 1) downto 0);
signal allzeros          : std_logic_vector((DATA_WIDTH - 1) downto 0);

-- Constant Declarations
constant RESET_ACTIVE : std_logic := '1';

begin
-- Some internal signals assignments. For (foreseen) compatibility with other bus standards.
  wrdata_reg <= wb_dat_i;
  bwsel_reg  <= wb_sel_i;
  rd_int     <= wb_cyc_i and (wb_stb_i and (not wb_we_i));
  wr_int     <= wb_cyc_i and (wb_stb_i and wb_we_i);
  allones    <= (others => '1');
  allzeros   <= (others => '0');
-- 
-- Main register bank access process.
  process (clk_sys_i, rst_n_i)
  begin
    if (rst_n_i = RESET_ACTIVE) then 
      ack_sreg <= "0000000000";
      ack_in_progress <= '0';
      rddata_reg <= "00000000000000000000000000000000";
      lbk_mcr_ena_int <= '0';
      lbk_mcr_clr_int <= '0';
      lbk_mcr_fdmac_int <= '0';
      --regs_o.dmac_l_load_o  <= '0';
      --regs_o.dmac_h_load_o  <= '0';
      --regs_o.rcv_cnt_load_o <= '0';
      --regs_o.drp_cnt_load_o <= '0';
      --regs_o.fwd_cnt_load_o <= '0';
      -- Address Register
      madr    <= (others => '0');
      -- Control Register
      men     <= '0';
			mien    <= '0';
			msta    <= '0';
			mtx     <= '0';
			txak    <= '0';
			rsta    <= '0';
      mbcr_wr <= '0';
      -- Status Register
			mal_bit_reset <= '0';
			mif_bit_reset <= '0';
      -- Data Register
			mbdr_micro <= (others => '0');
			mbdr_read  <= '0';
    elsif rising_edge(clk_sys_i) then
      -- advance the ACK generator shift register
      ack_sreg(8 downto 0) <= ack_sreg(9 downto 1);
      ack_sreg(9) <= '0';
      if (ack_in_progress = '1') then
        if (ack_sreg(0) = '1') then
          lbk_mcr_clr_int <= '0';
          mbcr_wr <= '0';
          --regs_o.dmac_l_load_o  <= '0';
          --regs_o.dmac_h_load_o  <= '0';
          --regs_o.rcv_cnt_load_o <= '0';
          --regs_o.drp_cnt_load_o <= '0';
          --regs_o.fwd_cnt_load_o <= '0';
          ack_in_progress       <= '0';
        else
          --regs_o.dmac_l_load_o  <= '0';
          --regs_o.dmac_h_load_o  <= '0';
          --regs_o.rcv_cnt_load_o <= '0';
          --regs_o.drp_cnt_load_o <= '0';
          --regs_o.fwd_cnt_load_o <= '0';
        end if;
      else
        if ((wb_cyc_i = '1') and (wb_stb_i = '1')) then
          case rwaddr_reg(2 downto 0) is
          when "000" =>

            -- Address Register (MADR) 
            if (wb_we_i = '1') then
              lbk_mcr_ena_int   <= wrdata_reg(0);
              lbk_mcr_clr_int   <= wrdata_reg(1);
              lbk_mcr_fdmac_int <= wrdata_reg(2);
              madr <= wrdata_reg(7 downto 1) & '0';
            end if;
            --rddata_reg(0)  <= lbk_mcr_ena_int;
            --rddata_reg(1)  <= '0';
            --rddata_reg(2)  <= lbk_mcr_fdmac_int;
            --rddata_reg(3)  <= 'X';
            --rddata_reg(4)  <= 'X';
            --rddata_reg(5)  <= 'X';
            --rddata_reg(6)  <= 'X';
            --rddata_reg(7)  <= 'X';
            rddata_reg(7 downto 0) <= madr;
            /*
            rddata_reg(8)  <= 'X';
            rddata_reg(9)  <= 'X';
            rddata_reg(10) <= 'X';
            rddata_reg(11) <= 'X';
            rddata_reg(12) <= 'X';
            rddata_reg(13) <= 'X';
            rddata_reg(14) <= 'X';
            rddata_reg(15) <= 'X';
            rddata_reg(16) <= 'X';
            rddata_reg(17) <= 'X';
            rddata_reg(18) <= 'X';
            rddata_reg(19) <= 'X';
            rddata_reg(20) <= 'X';
            rddata_reg(21) <= 'X';
            rddata_reg(22) <= 'X';
            rddata_reg(23) <= 'X';
            rddata_reg(24) <= 'X';
            rddata_reg(25) <= 'X';
            rddata_reg(26) <= 'X';
            rddata_reg(27) <= 'X';
            rddata_reg(28) <= 'X';
            rddata_reg(29) <= 'X';
            rddata_reg(30) <= 'X';
            rddata_reg(31) <= 'X';
            */
            --ack_sreg(2)    <= '1';
            ack_sreg(0)     <= '1';
            ack_in_progress <= '1';
          
          when "001" => 

            -- Control Register (MBCR)
            if (wb_we_i = '1') then
              --regs_o.dmac_l_load_o <= '1';
              mbcr_wr <= '1';
              men     <= wrdata_reg(7);
			        mien    <= wrdata_reg(6);
			        msta    <= wrdata_reg(5);
			        mtx     <= wrdata_reg(4);
			        txak    <= wrdata_reg(3);
			        rsta    <= wrdata_reg(2);
            else
              mbcr_wr <= '0';
            end if;
            --rddata_reg(31 downto 0) <= regs_i.dmac_l_i;
            rddata_reg(7 downto 0) <= men & mien & msta & mtx & 
                                      txak & rsta & "0" & "0";
            ack_sreg(0) <= '1';
            ack_in_progress <= '1';
          when "010" => 

            -- Status Register (MBSR)
            if (wb_we_i = '1') then
              --regs_o.dmac_h_load_o <= '1';
              -- uC write to these bits generates a reset
              if (wrdata_reg(4) = '0') then
                mal_bit_reset <= '1';
              end if;
              if (wrdata_reg(1) = '0') then
                mif_bit_reset <= '1';
              end if;
            else
              mal_bit_reset <= '0';
			        mif_bit_reset <= '0';
            end if;
            /*
            rddata_reg(15 downto 0) <= regs_i.dmac_h_i;
            rddata_reg(16) <= 'X';
            rddata_reg(17) <= 'X';
            rddata_reg(18) <= 'X';
            rddata_reg(19) <= 'X';
            rddata_reg(20) <= 'X';
            rddata_reg(21) <= 'X';
            rddata_reg(22) <= 'X';
            rddata_reg(23) <= 'X';
            rddata_reg(24) <= 'X';
            rddata_reg(25) <= 'X';
            rddata_reg(26) <= 'X';
            rddata_reg(27) <= 'X';
            rddata_reg(28) <= 'X';
            rddata_reg(29) <= 'X';
            rddata_reg(30) <= 'X';
            rddata_reg(31) <= 'X';
            */
            rddata_reg(7 downto 0) <= mcf & maas & mbb & mal & 
                                      "0" & srw & mif & rxak;
            ack_sreg(0) <= '1';
            ack_in_progress <= '1';
          when "011" =>
          
            -- Data Register (MBDR)
            if (wb_we_i = '1') then
              --regs_o.rcv_cnt_load_o <= '1';
              mbdr_read <= '0';
              mbdr_micro <= wrdata_reg(7 downto 0);
            else
              mbdr_read <= '1';
            end if;
            --rddata_reg(31 downto 0) <= regs_i.rcv_cnt_i;
            rddata_reg(7 downto 0) <= mbdr_i2c;
            ack_sreg(0) <= '1';
            ack_in_progress <= '1';
                    
          when others =>
-- prevent the slave from hanging the bus on invalid address
            ack_in_progress <= '1';
            ack_sreg(0) <= '1';
          end case;
        end if; -- wb_cyc_i and wb_stb_i
      end if; -- ack_in_progress

      -- if arbitration is lost, the I2C Control component will generate a reset for the
		  -- MSTA bit to force the design to slave mode 
		  -- will do this reset synchronously

		  if (msta_rst = '1') then
          msta <= '0';
      end if;
  
      if (rsta_rst = '1') then
          rsta <= '0';
      end if;

    end if; -- reset
  end process;
  
  
-- Drive the data output bus
  wb_dat_o <= rddata_reg;
-- Enable Loopback
  --regs_o.mcr_ena_o <= lbk_mcr_ena_int;
-- Clear counters
  process (clk_sys_i, rst_n_i)
  begin
    if (rst_n_i = RESET_ACTIVE) then 
      lbk_mcr_clr_dly0 <= '0';
      --regs_o.mcr_clr_o <= '0';
    elsif rising_edge(clk_sys_i) then
      lbk_mcr_clr_dly0 <= lbk_mcr_clr_int;
      --regs_o.mcr_clr_o <= lbk_mcr_clr_int and (not lbk_mcr_clr_dly0);
    end if;
  end process;
  
  
-- Force DMAC
  --regs_o.mcr_fdmac_o <= lbk_mcr_fdmac_int;
-- MAC
  --regs_o.dmac_l_o <= wrdata_reg(31 downto 0);
-- MAC
  --regs_o.dmac_h_o <= wrdata_reg(15 downto 0);
-- Value
  --regs_o.rcv_cnt_o <= wrdata_reg(31 downto 0);
-- Value
  --regs_o.drp_cnt_o <= wrdata_reg(31 downto 0);
-- Value
  --regs_o.fwd_cnt_o <= wrdata_reg(31 downto 0);

  rwaddr_reg <= wb_adr_i;
  wb_stall_o <= (not ack_sreg(0)) and (wb_stb_i and wb_cyc_i);
-- ACK signal generation. Just pass the LSB of ACK counter.
  wb_ack_o <= ack_sreg(0);

  dtack <= (not ack_sreg(0));

end syn;
