----------------------------------------------------------------------------
-- ETF BL
-- Wishbone I2C
-----------------------------------------------------------------------------
--
--    unit    name:                        register_block
--
--    description:
--
--              This is top-level entity.
--
-----------------------------------------------------------------------------
--    Copyright    (c)    ETF BL
-----------------------------------------------------------------------------
--    LICENSE    MIT License
-----------------------------------------------------------------------------
--    LICENSE    NOTICE
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--library altera;
--use altera.altera_syn_attributes.all;

use work.register_pkg.all;

entity register_block is
  generic
  (
    g_WIDTH      : natural := 32;
    g_ADDR_WIDTH : natural := 3;
    g_GPO_W      : natural := 8
  );
  port
  (
    clk_i           : in    std_logic;
    rst_i           : in    std_logic;
    stb_i           : in    std_logic;
    cyc_i           : in    std_logic;
    we_i            : in    std_logic;
    addr_i          : in    unsigned((g_ADDR_WIDTH - 1) downto 0);
    dat_i           : in    std_logic_vector((g_WIDTH - 1) downto 0);
    tx_buff_f_i     : in    std_logic;
    tx_buff_e_i     : in    std_logic;
    rx_buff_f_i     : in    std_logic;
    rx_buff_e_i     : in    std_logic;
    arb_lost_i      : in    std_logic;
    ack_res_flg_i   : in    std_logic;
    busy_flg_i      : in    std_logic;
    intr_flg_i      : in    std_logic;
    rx_data_i       : in    std_logic_vector(7 downto 0);
    ack_o           : out   std_logic;
    arb_lost_o      : out   std_logic;
    int_o           : out   std_logic;
    mode_o          : out   std_logic_vector(1 downto 0);
    strt_o          : out   std_logic;
    i2c_en_o        : out   std_logic;
    int_en_o        : out   std_logic;
    slv_addr_len_o  : out   std_logic;
    msl_o           : out   std_logic;
    tx_buff_wr_en_o : out   std_logic;
    rx_buff_rd_en_o : out   std_logic;
    rep_strt_o      : out   std_logic;
    clr_intr_o      : out   std_logic;
    tx_data_o       : out   std_logic_vector(7 downto 0);
    gpo_o           : out   std_logic_vector((g_GPO_W - 1) downto 0);
    slv_addr_o      : out   std_logic_vector(9 downto 0);
    sys_clk_o       : out   std_logic_vector((g_WIDTH - 1) downto 0);
    dat_o           : out   std_logic_vector((g_WIDTH - 1) downto 0)
  );
end register_block;

architecture arch of register_block is

  subtype t_word is std_logic_vector((g_WIDTH - 1) downto 0);
  type memory_t is array((2 ** g_ADDR_WIDTH - 1) downto 0) of t_word;
  signal ram : memory_t := (7 => c_50_MHz, others => (others => '0'));

begin

  -- Process
  process (clk_i, rst_i)
  begin
    if rst_i = '1' then

      ram(to_integer(c_REG_TX))   <= (others => '0');
      ram(to_integer(c_REG_RX))   <= (others => '0');
      ram(to_integer(c_REG_CTRL)) <= (0 => '1', others => '0');
      ram(to_integer(c_REG_STAT)) <= (others => '0');
      ram(to_integer(C_REG_CMD))  <= (others => '0');
      ram(to_integer(c_REG_SLVA)) <= (others => '0');
      ram(to_integer(c_REG_GPO))  <= (others => '0');
      ram(to_integer(c_REG_SYSC)) <= c_50_MHz;

      ack_o <= '0';

    elsif rising_edge(clk_i) then

      -- get data from rx buffer
      ram(to_integer(c_REG_RX))(t_DATA) <= rx_data_i;

      -- get status data from rx and tx buffer
      -- ram(c_REG_STAT)(7 downto 4) <= (rx_buff_e_i & rx_buff_f_i & tx_buff_e_i & tx_buff_f_i);
      ram(to_integer(c_REG_STAT))(c_RXB_E) <= rx_buff_e_i;
      ram(to_integer(c_REG_STAT))(c_RXB_F) <= rx_buff_f_i;
      ram(to_integer(c_REG_STAT))(c_TXB_E) <= tx_buff_e_i;
      ram(to_integer(c_REG_STAT))(c_TXB_F) <= tx_buff_f_i;
      ram(to_integer(c_REG_STAT))(c_IF)    <= intr_flg_i;
      ram(to_integer(c_REG_STAT))(c_BUSY)  <= busy_flg_i;
      ram(to_integer(c_REG_STAT))(c_ACK)   <= ack_res_flg_i;
      ram(to_integer(c_REG_STAT))(c_ARLO)  <= arb_lost_i;

      -- arbitration is lost
      -- go to slave mode
      if arb_lost_i = '1' then
        ram(to_integer(c_REG_CTRL))(c_MSL) <= '1';
      end if;

      ack_o <= '0';

      -- get interrupt data
      -- ram(c_REG_STAT)(3 downto 0) <= (intr_flg_i & busy_flg_i & ack_res_flg_i & arb_lost_i);

      -- write or read data from wishbone master side
      if stb_i = '1' then
        if we_i = '1' then
          ram(to_integer(addr_i)) <= dat_i;
        else
          dat_o <= ram(to_integer(addr_i));
        end if;

        ack_o <= '1';
      end if;
    end if;
  end process;

  -- write data to tx buffer
  -- write is completed if tx buffer write is enabled
  tx_data_o <= ram(to_integer(c_REG_TX))(t_DATA);

  -- sys clock register
  sys_clk_o <= ram(to_integer(c_REG_SYSC));

  -- select slave address
  with ram(to_integer(c_REG_CTRL))(c_ALEN) select
    slv_addr_o <= ("000" & ram(to_integer(c_REG_SLVA))(6 downto 0)) when '0',
                  ram(to_integer(c_REG_SLVA))(t_SLAVE_ADDR) when others;

  -- get flags from status register
  int_o      <= ram(to_integer(c_REG_STAT))(c_IF);
  -- ack_i2c_o  <= ram(c_REG_STAT)(c_ACK);
  arb_lost_o <= ram(to_integer(c_REG_STAT))(c_ARLO);

  -- control register signals
  i2c_en_o       <= ram(to_integer(c_REG_CTRL))(c_I2CEN);
  int_en_o       <= ram(to_integer(c_REG_CTRL))(c_IEN);
  slv_addr_len_o <= ram(to_integer(c_REG_CTRL))(c_ALEN);
  mode_o         <= ram(to_integer(c_REG_CTRL))(t_MODE);
  msl_o          <= ram(to_integer(c_REG_CTRL))(c_MSL);

  -- general purpose register
  gpo_o      <= ram(to_integer(c_REG_GPO))((g_GPO_W - 1) downto 0);

  -- command register signals
  strt_o <= ram(to_integer(c_REG_CMD))(c_STRT);
  tx_buff_wr_en_o <= '0' when ram(to_integer(c_REG_STAT))(c_TXB_F) = '1' else
                     ram(to_integer(c_REG_CMD))(c_TXB_WEN);
  rx_buff_rd_en_o <= '0' when ram(to_integer(c_REG_STAT))(c_RXB_E) = '1' else
                     ram(to_integer(c_REG_CMD))(c_RXB_REN);
  clr_intr_o <= ram(to_integer(c_REG_CMD))(c_IACK);
  rep_strt_o <= ram(to_integer(c_REG_CMD))(c_REP_ST);

end arch;
