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

  type t_array_byte is array (0 to 15) of std_logic_vector(7 downto 0);

    constant c_SCOPE : string := "WHISHBONE I2C CORE";
    --constant c_CLK_PERIOD : time := 20 ns; -- 50MHz
    --constant c_CLK_PERIOD : time := 500 ns; -- 2MHz
    constant c_CLK_PERIOD : time := 100 ns; -- 10MHz
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

  -- register addresses
constant MASTR0_MBASE  : std_logic_vector(15 downto 0) := "0000000000001111"; -- Base Address (addr_bus[23:8])
constant SLAVE0_MBASE  : std_logic_vector(15 downto 0) := "0000000000001101"; -- Base Address (addr_bus[23:8])
constant MADR_ADDR     : std_logic_vector(7 downto 0) := "00000000"; -- Address Register (MBASE + 141h)
constant MBCR_ADDR     : std_logic_vector(7 downto 0) := "00000001"; -- Control Register (MBASE + 145h)
constant MBSR_ADDR     : std_logic_vector(7 downto 0) := "00000010"; -- Status Register (MBASE + 147h)
constant MBDR_ADDR     : std_logic_vector(7 downto 0) := "00000011"; -- Data I/O Register (MBASE + 149h)

-- data words
constant ALL_ONES	          : std_logic_vector(7 downto 0) := "11111111";
constant ALL_ZEROS            : std_logic_vector(7 downto 0) := "00000000";
constant MASTR_ADDR           : std_logic_vector(7 downto 0) := "11110000";
constant SLAVE_ADDR           : std_logic_vector(7 downto 0) := "00001110";
constant MASTR_MBCR_TX        : std_logic_vector(7 downto 0) := "11010000";
constant MASTR_MBCR_RX        : std_logic_vector(7 downto 0) := "11000000";
constant MASTR_MBCR_RX_REPEAT : std_logic_vector(7 downto 0) := "11100000";
constant SLAVE_MBCR           : std_logic_vector(7 downto 0) := "11000000";
constant START_TX	          : std_logic_vector(7 downto 0) := "11110000";
constant START_RX	          : std_logic_vector(7 downto 0) := "11100000";
constant REPEAT_START_RX	  : std_logic_vector(7 downto 0) := "11100100";
constant NO_ACK	              : std_logic_vector(7 downto 0) := "11101000";
constant STOP_TX	          : std_logic_vector(7 downto 0) := "11010000";
constant STOP_RX	          : std_logic_vector(7 downto 0) := "11001000";
constant TST_ADDR_OUT_HEADER  : std_logic_vector(7 downto 0) := "10010000";
constant MASTR_RD_HEADER      : std_logic_vector(7 downto 0) := "10010001";

signal test_byte_array : t_array_byte;

