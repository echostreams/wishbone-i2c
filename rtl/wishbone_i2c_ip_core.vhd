----------------------------------------------------------------------------
-- ETF BL
-- Wishbone I2C
-----------------------------------------------------------------------------
--
--    unit    name:                        wishbone i2c ip core
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

use work.register_pkg.all;

entity wishbone_i2c_ip_core is
  generic
  (
    g_WIDTH      : natural := 32;
    g_ADDR_WIDTH : natural := 3;
    g_GPO_W      : natural := 8;
    g_WIDTH_B    : natural := 8;
    g_DEPTH      : natural := 16
  );
  port
  (
    clk_i     : in    std_logic;
    rst_i     : in    std_logic;
    we_i      : in    std_logic;
    stb_i     : in    std_logic;
    cyc_i     : in    std_logic;
    addr_i    : in    unsigned((g_ADDR_WIDTH - 1) downto 0);
    data_i    : in    std_logic_vector((g_WIDTH - 1) downto 0);
    data_o    : out   std_logic_vector((g_WIDTH - 1) downto 0);
    ack_o     : out   std_logic;
    int_o     : out   std_logic;
    scl_b     : inout std_logic;
    sda_b     : inout std_logic;
    gpo_o     : out   std_logic_vector(g_GPO_W - 1 downto 0)
  );
end wishbone_i2c_ip_core;

architecture arch of wishbone_i2c_ip_core is

  -- REGISTER BLOCK
  component register_block is
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
      stb_i           : in    std_logic;
      cyc_i           : in    std_logic;
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
  end component;

  -- CLOCK GENERATOR
  component clock_generator
    port
    (
      clk_i    : in  std_logic;
      rst_i    : in  std_logic;
      enb_i    : in  std_logic;
      sel_i    : in  std_logic_vector(1 downto 0);
      sysclk_i : in  std_logic_vector(31 downto 0);
      clk_o    : out std_logic
    );
  end component;

  -- FIFO BUFFER
  component fifo_buffer is
    generic
    (
      g_WIDTH : natural := 8;
      g_DEPTH : natural := 16
    );
    port
    (
      clk_i        : in  std_logic;
      rst_i        : in  std_logic;
      wr_en_i      : in  std_logic;
      rd_en_i      : in  std_logic;
      data_i       : in  std_logic_vector((g_WIDTH - 1) downto 0);
      data_o       : out std_logic_vector((g_WIDTH - 1) downto 0);
      buff_full_o  : out std_logic;
      buff_empty_o : out std_logic
    );
  end component;

  -- INTERRUPT GENERATOR
  component interrupt_generator
    port
    (
      clk_i        : in  std_logic;
      arlo_i       : in  std_logic;
      int_ack_i    : in  std_logic;
      int_enbl_i   : in  std_logic;
      int_clr_i    : in  std_logic;
      int_o        : out std_logic
   );
  end component;

  -- TRANSACTION CONTROLLER
  component transaction_controller is
    port
    (
      clk_i          : in    std_logic;
      rst_i          : in    std_logic;
      enbl_i         : in    std_logic;
      rep_strt_i     : in    std_logic;
      slv_addr_len_i : in    std_logic;
      msl_sel_i      : in    std_logic;
      scl_i          : in    std_logic;
      tx_buff_e_i    : in    std_logic;
      rx_buff_f_i    : in    std_logic;
      i2c_start_i    : in    std_logic;
      slv_addr_i     : in    std_logic_vector(9 downto 0);
      tx_data_i      : in    std_logic_vector(7 downto 0);
      mode_i         : in    std_logic_vector(1 downto 0);
      sysclk_i       : in    std_logic_vector(31 downto 0);
      sda_b          : inout std_logic;
      tx_rd_enbl_o   : out   std_logic;
      rx_wr_enbl_o   : out   std_logic;
      rx_data_o      : out   std_logic_vector(7 downto 0);
      busy_flg_o     : out   std_logic;
      ack_flg_o      : out   std_logic;
      clk_enbl_o     : out   std_logic;
      arb_lost_flg_o : out   std_logic
    );
  end component transaction_controller;

  -- SIGNALS
  signal clk_enbl     : std_logic;
  signal sel_mode     : std_logic_vector(1 downto 0);
  signal sysclk       : std_logic_vector(31 downto 0);
  signal tx_wr_enbl   : std_logic;
  signal tx_data      : std_logic_vector(7 downto 0);
  signal tx_data_out  : std_logic_vector(7 downto 0);
  signal tx_full      : std_logic;
  signal tx_empty     : std_logic;
  signal rx_full      : std_logic;
  signal rx_empty     : std_logic;
  signal rx_read_enbl : std_logic;
  signal strobe       : std_logic;
  signal cyc_valid    : std_logic;
  signal rx_data_out  : std_logic_vector(7 downto 0);
  signal i2c_enbl     : std_logic;
  signal i2c_start    : std_logic;
  signal rep_start    : std_logic;
  signal addr_len     : std_logic;
  signal master_sel   : std_logic;
  signal slv_addr     : std_logic_vector(9 downto 0);
  signal tx_read_enbl : std_logic;
  signal rx_wr_enbl   : std_logic;
  signal rx_data      : std_logic_vector(7 downto 0);
  signal busy         : std_logic;
  signal ack          : std_logic;
  signal arb_lost     : std_logic;
  signal arb_lost_int : std_logic;
  -- signal ack_int      : std_logic;
  signal int_enbl     : std_logic;
  signal int_clear    : std_logic;
  signal interrupt    : std_logic;
  signal clk_dir      : std_logic;
  signal clk_out      : std_logic;

