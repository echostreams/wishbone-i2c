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

library bitvis_vip_sbi;
  use bitvis_vip_sbi.vvc_methods_pkg.all;
  use bitvis_vip_sbi.td_vvc_framework_common_methods_pkg.all;

library bitvis_vip_i2c;
  use bitvis_vip_i2c.vvc_methods_pkg.all;
  use bitvis_vip_i2c.td_vvc_framework_common_methods_pkg.all;
  use bitvis_vip_i2c.i2c_bfm_pkg.all;

library bitvis_vip_wishbone;
  use bitvis_vip_wishbone.vvc_methods_pkg.all;
  use bitvis_vip_wishbone.td_vvc_framework_common_methods_pkg.all;
  use bitvis_vip_wishbone.wishbone_bfm_pkg.all;

library bitvis_vip_clock_generator;
  use bitvis_vip_clock_generator.vvc_cmd_pkg.all;
  use bitvis_vip_clock_generator.vvc_methods_pkg.all;
  use bitvis_vip_clock_generator.td_vvc_framework_common_methods_pkg.all;

library work;
  use work.wishbone_types.all;

entity i2c_wb_tb is
end i2c_wb_tb;

architecture arch of i2c_wb_tb is
    constant c_SCOPE : string := "WHISHBONE I2C CORE";
    constant c_CLK_PERIOD : time := 20 ns;
    constant c_CLOCK_GEN: natural := 1;
	  constant c_ADDR_WIDTH : natural := 30;
	  constant c_WIDTH : natural := 32;
	
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
   
  signal clk_test    : std_logic;
  signal rst_test    : std_logic;
  
  signal we_test     : std_logic;
  signal addr_test   : std_logic_vector((c_ADDR_WIDTH - 1) downto 0);
  --signal addr_test_u : unsigned((c_ADDR_WIDTH - 1) downto 0);
  signal data_i_test : std_logic_vector((c_WIDTH - 1) downto 0);
  signal data_o_test : std_logic_vector((c_WIDTH - 1) downto 0);
  signal stb_test    : std_logic;
  signal cyc_test    : std_logic;
  signal ack_test    : std_logic;
  
  -- I2C bus signals
	signal sda_test :	std_logic;		
	signal scl_test	: std_logic;

	-- Wishbone ports:
	signal wb_in_test  : wb_io_master_out;
	signal wb_out_test : wb_io_slave_out;

	signal dtack_test	 : std_logic;	-- data transfer acknowledge
	signal irq_test		 : std_logic;	-- interrupt request	
	signal mcf_test		 : std_logic; -- temporary output for testing 
   
begin

    -----------------------------------------------------------------------------
  -- Instantiate the concurrent procedure that initializes UVVM
  -----------------------------------------------------------------------------
  i_ti_uvvm_engine : entity uvvm_vvc_framework.ti_uvvm_engine;

  --addr_test_u <= unsigned(addr_test);
  
  i2c : entity work.i2c_wb
	generic map (
		I2C_ADDRESS => "0000000000001111"
	)
	port map (
		sda   => sda_test,
      scl   => scl_test,

      --wishbone_in  => wb_in_test,
      --wishbone_out => wb_out_test,
      
      i_adr  => addr_test,
      i_dat  => data_i_test,
      i_cyc  => cyc_test,
      i_stb  => stb_test,
      i_we   => we_test,
      
      o_dat => data_o_test,
      o_ack => ack_test,

      dtack	=> dtack_test,
      irq   => irq_test,
      mcf   => mcf_test,

		  -- clock and reset
		  clk   => clk_test,
      reset => rst_test
	);
	
  -----------------------------------------------------------------------------
  -- Wishbone
  -----------------------------------------------------------------------------
  i1_wishbone_vvc : entity bitvis_vip_wishbone.wishbone_vvc
    generic map
    (
        Gc_ADDR_WIDTH          => c_ADDR_WIDTH
      , GC_DATA_WIDTH          => c_WIDTH
      , Gc_WISHBONE_BFM_CONFIG => c_WISHBONE_BFM_CONFIG
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

      --wishbone_vvc_master_if.dat_i => wb_out_test.dat,
      --wishbone_vvc_master_if.ack_i => wb_out_test.ack,
      --wishbone_vvc_master_if.adr_o => wb_in_test.adr,
      --wishbone_vvc_master_if.dat_o => wb_in_test.dat,
      --wishbone_vvc_master_if.we_o  => wb_in_test.we,
      --wishbone_vvc_master_if.cyc_o => wb_in_test.cyc,
      --wishbone_vvc_master_if.stb_o => wb_in_test.stb
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
  
  -- main process
  process
  
  begin
    -- Wait for UVVM to finish initialization
    await_uvvm_initialization(VOID);

    start_clock(CLOCK_GENERATOR_VVCT, 1, "Start clock generator");

    -- Print the configuration to the log
    report_global_ctrl(VOID);
    report_msg_id_panel(VOID);

    disable_log_msg(ALL_MESSAGES);
    enable_log_msg(ID_LOG_HDR);
    enable_log_msg(ID_SEQUENCER);
    enable_log_msg(ID_UVVM_SEND_CMD);

    log(ID_LOG_HDR, "Starting simulation of TB for Wishbone-RAM using VVCs", c_SCOPE);
    ------------------------------------------------------------

    log("Wait 10 clock period for reset to be turned off");
    wait for (10 * c_CLK_PERIOD); -- for reset to be turned off
    
    wishbone_write(WISHBONE_VVCT, 1, "000000000000111110001101", x"5a", "write 0x5a to 10001101");
    --wait until wb_out_test.ack = '0';
    wait until ack_test = '0';
    wishbone_check(WISHBONE_VVCT, 1, "000000000000111110001101", x"5a", "read from 10001101, expect 0x5a");
    --wait until wb_out_test.ack = '0';
    wait until ack_test = '0';
    -----------------------------------------------------------------------------
    -- Ending the simulation
    -----------------------------------------------------------------------------
    --wait for 100 us;              -- to allow some time for completion
    report_alert_counters(FINAL); -- Report final counters and print conclusion for simulation (Success/Fail)
    log(ID_LOG_HDR, "SIMULATION COMPLETED", c_SCOPE);

    -- Finish the simulation
    std.env.stop;
    wait;  -- to stop completely

  end process;

end arch;
