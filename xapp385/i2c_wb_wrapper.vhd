library ieee;
  use ieee.std_logic_1164.all;

entity i2c_wb_wrapper is
    generic (
        I2C_ADDRESS : std_logic_vector(15 downto 0) := "0000000000000000";
        ADDR_WIDTH  : positive := 30;
        DATA_WIDTH  : positive := 8;
        GRANULARITY : positive := 8
    );
    port (
        sda   : inout std_logic;
        scl   : inout std_logic;

        irq   : out   std_logic;
        mcf   : inout std_logic;

        i_adr : in    std_logic_vector(29 downto 0); -- wishbone_addr_type;
        i_dat : in    std_logic_vector(31 downto 0); -- wishbone_data_type;
        --i_sel : in    std_logic_vector(DATA_WIDTH/GRANULARITY-1 downto 0);
        i_cyc : in    std_ulogic;
        i_stb : in    std_ulogic;
        i_we  : in    std_ulogic;

		--wishbone_out : out   wb_io_slave_out;
		o_dat : out   std_logic_vector(31 downto 0); -- wishbone_data_type;
        o_ack : out   std_ulogic;
        --o_stall : out   std_ulogic;

		dtack : out   std_logic;	-- data transfer acknowledge

		-- clock and reset
		clk   : in    std_logic;
		reset : in    std_logic

    );
end entity i2c_wb_wrapper;

architecture rtl of i2c_wb_wrapper is

    constant MBASE : std_logic_vector(15 downto 0) := I2C_ADDRESS;
    
    signal io_data_bus : std_logic_vector(7 downto 0);
    signal addr_bus    : std_logic_vector(23 downto 0);
    signal i_as        : std_logic;
    signal i_ds        : std_logic;
    signal i_r_w       : std_logic;

    signal wr_int      : std_logic;
    signal rd_int      : std_logic;

begin

    i2c_core : entity work.i2c 
    generic map (
        I2C_ADDRESS => I2C_ADDRESS
    )
    port map (
        clk      => clk,
        reset    => reset,
        sda      => sda,
        scl      => scl,
        irq      => irq,
        mcf      => mcf,
        dtack    => dtack,

        addr_bus => addr_bus,
        as       => i_as,
        data_bus => io_data_bus,
        ds       => i_ds,
        r_w      => i_r_w

    );

    addr_bus   <= i_adr(23 downto 0);
    rd_int     <= i_cyc and (i_stb and (not i_we));
    wr_int     <= i_cyc and (i_stb and i_we);

    process (reset, clk)
    begin
        if (reset = '1') then
            o_dat <= (others => '0');
            o_ack <= '0';
            i_as <= '1';
            i_ds <= '1';
            i_r_w <= '1';
        elsif rising_edge(clk) then
            if (i_adr(23 downto 8) = MBASE) then
                o_ack <= '1' when (dtack = '0') else '0';
                if (wr_int) then
                    io_data_bus <= i_dat(7 downto 0);
                    i_r_w <= '0';
                    i_as  <= '0';
                    i_ds  <= '0';
                end if;
                if (rd_int) then
                    i_r_w <= '1';
                    i_as  <= '1';
                    i_ds  <= '1';
                    o_dat(7 downto 0) <= io_data_bus;
                end if;
            else
                o_ack <= i_cyc and i_stb;
            end if;

        end if;
    end process;

end architecture;