begin

  

    -----------------------------------------------------------------------------
  -- Instantiate the concurrent procedure that initializes UVVM
  -----------------------------------------------------------------------------
  i_ti_uvvm_engine : entity uvvm_vvc_framework.ti_uvvm_engine;

  --addr_test_u <= unsigned(addr_test);
  
  master0 : entity work.i2c_wb
  --master0 : entity work.i2c_wb_wrapper
	generic map (
		I2C_ADDRESS => MASTR0_MBASE--,
    --ADDR_WIDTH => 30
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

  slave0: entity work.tmp175_simmodel
        port map(sda => sda_test,
                 scl => scl_test);

  eeprom : entity work.i2c_eeprom
    generic map (
      device => "24C01"
    )
    port map (
      STRETCH => 5 ns,
      E0      => 'L',
      E1      => 'L',
      E2      => 'L',
      WC      => 'L',
      SCL     => scl_test,
      SDA     => sda_test
    );
         
  cpullup: entity work.pullup
        port map(v101 => scl_test);
    
  dpullup: entity work.pullup
        port map(v101 => sda_test);
    
  apullup: entity work.pullup
        port map(v101 => dtack_test);
    
  ipullup: entity work.pullup
        port map(v101 => irq_test);
	
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

    procedure i2c_byte_write (
      constant slave : in std_logic_vector(6 downto 0);
      constant addr_value : in std_logic_vector(7 downto 0);
      constant data_value : in std_logic_vector(7 downto 0)) is
    begin
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), MASTR_MBCR_TX, "Enable the master to transmit");
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), slave & "0", "Write the header");
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), START_TX, "Generate START");
      wait until mcf_test = '1';  -- wait for header completed
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), addr_value, "Write address");
      wait until mcf_test = '1';  -- wait for transfer completed
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), data_value, "Write data");
      wait until mcf_test = '1';  -- wait for transfer completed
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), STOP_TX, "Stop TX");

    end procedure i2c_byte_write;

    procedure i2c_page_write (
      constant slave : in std_logic_vector(6 downto 0);
      constant addr_value : in std_logic_vector(7 downto 0);
      constant data_value : in t_array_byte;
      constant data_cnt : in integer
      ) is
    begin
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), MASTR_MBCR_TX, "Enable the master to transmit");
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), slave & "0", "Write the header");
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), START_TX, "Generate START");
      wait until mcf_test = '1';  -- wait for header completed
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), addr_value, "Write address");
      wait until mcf_test = '1';  -- wait for transfer completed

      for i in 0 to (data_cnt - 1) loop

        wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), data_value(i), "Write data");
        wait until mcf_test = '1';  -- wait for transfer completed

      end loop;

      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), STOP_TX, "Stop TX");

    end procedure i2c_page_write;


    procedure i2c_current_address_read (
      constant slave : in std_logic_vector(6 downto 0);
      constant check_value : in std_logic_vector(7 downto 0)) is
    begin
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), MASTR_MBCR_TX, "Enable the master to transmit");
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), slave & "1", "Write the header");
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), START_TX, "Generate START");
      wait until mcf_test = '1';  -- wait for header completed
      --wait until mcf_test = '0';  -- wait for ack
      --wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), MASTR_MBCR_RX_REPEAT, "Enable the master to receive");
      --wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), NO_ACK,	"turn off Master's acknowledge to end cycle");
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), "11101000",	"Enable master receive and send NACK");

      wait until mcf_test = '1';  -- wait for transfer completed
      wait until mcf_test = '0';  -- wait for ack   
      wishbone_check(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), check_value, "Current Address Read");
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), STOP_TX, "Stop TX");    

    end procedure i2c_current_address_read;

    procedure i2c_random_read (
      constant slave : in std_logic_vector(6 downto 0);
      constant addr_value : in std_logic_vector(7 downto 0);
      constant check_value : in std_logic_vector(7 downto 0)) is
    begin
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), MASTR_MBCR_TX, "Enable the master to transmit");
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), slave & "0", "Write the header");
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), START_TX, "Generate START");
      wait until mcf_test = '1';  -- wait for header completed
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), addr_value, "Write address");
      wait until mcf_test = '1';  -- wait for transfer completed 
      wait until mcf_test = '0';  -- wait for ack
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), MASTR_MBCR_RX_REPEAT, "enable the master to receive");
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), slave & "1", "write the header with slave to transmit");
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), REPEAT_START_RX, "Repeated START");   
      wait until mcf_test = '1';  -- wait for header completed
      wait until mcf_test = '0';  -- wait for ack
    

      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), NO_ACK,	"turn off Master's acknowledge to end cycle");
     
      wait until mcf_test = '1';  -- wait for transfer completed
      wait until mcf_test = '0';  -- wait for ack   
      wishbone_check(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), check_value, "Random Read");
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), STOP_TX, "Stop TX");    

    end procedure i2c_random_read;

    procedure i2c_sequential_read (
      constant slave : in std_logic_vector(6 downto 0);
      constant addr_value : in std_logic_vector(7 downto 0);
      constant check_value : in t_array_byte;
      constant data_cnt : in integer
      ) is
    begin
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), MASTR_MBCR_TX, "Enable the master to transmit");
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), slave & "0", "Write the header");
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), START_TX, "Generate START");
      wait until mcf_test = '1';  -- wait for header completed
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), addr_value, "Write address");
      wait until mcf_test = '1';  -- wait for transfer completed 
      wait until mcf_test = '0';  -- wait for ack
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), MASTR_MBCR_RX_REPEAT, "enable the master to receive");
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), slave & "1", "write the header with slave to transmit");
      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), REPEAT_START_RX, "Repeated START");   
      wait until mcf_test = '1';  -- wait for header completed
      wait until mcf_test = '0';  -- wait for ack

      for i in 0 to (data_cnt - 1) loop
        if (i = (data_cnt - 1)) then
          wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), NO_ACK,	"turn off Master's acknowledge to end cycle");
        end if;
        wait until mcf_test = '1';  -- wait for transfer completed
        wait until mcf_test = '0';  -- wait for ack   
        wishbone_check(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), check_value(i), "Sequential Read");
      
      end loop;

      wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), STOP_TX, "Stop TX");    

    end procedure i2c_sequential_read;
  
  begin
    -- Wait for UVVM to finish initialization
    await_uvvm_initialization(VOID);

    start_clock(CLOCK_GENERATOR_VVCT, 1, "Start clock generator");

    -- Increase alert counter as two warning is expected when writing to temperature register
    increment_expected_alerts(warning, 2);

    -- Print the configuration to the log
    report_global_ctrl(VOID);
    report_msg_id_panel(VOID);

    disable_log_msg(ALL_MESSAGES);
    --enable_log_msg(ALL_MESSAGES);
    disable_log_msg(ID_POS_ACK);        --make output a bit cleaner
    disable_log_msg(ID_CMD_INTERPRETER);
    disable_log_msg(ID_CMD_INTERPRETER_WAIT);
    disable_log_msg(ID_CMD_EXECUTOR);
    disable_log_msg(ID_CMD_EXECUTOR_WAIT);
    
    --enable_log_msg(ID_LOG_HDR);
    --enable_log_msg(ID_SEQUENCER);
    --enable_log_msg(ID_UVVM_SEND_CMD);
    enable_log_msg(ID_SEQUENCER_SUB);
    enable_log_msg(ID_LOG_HDR);

    log(ID_LOG_HDR, "Starting simulation of TB for Wishbone-RAM using VVCs", c_SCOPE);
    ------------------------------------------------------------

    log("Wait 10 clock period for reset to be turned off");
    wait for (10 * c_CLK_PERIOD); -- for reset to be turned off
    
    -- Preform check of write/read MADR register
    log(ID_LOG_HDR, "Setting and check MADR register", C_SCOPE);
    wishbone_write(WISHBONE_VVCT, 1, unsigned(std_logic_vector'(MASTR0_MBASE & MADR_ADDR)), x"5a", "write 0x5a to MADR");
    wishbone_check(WISHBONE_VVCT, 1, unsigned(std_logic_vector'(MASTR0_MBASE & MADR_ADDR)), x"5a", "read MADR, expect 0x5a");

    log(ID_LOG_HDR, "Setting TMP175 config register", C_SCOPE);
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), MASTR_MBCR_TX, "enable the master to transmit");
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), TST_ADDR_OUT_HEADER, "write the header");
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), START_TX, "Generate START");
    wait until mcf_test = '1';  -- wait for transfer completed
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), "00000001", "Pointer Address: Configuration register");
    wait until mcf_test = '1';  -- wait for transfer completed
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), "01100000", "Setting configuration register");
    wait until mcf_test = '1';  -- wait for transfer completed
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), STOP_TX, "Stop TX");

    
    -- reading configuration register
    log(ID_LOG_HDR, "Checking TMP175 config register", C_SCOPE);
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), MASTR_MBCR_TX, "enable the master to transmit");
    wait until ack_test = '0';
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), TST_ADDR_OUT_HEADER, "write the header");
    wait until ack_test = '0';
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), START_TX, "Generate START");
    wait until ack_test = '0';
    wait until mcf_test = '1';  -- wait for transfer completed
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), "00000001", "Pointer Address: Configuration register");
    wait until ack_test = '0';
    wait until mcf_test = '1';  -- wait for transfer completed
    wait until mcf_test = '0';  -- wait for ack

    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), MASTR_MBCR_RX_REPEAT, "enable the master to receive");
    wait until ack_test = '0';

    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), MASTR_RD_HEADER, "write the header with slave to transmit");
    wait until ack_test = '0';

    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), REPEAT_START_RX, "Repeated START");
    wait until ack_test = '0';
   
    wait until mcf_test = '1';  -- wait for header completed
    wait until mcf_test = '0';  -- wait for ack
    

    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), NO_ACK,	"turn off Master's acknowledge to end cycle");
    --wait until ack_test = '0';
    wait until mcf_test = '1';  -- wait for transfer completed
    wait until mcf_test = '0';  -- wait for ack   
    wishbone_check(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), "01100000", "Check configuration register");
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), STOP_TX, "Stop TX");
    --wait until ack_test = '0';

    ----------------------------------------------------
    
    log(ID_LOG_HDR, "Checking TMP175 temperature register", C_SCOPE);
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), MASTR_MBCR_TX, "enable the master to transmit");
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), TST_ADDR_OUT_HEADER, "write the header");
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), START_TX, "Generate START");
    wait until mcf_test = '1';  -- wait for header completed
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), "00000000", "Pointer Address: temperature register");
    wait until mcf_test = '1';  -- wait for transfer completed
    wait until mcf_test = '0';  -- wait for ack
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), MASTR_MBCR_RX_REPEAT, "enable the master to receive");
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), MASTR_RD_HEADER, "write the header with slave to transmit");
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), REPEAT_START_RX, "Repeated START");
    wait until mcf_test = '1';  -- wait for header completed
    wait until mcf_test = '0';  -- wait for ack
    wait until mcf_test = '1';  -- wait for MSB completed
    wait until mcf_test = '0';  -- wait for ack
    wishbone_check(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), x"a5", "Check temperature MSB");
    -- setup NACK for LSB
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), NO_ACK,	"turn off Master's acknowledge to end cycle");
    wait until mcf_test = '1';  -- wait for LSB completed    
    wait until mcf_test = '0';  -- wait for ack
    wishbone_check(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), x"5a", "Check temperature LSB");
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), STOP_TX, "Stop TX");

    ----------------------------------------------------
    
    log(ID_LOG_HDR, "Setting TMP175 temperature register", C_SCOPE);
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), MASTR_MBCR_TX, "enable the master to transmit");
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), TST_ADDR_OUT_HEADER, "write the header");
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), START_TX, "Generate START");
    wait until mcf_test = '1';  -- wait for header completed
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), "00000000", "Pointer Address: temperature register");
    wait until mcf_test = '1';  -- wait for transfer completed
    wait until mcf_test = '0';  -- wait for ack
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), "11110000", "Write TEMP MSB");
    wait until mcf_test = '1';  -- wait for transfer completed
    wait until mcf_test = '0';  -- wait for ack
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), "00001111", "Write TEMP LSB");
    wait until mcf_test = '1';  -- wait for transfer completed
    wait until mcf_test = '0';  -- wait for ack
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), STOP_TX, "Stop TX");

    -----------------------------------------------------------------------------
    log(ID_LOG_HDR, "Setting TMP175 LOW Register", C_SCOPE);
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), MASTR_MBCR_TX, "enable the master to transmit");
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), TST_ADDR_OUT_HEADER, "write the header");
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), START_TX, "Generate START");
    wait until mcf_test = '1';  -- wait for transfer completed
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), "00000010", "Pointer Address: TLOW register");
    wait until mcf_test = '1';  -- wait for transfer completed
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), "10101010", "Setting TLOW MSB");
    wait until mcf_test = '1';  -- wait for transfer completed
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), "01010101", "Setting TLOW LSB");
    wait until mcf_test = '1';  -- wait for transfer completed
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), STOP_TX, "Stop TX");

    -- reading configuration register
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), MASTR_MBCR_TX, "enable the master to transmit");
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), TST_ADDR_OUT_HEADER, "write the header");
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), START_TX, "Generate START");
    wait until mcf_test = '1';  -- wait for header completed
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), "00000010", "Pointer Address: TLOW register");
    wait until mcf_test = '1';  -- wait for transfer completed
    wait until mcf_test = '0';  -- wait for ack
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), MASTR_MBCR_RX_REPEAT, "enable the master to receive");
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), MASTR_RD_HEADER, "write the header with slave to transmit");
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), REPEAT_START_RX, "Repeated START");
    wait until mcf_test = '1';  -- wait for header completed
    wait until mcf_test = '0';  -- wait for ack
    wait until mcf_test = '1';  -- wait for MSB
    wait until mcf_test = '0';  -- wait for ack
    wishbone_check(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), "10101010", "Check TLOW MSB");
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), NO_ACK,	"turn off Master's acknowledge to end cycle");
    --wait until ack_test = '0';
    wait until mcf_test = '1';  -- wait for transfer completed
    wait until mcf_test = '0';  -- wait for ack   
    wishbone_check(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), "01010101", "Check TLOW LSB");
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), STOP_TX, "Stop TX");


    -----------------------------------------------------------------------------
    log(ID_LOG_HDR, "Setting TMP175 Thigh Register", C_SCOPE);
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), MASTR_MBCR_TX, "enable the master to transmit");
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), TST_ADDR_OUT_HEADER, "write the header");
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), START_TX, "Generate START");
    wait until mcf_test = '1';  -- wait for transfer completed
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), "00000011", "Pointer Address: Thigh register");
    wait until mcf_test = '1';  -- wait for transfer completed
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), "11110000", "Setting Thigh MSB");
    wait until mcf_test = '1';  -- wait for transfer completed
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), "00001111", "Setting Thigh LSB");
    wait until mcf_test = '1';  -- wait for transfer completed
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), STOP_TX, "Stop TX");

    -- reading configuration register
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), MASTR_MBCR_TX, "enable the master to transmit");
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), TST_ADDR_OUT_HEADER, "write the header");
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), START_TX, "Generate START");
    wait until mcf_test = '1';  -- wait for header completed
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), "00000011", "Pointer Address: Thigh register");
    wait until mcf_test = '1';  -- wait for transfer completed
    wait until mcf_test = '0';  -- wait for ack
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), MASTR_MBCR_RX_REPEAT, "enable the master to receive");
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), MASTR_RD_HEADER, "write the header with slave to transmit");
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), REPEAT_START_RX, "Repeated START");
    wait until mcf_test = '1';  -- wait for header completed
    wait until mcf_test = '0';  -- wait for ack
    wait until mcf_test = '1';  -- wait for MSB
    wait until mcf_test = '0';  -- wait for ack
    wishbone_check(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), "11110000", "Check Thigh MSB");
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), NO_ACK,	"turn off Master's acknowledge to end cycle");
    --wait until ack_test = '0';
    wait until mcf_test = '1';  -- wait for transfer completed
    wait until mcf_test = '0';  -- wait for ack   
    wishbone_check(WISHBONE_VVCT, 1, unsigned(MBDR_ADDR), "00001111", "Check Thigh LSB");
    wishbone_write(WISHBONE_VVCT, 1, unsigned(MBCR_ADDR), STOP_TX, "Stop TX");
    
    -- i2c eeprom test
    i2c_byte_write ("1010000", "00000011", "11001100");
    i2c_random_read("1010000", "00000011", "11001100");
    test_byte_array(0) <= x"e1";
    test_byte_array(1) <= x"f2";
    i2c_page_write("1010000", "00000100", test_byte_array, 2);
    i2c_random_read("1010000", "00000011", "11001100");
    i2c_current_address_read("1010000", x"e1");
    i2c_current_address_read("1010000", x"f2");

    test_byte_array(0) <= "11001100";
    test_byte_array(1) <= x"e1";
    test_byte_array(2) <= x"f2";
    i2c_sequential_read("1010000", "00000011", test_byte_array, 3);

    -----------------------------------------------------------------------------
    -- Ending the simulation
    -----------------------------------------------------------------------------
    wait for 100 us; -- to allow some time for completion
    report_alert_counters(FINAL); -- Report final counters and print conclusion for simulation (Success/Fail)
    log(ID_LOG_HDR, "SIMULATION COMPLETED", c_SCOPE);

    -- Finish the simulation
    std.env.stop;
    wait;  -- to stop completely

  end process;

end arch;
