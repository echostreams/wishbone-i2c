----------------------------------------------------------------------------
-- ETF BL
-- Wishbone I2C
-----------------------------------------------------------------------------
--
--    unit    name:                        wishbone i2c testbench with tmp175
--
--    description:
--
--              This is top-level entity testbench.
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

use work.register_pkg.all;

entity wishbone_i2c_tmp175_tb is
end wishbone_i2c_tmp175_tb;

architecture arch of wishbone_i2c_tmp175_tb is

  constant c_SCOPE : string := "WISHBONE I2C IP CORE";

  constant c_CLK_PERIOD : time    := 20 ns;

  constant c_SCL_PERIOD : time    := 10 us;
  -- constant c_SCL_PERIOD : time    := 2500 ns;
  -- constant c_SCL_PERIOD : time    := 1 us;

  constant c_TEST_DATA : std_logic_vector(31 downto 0) := (0 | 1 | 4 | 7 => '1', others => '0');

  constant c_SLAVE_ADDRESS         : std_logic_vector(6 downto 0) := "1110001";
  constant c_SLAVE_ADDRESS_CORE    : unsigned(6 downto 0)         := "0011110";
  constant c_SLAVE_ADDRESS_CORE_10 : unsigned(9 downto 0)         := "1010011010";
  constant c_SLAVE_ADDRESS_8_BIT   : std_logic_vector(7 downto 0) := "00100110";

  constant c_MSG_CMD_REG_START   : string := "Command register - I2C START";
  constant c_MSG_CMD_REG_DISABLE : string := "Command register - DISABLE";
  constant c_MSG_CMD_REG_TX_EN   : string := "Command register - ENABLE TX BUFFER";
  constant c_MSG_CMD_REG_RX_EN   : string := "Command register - ENABLE RX BUFFER";
  constant c_MSG_CMD_REG_REP_STR : string := "Command register - REPEATED START";
  constant c_MSG_CMD_REG_INT_CL  : string := "Command register - CLEAR INTERRUPT";
  constant c_MSG_CTR_REG_EN_MST  : string := "Control register - ENABLE I2C MASTER";
  constant c_MSG_CTR_REG_EN_IMST : string := "Control register - ENABLE I2C MASTER WITH INTERRUPT";
  constant c_MSG_CTR_REG_EN_SLV  : string := "Control register - ENABLE I2C SLAVE";
  constant c_MSG_CTR_REG_SLV_10B : string := "Control register - ENABLE I2C SLAVE 10 BIT";
  constant c_MSG_CTR_REG_EN_INT  : string := "Control register - ENABLE INTERRUPT";
  constant c_MSG_SLV_REG_SL_ADDR : string := "Slave address register - SLAVE ADDRESS";
  constant c_MSG_STA_REG_RD_INT  : string := "Status register - READ INTERRUPT BIT";
  constant c_MSG_TX_REG_DATA     : string := "Tx register - TX DATA";
  constant c_MSG_RX_REG_DATA     : string := "Rx register - RX DATA";
  constant c_MSG_GPO_REG_DATA    : string := "GPO register - WRITE DATA";
  constant c_MSG_I2C_SLAVE_CHECK : string := "I2C Slave - CHECK";
  constant c_MSG_I2C_SLAVE_TRAN  : string := "I2C Slave - TRANSMIT";
  constant c_MSG_I2C_MSTR_CHECK  : string := "I2C Master - CHECK";
  constant c_MSG_I2C_MSTR_TRAN   : string := "I2C Master - TRANSMIT";

  constant c_TEST_VECTOR_A : t_byte_array := (
    "00000001",
    "01100000"
  );

  constant c_TEST_VECTOR_A_2 : t_byte_array := (
    x"A7",
    x"0B",
    x"6F"
  );

  constant c_TEST_VECTOR_A_3 : t_byte_array := (
    x"7E",
    x"96",
    x"34"
  );

  constant c_TEST_VECTOR_A_4 : t_byte_array := (
    x"32",
    x"07",
    x"B1",
    x"4F",
    x"D5",
    x"AC"
  );

  constant c_GPO_REG_DATA : std_logic_vector(31 downto 0) := (0 | 3 | 4 | 6 | 7 => '1', others => '0');
  constant c_ADDR_DATA    : std_logic_vector(31 downto 0) := "00000000000000000000000000011110";
  constant c_ADDR_DATA_10 : std_logic_vector(31 downto 0) := "00000000000000000000001010011010";

  signal interrupt : std_logic;

  --TMP175 address values
  constant i2c_addr_tmp175 : std_logic_vector(6 downto 0) := "1010000";
  constant reg_addr_temp   : std_logic_vector(7 downto 0) := "00000000";    -- Temperature register (Read only)
  constant reg_addr_config : std_logic_vector(7 downto 0) := "00000001";    -- Configuration register
  constant reg_addr_tlow   : std_logic_vector(7 downto 0) := "00000010";    -- TLOW register
  constant reg_addr_thigh  : std_logic_vector(7 downto 0) := "00000011";    -- THIGH register

