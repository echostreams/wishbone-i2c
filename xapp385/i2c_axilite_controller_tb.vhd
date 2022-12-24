library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library STD;
use std.env.all;

library uvvm_util;
context uvvm_util.uvvm_util_context;

library uvvm_vvc_framework;
  use uvvm_vvc_framework.ti_vvc_framework_support_pkg.all;

-- use uvvm_util.axilite_bfm_pkg.all;
library bitvis_vip_axilite;
  use bitvis_vip_axilite.vvc_methods_pkg.all;
  use bitvis_vip_axilite.axilite_bfm_pkg.all;
  use bitvis_vip_axilite.td_vvc_framework_common_methods_pkg.all;
context bitvis_vip_axilite.vvc_context;

use std.textio.all;
use std.env.finish;

entity tb_axilite is
end tb_axilite;

architecture sim of tb_axilite is

-- CONSTANTS
constant c_clkperiod                : time := 10 ns;
constant c_clkfreq                  : integer := 100_000_000;
constant c_clock_high_percentage    : integer := 50;
constant c_axi_addr_width           : integer := 4;
constant c_axi_data_width           : integer := 32;
constant c_reg0_addr                : unsigned(c_axi_addr_width-1 downto 0) := x"0";
constant c_reg1_addr                : unsigned(c_axi_addr_width-1 downto 0) := x"4";
constant reg_if_addr_width_c        : integer := 4;
constant axi_access_time_c          : time := 4 * c_clkperiod;

signal clk			        : std_logic := '0';
signal resetn			    : std_logic := '0';
signal sw_i                 : std_logic_vector (7 downto 0) := (others => '0');
signal led_o                : std_logic_vector (7 downto 0);

-- AXI interface
signal s_axi_awaddr  : std_logic_vector(reg_if_addr_width_c-1 downto 0);
signal s_axi_awprot  : std_logic_vector(2 downto 0);
signal s_axi_awvalid : std_logic;
signal s_axi_awready : std_logic;
signal s_axi_wdata   : std_logic_vector(31 downto 0);
signal s_axi_wstrb   : std_logic_vector(3 downto 0);
signal s_axi_wvalid  : std_logic;
signal s_axi_wready  : std_logic;
signal s_axi_bresp   : std_logic_vector(1 downto 0);
signal s_axi_bvalid  : std_logic;
signal s_axi_bready  : std_logic;
signal s_axi_araddr  : std_logic_vector(reg_if_addr_width_c-1 downto 0);
signal s_axi_arprot  : std_logic_vector(2 downto 0);
signal s_axi_arvalid : std_logic;
signal s_axi_arready : std_logic;
signal s_axi_rdata   : std_logic_vector(31 downto 0);
signal s_axi_rresp   : std_logic_vector(1 downto 0);
signal s_axi_rvalid  : std_logic;
signal s_axi_rready  : std_logic;

-- axilite_bfm signals
signal axilite_if           : t_axilite_if(
    write_address_channel(
        awaddr(c_axi_addr_width-1 downto 0)
        ),
    write_data_channel(
        wdata(c_axi_data_width-1 downto 0),
        wstrb(4-1 downto 0)
        ),
    read_address_channel(
        araddr(c_axi_addr_width-1 downto 0)
    ),
    read_data_channel(
        rdata(c_axi_data_width-1 downto 0)
    )
) := init_axilite_if_signals(c_axi_addr_width, c_axi_data_width);
signal axilite_bfm_config   : t_axilite_bfm_config := C_AXILITE_BFM_CONFIG_DEFAULT;
signal alert_level : t_alert_level := WARNING;


begin

-- Initialize UVVM
ti_uvvm_engine_inst : entity uvvm_vvc_framework.ti_uvvm_engine;