begin

  reg_block : register_block
    generic map
    (
      g_WIDTH      => g_WIDTH,
      g_ADDR_WIDTH => g_ADDR_WIDTH,
      g_GPO_W      => g_GPO_W
    )
    port map
    (
      clk_i           => clk_i,
      rst_i           => rst_i,
      we_i            => we_i,
      addr_i          => addr_i,
      dat_i           => data_i,
      tx_buff_f_i     => tx_full,
      tx_buff_e_i     => tx_empty,
      rx_buff_f_i     => rx_full,
      rx_buff_e_i     => rx_empty,
      arb_lost_i      => arb_lost,
      ack_res_flg_i   => ack,
      busy_flg_i      => busy,
      intr_flg_i      => interrupt,
      stb_i           => strobe,
      cyc_i           => cyc_valid,
      rx_data_i       => rx_data_out,
      ack_o           => ack_o,
      arb_lost_o      => arb_lost_int,
      int_o           => int_o,
      mode_o          => sel_mode,
      strt_o          => i2c_start,
      i2c_en_o        => i2c_enbl,
      int_en_o        => int_enbl,
      slv_addr_len_o  => addr_len,
      msl_o           => master_sel,
      tx_buff_wr_en_o => tx_wr_enbl,
      rx_buff_rd_en_o => rx_read_enbl,
      rep_strt_o      => rep_start,
      clr_intr_o      => int_clear,
      tx_data_o       => tx_data,
      gpo_o           => gpo_o,
      slv_addr_o      => slv_addr,
      sys_clk_o       => sysclk,
      dat_o           => data_o
    );

  clk_gen : clock_generator
    port map (
      clk_i    => clk_i,
      rst_i    => rst_i,
      enb_i    => clk_enbl,
      sel_i    => sel_mode,
      sysclk_i => sysclk,
      clk_o    => clk_out
    );

  -- TX BUFFER
  tx_buff : fifo_buffer
    generic map (
      g_WIDTH => g_WIDTH_B,
      g_DEPTH => g_DEPTH
    )
    port map (
      clk_i        => clk_i,
      rst_i        => rst_i,
      wr_en_i      => tx_wr_enbl,
      rd_en_i      => tx_read_enbl,
      data_i       => tx_data,
      data_o       => tx_data_out,
      buff_full_o  => tx_full,
      buff_empty_o => tx_empty
    );

  -- RX BUFFER
  rx_buff : fifo_buffer
    generic map (
      g_WIDTH => g_WIDTH_B,
      g_DEPTH => g_DEPTH
    )
    port map (
      clk_i        => clk_i,
      rst_i        => rst_i,
      wr_en_i      => rx_wr_enbl,
      rd_en_i      => rx_read_enbl,
      data_i       => rx_data,
      data_o       => rx_data_out,
      buff_full_o  => rx_full,
      buff_empty_o => rx_empty
    );


  tran_contr : transaction_controller
    port map
    (
      clk_i          => clk_i,
      rst_i          => rst_i,
      enbl_i         => i2c_enbl,
      rep_strt_i     => rep_start,
      slv_addr_len_i => addr_len,
      msl_sel_i      => master_sel,
      scl_i          => clk_dir,
      tx_buff_e_i    => tx_empty,
      rx_buff_f_i    => rx_full,
      i2c_start_i    => i2c_start,
      slv_addr_i     => slv_addr,
      tx_data_i      => tx_data_out,
      mode_i         => sel_mode,
      sysclk_i       => sysclk,
      sda_b          => sda_b,
      tx_rd_enbl_o   => tx_read_enbl,
      rx_wr_enbl_o   => rx_wr_enbl,
      rx_data_o      => rx_data,
      busy_flg_o     => busy,
      ack_flg_o      => ack,
      clk_enbl_o     => clk_enbl,
      arb_lost_flg_o => arb_lost
    );

  int_gen : interrupt_generator
    port map
    (
      clk_i        => clk_i,
      arlo_i       => arb_lost_int,
      int_ack_i    => ack,
      int_enbl_i   => int_enbl,
      int_clr_i    => int_clear,
      int_o        => interrupt
   );

  strobe    <= stb_i;
  cyc_valid <= cyc_i;

  clk_dir <= clk_out when master_sel = '0' else
             scl_b;

  scl_b  <= clk_out when master_sel = '0' else
            'H';

end arch;
