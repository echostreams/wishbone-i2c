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

library uvvm_util;
use uvvm_util.types_pkg.all;
use uvvm_util.global_signals_and_shared_variables_pkg.all;
use uvvm_util.hierarchy_linked_list_pkg.all;
use uvvm_util.string_methods_pkg.all;
use uvvm_util.adaptations_pkg.all;
use uvvm_util.methods_pkg.all;
use uvvm_util.bfm_common_pkg.all;
use uvvm_util.alert_hierarchy_pkg.all;
use uvvm_util.license_pkg.all;
use uvvm_util.protected_types_pkg.all;
use uvvm_util.rand_pkg.all;
use uvvm_util.func_cov_pkg.all;

library uvvm_vvc_framework;
use uvvm_vvc_framework.ti_vvc_framework_support_pkg.all;

library bitvis_vip_i2c;
use bitvis_vip_i2c.i2c_bfm_pkg.all;

library bitvis_vip_wishbone;
use bitvis_vip_wishbone.wishbone_bfm_pkg.all;

library bitvis_vip_clock_generator;
use bitvis_vip_clock_generator.vvc_methods_pkg.all;

entity wishbone_i2c_ip_core_th is
  port
  (
    int_o : out std_logic
  );
end wishbone_i2c_ip_core_th;