/*
-- AXI-Lite VVC
axi_lite_vvc_inst : entity bitvis_vip_axilite.axilite_vvc
generic map (
  GC_ADDR_WIDTH   => reg_if_addr_width_c,
  GC_DATA_WIDTH   => 32,
  GC_INSTANCE_IDX => 1)
port map (
  clk => clk,

  -- t_axilite_write_address_channel  
  axilite_vvc_master_if.write_address_channel.awaddr => s_axi_awaddr(3 downto 0),
  axilite_vvc_master_if.write_address_channel.awvalid => s_axi_awvalid,
  axilite_vvc_master_if.write_address_channel.awprot  => s_axi_awprot,
  axilite_vvc_master_if.write_address_channel.awready => s_axi_awready,
  -- t_axilite_write_data_channel
  axilite_vvc_master_if.write_data_channel.wdata  => s_axi_wdata(31 downto 0),
  axilite_vvc_master_if.write_data_channel.wstrb  => s_axi_wstrb(3 downto 0),
  axilite_vvc_master_if.write_data_channel.wvalid => s_axi_wvalid,
  axilite_vvc_master_if.write_data_channel.wready => s_axi_wready,
  -- t_axilite_write_response_channel
  axilite_vvc_master_if.write_response_channel.bready => s_axi_bready,
  axilite_vvc_master_if.write_response_channel.bresp  => s_axi_bresp,
  axilite_vvc_master_if.write_response_channel.bvalid => s_axi_bvalid,
  -- t_axilite_read_address_channel
  axilite_vvc_master_if.read_address_channel.araddr   => s_axi_araddr(3 downto 0),
  axilite_vvc_master_if.read_address_channel.arvalid => s_axi_arvalid,
  axilite_vvc_master_if.read_address_channel.arprot  => s_axi_arprot,
  axilite_vvc_master_if.read_address_channel.arready => s_axi_arready,
  -- t_axilite_read_data_channel
  axilite_vvc_master_if.read_data_channel.rready => s_axi_rready,
  axilite_vvc_master_if.read_data_channel.rdata  => s_axi_rdata(31 downto 0),
  axilite_vvc_master_if.read_data_channel.rresp  => s_axi_rresp,  
  axilite_vvc_master_if.read_data_channel.rvalid => s_axi_rvalid  
);
*/

--DUT : entity work.mba_ledsw_v1_0 
DUT : entity work.mba_ledsw_v1_0_S00_AXI
generic map(
-- Parameters of Axi Slave Bus Interface S00_AXI
C_S_AXI_DATA_WIDTH	=> c_axi_data_width,
C_S_AXI_ADDR_WIDTH	=> c_axi_addr_width
)
port map(
-- Users to add ports here
--sw_i 	=> sw_i,
reg0 => sw_i,
--led_o 	=> led_o,
reg1 => led_o,
-- Ports of Axi Slave Bus Interface S00_AXI
s_axi_aclk	=> clk,
s_axi_aresetn	=> resetn,
/*
-- AXI4 write address channel
s_axi_awaddr	=> s_axi_awaddr,
s_axi_awprot	=> s_axi_awprot,
s_axi_awvalid	=> s_axi_awvalid,
s_axi_awready	=> s_axi_awready,
-- AXI4 write data channel
s_axi_wdata	=> s_axi_wdata,
s_axi_wstrb	=> s_axi_wstrb,
s_axi_wvalid	=> s_axi_wvalid,
s_axi_wready	=> s_axi_wready,
-- AXI4 write response channel
s_axi_bresp	=> s_axi_bresp,
s_axi_bvalid	=> s_axi_bvalid,
s_axi_bready	=> s_axi_bready,
-- AXI4 read address channel
s_axi_araddr	=> s_axi_araddr,
s_axi_arprot	=> s_axi_arprot,
s_axi_arvalid	=> s_axi_arvalid,
s_axi_arready	=> s_axi_arready,
-- AXI4 read data channel
s_axi_rdata	=> s_axi_rdata,
s_axi_rresp	=> s_axi_rresp,
s_axi_rvalid	=> s_axi_rvalid,
s_axi_rready	=> s_axi_rready
*/
-- AXI4 write address channel
s_axi_awaddr	=> axilite_if.write_address_channel.awaddr,
s_axi_awprot	=> axilite_if.write_address_channel.awprot,
s_axi_awvalid	=> axilite_if.write_address_channel.awvalid,
s_axi_awready	=> axilite_if.write_address_channel.awready,
-- AXI4 write data channel
s_axi_wdata	=> axilite_if.write_data_channel.wdata,
s_axi_wstrb	=> axilite_if.write_data_channel.wstrb,
s_axi_wvalid	=> axilite_if.write_data_channel.wvalid,
s_axi_wready	=> axilite_if.write_data_channel.wready,
-- AXI4 write response channel
s_axi_bresp	=> axilite_if.write_response_channel.bresp,
s_axi_bvalid	=> axilite_if.write_response_channel.bvalid,
s_axi_bready	=> axilite_if.write_response_channel.bready,
-- AXI4 read address channel
s_axi_araddr	=> axilite_if.read_address_channel.araddr,
s_axi_arprot	=> axilite_if.read_address_channel.arprot,
s_axi_arvalid	=> axilite_if.read_address_channel.arvalid,
s_axi_arready	=> axilite_if.read_address_channel.arready,
-- AXI4 read data channel
s_axi_rdata	=> axilite_if.read_data_channel.rdata,
s_axi_rresp	=> axilite_if.read_data_channel.rresp,
s_axi_rvalid	=> axilite_if.read_data_channel.rvalid,
s_axi_rready	=> axilite_if.read_data_channel.rready
);