begin

  i_wishbone_i2c_tmp175 : entity work.wishbone_i2c_tmp175_th
    port map
    (
      int_o => interrupt
    );

  -- main process
  process

    -- send data to TX buffer
    procedure write_buffer (
      constant data : std_logic_vector(7 downto 0)
    )
    is
      variable send : std_logic_vector(31 downto 0) := (others => '0');
    begin
      send := send(31 downto 8) & data;
      wishbone_write(WISHBONE_VVCT, 1, c_REG_TX,  send,              c_MSG_TX_REG_DATA);
      wishbone_write(WISHBONE_VVCT, 1, c_REG_CMD, c_CMD_WRITE_BUFF,  c_MSG_CMD_REG_TX_EN);
      wishbone_write(WISHBONE_VVCT, 1, c_REG_CMD, c_CMD_DISABLE_ALL, c_MSG_CMD_REG_DISABLE);
    end write_buffer;

    -- read data from RX buffer and check
    procedure check_buffer (
      constant data : std_logic_vector(7 downto 0)
    )
    is
      variable send : std_logic_vector(31 downto 0) := (others => '0');
    begin
      send := send(31 downto 8) & data;
      wishbone_write(WISHBONE_VVCT, 1, c_REG_CMD, c_CMD_READ_BUFF,   c_MSG_CMD_REG_RX_EN);
      wishbone_write(WISHBONE_VVCT, 1, c_REG_CMD, c_CMD_DISABLE_ALL, c_MSG_CMD_REG_DISABLE);
      wishbone_check(WISHBONE_VVCT, 1, c_REG_RX,  send,              c_MSG_RX_REG_DATA);
    end check_buffer;

    procedure check_interrupt is
    begin
      -- read data
      -- interrupt is high
      wishbone_read(WISHBONE_VVCT, 1, c_REG_STAT, c_MSG_STA_REG_RD_INT);

      assert (interrupt = '1')
        report "Interrupt bit not set, expected to be"
        severity error;

      wait for 500 ns;

      -- clear interrupt
      wishbone_write(WISHBONE_VVCT, 1, c_REG_CMD, c_CMD_INT_CLR,     c_MSG_CMD_REG_INT_CL);
      wishbone_write(WISHBONE_VVCT, 1, c_REG_CMD, c_CMD_DISABLE_ALL, c_MSG_CMD_REG_DISABLE);

      wait for 5 * c_CLK_PERIOD;

      assert (interrupt = '0')
        report "Interrupt bit set, expected not to be"
        severity error;
    end check_interrupt;

  begin

    -- Wait for UVVM to finish initialization
    await_uvvm_initialization(VOID);

    start_clock(CLOCK_GENERATOR_VVCT, 1, "Start clock generator");

    -- Print the configuration to the log
    report_global_ctrl(VOID);
    report_msg_id_panel(VOID);

    --disable_log_msg(ALL_MESSAGES);
    enable_log_msg(ALL_MESSAGES);
    disable_log_msg(ID_POS_ACK);        --make output a bit cleaner
    enable_log_msg(ID_LOG_HDR);
    enable_log_msg(ID_SEQUENCER);
    enable_log_msg(ID_UVVM_SEND_CMD);
    enable_log_msg(ID_SEQUENCER_SUB);

    log(ID_LOG_HDR, "Starting simulation of TB for Wishbone-I2C using VVCs", c_SCOPE);
    ------------------------------------------------------------

    log("Wait 10 clock period for reset to be turned off");
    wait for (10 * c_CLK_PERIOD); -- for reset to be turned off

    -- enable I2C and select master mode
    wishbone_write(WISHBONE_VVCT, 1, c_REG_CTRL, c_CTRL_I2C_EN_MASTER, c_MSG_CTR_REG_EN_MST);

    log(ID_LOG_HDR, "Test write configuration register(1 byte)", c_SCOPE);
    -----------------------------------------------------------------------------
    write_buffer("00000010");
    write_buffer(i2c_addr_tmp175 & "0");
    write_buffer(reg_addr_config);
    write_buffer("01100000");

    -- command register
    wishbone_write(WISHBONE_VVCT, 1, c_REG_CMD, c_CMD_I2C_START,   c_MSG_CMD_REG_START);
    wishbone_write(WISHBONE_VVCT, 1, c_REG_CMD, c_CMD_DISABLE_ALL, c_MSG_CMD_REG_DISABLE);

    i2c_slave_check(I2C_VVCT, 1, c_TEST_VECTOR_A, c_MSG_I2C_SLAVE_CHECK);

    await_completion(I2C_VVCT, 1, 3 * 11 * c_SCL_PERIOD);
    -----------------------------------------------------------------------------

    wait for 50 us;

    log(ID_LOG_HDR, "Test read configuration register", c_SCOPE);
    -----------------------------------------------------------------------------
    write_buffer("00000001");
    write_buffer(i2c_addr_tmp175 & "0");
    write_buffer(reg_addr_config);

    -- command register
    wishbone_write(WISHBONE_VVCT, 1, c_REG_CMD, c_CMD_I2C_START,   c_MSG_CMD_REG_START);
    wishbone_write(WISHBONE_VVCT, 1, c_REG_CMD, c_CMD_DISABLE_ALL, c_MSG_CMD_REG_DISABLE);

    write_buffer("00000000");
    write_buffer(i2c_addr_tmp175 & "1");
    wishbone_write(WISHBONE_VVCT, 1, c_REG_CMD, c_CMD_I2C_START,   c_MSG_CMD_REG_START);
    wishbone_write(WISHBONE_VVCT, 1, c_REG_CMD, c_CMD_DISABLE_ALL, c_MSG_CMD_REG_DISABLE);

    -- slave write data
    -- i2c_slave_transmit(I2C_VVCT, 1, c_TEST_VECTOR_A, c_MSG_I2C_SLAVE_TRAN);
    await_completion(I2C_VVCT, 1, 3 * 10 * c_SCL_PERIOD);

    -- wishbone read from RX buffer and check
    check_buffer("01100000");

    -----------------------------------------------------------------------------



    -----------------------------------------------------------------------------
    -- Ending the simulation
    -----------------------------------------------------------------------------
    wait for 500 us;              -- to allow some time for completion
    report_alert_counters(FINAL); -- Report final counters and print conclusion for simulation (Success/Fail)
    log(ID_LOG_HDR, "SIMULATION COMPLETED", c_SCOPE);

    -- Finish the simulation
    std.env.stop;
    wait;  -- to stop completely

  end process;

end arch;