architecture arch of wishbone_i2c_ip_core_th is

  constant c_WIDTH      : natural := 32;
  constant c_ADDR_WIDTH : natural := 3;
  constant c_GPO_W      : natural := 8;
  constant c_WIDTH_B    : natural := 8;
  constant c_DEPTH      : natural := 16;

  constant c_CLK_PERIOD : time    := 20 ns;
  constant c_CLOCK_GEN  : natural := 1;

  constant c_SLAVE_ADDRESS        : unsigned(9 downto 0) := "0001110001";
  constant c_SLAVE_ADDRESS_10_BIT : unsigned(9 downto 0) := "1100100110";

  constant c_BIT_TIME : time := 10 us;
  -- constant c_BIT_TIME : time := 2500 ns;
  -- constant c_BIT_TIME : time := 1 us;

  -- Define value for the Wishbone BFM config
  constant c_WISHBONE_BFM_CONFIG : t_wishbone_bfm_config := (
    max_wait_cycles             => 10,
    max_wait_cycles_severity    => failure,
    clock_period                => c_CLK_PERIOD,
    clock_period_margin         => 0 ns,
    clock_margin_severity       => TB_ERROR,
    setup_time                  => 1 ns,
    hold_time                   => 1 ns,
    match_strictness            => MATCH_EXACT,
    id_for_bfm                  => ID_BFM,
    id_for_bfm_wait             => ID_BFM_WAIT,
    id_for_bfm_poll             => ID_BFM_POLL
  );

  -- Define value for the I2C Slave BFM config 7-bit address
  constant c_I2C_BFM_CONFIG_7_BIT : t_i2c_bfm_config := (
    enable_10_bits_addressing       => false,
    master_sda_to_scl               => 5 us,
    master_scl_to_sda               => 5 us,
    master_stop_condition_hold_time => 5 us,
    max_wait_scl_change             => 10 ms,
    max_wait_scl_change_severity    => warning,
    max_wait_sda_change             => 10 ms,
    max_wait_sda_change_severity    => warning,
    i2c_bit_time                    => c_BIT_TIME,
    i2c_bit_time_severity           => failure,
    acknowledge_severity            => failure,
    slave_mode_address              => c_SLAVE_ADDRESS,
    slave_mode_address_severity     => failure,
    slave_rw_bit_severity           => failure,
    reserved_address_severity       => warning,
    match_strictness                => MATCH_EXACT,
    id_for_bfm                      => ID_BFM,
    id_for_bfm_wait                 => ID_BFM_WAIT,
    id_for_bfm_poll                 => ID_BFM_POLL
  );

  -- Define value for the I2C Slave BFM config 10-bit address
  constant c_I2C_BFM_CONFIG_10_BIT : t_i2c_bfm_config := (
    enable_10_bits_addressing       => true,
    master_sda_to_scl               => 5 us,
    master_scl_to_sda               => 5 us,
    master_stop_condition_hold_time => 5 us,
    max_wait_scl_change             => 10 ms,
    max_wait_scl_change_severity    => warning,
    max_wait_sda_change             => 10 ms,
    max_wait_sda_change_severity    => warning,
    i2c_bit_time                    => c_BIT_TIME,
    i2c_bit_time_severity           => failure,
    acknowledge_severity            => failure,
    slave_mode_address              => c_SLAVE_ADDRESS_10_BIT,
    slave_mode_address_severity     => failure,
    slave_rw_bit_severity           => failure,
    reserved_address_severity       => warning,
    match_strictness                => MATCH_EXACT,
    id_for_bfm                      => ID_BFM,
    id_for_bfm_wait                 => ID_BFM_WAIT,
    id_for_bfm_poll                 => ID_BFM_POLL
  );

  -- Define value for the I2C Master BFM config 7-bit address
  constant c_I2C_BFM_CONFIG_MASTER_7_BIT : t_i2c_bfm_config := (
    enable_10_bits_addressing       => false,
    master_sda_to_scl               => 2500 ns,
    master_scl_to_sda               => 1 us,
    master_stop_condition_hold_time => 1 us,
    max_wait_scl_change             => 1 ms,
    max_wait_scl_change_severity    => warning,
    max_wait_sda_change             => 1 ms,
    max_wait_sda_change_severity    => warning,
    i2c_bit_time                    => c_BIT_TIME,
    i2c_bit_time_severity           => failure,
    acknowledge_severity            => warning, -- failure,
    slave_mode_address              => c_SLAVE_ADDRESS,
    slave_mode_address_severity     => failure,
    slave_rw_bit_severity           => failure,
    reserved_address_severity       => warning,
    match_strictness                => MATCH_EXACT,
    id_for_bfm                      => ID_BFM,
    id_for_bfm_wait                 => ID_BFM_WAIT,
    id_for_bfm_poll                 => ID_BFM_POLL
  );

  -- Define value for the I2C Master BFM config 10-bit address
  constant c_I2C_BFM_CONFIG_MASTER_10_BIT : t_i2c_bfm_config := (
    enable_10_bits_addressing       => true,
    master_sda_to_scl               => 1 us,
    master_scl_to_sda               => 1 us,
    master_stop_condition_hold_time => 1 us,
    max_wait_scl_change             => 1 ms,
    max_wait_scl_change_severity    => warning,
    max_wait_sda_change             => 1 ms,
    max_wait_sda_change_severity    => warning,
    i2c_bit_time                    => c_BIT_TIME,
    i2c_bit_time_severity           => failure,
    acknowledge_severity            => failure,
    slave_mode_address              => c_SLAVE_ADDRESS,
    slave_mode_address_severity     => failure,
    slave_rw_bit_severity           => failure,
    reserved_address_severity       => warning,
    match_strictness                => MATCH_EXACT,
    id_for_bfm                      => ID_BFM,
    id_for_bfm_wait                 => ID_BFM_WAIT,
    id_for_bfm_poll                 => ID_BFM_POLL
  );

  signal clk_test    : std_logic;
  signal rst_test    : std_logic;
  signal we_test     : std_logic;
  signal addr_test   : std_logic_vector((c_ADDR_WIDTH - 1) downto 0);
  signal addr_test_u : unsigned((c_ADDR_WIDTH - 1) downto 0);
  signal data_i_test : std_logic_vector((c_WIDTH - 1) downto 0);
  signal data_o_test : std_logic_vector((c_WIDTH - 1) downto 0);
  signal stb_test    : std_logic;
  signal cyc_test    : std_logic;
  signal ack_test    : std_logic;
  signal int_test    : std_logic;
  signal scl_test    : std_logic;
  signal sda_test    : std_logic;
  signal gpo_test    : std_logic_vector(c_GPO_W - 1 downto 0);