-----------------------------------------------------------------------------
-- Clock Generator
-----------------------------------------------------------------------------
clock_generator(clk, c_clkperiod, c_clock_high_percentage);

------------------------------------------------
-- PROCESS: p_main
------------------------------------------------
p_main: process
    constant C_SCOPE        : string    := C_VVC_CMD_SCOPE_DEFAULT; --C_TB_SCOPE_DEFAULT;
    variable v_time_stamp   : time      := 0 ns;
    variable v_data         : std_logic_vector(c_axi_data_width-1 downto 0);
    variable v_addr         : unsigned(c_axi_addr_width-1 downto 0);

    --variable axilite_bfm_config : t_axilite_bfm_config := C_AXILITE_BFM_CONFIG_DEFAULT;


    procedure axilite_write (
      constant addr_value : in unsigned;
      constant data_value : in std_logic_vector;
      constant msg        : in string) is
    begin

    axilite_write(
        addr_value,             -- keep as is
        data_value,             -- keep as is
        msg,                    -- keep as is
        clk,                    -- Clock signal
        axilite_if,             -- Signal must be visible in local process scope
        C_SCOPE,                -- Just use the default
        shared_msg_id_panel,    -- Use global, shared msg_id_panel
        axilite_bfm_config      -- Use locally defined configuration or C_AXILITE_BFM_CONFIG_DEFAULT
    );              

    end;    

    procedure axilite_check (
      constant addr_value : in unsigned;
      constant data_exp   : in std_logic_vector;
      constant msg        : in string) is
    begin

        axilite_check(
            addr_value,             -- keep as is
            data_exp,               -- keep as is
            msg,                    -- keep as is
            clk,                    -- Clock signal
            axilite_if,             -- Signal must be visible in local process scope
            alert_level,            -- alert level
            C_SCOPE,                -- Just use the default
            shared_msg_id_panel,    -- Use global, shared msg_id_panel
            axilite_bfm_config      -- Use locally defined configuration or C_AXILITE_BFM_CONFIG_DEFAULT
        );                          
    end;


begin


    -- axi lite initializations
    --axilite_bfm_config.clock_period     <= c_clkperiod;
    --shared_axilite_vvc_config(1).bfm_config.clock_period <= c_clkperiod;

    -- Wait for UVVM to finish initialization
    await_uvvm_initialization(VOID);

    -- Print the configuration to the log
    -- report_global_ctrl(VOID);
    -- report_msg_id_panel(VOID);

    enable_log_msg(ALL_MESSAGES);
    --disable_log_msg(ALL_MESSAGES);
    --enable_log_msg(ID_LOG_HDR);

    log(ID_LOG_HDR, "Start Simulation of TB for custom axi lite IP", C_SCOPE);

    -- release active-low resetn signal 
    resetn  <= '0';
    wait for c_clkperiod*10;
    resetn  <= '1';
    wait for c_clkperiod*10;

    
    -- initialize axi lite signals
    --axilite_if <= init_axilite_if_signals(c_axi_addr_width,c_axi_data_width);
    wait for c_clkperiod;

    -- assign a value to switches    
    sw_i    <= x"3C";
    wait for c_clkperiod*10;

    -- read the switch value and check, which is the reg0 of axi lite registers
    v_addr  := c_reg0_addr;
    v_data  :=  x"0000003C";
    --axilite_check(AXILITE_VVCT, 1, v_addr, v_data, "0x3C expected");
    axilite_check(v_addr, v_data, "0x3c expected");
    wait for c_clkperiod*10;
    --await_completion(AXILITE_VVCT, 1, 2*axi_access_time_c, "Waitng to read...");

    -- write switch value to leds register, which is reg1 of axi lite registers
    v_addr  := c_reg1_addr;
    v_data  :=  x"0000005C";
    --axilite_write(AXILITE_VVCT, 1, v_addr, v_data, "0x5C is written");    
    axilite_write(v_addr, v_data, "0x5C is written");    
    wait for c_clkperiod*10;
    
    -- check led value, which must be 0x3C
    check_value(led_o, x"5c", ERROR, "");
    wait for 10 ps;

    --==================================================================================================
    -- Ending the simulation
    --------------------------------------------------------------------------------------
    wait for 1000 ns;             -- to allow some time for completion
    report_alert_counters(FINAL); -- Report final counters and print conclusion for simulation (Success/Fail)
    log(ID_LOG_HDR, "SIMULATION COMPLETED", C_SCOPE);

    -- Finish the simulation
    std.env.stop;
    wait;  -- to stop completely

end process p_main;

end architecture;
