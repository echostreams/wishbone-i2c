library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- User library with I2C read and write procedures
use work.i2c_master_pkg.all;

-------------------------------------------------------------------------------
-- UVVM Utility Library
-------------------------------------------------------------------------------
library STD;
use std.env.all;

library uvvm_util;
context uvvm_util.uvvm_util_context;


-------------------------------------------------------------------------------



entity i2c_master_tb is
end entity;

architecture tb of i2c_master_tb is


  signal reg_addr_use  : std_logic_vector(7 downto 0);
  signal data_array_wr : t_data_array;
  signal data_array_rd : t_data_array;


begin

  -- Include the I2C master (DUT)
  UUT : entity work.i2c_master
    generic map (
      GC_SYSTEM_CLK => GC_SYSTEM_CLK,
      GC_I2C_CLK    => GC_I2C_CLK)
    port map (
      clk       => clk,
      rst_n     => rst_n,
      valid     => valid,
      addr      => addr,
      rnw       => rnw,
      data_wr   => data_wr,
      data_rd   => data_rd,
      busy      => busy,
      ack_error => ack_error,
      sda       => sda,
      scl       => scl);

  -- Include the TMP175 simulation model
  tmp175 : entity work.tmp175_simmodel
    generic map (
      i2c_clk => GC_I2C_CLK)
    port map (
      sda => sda,
      scl => scl);



-- Bitvis clock generator
  clock_generator(clk, clk_ena, clk_period, "TB clock");



-- sequencer
  p_seq : process

    constant C_SCOPE : string := "TB seq.";


    -- Overloaded procedure for simplicity
    procedure write_i2c(
      constant i2c_addr : in std_logic_vector;
      constant reg_addr : in std_logic_vector;
      constant data     : in t_data_array;
      constant no_bytes : in integer) is
    begin
      write_i2c(i2c_addr, reg_addr, data, no_bytes, clk, busy, valid, rnw, addr, data_wr);
    end procedure;


    -- Overloaded procedure for simplicity
    procedure read_i2c(
      constant i2c_addr    : in  std_logic_vector;
      constant reg_addr    : in  std_logic_vector;
      signal data          : out t_data_array;
      constant no_bytes    : in  integer;
      constant check_value : in  boolean := false) is
    begin
      read_i2c(i2c_addr, reg_addr, data, no_bytes, clk, busy, data_rd, valid, rnw, addr, data_wr, check_value);
    end procedure;



    ------------------------------------------------------------------------------
    -- pulse
    -- purpose: general purpose pulse generator
    -- parameters:
    --   target: (std_logic) target signal to be operated on
    --   pulse_value: (std_logic) value of pulse (1= high, 0=low)
    --   clk:   (std_logic)  reference clk
    --   num_periods: (natural) used to specify length of pulse
    --   msg: (string)  log msg to be displayed at pulse generation
    ------------------------------------------------------------------------------
    procedure pulse(
      signal target        : inout std_logic;
      constant pulse_value : in    std_logic;
      signal clk           : in    std_logic;
      constant num_periods : in    natural;
      constant msg         : in    string)
    is
    begin
      if num_periods > 0 then
        wait until falling_edge(clk);
        target <= pulse_value;          --pulse_value;
        for i in 1 to num_periods loop
          wait until falling_edge(clk);
        end loop;
      else
        target <= pulse_value;
      end if;
      target <= not(pulse_value);       --not (pulse_value);
      log(ID_SEQUENCER_SUB, msg, C_SCOPE);
    end procedure;


  begin
    ----------------------------------------------------------------------------------
    -- Set and report init conditions
    ----------------------------------------------------------------------------------
    -- Increment alert counter as two warning is expected when testing writing
    -- to temperature register
    increment_expected_alerts(warning, 2);
    -- Print the configuration to the log: report/enable logging/alert conditions
    report_global_ctrl(VOID);
    report_msg_id_panel(VOID);
    enable_log_msg(ALL_MESSAGES);
    disable_log_msg(ID_POS_ACK);        --make output a bit cleaner