begin

  -----------------------------------------------------------------------------
  -- Instantiate the concurrent procedure that initializes UVVM
  -----------------------------------------------------------------------------
  i_ti_uvvm_engine : entity uvvm_vvc_framework.ti_uvvm_engine;

  addr_test_u <= unsigned(addr_test);

  int_o <= int_test;

  -----------------------------------------------------------------------------
  -- Wishbone I2C IP Core
  -----------------------------------------------------------------------------
  i_wishbone_i2c_ip_core : entity work.wishbone_i2c_ip_core
    generic map
    (
      g_WIDTH      => c_WIDTH,
      g_ADDR_WIDTH => c_ADDR_WIDTH,
      g_GPO_W      => c_GPO_W,
      g_WIDTH_B    => c_WIDTH_B,
      g_DEPTH      => c_DEPTH
    )
    port map
    (
      clk_i     => clk_test,
      rst_i     => rst_test,
      we_i      => we_test,
      stb_i     => stb_test,
      cyc_i     => cyc_test,
      addr_i    => addr_test_u,
      data_i    => data_i_test,
      data_o    => data_o_test,
      ack_o     => ack_test,
      int_o     => int_test,
      scl_b     => scl_test,
      sda_b     => sda_test,
      gpo_o     => gpo_test
    );

  -----------------------------------------------------------------------------
  -- Wishbone
  -----------------------------------------------------------------------------
  i1_wishbone_vvc : entity bitvis_vip_wishbone.wishbone_vvc
    generic map
    (
      Gc_ADDR_WIDTH          => c_ADDR_WIDTH,
      GC_DATA_WIDTH          => c_WIDTH,
      Gc_WISHBONE_BFM_CONFIG => c_WISHBONE_BFM_CONFIG
    )
    port map
    (
      clk                          => clk_test,
      wishbone_vvc_master_if.dat_i => data_o_test,
      wishbone_vvc_master_if.ack_i => ack_test,
      wishbone_vvc_master_if.adr_o => addr_test,
      wishbone_vvc_master_if.dat_o => data_i_test,
      wishbone_vvc_master_if.we_o  => we_test,
      wishbone_vvc_master_if.cyc_o => cyc_test,
      wishbone_vvc_master_if.stb_o => stb_test
    );

  -----------------------------------------------------------------------------
  -- I2C
  -----------------------------------------------------------------------------
  -- 7-bit slave
  i1_i2c_vvc_slave : entity bitvis_vip_i2c.i2c_vvc
    generic map
    (
      GC_INSTANCE_IDX => 1,
      GC_MASTER_MODE  => false,
      Gc_I2C_CONFIG   => c_I2C_BFM_CONFIG_7_BIT
    )
    port map
    (
      i2c_vvc_if.scl => scl_test,
      i2c_vvc_if.sda => sda_test
    );

  -- 10-bit slave
  i2_i2c_vvc_slave : entity bitvis_vip_i2c.i2c_vvc
    generic map
    (
      GC_INSTANCE_IDX => 2,
      GC_MASTER_MODE  => false,
      Gc_I2C_CONFIG   => c_I2C_BFM_CONFIG_10_BIT
    )
    port map
    (
      i2c_vvc_if.scl => scl_test,
      i2c_vvc_if.sda => sda_test
    );

  -- 7-bit master
  i1_i2c_vvc_master : entity bitvis_vip_i2c.i2c_vvc
    generic map
    (
      GC_INSTANCE_IDX => 3,
      GC_MASTER_MODE  => true,
      Gc_I2C_CONFIG   => c_I2C_BFM_CONFIG_MASTER_7_BIT
    )
    port map
    (
      i2c_vvc_if.scl => scl_test,
      i2c_vvc_if.sda => sda_test
    );

  -- 10-bit master
  i2_i2c_vvc_master : entity bitvis_vip_i2c.i2c_vvc
    generic map
    (
      GC_INSTANCE_IDX => 4,
      GC_MASTER_MODE  => true,
      Gc_I2C_CONFIG   => c_I2C_BFM_CONFIG_MASTER_10_BIT
    )
    port map
    (
      i2c_vvc_if.scl => scl_test,
      i2c_vvc_if.sda => sda_test
    );


  -----------------------------------------------------------------------------
  -- Clock Generator VVC
  -----------------------------------------------------------------------------
  i_clock_generator_vvc : entity bitvis_vip_clock_generator.clock_generator_vvc
    generic map
    (
      GC_INSTANCE_IDX    => c_CLOCK_GEN,
      GC_CLOCK_NAME      => "Clock",
      GC_CLOCK_PERIOD    => c_CLK_PERIOD,
      GC_CLOCK_HIGH_TIME => c_CLK_PERIOD / 2
    )
    port map
    (
      clk => clk_test
    );

  rst_test <= '1', '0' after (5 * c_CLK_PERIOD);

end arch;