-- Begin simulation
    log(ID_LOG_HDR, "Start Simulation of TB for I2C master", C_SCOPE);
    log(ID_LOG_HDR, "Set default values for I2C master I/O and enable clock and reset system", C_SCOPE);
    -- default values
    data_array_wr <= (others => (others => '0'));
    data_array_rd <= (others => (others => '0'));
    addr          <= (others => '0');
    rnw           <= '0';
    data_wr       <= (others => '0');
    valid         <= '0';
    rst_n         <= '1';
    clk_ena       <= true;              --Enable the system clk
    pulse(rst_n, '0', clk, 5, "Activate async. reset");

    -- Delay start by some clock cycles
    wait for clk_period*2;

/*
    --Preform check of config.register (1 byte)
    log(ID_LOG_HDR, "Setting and check TMP175 config register", C_SCOPE);
    data_array_wr(0) <= "01100000";
    reg_addr_use     <= reg_addr_config;
    wait for 0 ns;                      -- allow values to be update
    write_i2c(i2c_addr_tmp175, reg_addr_use, data_array_wr, 1);
    read_i2c(i2c_addr_tmp175, reg_addr_use, data_array_rd, 1);
    check_value(data_array_rd(0), data_array_wr(0), warning, "Read reg. addr.: " & to_string(reg_addr_use));

    wait for clk_period*2;
*/
    --Preform check of thigh register (2 byte)
    log(ID_LOG_HDR, "Setting and check TMP175 THIGH register", C_SCOPE);
    data_array_wr(0) <= "00010001";     --MSB
    data_array_wr(1) <= "00110011";     --LSB
    reg_addr_use     <= reg_addr_thigh;
    wait for 0 ns;                      -- allow values to be update
    write_i2c(i2c_addr_tmp175, reg_addr_use, data_array_wr, 2);
    read_i2c(i2c_addr_tmp175, reg_addr_use, data_array_rd, 2);
    check_value(data_array_rd(0), data_array_wr(0), warning, "Read reg. addr.(MSB): " & to_string(reg_addr_use));
    check_value(data_array_rd(1), data_array_wr(1), warning, "Read reg. addr.(LSB): " & to_string(reg_addr_use));

    wait for clk_period*2;
/*
    --Preform check of tlow register (2 byte)
    log(ID_LOG_HDR, "Setting and check TMP175 TLOW register", C_SCOPE);
    data_array_wr(0) <= "01010101";     --MSB
    data_array_wr(1) <= "11001100";     --LSB
    reg_addr_use     <= reg_addr_tlow;
    wait for 0 ns;                      -- allow values to be update
    write_i2c(i2c_addr_tmp175, reg_addr_use, data_array_wr, 2);
    read_i2c(i2c_addr_tmp175, reg_addr_use, data_array_rd, 2);
    check_value(data_array_rd(0), data_array_wr(0), warning, "Read reg. addr.(MSB): " & to_string(reg_addr_use));
    check_value(data_array_rd(1), data_array_wr(1), warning, "Read reg. addr.(LSB): " & to_string(reg_addr_use));

    wait for clk_period*2;

    --Preform check of temperature register (2 byte)
    --Warning is expected as the temp. register is read only.
    log(ID_LOG_HDR, "Preforming write and read of TMP175 temperature register", C_SCOPE);
    data_array_wr(0) <= "11110000";     --MSB
    data_array_wr(1) <= "00001111";     --LSB
    reg_addr_use     <= reg_addr_temp;
    wait for 0 ns;                      -- allow values to be update
    write_i2c(i2c_addr_tmp175, reg_addr_use, data_array_wr, 2);
    read_i2c(i2c_addr_tmp175, reg_addr_use, data_array_rd, 2);
    -- Expecty zero as temp. is read only and default value is set to zero in
    -- simulation model
    check_value(data_array_rd(0), x"a5", warning, "Read reg. addr.(MSB): " & to_string(reg_addr_use));
    check_value(data_array_rd(1), x"5a", warning, "Read reg. addr.(LSB): " & to_string(reg_addr_use));
*/


    --==================================================================================================
    -- Ending the simulation
    --------------------------------------------------------------------------------------
    wait for 1000 ns;                   -- to allow some time for completion
    report_alert_counters(FINAL);  -- Report final counters and print conclusion for simulation (Success/Fail)
    log(ID_LOG_HDR, "SIMULATION COMPLETED", C_SCOPE);
    clk_ena <= false;  -- to gracefully stop the simulation - if possible

    wait;                               -- to stop completely


    wait;                               --end simulation
  end process;
end architecture tb;
