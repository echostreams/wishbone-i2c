-- Xilinx Vhdl produced by program ngd2vhdl F.26
-- Command: -rpw 100 -ar Structure -xon true -w -log __projnav/ngd2vhdl.log i2c.nga i2c_timesim.vhd 
-- Input file: i2c.nga
-- Output file: i2c_timesim.vhd
-- Design name: i2c
-- Xilinx: C:/Xilinx_webpack_51
-- # of Entities: 1
-- Device: XC2C256-5-TQ144

-- The output of ngd2vhdl is a simulation model. This file cannot be synthesized,
-- or used in any other manner other than simulation. This netlist uses simulation
-- primitives which may not represent the true implementation of the device, however
-- the netlist is functionally correct. Do not modify this file.

-- Model for  ROC (Reset-On-Configuration) Cell
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.VITAL_Timing.all;
entity ROC is
  generic (InstancePath: STRING := "*";
           WIDTH : Time := 100 ns);
  port(O : out std_ulogic := '1') ;
  attribute VITAL_LEVEL0 of ROC : entity is TRUE;
end ROC;

architecture ROC_V of ROC is
attribute VITAL_LEVEL0 of ROC_V : architecture is TRUE;
begin
  ONE_SHOT : process
  begin
    if (WIDTH <= 0 ns) then
       assert FALSE report
       "*** Error: a positive value of WIDTH must be specified ***"
       severity failure;
    else
       wait for WIDTH;
       O <= '0';
    end if;
    wait;
  end process ONE_SHOT;
end ROC_V;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;
entity i2c is
  port (
    clk : in STD_LOGIC := 'X'; 
    r_w : in STD_LOGIC := 'X'; 
    as : in STD_LOGIC := 'X'; 
    reset : in STD_LOGIC := 'X'; 
    scl : inout STD_LOGIC; 
    sda : inout STD_LOGIC; 
    dtack : out STD_LOGIC; 
    irq : out STD_LOGIC; 
    mcf : out STD_LOGIC; 
    ds : in STD_LOGIC := 'X'; 
    addr_bus : in STD_LOGIC_VECTOR ( 23 downto 0 ); 
    data_bus : inout STD_LOGIC_VECTOR ( 7 downto 0 ) 
  );
end i2c;

architecture Structure of i2c is
  component ROC
    generic (InstancePath: STRING := "*";
             WIDTH : Time := 100 ns);
    port (O : out STD_ULOGIC := '1');
  end component;
  signal NlwRenamedSig_OI_dtack : STD_LOGIC; 
  signal NlwRenamedSig_OI_irq : STD_LOGIC; 
  signal data_bus_0_MC_Q : STD_LOGIC; 
  signal data_bus_0_MC_OE : STD_LOGIC; 
  signal data_bus_0_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal reset_II_FSR_Q : STD_LOGIC; 
  signal data_bus_0_MC_R_OR_PRLD : STD_LOGIC; 
  signal data_bus_0_MC_D : STD_LOGIC; 
  signal clk_II_FCLK : STD_LOGIC; 
  signal data_bus_0_MC_D1 : STD_LOGIC; 
  signal data_bus_0_MC_UIM : STD_LOGIC; 
  signal N_PZ_562 : STD_LOGIC; 
  signal data_bus_0_MC_D2_PT_0 : STD_LOGIC; 
  signal r_w_II_UIM : STD_LOGIC; 
  signal uc_ctrl_prs_state_ffd2 : STD_LOGIC; 
  signal uc_ctrl_prs_state_ffd1 : STD_LOGIC; 
  signal uc_ctrl_data_en : STD_LOGIC; 
  signal data_bus_0_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_stat_en : STD_LOGIC; 
  signal i2c_ctrl_rxak : STD_LOGIC; 
  signal data_bus_0_MC_D2_PT_2 : STD_LOGIC; 
  signal uc_ctrl_cntrl_en : STD_LOGIC; 
  signal uc_ctrl_addr_en : STD_LOGIC; 
  signal data_bus_0_MC_D2_PT_3 : STD_LOGIC; 
  signal data_bus_0_MC_D2 : STD_LOGIC; 
  signal data_bus_0_MC_BUFOE_OUT : STD_LOGIC; 
  signal FOOBAR2_ctinst_7 : STD_LOGIC; 
  signal uc_ctrl_prs_state_ffd1_MC_Q : STD_LOGIC; 
  signal uc_ctrl_prs_state_ffd1_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_prs_state_ffd1_MC_D : STD_LOGIC; 
  signal uc_ctrl_prs_state_ffd1_MC_D1_PT_0 : STD_LOGIC; 
  signal uc_ctrl_prs_state_ffd1_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_address_match : STD_LOGIC; 
  signal uc_ctrl_ds_int : STD_LOGIC; 
  signal uc_ctrl_prs_state_ffd1_MC_D2_PT_0 : STD_LOGIC; 
  signal uc_ctrl_as_int_d1 : STD_LOGIC; 
  signal uc_ctrl_prs_state_ffd1_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_prs_state_ffd1_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_prs_state_ffd1_MC_GLB : STD_LOGIC; 
  signal uc_ctrl_prs_state_ffd2_MC_Q : STD_LOGIC; 
  signal uc_ctrl_prs_state_ffd2_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_prs_state_ffd2_MC_D : STD_LOGIC; 
  signal uc_ctrl_prs_state_ffd2_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_prs_state_ffd2_MC_D2_PT_0 : STD_LOGIC; 
  signal as_II_UIM : STD_LOGIC; 
  signal uc_ctrl_prs_state_ffd2_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_prs_state_ffd2_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_address_match_MC_Q : STD_LOGIC; 
  signal uc_ctrl_address_match_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_address_match_MC_D : STD_LOGIC; 
  signal addr_bus_10_II_UIM : STD_LOGIC; 
  signal addr_bus_11_II_UIM : STD_LOGIC; 
  signal addr_bus_12_II_UIM : STD_LOGIC; 
  signal addr_bus_13_II_UIM : STD_LOGIC; 
  signal addr_bus_14_II_UIM : STD_LOGIC; 
  signal addr_bus_15_II_UIM : STD_LOGIC; 
  signal addr_bus_16_II_UIM : STD_LOGIC; 
  signal addr_bus_17_II_UIM : STD_LOGIC; 
  signal addr_bus_18_II_UIM : STD_LOGIC; 
  signal addr_bus_19_II_UIM : STD_LOGIC; 
  signal addr_bus_20_II_UIM : STD_LOGIC; 
  signal addr_bus_21_II_UIM : STD_LOGIC; 
  signal addr_bus_22_II_UIM : STD_LOGIC; 
  signal addr_bus_23_II_UIM : STD_LOGIC; 
  signal addr_bus_8_II_UIM : STD_LOGIC; 
  signal addr_bus_9_II_UIM : STD_LOGIC; 
  signal uc_ctrl_address_match_MC_D1_PT_0 : STD_LOGIC; 
  signal uc_ctrl_address_match_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_address_match_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_as_int_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal uc_ctrl_as_int_d1_MC_Q : STD_LOGIC; 
  signal uc_ctrl_as_int_d1_MC_D : STD_LOGIC; 
  signal uc_ctrl_as_int : STD_LOGIC; 
  signal uc_ctrl_as_int_d1_MC_D1_PT_0 : STD_LOGIC; 
  signal uc_ctrl_as_int_d1_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_as_int_d1_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_ds_int_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal uc_ctrl_ds_int_MC_D : STD_LOGIC; 
  signal uc_ctrl_ds_int_MC_COMB : STD_LOGIC; 
  signal uc_ctrl_ds_int_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_ds_int_MC_D2_PT_0 : STD_LOGIC; 
  signal uc_ctrl_ds_int_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_ds_int_MC_D2_PT_2 : STD_LOGIC; 
  signal uc_ctrl_ds_int_MC_D2_PT_3 : STD_LOGIC; 
  signal uc_ctrl_ds_int_MC_D2_PT_4 : STD_LOGIC; 
  signal uc_ctrl_ds_int_MC_D2_PT_5 : STD_LOGIC; 
  signal uc_ctrl_ds_int_MC_D2_PT_6 : STD_LOGIC; 
  signal uc_ctrl_ds_int_MC_D2_PT_7 : STD_LOGIC; 
  signal uc_ctrl_ds_int_MC_D2_PT_8 : STD_LOGIC; 
  signal uc_ctrl_ds_int_MC_D2_PT_9 : STD_LOGIC; 
  signal uc_ctrl_ds_int_MC_D2_PT_10 : STD_LOGIC; 
  signal uc_ctrl_ds_int_MC_D2_PT_11 : STD_LOGIC; 
  signal uc_ctrl_ds_int_MC_D2_PT_12 : STD_LOGIC; 
  signal uc_ctrl_ds_int_MC_D2_PT_13 : STD_LOGIC; 
  signal uc_ctrl_ds_int_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_madr_1_MC_Q : STD_LOGIC; 
  signal uc_ctrl_madr_1_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_madr_1_MC_D : STD_LOGIC; 
  signal uc_ctrl_madr_1_MC_D1 : STD_LOGIC; 
  signal N_PZ_565 : STD_LOGIC; 
  signal uc_ctrl_madr_1_MC_D2_PT_0 : STD_LOGIC; 
  signal data_bus_1_II_UIM : STD_LOGIC; 
  signal uc_ctrl_madr_1_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_madr_1_MC_D2 : STD_LOGIC; 
  signal N_PZ_565_MC_Q : STD_LOGIC; 
  signal N_PZ_565_MC_D : STD_LOGIC; 
  signal N_PZ_665 : STD_LOGIC; 
  signal N_PZ_565_MC_D1_PT_0 : STD_LOGIC; 
  signal N_PZ_565_MC_D1 : STD_LOGIC; 
  signal N_PZ_565_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_addr_en_MC_Q : STD_LOGIC; 
  signal uc_ctrl_addr_en_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_addr_en_MC_D : STD_LOGIC; 
  signal addr_bus_0_II_UIM : STD_LOGIC; 
  signal addr_bus_1_II_UIM : STD_LOGIC; 
  signal addr_bus_2_II_UIM : STD_LOGIC; 
  signal addr_bus_3_II_UIM : STD_LOGIC; 
  signal addr_bus_4_II_UIM : STD_LOGIC; 
  signal addr_bus_5_II_UIM : STD_LOGIC; 
  signal addr_bus_6_II_UIM : STD_LOGIC; 
  signal addr_bus_7_II_UIM : STD_LOGIC; 
  signal uc_ctrl_addr_en_MC_D1_PT_0 : STD_LOGIC; 
  signal uc_ctrl_addr_en_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_addr_en_MC_D2 : STD_LOGIC; 
  signal N_PZ_665_MC_Q : STD_LOGIC; 
  signal N_PZ_665_MC_D : STD_LOGIC; 
  signal N_PZ_665_MC_D1_PT_0 : STD_LOGIC; 
  signal N_PZ_665_MC_D1 : STD_LOGIC; 
  signal N_PZ_665_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_1_MC_Q : STD_LOGIC; 
  signal FOOBAR5_ctinst_5 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_1_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_1_MC_D : STD_LOGIC; 
  signal scl_II_FCLK : STD_LOGIC; 
  signal scl_II_FCLK_tsimcreated_inv_Q : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_1_MC_CE : STD_LOGIC; 
  signal uc_ctrl_men : STD_LOGIC; 
  signal FOOBAR5_ctinst_6 : STD_LOGIC; 
  signal uc_ctrl_men_MC_Q : STD_LOGIC; 
  signal uc_ctrl_men_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_men_MC_D : STD_LOGIC; 
  signal uc_ctrl_men_MC_D1 : STD_LOGIC; 
  signal N_PZ_569 : STD_LOGIC; 
  signal data_bus_7_II_UIM : STD_LOGIC; 
  signal uc_ctrl_men_MC_D2_PT_0 : STD_LOGIC; 
  signal uc_ctrl_men_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_men_MC_D2 : STD_LOGIC; 
  signal N_PZ_569_MC_Q : STD_LOGIC; 
  signal N_PZ_569_MC_D : STD_LOGIC; 
  signal N_PZ_569_MC_D1_PT_0 : STD_LOGIC; 
  signal N_PZ_569_MC_D1 : STD_LOGIC; 
  signal N_PZ_569_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_cntrl_en_MC_Q : STD_LOGIC; 
  signal uc_ctrl_cntrl_en_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_cntrl_en_MC_D : STD_LOGIC; 
  signal uc_ctrl_cntrl_en_MC_D1_PT_0 : STD_LOGIC; 
  signal uc_ctrl_cntrl_en_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_cntrl_en_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_en : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_1_MC_CE_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_1_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_1_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_1_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_0_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_0_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_0_MC_D : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_0_MC_CE : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_0_MC_CE_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_0_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_sda_in : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_0_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_0_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_sda_in_MC_D : STD_LOGIC; 
  signal i2c_ctrl_sda_in_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_sda_in_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_master_slave : STD_LOGIC; 
  signal i2c_ctrl_arb_lost : STD_LOGIC; 
  signal i2c_ctrl_stop_scl_reg : STD_LOGIC; 
  signal i2c_ctrl_sda_in_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_sda_out_reg : STD_LOGIC; 
  signal i2c_ctrl_sda_in_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_slave_sda : STD_LOGIC; 
  signal i2c_ctrl_sda_in_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_sda_in_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_sda_in_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal i2c_ctrl_master_slave_MC_Q : STD_LOGIC; 
  signal FOOBAR3_ctinst_5 : STD_LOGIC; 
  signal i2c_ctrl_master_slave_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_master_slave_MC_D : STD_LOGIC; 
  signal i2c_ctrl_master_slave_MC_CE : STD_LOGIC; 
  signal FOOBAR3_ctinst_6 : STD_LOGIC; 
  signal i2c_ctrl_bus_busy : STD_LOGIC; 
  signal i2c_ctrl_master_slave_MC_CE_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_master_slave_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_msta : STD_LOGIC; 
  signal i2c_ctrl_master_slave_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_master_slave_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_msta_MC_Q : STD_LOGIC; 
  signal uc_ctrl_msta_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_msta_MC_D : STD_LOGIC; 
  signal uc_ctrl_msta_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_msta_rst : STD_LOGIC; 
  signal uc_ctrl_msta_MC_D2_PT_0 : STD_LOGIC; 
  signal data_bus_5_II_UIM : STD_LOGIC; 
  signal uc_ctrl_msta_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_msta_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_msta_rst_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_msta_rst_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_msta_rst_MC_D : STD_LOGIC; 
  signal i2c_ctrl_msta_rst_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_msta_rst_MC_D2_PT_0 : STD_LOGIC; 
  signal N_PZ_687 : STD_LOGIC; 
  signal i2c_ctrl_msta_rst_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_msta_rst_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd1 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd3 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd2 : STD_LOGIC; 
  signal i2c_ctrl_msta_rst_MC_D2_PT_3 : STD_LOGIC; 
  signal i2c_ctrl_msta_rst_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_arb_lost_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_arb_lost_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_arb_lost_MC_D : STD_LOGIC; 
  signal i2c_ctrl_arb_lost_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_arb_lost_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_arb_lost_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_arb_lost_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_arb_lost_MC_D2 : STD_LOGIC; 
  signal N_PZ_687_MC_Q : STD_LOGIC; 
  signal N_PZ_687_MC_D : STD_LOGIC; 
  signal N_PZ_687_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_state_ffd1 : STD_LOGIC; 
  signal i2c_ctrl_state_ffd2 : STD_LOGIC; 
  signal i2c_ctrl_scl_in : STD_LOGIC; 
  signal scl_II_UIM : STD_LOGIC; 
  signal i2c_ctrl_sda_out_reg_d1 : STD_LOGIC; 
  signal N_PZ_687_MC_D2_PT_0 : STD_LOGIC; 
  signal N_PZ_687_MC_D2_PT_1 : STD_LOGIC; 
  signal N_PZ_652 : STD_LOGIC; 
  signal N_PZ_687_MC_D2_PT_2 : STD_LOGIC; 
  signal N_PZ_687_MC_D2_PT_3 : STD_LOGIC; 
  signal N_PZ_687_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_state_ffd1_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_state_ffd1_MC_RSTF : STD_LOGIC; 
  signal i2c_ctrl_state_ffd1_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_state_ffd1_MC_D : STD_LOGIC; 
  signal N_PZ_897 : STD_LOGIC; 
  signal i2c_ctrl_state_ffd1_MC_RSTF_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_state_ffd1_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_state_ffd3 : STD_LOGIC; 
  signal i2c_ctrl_state_ffd1_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_detect_start : STD_LOGIC; 
  signal i2c_ctrl_state_ffd1_MC_D2_PT_1 : STD_LOGIC; 
  signal sda_II_UIM : STD_LOGIC; 
  signal i2c_ctrl_state_ffd1_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_state_ffd1_MC_D2_PT_3 : STD_LOGIC; 
  signal i2c_ctrl_state_ffd1_MC_D2_PT_4 : STD_LOGIC; 
  signal i2c_ctrl_state_ffd1_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_state_ffd3_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_state_ffd3_MC_RSTF : STD_LOGIC; 
  signal i2c_ctrl_state_ffd3_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_state_ffd3_MC_D : STD_LOGIC; 
  signal i2c_ctrl_state_ffd3_MC_RSTF_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_state_ffd3_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_state_ffd3_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_state_ffd3_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_state_ffd3_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_n0159 : STD_LOGIC; 
  signal i2c_ctrl_state_ffd3_MC_D2_PT_3 : STD_LOGIC; 
  signal i2c_ctrl_state_ffd3_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_state_ffd2_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_state_ffd2_MC_RSTF : STD_LOGIC; 
  signal i2c_ctrl_state_ffd2_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_state_ffd2_MC_D : STD_LOGIC; 
  signal i2c_ctrl_state_ffd2_MC_RSTF_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_state_ffd2_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_state_ffd2_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_state_ffd2_MC_D2_PT_1 : STD_LOGIC; 
  signal n7426 : STD_LOGIC; 
  signal i2c_ctrl_state_ffd2_MC_D2_PT_2 : STD_LOGIC; 
  signal uc_ctrl_mtx : STD_LOGIC; 
  signal i2c_ctrl_state_ffd2_MC_D2_PT_3 : STD_LOGIC; 
  signal i2c_ctrl_state_ffd2_MC_D2_PT_4 : STD_LOGIC; 
  signal i2c_ctrl_state_ffd2_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_detect_start_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_detect_start_MC_RSTF : STD_LOGIC; 
  signal i2c_ctrl_detect_start_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_detect_start_MC_D : STD_LOGIC; 
  signal sda_II_FCLK : STD_LOGIC; 
  signal sda_II_FCLK_tsimcreated_inv_Q : STD_LOGIC; 
  signal i2c_ctrl_n0073 : STD_LOGIC; 
  signal i2c_ctrl_detect_start_MC_RSTF_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_detect_start_MC_D1_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_detect_start_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_detect_start_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_n0073_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_n0073_MC_D : STD_LOGIC; 
  signal i2c_ctrl_n0073_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_n0073_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_n0073_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_n0073_MC_D2 : STD_LOGIC; 
  signal n7426_MC_Q : STD_LOGIC; 
  signal n7426_MC_D : STD_LOGIC; 
  signal n7426_MC_D1_PT_0 : STD_LOGIC; 
  signal n7426_MC_D1 : STD_LOGIC; 
  signal n7426_MC_D2 : STD_LOGIC; 
  signal FOOBAR6_ctinst_6 : STD_LOGIC; 
  signal FOOBAR6_ctinst_5 : STD_LOGIC; 
  signal FOOBAR6_ctinst_7 : STD_LOGIC; 
  signal i2c_ctrl_bit_cnt_0_MC_Q : STD_LOGIC; 
  signal FOOBAR4_ctinst_5 : STD_LOGIC; 
  signal i2c_ctrl_bit_cnt_0_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_bit_cnt_0_MC_D : STD_LOGIC; 
  signal i2c_ctrl_bit_cnt_0_MC_D1 : STD_LOGIC; 
  signal N_PZ_672 : STD_LOGIC; 
  signal i2c_ctrl_bit_cnt_0_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_bit_cnt_0_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_bit_cnt_0_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_bit_cnt_0_MC_D_TFF : STD_LOGIC; 
  signal N_PZ_672_MC_Q : STD_LOGIC; 
  signal N_PZ_672_MC_D : STD_LOGIC; 
  signal N_PZ_672_MC_D1 : STD_LOGIC; 
  signal N_PZ_672_MC_D2_PT_0 : STD_LOGIC; 
  signal N_PZ_672_MC_D2_PT_1 : STD_LOGIC; 
  signal N_PZ_672_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_bit_cnt_1_MC_Q : STD_LOGIC; 
  signal FOOBAR8_ctinst_5 : STD_LOGIC; 
  signal i2c_ctrl_bit_cnt_1_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_bit_cnt_1_MC_D : STD_LOGIC; 
  signal i2c_ctrl_bit_cnt_1_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_bit_cnt_1_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_bit_cnt_1_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_bit_cnt_1_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_bit_cnt_1_MC_D_TFF : STD_LOGIC; 
  signal N_PZ_652_MC_Q : STD_LOGIC; 
  signal N_PZ_652_MC_D : STD_LOGIC; 
  signal N_PZ_652_MC_D1 : STD_LOGIC; 
  signal N_PZ_652_MC_D2_PT_0 : STD_LOGIC; 
  signal N_PZ_652_MC_D2_PT_1 : STD_LOGIC; 
  signal N_PZ_652_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_bit_cnt_2_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_bit_cnt_2_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_bit_cnt_2_MC_D : STD_LOGIC; 
  signal i2c_ctrl_bit_cnt_2_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_bit_cnt_2_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_bit_cnt_2_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_bit_cnt_2_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_bit_cnt_2_MC_D_TFF : STD_LOGIC; 
  signal i2c_ctrl_n0159_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_n0159_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_n0159_MC_D : STD_LOGIC; 
  signal i2c_ctrl_n0159_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_n0159_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_n0159_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_n0159_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_n0159_MC_D_TFF : STD_LOGIC; 
  signal uc_ctrl_mtx_MC_Q : STD_LOGIC; 
  signal uc_ctrl_mtx_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_mtx_MC_D : STD_LOGIC; 
  signal uc_ctrl_mtx_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_mtx_MC_D2_PT_0 : STD_LOGIC; 
  signal data_bus_4_II_UIM : STD_LOGIC; 
  signal uc_ctrl_mtx_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_mtx_MC_D2 : STD_LOGIC; 
  signal N_PZ_897_MC_Q : STD_LOGIC; 
  signal N_PZ_897_MC_D : STD_LOGIC; 
  signal i2c_ctrl_detect_stop : STD_LOGIC; 
  signal N_PZ_897_MC_D1_PT_0 : STD_LOGIC; 
  signal N_PZ_897_MC_D1 : STD_LOGIC; 
  signal N_PZ_897_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_detect_stop_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_detect_stop_MC_RSTF : STD_LOGIC; 
  signal i2c_ctrl_detect_stop_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_detect_stop_MC_D : STD_LOGIC; 
  signal N_PZ_896 : STD_LOGIC; 
  signal i2c_ctrl_detect_stop_MC_RSTF_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_detect_stop_MC_D1_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_detect_stop_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_detect_stop_MC_D2 : STD_LOGIC; 
  signal N_PZ_896_MC_Q : STD_LOGIC; 
  signal N_PZ_896_MC_D : STD_LOGIC; 
  signal N_PZ_896_MC_D1_PT_0 : STD_LOGIC; 
  signal N_PZ_896_MC_D1 : STD_LOGIC; 
  signal N_PZ_896_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_scl_in_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_scl_in_MC_D : STD_LOGIC; 
  signal i2c_ctrl_scl_in_MC_D1_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_scl_in_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_scl_in_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_sda_out_reg_d1_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_sda_out_reg_d1_MC_D : STD_LOGIC; 
  signal i2c_ctrl_sda_out_reg_d1_MC_D1_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_sda_out_reg_d1_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_sda_out_reg_d1_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_sda_out_reg_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_sda_out_reg_MC_D : STD_LOGIC; 
  signal i2c_ctrl_sda_out_reg_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_sda_out_reg_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_sda_out_reg_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_sda_out_reg_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_sda_out_reg_MC_D2_PT_3 : STD_LOGIC; 
  signal i2c_ctrl_sda_out_reg_MC_D2_PT_4 : STD_LOGIC; 
  signal i2c_ctrl_gen_stop : STD_LOGIC; 
  signal i2c_ctrl_sda_out_reg_MC_D2_PT_5 : STD_LOGIC; 
  signal i2c_ctrl_sm_stop : STD_LOGIC; 
  signal i2c_ctrl_sda_out_reg_MC_D2_PT_6 : STD_LOGIC; 
  signal i2c_ctrl_sda_out_reg_MC_D2_PT_7 : STD_LOGIC; 
  signal i2c_ctrl_sda_out_reg_MC_D2_PT_8 : STD_LOGIC; 
  signal uc_ctrl_rsta : STD_LOGIC; 
  signal i2c_ctrl_sda_out_reg_MC_D2_PT_9 : STD_LOGIC; 
  signal i2c_ctrl_sda_out_reg_MC_D2_PT_10 : STD_LOGIC; 
  signal i2c_ctrl_n0153 : STD_LOGIC; 
  signal i2c_ctrl_sda_out_reg_MC_D2_PT_11 : STD_LOGIC; 
  signal i2c_ctrl_sda_out_reg_MC_D2_PT_12 : STD_LOGIC; 
  signal i2c_ctrl_master_sda : STD_LOGIC; 
  signal i2c_ctrl_sda_out_reg_MC_D2_PT_13 : STD_LOGIC; 
  signal i2c_ctrl_sda_out_reg_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd1_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd1_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd1_MC_D : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd1_MC_D1_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd1_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd1_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd1_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_gen_start : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd1_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd1_MC_D2_PT_3 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd1_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd3_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd3_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd3_MC_D : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd3_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd3_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd3_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd3_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd3_MC_D2_PT_3 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd3_MC_D2_PT_4 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd3_MC_D2_PT_5 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd3_MC_D2_PT_6 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd3_MC_D2_PT_7 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd3_MC_D2_PT_8 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd3_MC_D2_PT_9 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd3_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd2_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd2_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd2_MC_D : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd2_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd2_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd2_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd2_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd2_MC_D2_PT_3 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd2_MC_D2_PT_4 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd2_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_scl_state_ffd2_MC_D_TFF : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_0_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_0_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_0_MC_D : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_0_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_0_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_0_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_0_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_0_MC_D2_PT_3 : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_0_MC_D2_PT_4 : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_0_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_0_MC_D_TFF : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_1_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_1_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_1_MC_D : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_1_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_1_MC_D2_PT_0 : STD_LOGIC; 
  signal N_PZ_654 : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_1_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_1_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_1_MC_D2_PT_3 : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_1_MC_D2 : STD_LOGIC; 
  signal N_PZ_654_MC_Q : STD_LOGIC; 
  signal N_PZ_654_MC_D : STD_LOGIC; 
  signal N_PZ_654_MC_D1 : STD_LOGIC; 
  signal N_PZ_654_MC_D2_PT_0 : STD_LOGIC; 
  signal N_PZ_654_MC_D2_PT_1 : STD_LOGIC; 
  signal N_PZ_654_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_n0153_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_n0153_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_n0153_MC_D : STD_LOGIC; 
  signal i2c_ctrl_n0153_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_n0153_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_n0153_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_n0153_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_n0153_MC_D2_PT_3 : STD_LOGIC; 
  signal i2c_ctrl_n0153_MC_D2_PT_4 : STD_LOGIC; 
  signal i2c_ctrl_n0153_MC_D2_PT_5 : STD_LOGIC; 
  signal i2c_ctrl_n0153_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_2_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_2_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_2_MC_D : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_2_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_2_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_2_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_2_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_2_MC_D2_PT_3 : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_2_MC_D2_PT_4 : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_2_MC_D2_PT_5 : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_2_MC_D2_PT_6 : STD_LOGIC; 
  signal i2c_ctrl_clk_cnt_2_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_rsta_MC_Q : STD_LOGIC; 
  signal uc_ctrl_rsta_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_rsta_MC_D : STD_LOGIC; 
  signal uc_ctrl_rsta_MC_D1 : STD_LOGIC; 
  signal data_bus_2_II_UIM : STD_LOGIC; 
  signal uc_ctrl_rsta_MC_D2_PT_0 : STD_LOGIC; 
  signal uc_ctrl_rsta_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_rsta_MC_D2_PT_2 : STD_LOGIC; 
  signal uc_ctrl_rsta_MC_D2_PT_3 : STD_LOGIC; 
  signal uc_ctrl_rsta_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_stop_scl_reg_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_stop_scl_reg_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_stop_scl_reg_MC_D : STD_LOGIC; 
  signal i2c_ctrl_stop_scl_reg_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_stop_scl_reg_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_stop_scl_reg_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_stop_scl_reg_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_stop_scl_reg_MC_D2_PT_3 : STD_LOGIC; 
  signal i2c_ctrl_stop_scl_reg_MC_D2_PT_4 : STD_LOGIC; 
  signal i2c_ctrl_stop_scl_reg_MC_D2_PT_5 : STD_LOGIC; 
  signal i2c_ctrl_stop_scl_reg_MC_D2_PT_6 : STD_LOGIC; 
  signal i2c_ctrl_stop_scl_reg_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_gen_stop_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_gen_stop_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_gen_stop_MC_D : STD_LOGIC; 
  signal i2c_ctrl_gen_stop_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_gen_stop_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_msta_d1 : STD_LOGIC; 
  signal i2c_ctrl_gen_stop_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_gen_stop_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_msta_d1_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_msta_d1_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_msta_d1_MC_D : STD_LOGIC; 
  signal i2c_ctrl_msta_d1_MC_D1_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_msta_d1_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_msta_d1_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_sm_stop_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_sm_stop_MC_RSTF : STD_LOGIC; 
  signal i2c_ctrl_sm_stop_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_sm_stop_MC_D : STD_LOGIC; 
  signal i2c_ctrl_sm_stop_MC_RSTF_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_sm_stop_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_sm_stop_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_sm_stop_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_sm_stop_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_sm_stop_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_sm_stop_MC_D_TFF : STD_LOGIC; 
  signal i2c_ctrl_bus_busy_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_bus_busy_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_bus_busy_MC_D : STD_LOGIC; 
  signal i2c_ctrl_bus_busy_MC_CE : STD_LOGIC; 
  signal N_PZ_892 : STD_LOGIC; 
  signal i2c_ctrl_bus_busy_MC_CE_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_bus_busy_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_bus_busy_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_bus_busy_MC_D2 : STD_LOGIC; 
  signal N_PZ_892_MC_Q : STD_LOGIC; 
  signal N_PZ_892_MC_D : STD_LOGIC; 
  signal N_PZ_892_MC_D1_PT_0 : STD_LOGIC; 
  signal N_PZ_892_MC_D1 : STD_LOGIC; 
  signal N_PZ_892_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_gen_start_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_gen_start_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_gen_start_MC_D : STD_LOGIC; 
  signal i2c_ctrl_gen_start_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_gen_start_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_gen_start_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_gen_start_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_master_sda_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_master_sda_MC_D : STD_LOGIC; 
  signal FOOBAR7_ctinst_6 : STD_LOGIC; 
  signal FOOBAR7_ctinst_5 : STD_LOGIC; 
  signal i2c_ctrl_master_sda_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_shift_out : STD_LOGIC; 
  signal i2c_ctrl_master_sda_MC_D2_PT_0 : STD_LOGIC; 
  signal uc_ctrl_txak : STD_LOGIC; 
  signal i2c_ctrl_master_sda_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_master_sda_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_master_sda_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_shift_out_MC_Q : STD_LOGIC; 
  signal FOOBAR9_ctinst_5 : STD_LOGIC; 
  signal i2c_ctrl_shift_out_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_shift_out_MC_D : STD_LOGIC; 
  signal i2c_ctrl_shift_out_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_ld : STD_LOGIC; 
  signal i2c_ctrl_shift_out_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_en : STD_LOGIC; 
  signal i2c_ctrl_shift_out_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_shift_out_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_shift_out_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_ld_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_ld_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_ld_MC_D : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_ld_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_ld_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_ld_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_ld_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_ld_MC_D2_PT_3 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_ld_MC_D2_PT_4 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_ld_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_7_MC_Q : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_7_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_7_MC_D : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_7_MC_D1 : STD_LOGIC; 
  signal N_PZ_564 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_7_MC_D2_PT_0 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_7_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_7_MC_D2 : STD_LOGIC; 
  signal N_PZ_564_MC_Q : STD_LOGIC; 
  signal N_PZ_564_MC_D : STD_LOGIC; 
  signal N_PZ_564_MC_D1_PT_0 : STD_LOGIC; 
  signal N_PZ_564_MC_D1 : STD_LOGIC; 
  signal N_PZ_564_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_data_en_MC_Q : STD_LOGIC; 
  signal uc_ctrl_data_en_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_data_en_MC_D : STD_LOGIC; 
  signal uc_ctrl_data_en_MC_D1_PT_0 : STD_LOGIC; 
  signal uc_ctrl_data_en_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_data_en_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_en_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_en_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_en_MC_D : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_en_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_en_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_en_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_en_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_6_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_6_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_6_MC_D : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_6_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_6_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_6_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_6_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_6_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_6_MC_Q : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_6_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_6_MC_D : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_6_MC_D1 : STD_LOGIC; 
  signal data_bus_6_II_UIM : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_6_MC_D2_PT_0 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_6_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_6_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_5_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_5_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_5_MC_D : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_5_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_5_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_5_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_5_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_5_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_5_MC_Q : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_5_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_5_MC_D : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_5_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_5_MC_D2_PT_0 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_5_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_5_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_4_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_4_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_4_MC_D : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_4_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_4_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_4_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_4_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_4_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_4_MC_Q : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_4_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_4_MC_D : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_4_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_4_MC_D2_PT_0 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_4_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_4_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_3_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_3_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_3_MC_D : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_3_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_3_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_3_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_3_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_3_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_3_MC_Q : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_3_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_3_MC_D : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_3_MC_D1 : STD_LOGIC; 
  signal data_bus_3_II_UIM : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_3_MC_D2_PT_0 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_3_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_3_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_2_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_2_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_2_MC_D : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_2_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_2_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_2_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_2_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_2_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_2_MC_Q : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_2_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_2_MC_D : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_2_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_2_MC_D2_PT_0 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_2_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_2_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_1_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_1_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_1_MC_D : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_1_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_1_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_1_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_1_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_1_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_1_MC_Q : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_1_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_1_MC_D : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_1_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_1_MC_D2_PT_0 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_1_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_1_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_0_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_0_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_0_MC_D : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_0_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_0_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_0_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_0_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_shift_reg_0_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_0_MC_Q : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_0_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_0_MC_D : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_0_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_0_MC_D2_PT_0 : STD_LOGIC; 
  signal data_bus_0_II_UIM : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_0_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_mbdr_micro_0_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_txak_MC_Q : STD_LOGIC; 
  signal uc_ctrl_txak_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_txak_MC_D : STD_LOGIC; 
  signal uc_ctrl_txak_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_txak_MC_D2_PT_0 : STD_LOGIC; 
  signal uc_ctrl_txak_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_txak_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_slave_sda_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_slave_sda_MC_D : STD_LOGIC; 
  signal i2c_ctrl_slave_sda_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_slave_sda_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_slave_sda_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_maas : STD_LOGIC; 
  signal i2c_ctrl_slave_sda_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_slave_sda_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_maas_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_maas_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_maas_MC_D : STD_LOGIC; 
  signal i2c_ctrl_maas_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_mbcr_wr : STD_LOGIC; 
  signal i2c_ctrl_maas_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_maas_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_maas_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_maas_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_maas_MC_D_TFF : STD_LOGIC; 
  signal uc_ctrl_mbcr_wr_MC_Q : STD_LOGIC; 
  signal uc_ctrl_mbcr_wr_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_mbcr_wr_MC_D : STD_LOGIC; 
  signal uc_ctrl_mbcr_wr_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_mbcr_wr_MC_D2_PT_0 : STD_LOGIC; 
  signal uc_ctrl_mbcr_wr_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_mbcr_wr_MC_D2_PT_2 : STD_LOGIC; 
  signal uc_ctrl_mbcr_wr_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_en_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_en_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_en_MC_D : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_en_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_en_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_en_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_en_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_madr_2_MC_Q : STD_LOGIC; 
  signal uc_ctrl_madr_2_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_madr_2_MC_D : STD_LOGIC; 
  signal uc_ctrl_madr_2_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_madr_2_MC_D2_PT_0 : STD_LOGIC; 
  signal uc_ctrl_madr_2_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_madr_2_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_2_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_2_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_2_MC_D : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_2_MC_CE : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_2_MC_CE_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_2_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_2_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_2_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_madr_3_MC_Q : STD_LOGIC; 
  signal uc_ctrl_madr_3_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_madr_3_MC_D : STD_LOGIC; 
  signal uc_ctrl_madr_3_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_madr_3_MC_D2_PT_0 : STD_LOGIC; 
  signal uc_ctrl_madr_3_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_madr_3_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_3_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_3_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_3_MC_D : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_3_MC_CE : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_3_MC_CE_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_3_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_3_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_3_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_madr_4_MC_Q : STD_LOGIC; 
  signal uc_ctrl_madr_4_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_madr_4_MC_D : STD_LOGIC; 
  signal uc_ctrl_madr_4_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_madr_4_MC_D2_PT_0 : STD_LOGIC; 
  signal uc_ctrl_madr_4_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_madr_4_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_4_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_4_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_4_MC_D : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_4_MC_CE : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_4_MC_CE_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_4_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_4_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_4_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_madr_5_MC_Q : STD_LOGIC; 
  signal uc_ctrl_madr_5_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_madr_5_MC_D : STD_LOGIC; 
  signal uc_ctrl_madr_5_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_madr_5_MC_D2_PT_0 : STD_LOGIC; 
  signal uc_ctrl_madr_5_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_madr_5_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_5_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_5_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_5_MC_D : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_5_MC_CE : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_5_MC_CE_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_5_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_5_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_5_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_madr_6_MC_Q : STD_LOGIC; 
  signal uc_ctrl_madr_6_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_madr_6_MC_D : STD_LOGIC; 
  signal uc_ctrl_madr_6_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_madr_6_MC_D2_PT_0 : STD_LOGIC; 
  signal uc_ctrl_madr_6_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_madr_6_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_6_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_6_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_6_MC_D : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_6_MC_CE : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_6_MC_CE_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_6_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_6_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_6_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_madr_7_MC_Q : STD_LOGIC; 
  signal uc_ctrl_madr_7_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_madr_7_MC_D : STD_LOGIC; 
  signal uc_ctrl_madr_7_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_madr_7_MC_D2_PT_0 : STD_LOGIC; 
  signal uc_ctrl_madr_7_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_madr_7_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_7_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_7_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_7_MC_D : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_7_MC_CE : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_7_MC_CE_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_7_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_7_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_i2c_header_7_MC_D2 : STD_LOGIC; 
  signal N_PZ_562_MC_Q : STD_LOGIC; 
  signal N_PZ_562_MC_D : STD_LOGIC; 
  signal N_PZ_562_MC_D1 : STD_LOGIC; 
  signal N_PZ_562_MC_D2_PT_0 : STD_LOGIC; 
  signal N_PZ_562_MC_D2_PT_1 : STD_LOGIC; 
  signal N_PZ_562_MC_D2_PT_2 : STD_LOGIC; 
  signal N_PZ_562_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_stat_en_MC_Q : STD_LOGIC; 
  signal uc_ctrl_stat_en_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_stat_en_MC_D : STD_LOGIC; 
  signal uc_ctrl_stat_en_MC_D1_PT_0 : STD_LOGIC; 
  signal uc_ctrl_stat_en_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_stat_en_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_0_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_0_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_0_MC_D : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_0_MC_CE : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_0_MC_CE_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_0_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_0_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_0_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_rxak_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_rxak_MC_D : STD_LOGIC; 
  signal i2c_ctrl_rxak_MC_CE : STD_LOGIC; 
  signal i2c_ctrl_rxak_MC_CE_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_rxak_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_rxak_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_rxak_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_madr_0_MC_Q : STD_LOGIC; 
  signal uc_ctrl_madr_0_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_madr_0_MC_D : STD_LOGIC; 
  signal uc_ctrl_madr_0_MC_D1_PT_0 : STD_LOGIC; 
  signal uc_ctrl_madr_0_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_madr_0_MC_D2 : STD_LOGIC; 
  signal data_bus_1_MC_Q : STD_LOGIC; 
  signal data_bus_1_MC_OE : STD_LOGIC; 
  signal data_bus_1_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal data_bus_1_MC_R_OR_PRLD : STD_LOGIC; 
  signal data_bus_1_MC_D : STD_LOGIC; 
  signal data_bus_1_MC_D1 : STD_LOGIC; 
  signal data_bus_1_MC_UIM : STD_LOGIC; 
  signal data_bus_1_MC_D2_PT_0 : STD_LOGIC; 
  signal data_bus_1_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_mif : STD_LOGIC; 
  signal data_bus_1_MC_D2_PT_2 : STD_LOGIC; 
  signal data_bus_1_MC_D2_PT_3 : STD_LOGIC; 
  signal data_bus_1_MC_D2 : STD_LOGIC; 
  signal data_bus_1_MC_BUFOE_OUT : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_1_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_1_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_1_MC_D : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_1_MC_CE : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_1_MC_CE_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_1_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_1_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_1_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_mif_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_mif_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_mif_MC_D : STD_LOGIC; 
  signal i2c_ctrl_mif_MC_CE : STD_LOGIC; 
  signal i2c_ctrl_n0171 : STD_LOGIC; 
  signal i2c_ctrl_mif_MC_CE_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_mif_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_mif_bit_reset : STD_LOGIC; 
  signal i2c_ctrl_mif_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_mif_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_mif_bit_reset_MC_Q : STD_LOGIC; 
  signal uc_ctrl_mif_bit_reset_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_mif_bit_reset_MC_D : STD_LOGIC; 
  signal uc_ctrl_mif_bit_reset_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_mif_bit_reset_MC_D2_PT_0 : STD_LOGIC; 
  signal uc_ctrl_mif_bit_reset_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_mif_bit_reset_MC_D2_PT_2 : STD_LOGIC; 
  signal uc_ctrl_mif_bit_reset_MC_D2_PT_3 : STD_LOGIC; 
  signal uc_ctrl_mif_bit_reset_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_n0171_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_n0171_MC_D : STD_LOGIC; 
  signal mcf_MC_UIM : STD_LOGIC; 
  signal i2c_ctrl_mal : STD_LOGIC; 
  signal i2c_ctrl_n0171_MC_D1_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_n0171_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_n0171_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_n0171_MC_D2 : STD_LOGIC; 
  signal mcf_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal mcf_MC_Q : STD_LOGIC; 
  signal mcf_MC_R_OR_PRLD : STD_LOGIC; 
  signal mcf_MC_D : STD_LOGIC; 
  signal mcf_MC_D1_PT_0 : STD_LOGIC; 
  signal mcf_MC_D1 : STD_LOGIC; 
  signal mcf_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_mal_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_mal_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_mal_MC_D : STD_LOGIC; 
  signal i2c_ctrl_mal_MC_CE : STD_LOGIC; 
  signal i2c_ctrl_n0170 : STD_LOGIC; 
  signal i2c_ctrl_mal_MC_CE_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_mal_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_mal_bit_reset : STD_LOGIC; 
  signal i2c_ctrl_mal_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_mal_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_mal_bit_reset_MC_Q : STD_LOGIC; 
  signal uc_ctrl_mal_bit_reset_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_mal_bit_reset_MC_D : STD_LOGIC; 
  signal uc_ctrl_mal_bit_reset_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_mal_bit_reset_MC_D2_PT_0 : STD_LOGIC; 
  signal uc_ctrl_mal_bit_reset_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_mal_bit_reset_MC_D2_PT_2 : STD_LOGIC; 
  signal uc_ctrl_mal_bit_reset_MC_D2_PT_3 : STD_LOGIC; 
  signal uc_ctrl_mal_bit_reset_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_n0170_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_n0170_MC_D : STD_LOGIC; 
  signal i2c_ctrl_n0170_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_n0170_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_n0170_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_n0170_MC_D2_PT_2 : STD_LOGIC; 
  signal i2c_ctrl_bus_busy_d1 : STD_LOGIC; 
  signal i2c_ctrl_n0170_MC_D2_PT_3 : STD_LOGIC; 
  signal i2c_ctrl_n0170_MC_D2_PT_4 : STD_LOGIC; 
  signal i2c_ctrl_n0170_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_bus_busy_d1_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_bus_busy_d1_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_bus_busy_d1_MC_D : STD_LOGIC; 
  signal i2c_ctrl_bus_busy_d1_MC_D1_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_bus_busy_d1_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_bus_busy_d1_MC_D2 : STD_LOGIC; 
  signal data_bus_2_MC_Q : STD_LOGIC; 
  signal data_bus_2_MC_OE : STD_LOGIC; 
  signal data_bus_2_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal data_bus_2_MC_R_OR_PRLD : STD_LOGIC; 
  signal data_bus_2_MC_D : STD_LOGIC; 
  signal data_bus_2_MC_D1 : STD_LOGIC; 
  signal data_bus_2_MC_UIM : STD_LOGIC; 
  signal data_bus_2_MC_D2_PT_0 : STD_LOGIC; 
  signal data_bus_2_MC_D2_PT_1 : STD_LOGIC; 
  signal i2c_ctrl_srw : STD_LOGIC; 
  signal data_bus_2_MC_D2_PT_2 : STD_LOGIC; 
  signal data_bus_2_MC_D2_PT_3 : STD_LOGIC; 
  signal data_bus_2_MC_D2_PT_4 : STD_LOGIC; 
  signal data_bus_2_MC_D2 : STD_LOGIC; 
  signal data_bus_2_MC_BUFOE_OUT : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_2_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_2_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_2_MC_D : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_2_MC_CE : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_2_MC_CE_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_2_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_2_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_2_MC_D2 : STD_LOGIC; 
  signal i2c_ctrl_srw_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_srw_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_srw_MC_D : STD_LOGIC; 
  signal i2c_ctrl_srw_MC_CE : STD_LOGIC; 
  signal i2c_ctrl_srw_MC_CE_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_srw_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_srw_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_srw_MC_D2 : STD_LOGIC; 
  signal data_bus_3_MC_Q : STD_LOGIC; 
  signal data_bus_3_MC_OE : STD_LOGIC; 
  signal data_bus_3_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal data_bus_3_MC_R_OR_PRLD : STD_LOGIC; 
  signal data_bus_3_MC_D : STD_LOGIC; 
  signal data_bus_3_MC_D1 : STD_LOGIC; 
  signal data_bus_3_MC_UIM : STD_LOGIC; 
  signal data_bus_3_MC_D2_PT_0 : STD_LOGIC; 
  signal data_bus_3_MC_D2_PT_1 : STD_LOGIC; 
  signal data_bus_3_MC_D2_PT_2 : STD_LOGIC; 
  signal data_bus_3_MC_D2_PT_3 : STD_LOGIC; 
  signal data_bus_3_MC_D2 : STD_LOGIC; 
  signal data_bus_3_MC_BUFOE_OUT : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_3_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_3_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_3_MC_D : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_3_MC_CE : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_3_MC_CE_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_3_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_3_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_3_MC_D2 : STD_LOGIC; 
  signal data_bus_4_MC_Q : STD_LOGIC; 
  signal data_bus_4_MC_OE : STD_LOGIC; 
  signal data_bus_4_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal data_bus_4_MC_R_OR_PRLD : STD_LOGIC; 
  signal data_bus_4_MC_D : STD_LOGIC; 
  signal data_bus_4_MC_D1 : STD_LOGIC; 
  signal data_bus_4_MC_UIM : STD_LOGIC; 
  signal data_bus_4_MC_D2_PT_0 : STD_LOGIC; 
  signal data_bus_4_MC_D2_PT_1 : STD_LOGIC; 
  signal data_bus_4_MC_D2_PT_2 : STD_LOGIC; 
  signal data_bus_4_MC_D2_PT_3 : STD_LOGIC; 
  signal data_bus_4_MC_D2_PT_4 : STD_LOGIC; 
  signal data_bus_4_MC_D2 : STD_LOGIC; 
  signal data_bus_4_MC_BUFOE_OUT : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_4_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_4_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_4_MC_D : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_4_MC_CE : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_4_MC_CE_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_4_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_4_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_4_MC_D2 : STD_LOGIC; 
  signal data_bus_5_MC_Q : STD_LOGIC; 
  signal data_bus_5_MC_OE : STD_LOGIC; 
  signal data_bus_5_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal data_bus_5_MC_R_OR_PRLD : STD_LOGIC; 
  signal data_bus_5_MC_D : STD_LOGIC; 
  signal data_bus_5_MC_D1 : STD_LOGIC; 
  signal data_bus_5_MC_UIM : STD_LOGIC; 
  signal data_bus_5_MC_D2_PT_0 : STD_LOGIC; 
  signal data_bus_5_MC_D2_PT_1 : STD_LOGIC; 
  signal data_bus_5_MC_D2_PT_2 : STD_LOGIC; 
  signal data_bus_5_MC_D2_PT_3 : STD_LOGIC; 
  signal data_bus_5_MC_D2_PT_4 : STD_LOGIC; 
  signal data_bus_5_MC_D2 : STD_LOGIC; 
  signal data_bus_5_MC_BUFOE_OUT : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_5_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_5_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_5_MC_D : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_5_MC_CE : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_5_MC_CE_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_5_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_5_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_5_MC_D2 : STD_LOGIC; 
  signal data_bus_6_MC_Q : STD_LOGIC; 
  signal data_bus_6_MC_OE : STD_LOGIC; 
  signal data_bus_6_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal data_bus_6_MC_R_OR_PRLD : STD_LOGIC; 
  signal data_bus_6_MC_D : STD_LOGIC; 
  signal data_bus_6_MC_D1 : STD_LOGIC; 
  signal data_bus_6_MC_UIM : STD_LOGIC; 
  signal data_bus_6_MC_D2_PT_0 : STD_LOGIC; 
  signal data_bus_6_MC_D2_PT_1 : STD_LOGIC; 
  signal data_bus_6_MC_D2_PT_2 : STD_LOGIC; 
  signal uc_ctrl_mien : STD_LOGIC; 
  signal data_bus_6_MC_D2_PT_3 : STD_LOGIC; 
  signal data_bus_6_MC_D2_PT_4 : STD_LOGIC; 
  signal data_bus_6_MC_D2 : STD_LOGIC; 
  signal data_bus_6_MC_BUFOE_OUT : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_6_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_6_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_6_MC_D : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_6_MC_CE : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_6_MC_CE_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_6_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_6_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_6_MC_D2 : STD_LOGIC; 
  signal uc_ctrl_mien_MC_Q : STD_LOGIC; 
  signal uc_ctrl_mien_MC_R_OR_PRLD : STD_LOGIC; 
  signal uc_ctrl_mien_MC_D : STD_LOGIC; 
  signal uc_ctrl_mien_MC_D1 : STD_LOGIC; 
  signal uc_ctrl_mien_MC_D2_PT_0 : STD_LOGIC; 
  signal uc_ctrl_mien_MC_D2_PT_1 : STD_LOGIC; 
  signal uc_ctrl_mien_MC_D2 : STD_LOGIC; 
  signal data_bus_7_MC_Q : STD_LOGIC; 
  signal data_bus_7_MC_OE : STD_LOGIC; 
  signal data_bus_7_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal data_bus_7_MC_R_OR_PRLD : STD_LOGIC; 
  signal data_bus_7_MC_D : STD_LOGIC; 
  signal data_bus_7_MC_D1 : STD_LOGIC; 
  signal data_bus_7_MC_UIM : STD_LOGIC; 
  signal data_bus_7_MC_D2_PT_0 : STD_LOGIC; 
  signal data_bus_7_MC_D2_PT_1 : STD_LOGIC; 
  signal data_bus_7_MC_D2_PT_2 : STD_LOGIC; 
  signal data_bus_7_MC_D2_PT_3 : STD_LOGIC; 
  signal data_bus_7_MC_D2_PT_4 : STD_LOGIC; 
  signal data_bus_7_MC_D2 : STD_LOGIC; 
  signal data_bus_7_MC_BUFOE_OUT : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_7_MC_Q : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_7_MC_R_OR_PRLD : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_7_MC_D : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_7_MC_CE : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_7_MC_CE_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_7_MC_D1 : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_7_MC_D2_PT_0 : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c_7_MC_D2 : STD_LOGIC; 
  signal dtack_MC_Q : STD_LOGIC; 
  signal dtack_MC_OE : STD_LOGIC; 
  signal dtack_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal dtack_MC_D : STD_LOGIC; 
  signal dtack_MC_D1_PT_0 : STD_LOGIC; 
  signal dtack_MC_D1 : STD_LOGIC; 
  signal dtack_MC_D2 : STD_LOGIC; 
  signal dtack_MC_BUFOE_OUT : STD_LOGIC; 
  signal irq_MC_Q : STD_LOGIC; 
  signal irq_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal irq_MC_D : STD_LOGIC; 
  signal irq_MC_D1_PT_0 : STD_LOGIC; 
  signal irq_MC_D1 : STD_LOGIC; 
  signal irq_MC_D2 : STD_LOGIC; 
  signal scl_MC_Q : STD_LOGIC; 
  signal scl_MC_Q_tsim_ireg_Q : STD_LOGIC; 
  signal scl_MC_D : STD_LOGIC; 
  signal scl_MC_D1 : STD_LOGIC; 
  signal scl_MC_D2_PT_0 : STD_LOGIC; 
  signal scl_MC_D2_PT_1 : STD_LOGIC; 
  signal scl_MC_D2 : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal GND : STD_LOGIC; 
  signal PRLD : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_0_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_0_MC_D2_PT_3_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_0_MC_D2_PT_3_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_0_MC_D2_PT_3_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_prs_state_ffd1_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_prs_state_ffd1_MC_D1_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_prs_state_ffd1_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_prs_state_ffd1_MC_D2_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_prs_state_ffd1_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_prs_state_ffd1_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_prs_state_ffd2_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_prs_state_ffd2_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_prs_state_ffd2_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_prs_state_ffd2_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN9 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN10 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN11 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN12 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN13 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN14 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN15 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN16 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_3_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_4_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_5_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_6_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_7_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_8_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_9_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_10_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_11_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_12_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_13_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_1_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_1_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_1_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_1_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_565_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_addr_en_MC_D1_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_addr_en_MC_D1_PT_0_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_addr_en_MC_D1_PT_0_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_addr_en_MC_D1_PT_0_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_FOOBAR5_ctinst_5_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_FOOBAR5_ctinst_5_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_FOOBAR5_ctinst_6_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_FOOBAR5_ctinst_6_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_men_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_men_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_men_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_men_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_569_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_cntrl_en_MC_D1_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_cntrl_en_MC_D1_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_cntrl_en_MC_D1_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_cntrl_en_MC_D1_PT_0_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_cntrl_en_MC_D1_PT_0_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_in_MC_D2_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_in_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_in_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_in_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_FOOBAR3_ctinst_5_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_FOOBAR3_ctinst_5_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_FOOBAR3_ctinst_6_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_FOOBAR3_ctinst_6_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_master_slave_MC_CE_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_master_slave_MC_CE_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_msta_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_msta_MC_D2_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_msta_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_msta_rst_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_msta_rst_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_msta_rst_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_msta_rst_MC_D2_PT_3_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_msta_rst_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_msta_rst_MC_D2_PT_3_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_msta_rst_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_arb_lost_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_arb_lost_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_arb_lost_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_arb_lost_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_arb_lost_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_arb_lost_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_arb_lost_MC_D2_PT_2_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_arb_lost_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_687_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_687_MC_D2_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_687_MC_D2_PT_0_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_687_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_687_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_687_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_687_MC_D2_PT_2_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_687_MC_D2_PT_3_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd1_MC_RSTF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd1_MC_RSTF_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_2_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_3_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_3_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_4_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_4_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_4_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_4_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd3_MC_RSTF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd3_MC_RSTF_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd3_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd3_MC_D2_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd3_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd3_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd3_MC_D2_PT_2_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd3_MC_D2_PT_3_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd3_MC_D2_PT_3_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd2_MC_RSTF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd2_MC_RSTF_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_2_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_3_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_3_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_4_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_4_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_4_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_4_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_4_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_detect_start_MC_RSTF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_detect_start_MC_RSTF_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_n0073_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_n0073_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_n7426_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_n7426_MC_D1_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_FOOBAR6_ctinst_5_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_FOOBAR6_ctinst_5_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_FOOBAR6_ctinst_6_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_FOOBAR6_ctinst_6_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_FOOBAR4_ctinst_5_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_FOOBAR4_ctinst_5_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_bit_cnt_0_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_bit_cnt_0_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_bit_cnt_0_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_bit_cnt_0_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_bit_cnt_0_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_bit_cnt_0_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_672_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_672_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_672_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_672_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_FOOBAR8_ctinst_5_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_FOOBAR8_ctinst_5_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_bit_cnt_1_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_652_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_652_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_652_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_bit_cnt_2_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_bit_cnt_2_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_n0159_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_n0159_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mtx_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mtx_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mtx_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mtx_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_897_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_detect_stop_MC_RSTF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_detect_stop_MC_RSTF_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_896_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_3_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_4_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_4_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_5_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_5_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_5_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_6_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_6_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_6_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_7_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_7_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_8_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_8_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_9_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_9_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_9_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_9_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_10_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_10_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_10_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_11_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_11_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_11_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_12_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_12_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_12_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN8 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D1_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_2_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_2_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_3_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_3_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_3_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_4_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_5_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_6_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_6_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_7_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_7_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_8_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_8_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_8_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_8_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_9_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_9_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_9_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_9_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_1_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_2_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_2_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_3_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_3_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_4_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_4_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_4_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_4_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_4_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_3_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_3_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_3_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_4_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_4_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_4_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_4_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_1_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_1_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_1_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_1_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_1_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_1_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_654_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_654_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_654_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_3_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_4_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_5_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_n0153_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_4_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_5_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_5_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_5_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_5_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_6_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_6_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_6_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_6_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_rsta_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_rsta_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_rsta_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_rsta_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_rsta_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_rsta_MC_D2_PT_3_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_rsta_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_D2_PT_4_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_D2_PT_4_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_D2_PT_5_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_D2_PT_5_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_D2_PT_6_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_D2_PT_6_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_D2_PT_6_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_gen_stop_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_gen_stop_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_gen_stop_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sm_stop_MC_RSTF_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sm_stop_MC_RSTF_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sm_stop_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sm_stop_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sm_stop_MC_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sm_stop_MC_D2_PT_1_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sm_stop_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sm_stop_MC_D2_PT_2_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_sm_stop_MC_D2_PT_2_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_bus_busy_MC_CE_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_bus_busy_MC_CE_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_bus_busy_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_bus_busy_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_892_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_892_MC_D1_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_gen_start_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_gen_start_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_FOOBAR7_ctinst_5_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_FOOBAR7_ctinst_5_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_FOOBAR7_ctinst_6_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_FOOBAR7_ctinst_6_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_master_sda_MC_D2_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_master_sda_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_master_sda_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_master_sda_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_master_sda_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_master_sda_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_master_sda_MC_D2_PT_2_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_master_sda_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_FOOBAR9_ctinst_5_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_FOOBAR9_ctinst_5_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_out_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_out_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_out_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_2_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_3_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_3_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_3_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_3_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_4_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_4_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_4_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_7_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_7_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_7_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_7_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_564_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_data_en_MC_D1_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_data_en_MC_D1_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_data_en_MC_D1_PT_0_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_data_en_MC_D1_PT_0_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_en_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_6_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_6_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_6_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_6_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_6_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_6_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_6_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_5_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_5_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_5_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_5_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_5_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_5_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_5_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_4_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_4_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_4_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_4_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_4_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_4_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_4_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_3_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_3_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_3_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_3_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_3_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_3_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_3_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_2_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_2_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_2_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_2_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_2_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_2_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_2_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_1_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_1_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_1_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_1_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_1_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_1_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_1_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_0_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_0_MC_D2_PT_1_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_shift_reg_0_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_0_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_0_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_0_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbdr_micro_0_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_txak_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_txak_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_txak_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_txak_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_slave_sda_MC_D2_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_slave_sda_MC_D2_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_slave_sda_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_slave_sda_MC_D2_PT_1_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_slave_sda_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_slave_sda_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_slave_sda_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_maas_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_maas_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_maas_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_maas_MC_D2_PT_2_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_maas_MC_D2_PT_2_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbcr_wr_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mbcr_wr_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_i2c_header_en_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_i2c_header_en_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_i2c_header_en_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_i2c_header_en_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_i2c_header_en_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_2_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_2_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_2_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_2_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_3_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_3_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_3_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_3_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_4_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_4_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_4_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_4_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_5_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_5_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_5_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_5_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_6_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_6_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_6_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_6_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_7_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_7_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_7_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_7_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_562_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_562_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_562_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_562_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_562_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_562_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_562_MC_D2_PT_2_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_N_PZ_562_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_stat_en_MC_D1_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_stat_en_MC_D1_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_stat_en_MC_D1_PT_0_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_stat_en_MC_D1_PT_0_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_rxak_MC_CE_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_madr_0_MC_D1_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_1_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_1_MC_D2_PT_3_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_1_MC_D2_PT_3_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_1_MC_D2_PT_3_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_mif_MC_CE_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_mif_MC_CE_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_mif_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_mif_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mif_bit_reset_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mif_bit_reset_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mif_bit_reset_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mif_bit_reset_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mif_bit_reset_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mif_bit_reset_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_n0171_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_n0171_MC_D1_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_n0171_MC_D1_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_n0171_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_n0171_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_n0171_MC_D2_PT_0_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_n0171_MC_D2_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_n0171_MC_D2_PT_0_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_mcf_MC_D1_PT_0_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_mal_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_mal_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mal_bit_reset_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mal_bit_reset_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mal_bit_reset_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mal_bit_reset_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mal_bit_reset_MC_D2_PT_2_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mal_bit_reset_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_n0170_MC_D2_PT_2_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_n0170_MC_D2_PT_4_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_n0170_MC_D2_PT_4_IN2 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_2_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_2_MC_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_2_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_2_MC_D2_PT_2_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_2_MC_D2_PT_3_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_2_MC_D2_PT_3_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_2_MC_D2_PT_3_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_2_MC_D2_PT_4_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_2_MC_D2_PT_4_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_2_MC_D2_PT_4_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_2_MC_D2_PT_4_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_2_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_i2c_ctrl_srw_MC_CE_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_3_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_3_MC_D2_PT_2_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_3_MC_D2_PT_3_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_3_MC_D2_PT_3_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_3_MC_D2_PT_3_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_4_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_4_MC_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_4_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_4_MC_D2_PT_2_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_4_MC_D2_PT_3_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_4_MC_D2_PT_3_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_4_MC_D2_PT_3_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_4_MC_D2_PT_4_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_4_MC_D2_PT_4_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_4_MC_D2_PT_4_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_4_MC_D2_PT_4_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_4_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_5_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_5_MC_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_5_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_5_MC_D2_PT_2_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_5_MC_D2_PT_3_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_5_MC_D2_PT_3_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_5_MC_D2_PT_3_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_5_MC_D2_PT_4_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_5_MC_D2_PT_4_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_5_MC_D2_PT_4_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_5_MC_D2_PT_4_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_5_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_6_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_6_MC_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_6_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_6_MC_D2_PT_2_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_6_MC_D2_PT_3_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_6_MC_D2_PT_3_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_6_MC_D2_PT_3_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_6_MC_D2_PT_4_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_6_MC_D2_PT_4_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_6_MC_D2_PT_4_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_6_MC_D2_PT_4_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_6_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mien_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mien_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mien_MC_D2_PT_1_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_uc_ctrl_mien_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_7_MC_D2_PT_0_IN1 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_7_MC_D2_PT_1_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_7_MC_D2_PT_2_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_7_MC_D2_PT_2_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_7_MC_D2_PT_3_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_7_MC_D2_PT_3_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_7_MC_D2_PT_3_IN6 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_7_MC_D2_PT_4_IN3 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_7_MC_D2_PT_4_IN4 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_7_MC_D2_PT_4_IN5 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_7_MC_D2_PT_4_IN7 : STD_LOGIC; 
  signal NlwInverterSignal_data_bus_7_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_dtack_MC_D1_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_dtack_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_irq_CTL : STD_LOGIC; 
  signal NlwInverterSignal_irq_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_scl_CTL : STD_LOGIC; 
  signal NlwInverterSignal_scl_MC_D2_PT_0_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_scl_MC_D2_PT_1_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_scl_MC_XOR_IN0 : STD_LOGIC; 
  signal NlwInverterSignal_sda_CTL : STD_LOGIC; 
  signal i2c_ctrl_mbdr_i2c : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal uc_ctrl_madr : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal i2c_ctrl_i2c_header : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal i2c_ctrl_bit_cnt : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal i2c_ctrl_clk_cnt : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal uc_ctrl_mbdr_micro : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal i2c_ctrl_shift_reg : STD_LOGIC_VECTOR ( 6 downto 0 ); 
begin
  dtack <= NlwRenamedSig_OI_dtack;
  irq <= NlwRenamedSig_OI_irq;
  data_bus_0_Q : X_TRI
    port map (
      I => data_bus_0_MC_Q,
      CTL => data_bus_0_MC_OE,
      O => data_bus(0)
    );
  data_bus_0_MC_Q_0 : X_BUF
    port map (
      I => data_bus_0_MC_Q_tsim_ireg_Q,
      O => data_bus_0_MC_Q
    );
  data_bus_0_MC_R_OR_PRLD_1 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => data_bus_0_MC_R_OR_PRLD
    );
  data_bus_0_MC_REG : X_FF
    port map (
      I => data_bus_0_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => data_bus_0_MC_R_OR_PRLD,
      O => data_bus_0_MC_Q_tsim_ireg_Q
    );
  VCC_ONE : X_ONE
    port map (
      O => VCC
    );
  GND_ZERO : X_ZERO
    port map (
      O => GND
    );
  data_bus_0_MC_D1_2 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => data_bus_0_MC_D1
    );
  data_bus_0_MC_D2_PT_0_3 : X_AND2
    port map (
      I0 => data_bus_0_MC_UIM,
      I1 => N_PZ_562,
      O => data_bus_0_MC_D2_PT_0
    );
  data_bus_0_MC_D2_PT_1_4 : X_AND5
    port map (
      I0 => r_w_II_UIM,
      I1 => i2c_ctrl_mbdr_i2c(0),
      I2 => uc_ctrl_prs_state_ffd2,
      I3 => uc_ctrl_prs_state_ffd1,
      I4 => uc_ctrl_data_en,
      O => data_bus_0_MC_D2_PT_1
    );
  data_bus_0_MC_D2_PT_2_5 : X_AND6
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => NlwInverterSignal_data_bus_0_MC_D2_PT_2_IN3,
      I4 => uc_ctrl_stat_en,
      I5 => i2c_ctrl_rxak,
      O => data_bus_0_MC_D2_PT_2
    );
  data_bus_0_MC_D2_PT_3_6 : X_AND8
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => NlwInverterSignal_data_bus_0_MC_D2_PT_3_IN3,
      I4 => NlwInverterSignal_data_bus_0_MC_D2_PT_3_IN4,
      I5 => NlwInverterSignal_data_bus_0_MC_D2_PT_3_IN5,
      I6 => uc_ctrl_addr_en,
      I7 => uc_ctrl_madr(0),
      O => data_bus_0_MC_D2_PT_3
    );
  data_bus_0_MC_D2_7 : X_OR4
    port map (
      I0 => data_bus_0_MC_D2_PT_0,
      I1 => data_bus_0_MC_D2_PT_1,
      I2 => data_bus_0_MC_D2_PT_2,
      I3 => data_bus_0_MC_D2_PT_3,
      O => data_bus_0_MC_D2
    );
  data_bus_0_MC_XOR : X_XOR2
    port map (
      I0 => data_bus_0_MC_D1,
      I1 => data_bus_0_MC_D2,
      O => data_bus_0_MC_D
    );
  data_bus_0_MC_UIM_8 : X_BUF
    port map (
      I => data_bus_0_MC_Q_tsim_ireg_Q,
      O => data_bus_0_MC_UIM
    );
  data_bus_0_MC_OE_9 : X_BUF
    port map (
      I => data_bus_0_MC_BUFOE_OUT,
      O => data_bus_0_MC_OE
    );
  FOOBAR2_ctinst_7_10 : X_AND2
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd1,
      O => FOOBAR2_ctinst_7
    );
  r_w_II_UIM_11 : X_BUF
    port map (
      I => r_w,
      O => r_w_II_UIM
    );
  uc_ctrl_prs_state_ffd1_12 : X_BUF
    port map (
      I => uc_ctrl_prs_state_ffd1_MC_Q,
      O => uc_ctrl_prs_state_ffd1
    );
  uc_ctrl_prs_state_ffd1_MC_R_OR_PRLD_13 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_prs_state_ffd1_MC_R_OR_PRLD
    );
  uc_ctrl_prs_state_ffd1_MC_REG : X_FF
    port map (
      I => uc_ctrl_prs_state_ffd1_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_prs_state_ffd1_MC_R_OR_PRLD,
      O => uc_ctrl_prs_state_ffd1_MC_Q
    );
  uc_ctrl_prs_state_ffd1_MC_D1_PT_0_14 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_prs_state_ffd1_MC_D1_PT_0_IN0,
      I1 => NlwInverterSignal_uc_ctrl_prs_state_ffd1_MC_D1_PT_0_IN1,
      O => uc_ctrl_prs_state_ffd1_MC_D1_PT_0
    );
  uc_ctrl_prs_state_ffd1_MC_D1_15 : X_OR2
    port map (
      I0 => uc_ctrl_prs_state_ffd1_MC_D1_PT_0,
      I1 => uc_ctrl_prs_state_ffd1_MC_D1_PT_0,
      O => uc_ctrl_prs_state_ffd1_MC_D1
    );
  uc_ctrl_prs_state_ffd1_MC_D2_PT_0_16 : X_AND4
    port map (
      I0 => uc_ctrl_prs_state_ffd2,
      I1 => NlwInverterSignal_uc_ctrl_prs_state_ffd1_MC_D2_PT_0_IN1,
      I2 => uc_ctrl_address_match,
      I3 => NlwInverterSignal_uc_ctrl_prs_state_ffd1_MC_D2_PT_0_IN3,
      O => uc_ctrl_prs_state_ffd1_MC_D2_PT_0
    );
  uc_ctrl_prs_state_ffd1_MC_D2_PT_1_17 : X_AND4
    port map (
      I0 => NlwInverterSignal_uc_ctrl_prs_state_ffd1_MC_D2_PT_1_IN0,
      I1 => uc_ctrl_prs_state_ffd1,
      I2 => uc_ctrl_as_int_d1,
      I3 => uc_ctrl_ds_int,
      O => uc_ctrl_prs_state_ffd1_MC_D2_PT_1
    );
  uc_ctrl_prs_state_ffd1_MC_D2_18 : X_OR2
    port map (
      I0 => uc_ctrl_prs_state_ffd1_MC_D2_PT_0,
      I1 => uc_ctrl_prs_state_ffd1_MC_D2_PT_1,
      O => uc_ctrl_prs_state_ffd1_MC_D2
    );
  uc_ctrl_prs_state_ffd1_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_prs_state_ffd1_MC_XOR_IN0,
      I1 => uc_ctrl_prs_state_ffd1_MC_D2,
      O => uc_ctrl_prs_state_ffd1_MC_D
    );
  uc_ctrl_prs_state_ffd1_MC_GLB_19 : X_BUF
    port map (
      I => uc_ctrl_prs_state_ffd1_MC_Q,
      O => uc_ctrl_prs_state_ffd1_MC_GLB
    );
  uc_ctrl_prs_state_ffd2_20 : X_BUF
    port map (
      I => uc_ctrl_prs_state_ffd2_MC_Q,
      O => uc_ctrl_prs_state_ffd2
    );
  uc_ctrl_prs_state_ffd2_MC_R_OR_PRLD_21 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_prs_state_ffd2_MC_R_OR_PRLD
    );
  uc_ctrl_prs_state_ffd2_MC_REG : X_FF
    port map (
      I => uc_ctrl_prs_state_ffd2_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_prs_state_ffd2_MC_R_OR_PRLD,
      O => uc_ctrl_prs_state_ffd2_MC_Q
    );
  uc_ctrl_prs_state_ffd2_MC_D1_22 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_prs_state_ffd2_MC_D1
    );
  uc_ctrl_prs_state_ffd2_MC_D2_PT_0_23 : X_AND3
    port map (
      I0 => uc_ctrl_prs_state_ffd2,
      I1 => NlwInverterSignal_uc_ctrl_prs_state_ffd2_MC_D2_PT_0_IN1,
      I2 => uc_ctrl_address_match,
      O => uc_ctrl_prs_state_ffd2_MC_D2_PT_0
    );
  uc_ctrl_prs_state_ffd2_MC_D2_PT_1_24 : X_AND4
    port map (
      I0 => NlwInverterSignal_uc_ctrl_prs_state_ffd2_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_uc_ctrl_prs_state_ffd2_MC_D2_PT_1_IN1,
      I2 => NlwInverterSignal_uc_ctrl_prs_state_ffd2_MC_D2_PT_1_IN2,
      I3 => uc_ctrl_as_int_d1,
      O => uc_ctrl_prs_state_ffd2_MC_D2_PT_1
    );
  uc_ctrl_prs_state_ffd2_MC_D2_25 : X_OR2
    port map (
      I0 => uc_ctrl_prs_state_ffd2_MC_D2_PT_0,
      I1 => uc_ctrl_prs_state_ffd2_MC_D2_PT_1,
      O => uc_ctrl_prs_state_ffd2_MC_D2
    );
  uc_ctrl_prs_state_ffd2_MC_XOR : X_XOR2
    port map (
      I0 => uc_ctrl_prs_state_ffd2_MC_D1,
      I1 => uc_ctrl_prs_state_ffd2_MC_D2,
      O => uc_ctrl_prs_state_ffd2_MC_D
    );
  uc_ctrl_address_match_26 : X_BUF
    port map (
      I => uc_ctrl_address_match_MC_Q,
      O => uc_ctrl_address_match
    );
  uc_ctrl_address_match_MC_R_OR_PRLD_27 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_address_match_MC_R_OR_PRLD
    );
  uc_ctrl_address_match_MC_REG : X_FF
    port map (
      I => uc_ctrl_address_match_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_address_match_MC_R_OR_PRLD,
      O => uc_ctrl_address_match_MC_Q
    );
  uc_ctrl_address_match_MC_D1_PT_0_28 : X_AND32
    port map (
      I0 => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN0,
      I1 => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN1,
      I2 => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN2,
      I3 => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN3,
      I4 => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN4,
      I5 => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN5,
      I6 => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN6,
      I7 => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN7,
      I8 => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN8,
      I9 => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN9,
      I10 => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN10,
      I11 => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN11,
      I12 => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN12,
      I13 => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN13,
      I14 => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN14,
      I15 => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN15,
      I16 => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN16,
      I17 => uc_ctrl_as_int_d1,
      I18 => VCC,
      I19 => VCC,
      I20 => VCC,
      I21 => VCC,
      I22 => VCC,
      I23 => VCC,
      I24 => VCC,
      I25 => VCC,
      I26 => VCC,
      I27 => VCC,
      I28 => VCC,
      I29 => VCC,
      I30 => VCC,
      I31 => VCC,
      O => uc_ctrl_address_match_MC_D1_PT_0
    );
  uc_ctrl_address_match_MC_D1_29 : X_OR2
    port map (
      I0 => uc_ctrl_address_match_MC_D1_PT_0,
      I1 => uc_ctrl_address_match_MC_D1_PT_0,
      O => uc_ctrl_address_match_MC_D1
    );
  uc_ctrl_address_match_MC_D2_30 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_address_match_MC_D2
    );
  uc_ctrl_address_match_MC_XOR : X_XOR2
    port map (
      I0 => uc_ctrl_address_match_MC_D1,
      I1 => uc_ctrl_address_match_MC_D2,
      O => uc_ctrl_address_match_MC_D
    );
  addr_bus_10_II_UIM_31 : X_BUF
    port map (
      I => addr_bus(10),
      O => addr_bus_10_II_UIM
    );
  addr_bus_11_II_UIM_32 : X_BUF
    port map (
      I => addr_bus(11),
      O => addr_bus_11_II_UIM
    );
  addr_bus_12_II_UIM_33 : X_BUF
    port map (
      I => addr_bus(12),
      O => addr_bus_12_II_UIM
    );
  addr_bus_13_II_UIM_34 : X_BUF
    port map (
      I => addr_bus(13),
      O => addr_bus_13_II_UIM
    );
  addr_bus_14_II_UIM_35 : X_BUF
    port map (
      I => addr_bus(14),
      O => addr_bus_14_II_UIM
    );
  addr_bus_15_II_UIM_36 : X_BUF
    port map (
      I => addr_bus(15),
      O => addr_bus_15_II_UIM
    );
  addr_bus_16_II_UIM_37 : X_BUF
    port map (
      I => addr_bus(16),
      O => addr_bus_16_II_UIM
    );
  addr_bus_17_II_UIM_38 : X_BUF
    port map (
      I => addr_bus(17),
      O => addr_bus_17_II_UIM
    );
  addr_bus_18_II_UIM_39 : X_BUF
    port map (
      I => addr_bus(18),
      O => addr_bus_18_II_UIM
    );
  addr_bus_19_II_UIM_40 : X_BUF
    port map (
      I => addr_bus(19),
      O => addr_bus_19_II_UIM
    );
  addr_bus_20_II_UIM_41 : X_BUF
    port map (
      I => addr_bus(20),
      O => addr_bus_20_II_UIM
    );
  addr_bus_21_II_UIM_42 : X_BUF
    port map (
      I => addr_bus(21),
      O => addr_bus_21_II_UIM
    );
  addr_bus_22_II_UIM_43 : X_BUF
    port map (
      I => addr_bus(22),
      O => addr_bus_22_II_UIM
    );
  addr_bus_23_II_UIM_44 : X_BUF
    port map (
      I => addr_bus(23),
      O => addr_bus_23_II_UIM
    );
  addr_bus_8_II_UIM_45 : X_BUF
    port map (
      I => addr_bus(8),
      O => addr_bus_8_II_UIM
    );
  addr_bus_9_II_UIM_46 : X_BUF
    port map (
      I => addr_bus(9),
      O => addr_bus_9_II_UIM
    );
  as_II_UIM_47 : X_BUF
    port map (
      I => as,
      O => as_II_UIM
    );
  as_II_IREG : X_FF
    port map (
      I => as,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => reset_II_FSR_Q,
      RST => PRLD,
      O => uc_ctrl_as_int_MC_Q_tsim_ireg_Q
    );
  uc_ctrl_as_int_d1_48 : X_BUF
    port map (
      I => uc_ctrl_as_int_d1_MC_Q,
      O => uc_ctrl_as_int_d1
    );
  uc_ctrl_as_int_d1_MC_REG : X_FF
    port map (
      I => uc_ctrl_as_int_d1_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => reset_II_FSR_Q,
      RST => PRLD,
      O => uc_ctrl_as_int_d1_MC_Q
    );
  uc_ctrl_as_int_d1_MC_D1_PT_0_49 : X_AND2
    port map (
      I0 => uc_ctrl_as_int,
      I1 => uc_ctrl_as_int,
      O => uc_ctrl_as_int_d1_MC_D1_PT_0
    );
  uc_ctrl_as_int_d1_MC_D1_50 : X_OR2
    port map (
      I0 => uc_ctrl_as_int_d1_MC_D1_PT_0,
      I1 => uc_ctrl_as_int_d1_MC_D1_PT_0,
      O => uc_ctrl_as_int_d1_MC_D1
    );
  uc_ctrl_as_int_d1_MC_D2_51 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_as_int_d1_MC_D2
    );
  uc_ctrl_as_int_d1_MC_XOR : X_XOR2
    port map (
      I0 => uc_ctrl_as_int_d1_MC_D1,
      I1 => uc_ctrl_as_int_d1_MC_D2,
      O => uc_ctrl_as_int_d1_MC_D
    );
  uc_ctrl_as_int_52 : X_BUF
    port map (
      I => uc_ctrl_as_int_MC_Q_tsim_ireg_Q,
      O => uc_ctrl_as_int
    );
  clk_II_FCLK_53 : X_BUF
    port map (
      I => clk,
      O => clk_II_FCLK
    );
  reset_II_FSR_Q_54 : X_INV
    port map (
      I => reset,
      O => reset_II_FSR_Q
    );
  uc_ctrl_ds_int_55 : X_BUF
    port map (
      I => uc_ctrl_ds_int_MC_Q_tsim_ireg_Q,
      O => uc_ctrl_ds_int
    );
  uc_ctrl_ds_int_MC_COMB_56 : X_BUF
    port map (
      I => uc_ctrl_ds_int_MC_D,
      O => uc_ctrl_ds_int_MC_COMB
    );
  uc_ctrl_ds_int_MC_D1_57 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_ds_int_MC_D1
    );
  uc_ctrl_ds_int_MC_D2_PT_0_58 : X_AND2
    port map (
      I0 => uc_ctrl_madr(1),
      I1 => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_0_IN1,
      O => uc_ctrl_ds_int_MC_D2_PT_0
    );
  uc_ctrl_ds_int_MC_D2_PT_1_59 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_1_IN0,
      I1 => i2c_ctrl_i2c_header(1),
      O => uc_ctrl_ds_int_MC_D2_PT_1
    );
  uc_ctrl_ds_int_MC_D2_PT_2_60 : X_AND2
    port map (
      I0 => uc_ctrl_madr(2),
      I1 => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_2_IN1,
      O => uc_ctrl_ds_int_MC_D2_PT_2
    );
  uc_ctrl_ds_int_MC_D2_PT_3_61 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_3_IN0,
      I1 => i2c_ctrl_i2c_header(2),
      O => uc_ctrl_ds_int_MC_D2_PT_3
    );
  uc_ctrl_ds_int_MC_D2_PT_4_62 : X_AND2
    port map (
      I0 => uc_ctrl_madr(3),
      I1 => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_4_IN1,
      O => uc_ctrl_ds_int_MC_D2_PT_4
    );
  uc_ctrl_ds_int_MC_D2_PT_5_63 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_5_IN0,
      I1 => i2c_ctrl_i2c_header(3),
      O => uc_ctrl_ds_int_MC_D2_PT_5
    );
  uc_ctrl_ds_int_MC_D2_PT_6_64 : X_AND2
    port map (
      I0 => uc_ctrl_madr(4),
      I1 => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_6_IN1,
      O => uc_ctrl_ds_int_MC_D2_PT_6
    );
  uc_ctrl_ds_int_MC_D2_PT_7_65 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_7_IN0,
      I1 => i2c_ctrl_i2c_header(4),
      O => uc_ctrl_ds_int_MC_D2_PT_7
    );
  uc_ctrl_ds_int_MC_D2_PT_8_66 : X_AND2
    port map (
      I0 => uc_ctrl_madr(5),
      I1 => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_8_IN1,
      O => uc_ctrl_ds_int_MC_D2_PT_8
    );
  uc_ctrl_ds_int_MC_D2_PT_9_67 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_9_IN0,
      I1 => i2c_ctrl_i2c_header(5),
      O => uc_ctrl_ds_int_MC_D2_PT_9
    );
  uc_ctrl_ds_int_MC_D2_PT_10_68 : X_AND2
    port map (
      I0 => uc_ctrl_madr(6),
      I1 => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_10_IN1,
      O => uc_ctrl_ds_int_MC_D2_PT_10
    );
  uc_ctrl_ds_int_MC_D2_PT_11_69 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_11_IN0,
      I1 => i2c_ctrl_i2c_header(6),
      O => uc_ctrl_ds_int_MC_D2_PT_11
    );
  uc_ctrl_ds_int_MC_D2_PT_12_70 : X_AND2
    port map (
      I0 => uc_ctrl_madr(7),
      I1 => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_12_IN1,
      O => uc_ctrl_ds_int_MC_D2_PT_12
    );
  uc_ctrl_ds_int_MC_D2_PT_13_71 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_13_IN0,
      I1 => i2c_ctrl_i2c_header(7),
      O => uc_ctrl_ds_int_MC_D2_PT_13
    );
  uc_ctrl_ds_int_MC_D2_72 : X_OR16
    port map (
      I0 => uc_ctrl_ds_int_MC_D2_PT_0,
      I1 => uc_ctrl_ds_int_MC_D2_PT_1,
      I2 => uc_ctrl_ds_int_MC_D2_PT_2,
      I3 => uc_ctrl_ds_int_MC_D2_PT_3,
      I4 => uc_ctrl_ds_int_MC_D2_PT_4,
      I5 => uc_ctrl_ds_int_MC_D2_PT_5,
      I6 => uc_ctrl_ds_int_MC_D2_PT_6,
      I7 => uc_ctrl_ds_int_MC_D2_PT_7,
      I8 => uc_ctrl_ds_int_MC_D2_PT_8,
      I9 => uc_ctrl_ds_int_MC_D2_PT_9,
      I10 => uc_ctrl_ds_int_MC_D2_PT_10,
      I11 => uc_ctrl_ds_int_MC_D2_PT_11,
      I12 => uc_ctrl_ds_int_MC_D2_PT_12,
      I13 => uc_ctrl_ds_int_MC_D2_PT_13,
      I14 => GND,
      I15 => GND,
      O => uc_ctrl_ds_int_MC_D2
    );
  uc_ctrl_ds_int_MC_XOR : X_XOR2
    port map (
      I0 => uc_ctrl_ds_int_MC_D1,
      I1 => uc_ctrl_ds_int_MC_D2,
      O => uc_ctrl_ds_int_MC_D
    );
  uc_ctrl_madr_1_Q : X_BUF
    port map (
      I => uc_ctrl_madr_1_MC_Q,
      O => uc_ctrl_madr(1)
    );
  uc_ctrl_madr_1_MC_R_OR_PRLD_73 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_madr_1_MC_R_OR_PRLD
    );
  uc_ctrl_madr_1_MC_REG : X_FF
    port map (
      I => uc_ctrl_madr_1_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_madr_1_MC_R_OR_PRLD,
      O => uc_ctrl_madr_1_MC_Q
    );
  uc_ctrl_madr_1_MC_D1_74 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_madr_1_MC_D1
    );
  uc_ctrl_madr_1_MC_D2_PT_0_75 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_madr_1_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_uc_ctrl_madr_1_MC_D2_PT_0_IN1,
      O => uc_ctrl_madr_1_MC_D2_PT_0
    );
  uc_ctrl_madr_1_MC_D2_PT_1_76 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_madr_1_MC_D2_PT_1_IN0,
      I1 => N_PZ_565,
      O => uc_ctrl_madr_1_MC_D2_PT_1
    );
  uc_ctrl_madr_1_MC_D2_77 : X_OR2
    port map (
      I0 => uc_ctrl_madr_1_MC_D2_PT_0,
      I1 => uc_ctrl_madr_1_MC_D2_PT_1,
      O => uc_ctrl_madr_1_MC_D2
    );
  uc_ctrl_madr_1_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_madr_1_MC_XOR_IN0,
      I1 => uc_ctrl_madr_1_MC_D2,
      O => uc_ctrl_madr_1_MC_D
    );
  N_PZ_565_78 : X_BUF
    port map (
      I => N_PZ_565_MC_Q,
      O => N_PZ_565
    );
  N_PZ_565_MC_REG : X_BUF
    port map (
      I => N_PZ_565_MC_D,
      O => N_PZ_565_MC_Q
    );
  N_PZ_565_MC_D1_PT_0_79 : X_AND3
    port map (
      I0 => NlwInverterSignal_N_PZ_565_MC_D1_PT_0_IN0,
      I1 => uc_ctrl_addr_en,
      I2 => N_PZ_665,
      O => N_PZ_565_MC_D1_PT_0
    );
  N_PZ_565_MC_D1_80 : X_OR2
    port map (
      I0 => N_PZ_565_MC_D1_PT_0,
      I1 => N_PZ_565_MC_D1_PT_0,
      O => N_PZ_565_MC_D1
    );
  N_PZ_565_MC_D2_81 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_565_MC_D2
    );
  N_PZ_565_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_565_MC_D1,
      I1 => N_PZ_565_MC_D2,
      O => N_PZ_565_MC_D
    );
  uc_ctrl_addr_en_82 : X_BUF
    port map (
      I => uc_ctrl_addr_en_MC_Q,
      O => uc_ctrl_addr_en
    );
  uc_ctrl_addr_en_MC_R_OR_PRLD_83 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_addr_en_MC_R_OR_PRLD
    );
  uc_ctrl_addr_en_MC_REG : X_FF
    port map (
      I => uc_ctrl_addr_en_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_addr_en_MC_R_OR_PRLD,
      O => uc_ctrl_addr_en_MC_Q
    );
  uc_ctrl_addr_en_MC_D1_PT_0_84 : X_AND16
    port map (
      I0 => addr_bus_0_II_UIM,
      I1 => NlwInverterSignal_uc_ctrl_addr_en_MC_D1_PT_0_IN1,
      I2 => addr_bus_2_II_UIM,
      I3 => addr_bus_3_II_UIM,
      I4 => NlwInverterSignal_uc_ctrl_addr_en_MC_D1_PT_0_IN4,
      I5 => NlwInverterSignal_uc_ctrl_addr_en_MC_D1_PT_0_IN5,
      I6 => NlwInverterSignal_uc_ctrl_addr_en_MC_D1_PT_0_IN6,
      I7 => addr_bus_7_II_UIM,
      I8 => uc_ctrl_address_match,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => uc_ctrl_addr_en_MC_D1_PT_0
    );
  uc_ctrl_addr_en_MC_D1_85 : X_OR2
    port map (
      I0 => uc_ctrl_addr_en_MC_D1_PT_0,
      I1 => uc_ctrl_addr_en_MC_D1_PT_0,
      O => uc_ctrl_addr_en_MC_D1
    );
  uc_ctrl_addr_en_MC_D2_86 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_addr_en_MC_D2
    );
  uc_ctrl_addr_en_MC_XOR : X_XOR2
    port map (
      I0 => uc_ctrl_addr_en_MC_D1,
      I1 => uc_ctrl_addr_en_MC_D2,
      O => uc_ctrl_addr_en_MC_D
    );
  addr_bus_0_II_UIM_87 : X_BUF
    port map (
      I => addr_bus(0),
      O => addr_bus_0_II_UIM
    );
  addr_bus_1_II_UIM_88 : X_BUF
    port map (
      I => addr_bus(1),
      O => addr_bus_1_II_UIM
    );
  addr_bus_2_II_UIM_89 : X_BUF
    port map (
      I => addr_bus(2),
      O => addr_bus_2_II_UIM
    );
  addr_bus_3_II_UIM_90 : X_BUF
    port map (
      I => addr_bus(3),
      O => addr_bus_3_II_UIM
    );
  addr_bus_4_II_UIM_91 : X_BUF
    port map (
      I => addr_bus(4),
      O => addr_bus_4_II_UIM
    );
  addr_bus_5_II_UIM_92 : X_BUF
    port map (
      I => addr_bus(5),
      O => addr_bus_5_II_UIM
    );
  addr_bus_6_II_UIM_93 : X_BUF
    port map (
      I => addr_bus(6),
      O => addr_bus_6_II_UIM
    );
  addr_bus_7_II_UIM_94 : X_BUF
    port map (
      I => addr_bus(7),
      O => addr_bus_7_II_UIM
    );
  N_PZ_665_95 : X_BUF
    port map (
      I => N_PZ_665_MC_Q,
      O => N_PZ_665
    );
  N_PZ_665_MC_REG : X_BUF
    port map (
      I => N_PZ_665_MC_D,
      O => N_PZ_665_MC_Q
    );
  N_PZ_665_MC_D1_PT_0_96 : X_AND2
    port map (
      I0 => uc_ctrl_prs_state_ffd2,
      I1 => uc_ctrl_prs_state_ffd1,
      O => N_PZ_665_MC_D1_PT_0
    );
  N_PZ_665_MC_D1_97 : X_OR2
    port map (
      I0 => N_PZ_665_MC_D1_PT_0,
      I1 => N_PZ_665_MC_D1_PT_0,
      O => N_PZ_665_MC_D1
    );
  N_PZ_665_MC_D2_98 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_665_MC_D2
    );
  N_PZ_665_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_665_MC_D1,
      I1 => N_PZ_665_MC_D2,
      O => N_PZ_665_MC_D
    );
  data_bus_1_II_UIM_99 : X_BUF
    port map (
      I => data_bus(1),
      O => data_bus_1_II_UIM
    );
  i2c_ctrl_i2c_header_1_Q : X_BUF
    port map (
      I => i2c_ctrl_i2c_header_1_MC_Q,
      O => i2c_ctrl_i2c_header(1)
    );
  i2c_ctrl_i2c_header_1_MC_R_OR_PRLD_100 : X_OR2
    port map (
      I0 => FOOBAR5_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_i2c_header_1_MC_R_OR_PRLD
    );
  i2c_ctrl_i2c_header_1_MC_REG : X_FF
    port map (
      I => i2c_ctrl_i2c_header_1_MC_D,
      CE => i2c_ctrl_i2c_header_1_MC_CE,
      CLK => scl_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => i2c_ctrl_i2c_header_1_MC_R_OR_PRLD,
      O => i2c_ctrl_i2c_header_1_MC_Q
    );
  scl_II_FCLK_tsimcreated_inv_Q_101 : X_INV
    port map (
      I => scl_II_FCLK,
      O => scl_II_FCLK_tsimcreated_inv_Q
    );
  FOOBAR5_ctinst_5_102 : X_AND2
    port map (
      I0 => NlwInverterSignal_FOOBAR5_ctinst_5_IN0,
      I1 => NlwInverterSignal_FOOBAR5_ctinst_5_IN1,
      O => FOOBAR5_ctinst_5
    );
  FOOBAR5_ctinst_6_103 : X_AND2
    port map (
      I0 => NlwInverterSignal_FOOBAR5_ctinst_6_IN0,
      I1 => NlwInverterSignal_FOOBAR5_ctinst_6_IN1,
      O => FOOBAR5_ctinst_6
    );
  uc_ctrl_men_104 : X_BUF
    port map (
      I => uc_ctrl_men_MC_Q,
      O => uc_ctrl_men
    );
  uc_ctrl_men_MC_R_OR_PRLD_105 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_men_MC_R_OR_PRLD
    );
  uc_ctrl_men_MC_REG : X_FF
    port map (
      I => uc_ctrl_men_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_men_MC_R_OR_PRLD,
      O => uc_ctrl_men_MC_Q
    );
  uc_ctrl_men_MC_D1_106 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_men_MC_D1
    );
  uc_ctrl_men_MC_D2_PT_0_107 : X_AND2
    port map (
      I0 => N_PZ_569,
      I1 => NlwInverterSignal_uc_ctrl_men_MC_D2_PT_0_IN1,
      O => uc_ctrl_men_MC_D2_PT_0
    );
  uc_ctrl_men_MC_D2_PT_1_108 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_men_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_uc_ctrl_men_MC_D2_PT_1_IN1,
      O => uc_ctrl_men_MC_D2_PT_1
    );
  uc_ctrl_men_MC_D2_109 : X_OR2
    port map (
      I0 => uc_ctrl_men_MC_D2_PT_0,
      I1 => uc_ctrl_men_MC_D2_PT_1,
      O => uc_ctrl_men_MC_D2
    );
  uc_ctrl_men_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_men_MC_XOR_IN0,
      I1 => uc_ctrl_men_MC_D2,
      O => uc_ctrl_men_MC_D
    );
  N_PZ_569_110 : X_BUF
    port map (
      I => N_PZ_569_MC_Q,
      O => N_PZ_569
    );
  N_PZ_569_MC_REG : X_BUF
    port map (
      I => N_PZ_569_MC_D,
      O => N_PZ_569_MC_Q
    );
  N_PZ_569_MC_D1_PT_0_111 : X_AND3
    port map (
      I0 => NlwInverterSignal_N_PZ_569_MC_D1_PT_0_IN0,
      I1 => uc_ctrl_cntrl_en,
      I2 => N_PZ_665,
      O => N_PZ_569_MC_D1_PT_0
    );
  N_PZ_569_MC_D1_112 : X_OR2
    port map (
      I0 => N_PZ_569_MC_D1_PT_0,
      I1 => N_PZ_569_MC_D1_PT_0,
      O => N_PZ_569_MC_D1
    );
  N_PZ_569_MC_D2_113 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_569_MC_D2
    );
  N_PZ_569_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_569_MC_D1,
      I1 => N_PZ_569_MC_D2,
      O => N_PZ_569_MC_D
    );
  uc_ctrl_cntrl_en_114 : X_BUF
    port map (
      I => uc_ctrl_cntrl_en_MC_Q,
      O => uc_ctrl_cntrl_en
    );
  uc_ctrl_cntrl_en_MC_R_OR_PRLD_115 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_cntrl_en_MC_R_OR_PRLD
    );
  uc_ctrl_cntrl_en_MC_REG : X_FF
    port map (
      I => uc_ctrl_cntrl_en_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_cntrl_en_MC_R_OR_PRLD,
      O => uc_ctrl_cntrl_en_MC_Q
    );
  uc_ctrl_cntrl_en_MC_D1_PT_0_116 : X_AND16
    port map (
      I0 => addr_bus_0_II_UIM,
      I1 => NlwInverterSignal_uc_ctrl_cntrl_en_MC_D1_PT_0_IN1,
      I2 => NlwInverterSignal_uc_ctrl_cntrl_en_MC_D1_PT_0_IN2,
      I3 => NlwInverterSignal_uc_ctrl_cntrl_en_MC_D1_PT_0_IN3,
      I4 => addr_bus_4_II_UIM,
      I5 => NlwInverterSignal_uc_ctrl_cntrl_en_MC_D1_PT_0_IN5,
      I6 => NlwInverterSignal_uc_ctrl_cntrl_en_MC_D1_PT_0_IN6,
      I7 => addr_bus_7_II_UIM,
      I8 => uc_ctrl_address_match,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => uc_ctrl_cntrl_en_MC_D1_PT_0
    );
  uc_ctrl_cntrl_en_MC_D1_117 : X_OR2
    port map (
      I0 => uc_ctrl_cntrl_en_MC_D1_PT_0,
      I1 => uc_ctrl_cntrl_en_MC_D1_PT_0,
      O => uc_ctrl_cntrl_en_MC_D1
    );
  uc_ctrl_cntrl_en_MC_D2_118 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_cntrl_en_MC_D2
    );
  uc_ctrl_cntrl_en_MC_XOR : X_XOR2
    port map (
      I0 => uc_ctrl_cntrl_en_MC_D1,
      I1 => uc_ctrl_cntrl_en_MC_D2,
      O => uc_ctrl_cntrl_en_MC_D
    );
  data_bus_7_II_UIM_119 : X_BUF
    port map (
      I => data_bus(7),
      O => data_bus_7_II_UIM
    );
  i2c_ctrl_i2c_header_1_MC_CE_PT_0_120 : X_AND2
    port map (
      I0 => i2c_ctrl_i2c_header_en,
      I1 => i2c_ctrl_i2c_header_en,
      O => i2c_ctrl_i2c_header_1_MC_CE_PT_0
    );
  i2c_ctrl_i2c_header_1_MC_CE_121 : X_OR2
    port map (
      I0 => i2c_ctrl_i2c_header_1_MC_CE_PT_0,
      I1 => i2c_ctrl_i2c_header_1_MC_CE_PT_0,
      O => i2c_ctrl_i2c_header_1_MC_CE
    );
  i2c_ctrl_i2c_header_1_MC_D1_122 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_i2c_header_1_MC_D1
    );
  i2c_ctrl_i2c_header_1_MC_D2_PT_0_123 : X_AND2
    port map (
      I0 => i2c_ctrl_i2c_header(0),
      I1 => i2c_ctrl_i2c_header(0),
      O => i2c_ctrl_i2c_header_1_MC_D2_PT_0
    );
  i2c_ctrl_i2c_header_1_MC_D2_124 : X_OR2
    port map (
      I0 => i2c_ctrl_i2c_header_1_MC_D2_PT_0,
      I1 => i2c_ctrl_i2c_header_1_MC_D2_PT_0,
      O => i2c_ctrl_i2c_header_1_MC_D2
    );
  i2c_ctrl_i2c_header_1_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_i2c_header_1_MC_D1,
      I1 => i2c_ctrl_i2c_header_1_MC_D2,
      O => i2c_ctrl_i2c_header_1_MC_D
    );
  i2c_ctrl_i2c_header_0_Q : X_BUF
    port map (
      I => i2c_ctrl_i2c_header_0_MC_Q,
      O => i2c_ctrl_i2c_header(0)
    );
  i2c_ctrl_i2c_header_0_MC_R_OR_PRLD_125 : X_OR2
    port map (
      I0 => FOOBAR5_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_i2c_header_0_MC_R_OR_PRLD
    );
  i2c_ctrl_i2c_header_0_MC_REG : X_FF
    port map (
      I => i2c_ctrl_i2c_header_0_MC_D,
      CE => i2c_ctrl_i2c_header_0_MC_CE,
      CLK => scl_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => i2c_ctrl_i2c_header_0_MC_R_OR_PRLD,
      O => i2c_ctrl_i2c_header_0_MC_Q
    );
  i2c_ctrl_i2c_header_0_MC_CE_PT_0_126 : X_AND2
    port map (
      I0 => i2c_ctrl_i2c_header_en,
      I1 => i2c_ctrl_i2c_header_en,
      O => i2c_ctrl_i2c_header_0_MC_CE_PT_0
    );
  i2c_ctrl_i2c_header_0_MC_CE_127 : X_OR2
    port map (
      I0 => i2c_ctrl_i2c_header_0_MC_CE_PT_0,
      I1 => i2c_ctrl_i2c_header_0_MC_CE_PT_0,
      O => i2c_ctrl_i2c_header_0_MC_CE
    );
  i2c_ctrl_i2c_header_0_MC_D1_128 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_i2c_header_0_MC_D1
    );
  i2c_ctrl_i2c_header_0_MC_D2_PT_0_129 : X_AND2
    port map (
      I0 => i2c_ctrl_sda_in,
      I1 => i2c_ctrl_sda_in,
      O => i2c_ctrl_i2c_header_0_MC_D2_PT_0
    );
  i2c_ctrl_i2c_header_0_MC_D2_130 : X_OR2
    port map (
      I0 => i2c_ctrl_i2c_header_0_MC_D2_PT_0,
      I1 => i2c_ctrl_i2c_header_0_MC_D2_PT_0,
      O => i2c_ctrl_i2c_header_0_MC_D2
    );
  i2c_ctrl_i2c_header_0_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_i2c_header_0_MC_D1,
      I1 => i2c_ctrl_i2c_header_0_MC_D2,
      O => i2c_ctrl_i2c_header_0_MC_D
    );
  i2c_ctrl_sda_in_MC_Q_131 : X_BUF
    port map (
      I => i2c_ctrl_sda_in_MC_D,
      O => i2c_ctrl_sda_in_MC_Q
    );
  i2c_ctrl_sda_in_MC_D1_132 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_sda_in_MC_D1
    );
  i2c_ctrl_sda_in_MC_D2_PT_0_133 : X_AND3
    port map (
      I0 => i2c_ctrl_master_slave,
      I1 => i2c_ctrl_arb_lost,
      I2 => NlwInverterSignal_i2c_ctrl_sda_in_MC_D2_PT_0_IN2,
      O => i2c_ctrl_sda_in_MC_D2_PT_0
    );
  i2c_ctrl_sda_in_MC_D2_PT_1_134 : X_AND3
    port map (
      I0 => i2c_ctrl_master_slave,
      I1 => NlwInverterSignal_i2c_ctrl_sda_in_MC_D2_PT_1_IN1,
      I2 => i2c_ctrl_sda_out_reg,
      O => i2c_ctrl_sda_in_MC_D2_PT_1
    );
  i2c_ctrl_sda_in_MC_D2_PT_2_135 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_sda_in_MC_D2_PT_2_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_sda_in_MC_D2_PT_2_IN1,
      I2 => i2c_ctrl_slave_sda,
      O => i2c_ctrl_sda_in_MC_D2_PT_2
    );
  i2c_ctrl_sda_in_MC_D2_136 : X_OR3
    port map (
      I0 => i2c_ctrl_sda_in_MC_D2_PT_0,
      I1 => i2c_ctrl_sda_in_MC_D2_PT_1,
      I2 => i2c_ctrl_sda_in_MC_D2_PT_2,
      O => i2c_ctrl_sda_in_MC_D2
    );
  i2c_ctrl_sda_in_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_sda_in_MC_D1,
      I1 => i2c_ctrl_sda_in_MC_D2,
      O => i2c_ctrl_sda_in_MC_D
    );
  i2c_ctrl_sda_in_137 : X_BUF
    port map (
      I => i2c_ctrl_sda_in_MC_Q_tsim_ireg_Q,
      O => i2c_ctrl_sda_in
    );
  i2c_ctrl_master_slave_138 : X_BUF
    port map (
      I => i2c_ctrl_master_slave_MC_Q,
      O => i2c_ctrl_master_slave
    );
  i2c_ctrl_master_slave_MC_R_OR_PRLD_139 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_master_slave_MC_R_OR_PRLD
    );
  i2c_ctrl_master_slave_MC_REG : X_FF
    port map (
      I => i2c_ctrl_master_slave_MC_D,
      CE => i2c_ctrl_master_slave_MC_CE,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_master_slave_MC_R_OR_PRLD,
      O => i2c_ctrl_master_slave_MC_Q
    );
  FOOBAR3_ctinst_5_140 : X_AND2
    port map (
      I0 => NlwInverterSignal_FOOBAR3_ctinst_5_IN0,
      I1 => NlwInverterSignal_FOOBAR3_ctinst_5_IN1,
      O => FOOBAR3_ctinst_5
    );
  FOOBAR3_ctinst_6_141 : X_AND2
    port map (
      I0 => NlwInverterSignal_FOOBAR3_ctinst_6_IN0,
      I1 => NlwInverterSignal_FOOBAR3_ctinst_6_IN1,
      O => FOOBAR3_ctinst_6
    );
  i2c_ctrl_master_slave_MC_CE_PT_0_142 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_master_slave_MC_CE_PT_0_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_master_slave_MC_CE_PT_0_IN1,
      O => i2c_ctrl_master_slave_MC_CE_PT_0
    );
  i2c_ctrl_master_slave_MC_CE_143 : X_OR2
    port map (
      I0 => i2c_ctrl_master_slave_MC_CE_PT_0,
      I1 => i2c_ctrl_master_slave_MC_CE_PT_0,
      O => i2c_ctrl_master_slave_MC_CE
    );
  i2c_ctrl_master_slave_MC_D1_144 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_master_slave_MC_D1
    );
  i2c_ctrl_master_slave_MC_D2_PT_0_145 : X_AND2
    port map (
      I0 => uc_ctrl_msta,
      I1 => uc_ctrl_msta,
      O => i2c_ctrl_master_slave_MC_D2_PT_0
    );
  i2c_ctrl_master_slave_MC_D2_146 : X_OR2
    port map (
      I0 => i2c_ctrl_master_slave_MC_D2_PT_0,
      I1 => i2c_ctrl_master_slave_MC_D2_PT_0,
      O => i2c_ctrl_master_slave_MC_D2
    );
  i2c_ctrl_master_slave_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_master_slave_MC_D1,
      I1 => i2c_ctrl_master_slave_MC_D2,
      O => i2c_ctrl_master_slave_MC_D
    );
  uc_ctrl_msta_147 : X_BUF
    port map (
      I => uc_ctrl_msta_MC_Q,
      O => uc_ctrl_msta
    );
  uc_ctrl_msta_MC_R_OR_PRLD_148 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_msta_MC_R_OR_PRLD
    );
  uc_ctrl_msta_MC_REG : X_FF
    port map (
      I => uc_ctrl_msta_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_msta_MC_R_OR_PRLD,
      O => uc_ctrl_msta_MC_Q
    );
  uc_ctrl_msta_MC_D1_149 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_msta_MC_D1
    );
  uc_ctrl_msta_MC_D2_PT_0_150 : X_AND3
    port map (
      I0 => uc_ctrl_msta,
      I1 => NlwInverterSignal_uc_ctrl_msta_MC_D2_PT_0_IN1,
      I2 => NlwInverterSignal_uc_ctrl_msta_MC_D2_PT_0_IN2,
      O => uc_ctrl_msta_MC_D2_PT_0
    );
  uc_ctrl_msta_MC_D2_PT_1_151 : X_AND3
    port map (
      I0 => NlwInverterSignal_uc_ctrl_msta_MC_D2_PT_1_IN0,
      I1 => N_PZ_569,
      I2 => data_bus_5_II_UIM,
      O => uc_ctrl_msta_MC_D2_PT_1
    );
  uc_ctrl_msta_MC_D2_152 : X_OR2
    port map (
      I0 => uc_ctrl_msta_MC_D2_PT_0,
      I1 => uc_ctrl_msta_MC_D2_PT_1,
      O => uc_ctrl_msta_MC_D2
    );
  uc_ctrl_msta_MC_XOR : X_XOR2
    port map (
      I0 => uc_ctrl_msta_MC_D1,
      I1 => uc_ctrl_msta_MC_D2,
      O => uc_ctrl_msta_MC_D
    );
  i2c_ctrl_msta_rst_153 : X_BUF
    port map (
      I => i2c_ctrl_msta_rst_MC_Q,
      O => i2c_ctrl_msta_rst
    );
  i2c_ctrl_msta_rst_MC_R_OR_PRLD_154 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_msta_rst_MC_R_OR_PRLD
    );
  i2c_ctrl_msta_rst_MC_REG : X_FF
    port map (
      I => i2c_ctrl_msta_rst_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_msta_rst_MC_R_OR_PRLD,
      O => i2c_ctrl_msta_rst_MC_Q
    );
  i2c_ctrl_msta_rst_MC_D1_155 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_msta_rst_MC_D1
    );
  i2c_ctrl_msta_rst_MC_D2_PT_0_156 : X_AND2
    port map (
      I0 => i2c_ctrl_master_slave,
      I1 => i2c_ctrl_arb_lost,
      O => i2c_ctrl_msta_rst_MC_D2_PT_0
    );
  i2c_ctrl_msta_rst_MC_D2_PT_1_157 : X_AND2
    port map (
      I0 => i2c_ctrl_master_slave,
      I1 => NlwInverterSignal_i2c_ctrl_msta_rst_MC_D2_PT_1_IN1,
      O => i2c_ctrl_msta_rst_MC_D2_PT_1
    );
  i2c_ctrl_msta_rst_MC_D2_PT_2_158 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_msta_rst_MC_D2_PT_2_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_msta_rst_MC_D2_PT_2_IN1,
      O => i2c_ctrl_msta_rst_MC_D2_PT_2
    );
  i2c_ctrl_msta_rst_MC_D2_PT_3_159 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_msta_rst_MC_D2_PT_3_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_msta_rst_MC_D2_PT_3_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_msta_rst_MC_D2_PT_3_IN2,
      O => i2c_ctrl_msta_rst_MC_D2_PT_3
    );
  i2c_ctrl_msta_rst_MC_D2_160 : X_OR4
    port map (
      I0 => i2c_ctrl_msta_rst_MC_D2_PT_0,
      I1 => i2c_ctrl_msta_rst_MC_D2_PT_1,
      I2 => i2c_ctrl_msta_rst_MC_D2_PT_2,
      I3 => i2c_ctrl_msta_rst_MC_D2_PT_3,
      O => i2c_ctrl_msta_rst_MC_D2
    );
  i2c_ctrl_msta_rst_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_msta_rst_MC_XOR_IN0,
      I1 => i2c_ctrl_msta_rst_MC_D2,
      O => i2c_ctrl_msta_rst_MC_D
    );
  i2c_ctrl_arb_lost_161 : X_BUF
    port map (
      I => i2c_ctrl_arb_lost_MC_Q,
      O => i2c_ctrl_arb_lost
    );
  i2c_ctrl_arb_lost_MC_R_OR_PRLD_162 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_arb_lost_MC_R_OR_PRLD
    );
  i2c_ctrl_arb_lost_MC_REG : X_FF
    port map (
      I => i2c_ctrl_arb_lost_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_arb_lost_MC_R_OR_PRLD,
      O => i2c_ctrl_arb_lost_MC_Q
    );
  i2c_ctrl_arb_lost_MC_D1_163 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_arb_lost_MC_D1
    );
  i2c_ctrl_arb_lost_MC_D2_PT_0_164 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_arb_lost_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_arb_lost_MC_D2_PT_0_IN1,
      O => i2c_ctrl_arb_lost_MC_D2_PT_0
    );
  i2c_ctrl_arb_lost_MC_D2_PT_1_165 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_arb_lost_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_arb_lost_MC_D2_PT_1_IN1,
      O => i2c_ctrl_arb_lost_MC_D2_PT_1
    );
  i2c_ctrl_arb_lost_MC_D2_PT_2_166 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_arb_lost_MC_D2_PT_2_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_arb_lost_MC_D2_PT_2_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_arb_lost_MC_D2_PT_2_IN2,
      O => i2c_ctrl_arb_lost_MC_D2_PT_2
    );
  i2c_ctrl_arb_lost_MC_D2_167 : X_OR3
    port map (
      I0 => i2c_ctrl_arb_lost_MC_D2_PT_0,
      I1 => i2c_ctrl_arb_lost_MC_D2_PT_1,
      I2 => i2c_ctrl_arb_lost_MC_D2_PT_2,
      O => i2c_ctrl_arb_lost_MC_D2
    );
  i2c_ctrl_arb_lost_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_arb_lost_MC_XOR_IN0,
      I1 => i2c_ctrl_arb_lost_MC_D2,
      O => i2c_ctrl_arb_lost_MC_D
    );
  N_PZ_687_168 : X_BUF
    port map (
      I => N_PZ_687_MC_Q,
      O => N_PZ_687
    );
  N_PZ_687_MC_REG : X_BUF
    port map (
      I => N_PZ_687_MC_D,
      O => N_PZ_687_MC_Q
    );
  N_PZ_687_MC_D1_169 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_687_MC_D1
    );
  N_PZ_687_MC_D2_PT_0_170 : X_AND6
    port map (
      I0 => NlwInverterSignal_N_PZ_687_MC_D2_PT_0_IN0,
      I1 => i2c_ctrl_sda_in,
      I2 => NlwInverterSignal_N_PZ_687_MC_D2_PT_0_IN2,
      I3 => i2c_ctrl_scl_in,
      I4 => scl_II_UIM,
      I5 => NlwInverterSignal_N_PZ_687_MC_D2_PT_0_IN5,
      O => N_PZ_687_MC_D2_PT_0
    );
  N_PZ_687_MC_D2_PT_1_171 : X_AND6
    port map (
      I0 => NlwInverterSignal_N_PZ_687_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_N_PZ_687_MC_D2_PT_1_IN1,
      I2 => NlwInverterSignal_N_PZ_687_MC_D2_PT_1_IN2,
      I3 => i2c_ctrl_scl_in,
      I4 => scl_II_UIM,
      I5 => i2c_ctrl_sda_out_reg_d1,
      O => N_PZ_687_MC_D2_PT_1
    );
  N_PZ_687_MC_D2_PT_2_172 : X_AND6
    port map (
      I0 => i2c_ctrl_sda_in,
      I1 => i2c_ctrl_state_ffd2,
      I2 => i2c_ctrl_scl_in,
      I3 => scl_II_UIM,
      I4 => N_PZ_652,
      I5 => NlwInverterSignal_N_PZ_687_MC_D2_PT_2_IN5,
      O => N_PZ_687_MC_D2_PT_2
    );
  N_PZ_687_MC_D2_PT_3_173 : X_AND6
    port map (
      I0 => NlwInverterSignal_N_PZ_687_MC_D2_PT_3_IN0,
      I1 => i2c_ctrl_state_ffd2,
      I2 => i2c_ctrl_scl_in,
      I3 => scl_II_UIM,
      I4 => N_PZ_652,
      I5 => i2c_ctrl_sda_out_reg_d1,
      O => N_PZ_687_MC_D2_PT_3
    );
  N_PZ_687_MC_D2_174 : X_OR4
    port map (
      I0 => N_PZ_687_MC_D2_PT_0,
      I1 => N_PZ_687_MC_D2_PT_1,
      I2 => N_PZ_687_MC_D2_PT_2,
      I3 => N_PZ_687_MC_D2_PT_3,
      O => N_PZ_687_MC_D2
    );
  N_PZ_687_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_687_MC_D1,
      I1 => N_PZ_687_MC_D2,
      O => N_PZ_687_MC_D
    );
  i2c_ctrl_state_ffd1_175 : X_BUF
    port map (
      I => i2c_ctrl_state_ffd1_MC_Q,
      O => i2c_ctrl_state_ffd1
    );
  i2c_ctrl_state_ffd1_MC_R_OR_PRLD_176 : X_OR2
    port map (
      I0 => i2c_ctrl_state_ffd1_MC_RSTF,
      I1 => PRLD,
      O => i2c_ctrl_state_ffd1_MC_R_OR_PRLD
    );
  i2c_ctrl_state_ffd1_MC_REG : X_FF
    port map (
      I => i2c_ctrl_state_ffd1_MC_D,
      CE => VCC,
      CLK => scl_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => i2c_ctrl_state_ffd1_MC_R_OR_PRLD,
      O => i2c_ctrl_state_ffd1_MC_Q
    );
  i2c_ctrl_state_ffd1_MC_RSTF_PT_0_177 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_RSTF_PT_0_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_RSTF_PT_0_IN1,
      O => i2c_ctrl_state_ffd1_MC_RSTF_PT_0
    );
  i2c_ctrl_state_ffd1_MC_RSTF_178 : X_OR2
    port map (
      I0 => i2c_ctrl_state_ffd1_MC_RSTF_PT_0,
      I1 => i2c_ctrl_state_ffd1_MC_RSTF_PT_0,
      O => i2c_ctrl_state_ffd1_MC_RSTF
    );
  i2c_ctrl_state_ffd1_MC_D1_179 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_state_ffd1_MC_D1
    );
  i2c_ctrl_state_ffd1_MC_D2_PT_0_180 : X_AND3
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => i2c_ctrl_state_ffd1,
      I2 => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_0_IN2,
      O => i2c_ctrl_state_ffd1_MC_D2_PT_0
    );
  i2c_ctrl_state_ffd1_MC_D2_PT_1_181 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_1_IN0,
      I1 => i2c_ctrl_state_ffd1,
      I2 => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_1_IN2,
      O => i2c_ctrl_state_ffd1_MC_D2_PT_1
    );
  i2c_ctrl_state_ffd1_MC_D2_PT_2_182 : X_AND4
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => i2c_ctrl_state_ffd1,
      I2 => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_2_IN2,
      I3 => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_2_IN3,
      O => i2c_ctrl_state_ffd1_MC_D2_PT_2
    );
  i2c_ctrl_state_ffd1_MC_D2_PT_3_183 : X_AND6
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_3_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_3_IN2,
      I3 => i2c_ctrl_master_slave,
      I4 => i2c_ctrl_state_ffd2,
      I5 => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_3_IN5,
      O => i2c_ctrl_state_ffd1_MC_D2_PT_3
    );
  i2c_ctrl_state_ffd1_MC_D2_PT_4_184 : X_AND6
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_4_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_4_IN2,
      I3 => i2c_ctrl_state_ffd2,
      I4 => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_4_IN4,
      I5 => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_4_IN5,
      O => i2c_ctrl_state_ffd1_MC_D2_PT_4
    );
  i2c_ctrl_state_ffd1_MC_D2_185 : X_OR5
    port map (
      I0 => i2c_ctrl_state_ffd1_MC_D2_PT_0,
      I1 => i2c_ctrl_state_ffd1_MC_D2_PT_1,
      I2 => i2c_ctrl_state_ffd1_MC_D2_PT_2,
      I3 => i2c_ctrl_state_ffd1_MC_D2_PT_3,
      I4 => i2c_ctrl_state_ffd1_MC_D2_PT_4,
      O => i2c_ctrl_state_ffd1_MC_D2
    );
  i2c_ctrl_state_ffd1_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_state_ffd1_MC_D1,
      I1 => i2c_ctrl_state_ffd1_MC_D2,
      O => i2c_ctrl_state_ffd1_MC_D
    );
  i2c_ctrl_state_ffd3_186 : X_BUF
    port map (
      I => i2c_ctrl_state_ffd3_MC_Q,
      O => i2c_ctrl_state_ffd3
    );
  i2c_ctrl_state_ffd3_MC_R_OR_PRLD_187 : X_OR2
    port map (
      I0 => i2c_ctrl_state_ffd3_MC_RSTF,
      I1 => PRLD,
      O => i2c_ctrl_state_ffd3_MC_R_OR_PRLD
    );
  i2c_ctrl_state_ffd3_MC_REG : X_FF
    port map (
      I => i2c_ctrl_state_ffd3_MC_D,
      CE => VCC,
      CLK => scl_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => i2c_ctrl_state_ffd3_MC_R_OR_PRLD,
      O => i2c_ctrl_state_ffd3_MC_Q
    );
  i2c_ctrl_state_ffd3_MC_RSTF_PT_0_188 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_state_ffd3_MC_RSTF_PT_0_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_state_ffd3_MC_RSTF_PT_0_IN1,
      O => i2c_ctrl_state_ffd3_MC_RSTF_PT_0
    );
  i2c_ctrl_state_ffd3_MC_RSTF_189 : X_OR2
    port map (
      I0 => i2c_ctrl_state_ffd3_MC_RSTF_PT_0,
      I1 => i2c_ctrl_state_ffd3_MC_RSTF_PT_0,
      O => i2c_ctrl_state_ffd3_MC_RSTF
    );
  i2c_ctrl_state_ffd3_MC_D1_190 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_state_ffd3_MC_D1
    );
  i2c_ctrl_state_ffd3_MC_D2_PT_0_191 : X_AND3
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => NlwInverterSignal_i2c_ctrl_state_ffd3_MC_D2_PT_0_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_state_ffd3_MC_D2_PT_0_IN2,
      O => i2c_ctrl_state_ffd3_MC_D2_PT_0
    );
  i2c_ctrl_state_ffd3_MC_D2_PT_1_192 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_state_ffd3_MC_D2_PT_1_IN0,
      I1 => i2c_ctrl_state_ffd1,
      I2 => i2c_ctrl_detect_start,
      O => i2c_ctrl_state_ffd3_MC_D2_PT_1
    );
  i2c_ctrl_state_ffd3_MC_D2_PT_2_193 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_state_ffd3_MC_D2_PT_2_IN0,
      I1 => i2c_ctrl_detect_start,
      I2 => NlwInverterSignal_i2c_ctrl_state_ffd3_MC_D2_PT_2_IN2,
      O => i2c_ctrl_state_ffd3_MC_D2_PT_2
    );
  i2c_ctrl_state_ffd3_MC_D2_PT_3_194 : X_AND6
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_state_ffd3_MC_D2_PT_3_IN0,
      I1 => i2c_ctrl_state_ffd1,
      I2 => i2c_ctrl_bit_cnt(0),
      I3 => i2c_ctrl_bit_cnt(1),
      I4 => i2c_ctrl_bit_cnt(2),
      I5 => NlwInverterSignal_i2c_ctrl_state_ffd3_MC_D2_PT_3_IN5,
      O => i2c_ctrl_state_ffd3_MC_D2_PT_3
    );
  i2c_ctrl_state_ffd3_MC_D2_195 : X_OR4
    port map (
      I0 => i2c_ctrl_state_ffd3_MC_D2_PT_0,
      I1 => i2c_ctrl_state_ffd3_MC_D2_PT_1,
      I2 => i2c_ctrl_state_ffd3_MC_D2_PT_2,
      I3 => i2c_ctrl_state_ffd3_MC_D2_PT_3,
      O => i2c_ctrl_state_ffd3_MC_D2
    );
  i2c_ctrl_state_ffd3_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_state_ffd3_MC_D1,
      I1 => i2c_ctrl_state_ffd3_MC_D2,
      O => i2c_ctrl_state_ffd3_MC_D
    );
  i2c_ctrl_state_ffd2_196 : X_BUF
    port map (
      I => i2c_ctrl_state_ffd2_MC_Q,
      O => i2c_ctrl_state_ffd2
    );
  i2c_ctrl_state_ffd2_MC_R_OR_PRLD_197 : X_OR2
    port map (
      I0 => i2c_ctrl_state_ffd2_MC_RSTF,
      I1 => PRLD,
      O => i2c_ctrl_state_ffd2_MC_R_OR_PRLD
    );
  i2c_ctrl_state_ffd2_MC_REG : X_FF
    port map (
      I => i2c_ctrl_state_ffd2_MC_D,
      CE => VCC,
      CLK => scl_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => i2c_ctrl_state_ffd2_MC_R_OR_PRLD,
      O => i2c_ctrl_state_ffd2_MC_Q
    );
  i2c_ctrl_state_ffd2_MC_RSTF_PT_0_198 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_RSTF_PT_0_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_RSTF_PT_0_IN1,
      O => i2c_ctrl_state_ffd2_MC_RSTF_PT_0
    );
  i2c_ctrl_state_ffd2_MC_RSTF_199 : X_OR2
    port map (
      I0 => i2c_ctrl_state_ffd2_MC_RSTF_PT_0,
      I1 => i2c_ctrl_state_ffd2_MC_RSTF_PT_0,
      O => i2c_ctrl_state_ffd2_MC_RSTF
    );
  i2c_ctrl_state_ffd2_MC_D1_200 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_state_ffd2_MC_D1
    );
  i2c_ctrl_state_ffd2_MC_D2_PT_0_201 : X_AND4
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_0_IN0,
      I1 => i2c_ctrl_state_ffd1,
      I2 => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_0_IN2,
      I3 => i2c_ctrl_state_ffd2,
      O => i2c_ctrl_state_ffd2_MC_D2_PT_0
    );
  i2c_ctrl_state_ffd2_MC_D2_PT_1_202 : X_AND5
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => i2c_ctrl_state_ffd1,
      I2 => i2c_ctrl_state_ffd2,
      I3 => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_1_IN3,
      I4 => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_1_IN4,
      O => i2c_ctrl_state_ffd2_MC_D2_PT_1
    );
  i2c_ctrl_state_ffd2_MC_D2_PT_2_203 : X_AND6
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => n7426,
      I2 => i2c_ctrl_bit_cnt(0),
      I3 => i2c_ctrl_bit_cnt(1),
      I4 => i2c_ctrl_bit_cnt(2),
      I5 => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_2_IN5,
      O => i2c_ctrl_state_ffd2_MC_D2_PT_2
    );
  i2c_ctrl_state_ffd2_MC_D2_PT_3_204 : X_AND7
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_3_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_3_IN2,
      I3 => i2c_ctrl_master_slave,
      I4 => i2c_ctrl_state_ffd2,
      I5 => uc_ctrl_mtx,
      I6 => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_3_IN6,
      O => i2c_ctrl_state_ffd2_MC_D2_PT_3
    );
  i2c_ctrl_state_ffd2_MC_D2_PT_4_205 : X_AND8
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_4_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_4_IN2,
      I3 => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_4_IN3,
      I4 => i2c_ctrl_state_ffd2,
      I5 => i2c_ctrl_i2c_header(0),
      I6 => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_4_IN6,
      I7 => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_4_IN7,
      O => i2c_ctrl_state_ffd2_MC_D2_PT_4
    );
  i2c_ctrl_state_ffd2_MC_D2_206 : X_OR5
    port map (
      I0 => i2c_ctrl_state_ffd2_MC_D2_PT_0,
      I1 => i2c_ctrl_state_ffd2_MC_D2_PT_1,
      I2 => i2c_ctrl_state_ffd2_MC_D2_PT_2,
      I3 => i2c_ctrl_state_ffd2_MC_D2_PT_3,
      I4 => i2c_ctrl_state_ffd2_MC_D2_PT_4,
      O => i2c_ctrl_state_ffd2_MC_D2
    );
  i2c_ctrl_state_ffd2_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_state_ffd2_MC_D1,
      I1 => i2c_ctrl_state_ffd2_MC_D2,
      O => i2c_ctrl_state_ffd2_MC_D
    );
  i2c_ctrl_detect_start_207 : X_BUF
    port map (
      I => i2c_ctrl_detect_start_MC_Q,
      O => i2c_ctrl_detect_start
    );
  i2c_ctrl_detect_start_MC_R_OR_PRLD_208 : X_OR2
    port map (
      I0 => i2c_ctrl_detect_start_MC_RSTF,
      I1 => PRLD,
      O => i2c_ctrl_detect_start_MC_R_OR_PRLD
    );
  i2c_ctrl_detect_start_MC_REG : X_FF
    port map (
      I => i2c_ctrl_detect_start_MC_D,
      CE => VCC,
      CLK => sda_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => i2c_ctrl_detect_start_MC_R_OR_PRLD,
      O => i2c_ctrl_detect_start_MC_Q
    );
  sda_II_FCLK_tsimcreated_inv_Q_209 : X_INV
    port map (
      I => sda_II_FCLK,
      O => sda_II_FCLK_tsimcreated_inv_Q
    );
  i2c_ctrl_detect_start_MC_RSTF_PT_0_210 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_detect_start_MC_RSTF_PT_0_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_detect_start_MC_RSTF_PT_0_IN1,
      O => i2c_ctrl_detect_start_MC_RSTF_PT_0
    );
  i2c_ctrl_detect_start_MC_RSTF_211 : X_OR2
    port map (
      I0 => i2c_ctrl_detect_start_MC_RSTF_PT_0,
      I1 => i2c_ctrl_detect_start_MC_RSTF_PT_0,
      O => i2c_ctrl_detect_start_MC_RSTF
    );
  i2c_ctrl_detect_start_MC_D1_PT_0_212 : X_AND2
    port map (
      I0 => scl_II_UIM,
      I1 => scl_II_UIM,
      O => i2c_ctrl_detect_start_MC_D1_PT_0
    );
  i2c_ctrl_detect_start_MC_D1_213 : X_OR2
    port map (
      I0 => i2c_ctrl_detect_start_MC_D1_PT_0,
      I1 => i2c_ctrl_detect_start_MC_D1_PT_0,
      O => i2c_ctrl_detect_start_MC_D1
    );
  i2c_ctrl_detect_start_MC_D2_214 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_detect_start_MC_D2
    );
  i2c_ctrl_detect_start_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_detect_start_MC_D1,
      I1 => i2c_ctrl_detect_start_MC_D2,
      O => i2c_ctrl_detect_start_MC_D
    );
  scl_II_UIM_215 : X_BUF
    port map (
      I => scl,
      O => scl_II_UIM
    );
  scl_II_FCLK_216 : X_BUF
    port map (
      I => scl,
      O => scl_II_FCLK
    );
  i2c_ctrl_n0073_217 : X_BUF
    port map (
      I => i2c_ctrl_n0073_MC_Q,
      O => i2c_ctrl_n0073
    );
  i2c_ctrl_n0073_MC_REG : X_BUF
    port map (
      I => i2c_ctrl_n0073_MC_D,
      O => i2c_ctrl_n0073_MC_Q
    );
  i2c_ctrl_n0073_MC_D1_218 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_n0073_MC_D1
    );
  i2c_ctrl_n0073_MC_D2_PT_0_219 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_n0073_MC_D2_PT_0_IN0,
      I1 => uc_ctrl_men,
      O => i2c_ctrl_n0073_MC_D2_PT_0
    );
  i2c_ctrl_n0073_MC_D2_PT_1_220 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_n0073_MC_D2_PT_1_IN0,
      I1 => uc_ctrl_men,
      O => i2c_ctrl_n0073_MC_D2_PT_1
    );
  i2c_ctrl_n0073_MC_D2_221 : X_OR2
    port map (
      I0 => i2c_ctrl_n0073_MC_D2_PT_0,
      I1 => i2c_ctrl_n0073_MC_D2_PT_1,
      O => i2c_ctrl_n0073_MC_D2
    );
  i2c_ctrl_n0073_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_n0073_MC_D1,
      I1 => i2c_ctrl_n0073_MC_D2,
      O => i2c_ctrl_n0073_MC_D
    );
  n7426_222 : X_BUF
    port map (
      I => n7426_MC_Q,
      O => n7426
    );
  n7426_MC_REG : X_BUF
    port map (
      I => n7426_MC_D,
      O => n7426_MC_Q
    );
  n7426_MC_D1_PT_0_223 : X_AND2
    port map (
      I0 => NlwInverterSignal_n7426_MC_D1_PT_0_IN0,
      I1 => NlwInverterSignal_n7426_MC_D1_PT_0_IN1,
      O => n7426_MC_D1_PT_0
    );
  n7426_MC_D1_224 : X_OR2
    port map (
      I0 => n7426_MC_D1_PT_0,
      I1 => n7426_MC_D1_PT_0,
      O => n7426_MC_D1
    );
  n7426_MC_D2_225 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => n7426_MC_D2
    );
  n7426_MC_XOR : X_XOR2
    port map (
      I0 => n7426_MC_D1,
      I1 => n7426_MC_D2,
      O => n7426_MC_D
    );
  sda_II_UIM_226 : X_BUF
    port map (
      I => sda,
      O => sda_II_UIM
    );
  sda_II_FCLK_227 : X_BUF
    port map (
      I => sda,
      O => sda_II_FCLK
    );
  sda_II_IREG : X_FF
    port map (
      I => sda,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => FOOBAR6_ctinst_6,
      RST => PRLD,
      O => i2c_ctrl_sda_in_MC_Q_tsim_ireg_Q
    );
  FOOBAR6_ctinst_5_228 : X_AND2
    port map (
      I0 => NlwInverterSignal_FOOBAR6_ctinst_5_IN0,
      I1 => NlwInverterSignal_FOOBAR6_ctinst_5_IN1,
      O => FOOBAR6_ctinst_5
    );
  FOOBAR6_ctinst_6_229 : X_AND2
    port map (
      I0 => NlwInverterSignal_FOOBAR6_ctinst_6_IN0,
      I1 => NlwInverterSignal_FOOBAR6_ctinst_6_IN1,
      O => FOOBAR6_ctinst_6
    );
  FOOBAR6_ctinst_7_230 : X_AND2
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd1,
      O => FOOBAR6_ctinst_7
    );
  i2c_ctrl_bit_cnt_0_Q : X_BUF
    port map (
      I => i2c_ctrl_bit_cnt_0_MC_Q,
      O => i2c_ctrl_bit_cnt(0)
    );
  i2c_ctrl_bit_cnt_0_MC_R_OR_PRLD_231 : X_OR2
    port map (
      I0 => FOOBAR4_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_bit_cnt_0_MC_R_OR_PRLD
    );
  i2c_ctrl_bit_cnt_0_MC_REG : X_FF
    port map (
      I => i2c_ctrl_bit_cnt_0_MC_D,
      CE => VCC,
      CLK => scl_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => i2c_ctrl_bit_cnt_0_MC_R_OR_PRLD,
      O => i2c_ctrl_bit_cnt_0_MC_Q
    );
  FOOBAR4_ctinst_5_232 : X_AND2
    port map (
      I0 => NlwInverterSignal_FOOBAR4_ctinst_5_IN0,
      I1 => NlwInverterSignal_FOOBAR4_ctinst_5_IN1,
      O => FOOBAR4_ctinst_5
    );
  i2c_ctrl_bit_cnt_0_MC_D1_233 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_bit_cnt_0_MC_D1
    );
  i2c_ctrl_bit_cnt_0_MC_D2_PT_0_234 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_bit_cnt_0_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_bit_cnt_0_MC_D2_PT_0_IN1,
      O => i2c_ctrl_bit_cnt_0_MC_D2_PT_0
    );
  i2c_ctrl_bit_cnt_0_MC_D2_PT_1_235 : X_AND4
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_bit_cnt_0_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_bit_cnt_0_MC_D2_PT_1_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_bit_cnt_0_MC_D2_PT_1_IN2,
      I3 => i2c_ctrl_state_ffd2,
      O => i2c_ctrl_bit_cnt_0_MC_D2_PT_1
    );
  i2c_ctrl_bit_cnt_0_MC_D2_236 : X_OR2
    port map (
      I0 => i2c_ctrl_bit_cnt_0_MC_D2_PT_0,
      I1 => i2c_ctrl_bit_cnt_0_MC_D2_PT_1,
      O => i2c_ctrl_bit_cnt_0_MC_D2
    );
  i2c_ctrl_bit_cnt_0_MC_D_237 : X_XOR2
    port map (
      I0 => i2c_ctrl_bit_cnt_0_MC_D_TFF,
      I1 => i2c_ctrl_bit_cnt_0_MC_Q,
      O => i2c_ctrl_bit_cnt_0_MC_D
    );
  i2c_ctrl_bit_cnt_0_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_bit_cnt_0_MC_XOR_IN0,
      I1 => i2c_ctrl_bit_cnt_0_MC_D2,
      O => i2c_ctrl_bit_cnt_0_MC_D_TFF
    );
  N_PZ_672_238 : X_BUF
    port map (
      I => N_PZ_672_MC_Q,
      O => N_PZ_672
    );
  N_PZ_672_MC_REG : X_BUF
    port map (
      I => N_PZ_672_MC_D,
      O => N_PZ_672_MC_Q
    );
  N_PZ_672_MC_D1_239 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_672_MC_D1
    );
  N_PZ_672_MC_D2_PT_0_240 : X_AND3
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => NlwInverterSignal_N_PZ_672_MC_D2_PT_0_IN1,
      I2 => n7426,
      O => N_PZ_672_MC_D2_PT_0
    );
  N_PZ_672_MC_D2_PT_1_241 : X_AND3
    port map (
      I0 => NlwInverterSignal_N_PZ_672_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_N_PZ_672_MC_D2_PT_1_IN1,
      I2 => NlwInverterSignal_N_PZ_672_MC_D2_PT_1_IN2,
      O => N_PZ_672_MC_D2_PT_1
    );
  N_PZ_672_MC_D2_242 : X_OR2
    port map (
      I0 => N_PZ_672_MC_D2_PT_0,
      I1 => N_PZ_672_MC_D2_PT_1,
      O => N_PZ_672_MC_D2
    );
  N_PZ_672_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_672_MC_D1,
      I1 => N_PZ_672_MC_D2,
      O => N_PZ_672_MC_D
    );
  i2c_ctrl_bit_cnt_1_Q : X_BUF
    port map (
      I => i2c_ctrl_bit_cnt_1_MC_Q,
      O => i2c_ctrl_bit_cnt(1)
    );
  i2c_ctrl_bit_cnt_1_MC_R_OR_PRLD_243 : X_OR2
    port map (
      I0 => FOOBAR8_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_bit_cnt_1_MC_R_OR_PRLD
    );
  i2c_ctrl_bit_cnt_1_MC_REG : X_FF
    port map (
      I => i2c_ctrl_bit_cnt_1_MC_D,
      CE => VCC,
      CLK => scl_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => i2c_ctrl_bit_cnt_1_MC_R_OR_PRLD,
      O => i2c_ctrl_bit_cnt_1_MC_Q
    );
  FOOBAR8_ctinst_5_244 : X_AND2
    port map (
      I0 => NlwInverterSignal_FOOBAR8_ctinst_5_IN0,
      I1 => NlwInverterSignal_FOOBAR8_ctinst_5_IN1,
      O => FOOBAR8_ctinst_5
    );
  i2c_ctrl_bit_cnt_1_MC_D1_245 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_bit_cnt_1_MC_D1
    );
  i2c_ctrl_bit_cnt_1_MC_D2_PT_0_246 : X_AND2
    port map (
      I0 => i2c_ctrl_bit_cnt(1),
      I1 => NlwInverterSignal_i2c_ctrl_bit_cnt_1_MC_D2_PT_0_IN1,
      O => i2c_ctrl_bit_cnt_1_MC_D2_PT_0
    );
  i2c_ctrl_bit_cnt_1_MC_D2_PT_1_247 : X_AND3
    port map (
      I0 => i2c_ctrl_bit_cnt(0),
      I1 => N_PZ_672,
      I2 => N_PZ_652,
      O => i2c_ctrl_bit_cnt_1_MC_D2_PT_1
    );
  i2c_ctrl_bit_cnt_1_MC_D2_248 : X_OR2
    port map (
      I0 => i2c_ctrl_bit_cnt_1_MC_D2_PT_0,
      I1 => i2c_ctrl_bit_cnt_1_MC_D2_PT_1,
      O => i2c_ctrl_bit_cnt_1_MC_D2
    );
  i2c_ctrl_bit_cnt_1_MC_D_249 : X_XOR2
    port map (
      I0 => i2c_ctrl_bit_cnt_1_MC_D_TFF,
      I1 => i2c_ctrl_bit_cnt_1_MC_Q,
      O => i2c_ctrl_bit_cnt_1_MC_D
    );
  i2c_ctrl_bit_cnt_1_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_bit_cnt_1_MC_D1,
      I1 => i2c_ctrl_bit_cnt_1_MC_D2,
      O => i2c_ctrl_bit_cnt_1_MC_D_TFF
    );
  N_PZ_652_250 : X_BUF
    port map (
      I => N_PZ_652_MC_Q,
      O => N_PZ_652
    );
  N_PZ_652_MC_REG : X_BUF
    port map (
      I => N_PZ_652_MC_D,
      O => N_PZ_652_MC_Q
    );
  N_PZ_652_MC_D1_251 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_652_MC_D1
    );
  N_PZ_652_MC_D2_PT_0_252 : X_AND2
    port map (
      I0 => NlwInverterSignal_N_PZ_652_MC_D2_PT_0_IN0,
      I1 => i2c_ctrl_state_ffd1,
      O => N_PZ_652_MC_D2_PT_0
    );
  N_PZ_652_MC_D2_PT_1_253 : X_AND3
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => NlwInverterSignal_N_PZ_652_MC_D2_PT_1_IN1,
      I2 => NlwInverterSignal_N_PZ_652_MC_D2_PT_1_IN2,
      O => N_PZ_652_MC_D2_PT_1
    );
  N_PZ_652_MC_D2_254 : X_OR2
    port map (
      I0 => N_PZ_652_MC_D2_PT_0,
      I1 => N_PZ_652_MC_D2_PT_1,
      O => N_PZ_652_MC_D2
    );
  N_PZ_652_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_652_MC_D1,
      I1 => N_PZ_652_MC_D2,
      O => N_PZ_652_MC_D
    );
  i2c_ctrl_bit_cnt_2_Q : X_BUF
    port map (
      I => i2c_ctrl_bit_cnt_2_MC_Q,
      O => i2c_ctrl_bit_cnt(2)
    );
  i2c_ctrl_bit_cnt_2_MC_R_OR_PRLD_255 : X_OR2
    port map (
      I0 => FOOBAR8_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_bit_cnt_2_MC_R_OR_PRLD
    );
  i2c_ctrl_bit_cnt_2_MC_REG : X_FF
    port map (
      I => i2c_ctrl_bit_cnt_2_MC_D,
      CE => VCC,
      CLK => scl_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => i2c_ctrl_bit_cnt_2_MC_R_OR_PRLD,
      O => i2c_ctrl_bit_cnt_2_MC_Q
    );
  i2c_ctrl_bit_cnt_2_MC_D1_256 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_bit_cnt_2_MC_D1
    );
  i2c_ctrl_bit_cnt_2_MC_D2_PT_0_257 : X_AND2
    port map (
      I0 => i2c_ctrl_bit_cnt(2),
      I1 => NlwInverterSignal_i2c_ctrl_bit_cnt_2_MC_D2_PT_0_IN1,
      O => i2c_ctrl_bit_cnt_2_MC_D2_PT_0
    );
  i2c_ctrl_bit_cnt_2_MC_D2_PT_1_258 : X_AND4
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_bit_cnt_2_MC_D2_PT_1_IN0,
      I1 => i2c_ctrl_bit_cnt(0),
      I2 => i2c_ctrl_bit_cnt(1),
      I3 => N_PZ_652,
      O => i2c_ctrl_bit_cnt_2_MC_D2_PT_1
    );
  i2c_ctrl_bit_cnt_2_MC_D2_259 : X_OR2
    port map (
      I0 => i2c_ctrl_bit_cnt_2_MC_D2_PT_0,
      I1 => i2c_ctrl_bit_cnt_2_MC_D2_PT_1,
      O => i2c_ctrl_bit_cnt_2_MC_D2
    );
  i2c_ctrl_bit_cnt_2_MC_D_260 : X_XOR2
    port map (
      I0 => i2c_ctrl_bit_cnt_2_MC_D_TFF,
      I1 => i2c_ctrl_bit_cnt_2_MC_Q,
      O => i2c_ctrl_bit_cnt_2_MC_D
    );
  i2c_ctrl_bit_cnt_2_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_bit_cnt_2_MC_D1,
      I1 => i2c_ctrl_bit_cnt_2_MC_D2,
      O => i2c_ctrl_bit_cnt_2_MC_D_TFF
    );
  i2c_ctrl_n0159_261 : X_BUF
    port map (
      I => i2c_ctrl_n0159_MC_Q,
      O => i2c_ctrl_n0159
    );
  i2c_ctrl_n0159_MC_R_OR_PRLD_262 : X_OR2
    port map (
      I0 => FOOBAR8_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_n0159_MC_R_OR_PRLD
    );
  i2c_ctrl_n0159_MC_REG : X_FF
    port map (
      I => i2c_ctrl_n0159_MC_D,
      CE => VCC,
      CLK => scl_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => i2c_ctrl_n0159_MC_R_OR_PRLD,
      O => i2c_ctrl_n0159_MC_Q
    );
  i2c_ctrl_n0159_MC_D1_263 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_n0159_MC_D1
    );
  i2c_ctrl_n0159_MC_D2_PT_0_264 : X_AND2
    port map (
      I0 => i2c_ctrl_n0159,
      I1 => NlwInverterSignal_i2c_ctrl_n0159_MC_D2_PT_0_IN1,
      O => i2c_ctrl_n0159_MC_D2_PT_0
    );
  i2c_ctrl_n0159_MC_D2_PT_1_265 : X_AND5
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_n0159_MC_D2_PT_1_IN0,
      I1 => i2c_ctrl_bit_cnt(0),
      I2 => i2c_ctrl_bit_cnt(1),
      I3 => i2c_ctrl_bit_cnt(2),
      I4 => N_PZ_652,
      O => i2c_ctrl_n0159_MC_D2_PT_1
    );
  i2c_ctrl_n0159_MC_D2_266 : X_OR2
    port map (
      I0 => i2c_ctrl_n0159_MC_D2_PT_0,
      I1 => i2c_ctrl_n0159_MC_D2_PT_1,
      O => i2c_ctrl_n0159_MC_D2
    );
  i2c_ctrl_n0159_MC_D_267 : X_XOR2
    port map (
      I0 => i2c_ctrl_n0159_MC_D_TFF,
      I1 => i2c_ctrl_n0159_MC_Q,
      O => i2c_ctrl_n0159_MC_D
    );
  i2c_ctrl_n0159_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_n0159_MC_D1,
      I1 => i2c_ctrl_n0159_MC_D2,
      O => i2c_ctrl_n0159_MC_D_TFF
    );
  uc_ctrl_mtx_268 : X_BUF
    port map (
      I => uc_ctrl_mtx_MC_Q,
      O => uc_ctrl_mtx
    );
  uc_ctrl_mtx_MC_R_OR_PRLD_269 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_mtx_MC_R_OR_PRLD
    );
  uc_ctrl_mtx_MC_REG : X_FF
    port map (
      I => uc_ctrl_mtx_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_mtx_MC_R_OR_PRLD,
      O => uc_ctrl_mtx_MC_Q
    );
  uc_ctrl_mtx_MC_D1_270 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_mtx_MC_D1
    );
  uc_ctrl_mtx_MC_D2_PT_0_271 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mtx_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_uc_ctrl_mtx_MC_D2_PT_0_IN1,
      O => uc_ctrl_mtx_MC_D2_PT_0
    );
  uc_ctrl_mtx_MC_D2_PT_1_272 : X_AND2
    port map (
      I0 => N_PZ_569,
      I1 => NlwInverterSignal_uc_ctrl_mtx_MC_D2_PT_1_IN1,
      O => uc_ctrl_mtx_MC_D2_PT_1
    );
  uc_ctrl_mtx_MC_D2_273 : X_OR2
    port map (
      I0 => uc_ctrl_mtx_MC_D2_PT_0,
      I1 => uc_ctrl_mtx_MC_D2_PT_1,
      O => uc_ctrl_mtx_MC_D2
    );
  uc_ctrl_mtx_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mtx_MC_XOR_IN0,
      I1 => uc_ctrl_mtx_MC_D2,
      O => uc_ctrl_mtx_MC_D
    );
  data_bus_4_II_UIM_274 : X_BUF
    port map (
      I => data_bus(4),
      O => data_bus_4_II_UIM
    );
  N_PZ_897_275 : X_BUF
    port map (
      I => N_PZ_897_MC_Q,
      O => N_PZ_897
    );
  N_PZ_897_MC_REG : X_BUF
    port map (
      I => N_PZ_897_MC_D,
      O => N_PZ_897_MC_Q
    );
  N_PZ_897_MC_D1_PT_0_276 : X_AND2
    port map (
      I0 => NlwInverterSignal_N_PZ_897_MC_D1_PT_0_IN0,
      I1 => uc_ctrl_men,
      O => N_PZ_897_MC_D1_PT_0
    );
  N_PZ_897_MC_D1_277 : X_OR2
    port map (
      I0 => N_PZ_897_MC_D1_PT_0,
      I1 => N_PZ_897_MC_D1_PT_0,
      O => N_PZ_897_MC_D1
    );
  N_PZ_897_MC_D2_278 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_897_MC_D2
    );
  N_PZ_897_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_897_MC_D1,
      I1 => N_PZ_897_MC_D2,
      O => N_PZ_897_MC_D
    );
  i2c_ctrl_detect_stop_279 : X_BUF
    port map (
      I => i2c_ctrl_detect_stop_MC_Q,
      O => i2c_ctrl_detect_stop
    );
  i2c_ctrl_detect_stop_MC_R_OR_PRLD_280 : X_OR2
    port map (
      I0 => i2c_ctrl_detect_stop_MC_RSTF,
      I1 => PRLD,
      O => i2c_ctrl_detect_stop_MC_R_OR_PRLD
    );
  i2c_ctrl_detect_stop_MC_REG : X_FF
    port map (
      I => i2c_ctrl_detect_stop_MC_D,
      CE => VCC,
      CLK => sda_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_detect_stop_MC_R_OR_PRLD,
      O => i2c_ctrl_detect_stop_MC_Q
    );
  i2c_ctrl_detect_stop_MC_RSTF_PT_0_281 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_detect_stop_MC_RSTF_PT_0_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_detect_stop_MC_RSTF_PT_0_IN1,
      O => i2c_ctrl_detect_stop_MC_RSTF_PT_0
    );
  i2c_ctrl_detect_stop_MC_RSTF_282 : X_OR2
    port map (
      I0 => i2c_ctrl_detect_stop_MC_RSTF_PT_0,
      I1 => i2c_ctrl_detect_stop_MC_RSTF_PT_0,
      O => i2c_ctrl_detect_stop_MC_RSTF
    );
  i2c_ctrl_detect_stop_MC_D1_PT_0_283 : X_AND2
    port map (
      I0 => scl_II_UIM,
      I1 => scl_II_UIM,
      O => i2c_ctrl_detect_stop_MC_D1_PT_0
    );
  i2c_ctrl_detect_stop_MC_D1_284 : X_OR2
    port map (
      I0 => i2c_ctrl_detect_stop_MC_D1_PT_0,
      I1 => i2c_ctrl_detect_stop_MC_D1_PT_0,
      O => i2c_ctrl_detect_stop_MC_D1
    );
  i2c_ctrl_detect_stop_MC_D2_285 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_detect_stop_MC_D2
    );
  i2c_ctrl_detect_stop_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_detect_stop_MC_D1,
      I1 => i2c_ctrl_detect_stop_MC_D2,
      O => i2c_ctrl_detect_stop_MC_D
    );
  N_PZ_896_286 : X_BUF
    port map (
      I => N_PZ_896_MC_Q,
      O => N_PZ_896
    );
  N_PZ_896_MC_REG : X_BUF
    port map (
      I => N_PZ_896_MC_D,
      O => N_PZ_896_MC_Q
    );
  N_PZ_896_MC_D1_PT_0_287 : X_AND2
    port map (
      I0 => NlwInverterSignal_N_PZ_896_MC_D1_PT_0_IN0,
      I1 => uc_ctrl_men,
      O => N_PZ_896_MC_D1_PT_0
    );
  N_PZ_896_MC_D1_288 : X_OR2
    port map (
      I0 => N_PZ_896_MC_D1_PT_0,
      I1 => N_PZ_896_MC_D1_PT_0,
      O => N_PZ_896_MC_D1
    );
  N_PZ_896_MC_D2_289 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_896_MC_D2
    );
  N_PZ_896_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_896_MC_D1,
      I1 => N_PZ_896_MC_D2,
      O => N_PZ_896_MC_D
    );
  i2c_ctrl_scl_in_290 : X_BUF
    port map (
      I => i2c_ctrl_scl_in_MC_Q,
      O => i2c_ctrl_scl_in
    );
  i2c_ctrl_scl_in_MC_REG : X_FF
    port map (
      I => i2c_ctrl_scl_in_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => FOOBAR5_ctinst_6,
      RST => PRLD,
      O => i2c_ctrl_scl_in_MC_Q
    );
  i2c_ctrl_scl_in_MC_D1_PT_0_291 : X_AND2
    port map (
      I0 => scl_II_UIM,
      I1 => scl_II_UIM,
      O => i2c_ctrl_scl_in_MC_D1_PT_0
    );
  i2c_ctrl_scl_in_MC_D1_292 : X_OR2
    port map (
      I0 => i2c_ctrl_scl_in_MC_D1_PT_0,
      I1 => i2c_ctrl_scl_in_MC_D1_PT_0,
      O => i2c_ctrl_scl_in_MC_D1
    );
  i2c_ctrl_scl_in_MC_D2_293 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_scl_in_MC_D2
    );
  i2c_ctrl_scl_in_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_scl_in_MC_D1,
      I1 => i2c_ctrl_scl_in_MC_D2,
      O => i2c_ctrl_scl_in_MC_D
    );
  i2c_ctrl_sda_out_reg_d1_294 : X_BUF
    port map (
      I => i2c_ctrl_sda_out_reg_d1_MC_Q,
      O => i2c_ctrl_sda_out_reg_d1
    );
  i2c_ctrl_sda_out_reg_d1_MC_REG : X_FF
    port map (
      I => i2c_ctrl_sda_out_reg_d1_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => FOOBAR5_ctinst_6,
      RST => PRLD,
      O => i2c_ctrl_sda_out_reg_d1_MC_Q
    );
  i2c_ctrl_sda_out_reg_d1_MC_D1_PT_0_295 : X_AND2
    port map (
      I0 => i2c_ctrl_sda_out_reg,
      I1 => i2c_ctrl_sda_out_reg,
      O => i2c_ctrl_sda_out_reg_d1_MC_D1_PT_0
    );
  i2c_ctrl_sda_out_reg_d1_MC_D1_296 : X_OR2
    port map (
      I0 => i2c_ctrl_sda_out_reg_d1_MC_D1_PT_0,
      I1 => i2c_ctrl_sda_out_reg_d1_MC_D1_PT_0,
      O => i2c_ctrl_sda_out_reg_d1_MC_D1
    );
  i2c_ctrl_sda_out_reg_d1_MC_D2_297 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_sda_out_reg_d1_MC_D2
    );
  i2c_ctrl_sda_out_reg_d1_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_sda_out_reg_d1_MC_D1,
      I1 => i2c_ctrl_sda_out_reg_d1_MC_D2,
      O => i2c_ctrl_sda_out_reg_d1_MC_D
    );
  i2c_ctrl_sda_out_reg_298 : X_BUF
    port map (
      I => i2c_ctrl_sda_out_reg_MC_Q,
      O => i2c_ctrl_sda_out_reg
    );
  i2c_ctrl_sda_out_reg_MC_REG : X_FF
    port map (
      I => i2c_ctrl_sda_out_reg_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => FOOBAR3_ctinst_6,
      RST => PRLD,
      O => i2c_ctrl_sda_out_reg_MC_Q
    );
  i2c_ctrl_sda_out_reg_MC_D1_299 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_sda_out_reg_MC_D1
    );
  i2c_ctrl_sda_out_reg_MC_D2_PT_0_300 : X_AND3
    port map (
      I0 => i2c_ctrl_scl_state_ffd1,
      I1 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_0_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_0_IN2,
      O => i2c_ctrl_sda_out_reg_MC_D2_PT_0
    );
  i2c_ctrl_sda_out_reg_MC_D2_PT_1_301 : X_AND3
    port map (
      I0 => i2c_ctrl_scl_state_ffd1,
      I1 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_1_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_1_IN2,
      O => i2c_ctrl_sda_out_reg_MC_D2_PT_1
    );
  i2c_ctrl_sda_out_reg_MC_D2_PT_2_302 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_2_IN0,
      I1 => i2c_ctrl_scl_state_ffd3,
      I2 => i2c_ctrl_scl_state_ffd2,
      O => i2c_ctrl_sda_out_reg_MC_D2_PT_2
    );
  i2c_ctrl_sda_out_reg_MC_D2_PT_3_303 : X_AND3
    port map (
      I0 => i2c_ctrl_scl_state_ffd3,
      I1 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_3_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_3_IN2,
      O => i2c_ctrl_sda_out_reg_MC_D2_PT_3
    );
  i2c_ctrl_sda_out_reg_MC_D2_PT_4_304 : X_AND4
    port map (
      I0 => i2c_ctrl_arb_lost,
      I1 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_4_IN1,
      I2 => i2c_ctrl_scl_state_ffd2,
      I3 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_4_IN3,
      O => i2c_ctrl_sda_out_reg_MC_D2_PT_4
    );
  i2c_ctrl_sda_out_reg_MC_D2_PT_5_305 : X_AND5
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_5_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_5_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_5_IN2,
      I3 => i2c_ctrl_scl_state_ffd2,
      I4 => i2c_ctrl_gen_stop,
      O => i2c_ctrl_sda_out_reg_MC_D2_PT_5
    );
  i2c_ctrl_sda_out_reg_MC_D2_PT_6_306 : X_AND5
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_6_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_6_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_6_IN2,
      I3 => i2c_ctrl_scl_state_ffd2,
      I4 => i2c_ctrl_sm_stop,
      O => i2c_ctrl_sda_out_reg_MC_D2_PT_6
    );
  i2c_ctrl_sda_out_reg_MC_D2_PT_7_307 : X_AND5
    port map (
      I0 => n7426,
      I1 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_7_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_7_IN2,
      I3 => i2c_ctrl_scl_state_ffd2,
      I4 => i2c_ctrl_gen_stop,
      O => i2c_ctrl_sda_out_reg_MC_D2_PT_7
    );
  i2c_ctrl_sda_out_reg_MC_D2_PT_8_308 : X_AND5
    port map (
      I0 => n7426,
      I1 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_8_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_8_IN2,
      I3 => i2c_ctrl_scl_state_ffd2,
      I4 => i2c_ctrl_sm_stop,
      O => i2c_ctrl_sda_out_reg_MC_D2_PT_8
    );
  i2c_ctrl_sda_out_reg_MC_D2_PT_9_309 : X_AND5
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_9_IN0,
      I1 => i2c_ctrl_scl_state_ffd2,
      I2 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_9_IN2,
      I3 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_9_IN3,
      I4 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_9_IN4,
      O => i2c_ctrl_sda_out_reg_MC_D2_PT_9
    );
  i2c_ctrl_sda_out_reg_MC_D2_PT_10_310 : X_AND5
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_10_IN0,
      I1 => i2c_ctrl_scl_state_ffd2,
      I2 => i2c_ctrl_clk_cnt(1),
      I3 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_10_IN3,
      I4 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_10_IN4,
      O => i2c_ctrl_sda_out_reg_MC_D2_PT_10
    );
  i2c_ctrl_sda_out_reg_MC_D2_PT_11_311 : X_AND5
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_11_IN0,
      I1 => i2c_ctrl_scl_state_ffd2,
      I2 => i2c_ctrl_n0153,
      I3 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_11_IN3,
      I4 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_11_IN4,
      O => i2c_ctrl_sda_out_reg_MC_D2_PT_11
    );
  i2c_ctrl_sda_out_reg_MC_D2_PT_12_312 : X_AND5
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_12_IN0,
      I1 => i2c_ctrl_scl_state_ffd2,
      I2 => i2c_ctrl_clk_cnt(2),
      I3 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_12_IN3,
      I4 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_12_IN4,
      O => i2c_ctrl_sda_out_reg_MC_D2_PT_12
    );
  i2c_ctrl_sda_out_reg_MC_D2_PT_13_313 : X_AND16
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN1,
      I2 => i2c_ctrl_scl_state_ffd2,
      I3 => i2c_ctrl_clk_cnt(0),
      I4 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN4,
      I5 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN5,
      I6 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN6,
      I7 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN7,
      I8 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN8,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => i2c_ctrl_sda_out_reg_MC_D2_PT_13
    );
  i2c_ctrl_sda_out_reg_MC_D2_314 : X_OR16
    port map (
      I0 => i2c_ctrl_sda_out_reg_MC_D2_PT_0,
      I1 => i2c_ctrl_sda_out_reg_MC_D2_PT_1,
      I2 => i2c_ctrl_sda_out_reg_MC_D2_PT_2,
      I3 => i2c_ctrl_sda_out_reg_MC_D2_PT_3,
      I4 => i2c_ctrl_sda_out_reg_MC_D2_PT_4,
      I5 => i2c_ctrl_sda_out_reg_MC_D2_PT_5,
      I6 => i2c_ctrl_sda_out_reg_MC_D2_PT_6,
      I7 => i2c_ctrl_sda_out_reg_MC_D2_PT_7,
      I8 => i2c_ctrl_sda_out_reg_MC_D2_PT_8,
      I9 => i2c_ctrl_sda_out_reg_MC_D2_PT_9,
      I10 => i2c_ctrl_sda_out_reg_MC_D2_PT_10,
      I11 => i2c_ctrl_sda_out_reg_MC_D2_PT_11,
      I12 => i2c_ctrl_sda_out_reg_MC_D2_PT_12,
      I13 => i2c_ctrl_sda_out_reg_MC_D2_PT_13,
      I14 => GND,
      I15 => GND,
      O => i2c_ctrl_sda_out_reg_MC_D2
    );
  i2c_ctrl_sda_out_reg_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_XOR_IN0,
      I1 => i2c_ctrl_sda_out_reg_MC_D2,
      O => i2c_ctrl_sda_out_reg_MC_D
    );
  i2c_ctrl_scl_state_ffd1_315 : X_BUF
    port map (
      I => i2c_ctrl_scl_state_ffd1_MC_Q,
      O => i2c_ctrl_scl_state_ffd1
    );
  i2c_ctrl_scl_state_ffd1_MC_R_OR_PRLD_316 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_scl_state_ffd1_MC_R_OR_PRLD
    );
  i2c_ctrl_scl_state_ffd1_MC_REG : X_FF
    port map (
      I => i2c_ctrl_scl_state_ffd1_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_scl_state_ffd1_MC_R_OR_PRLD,
      O => i2c_ctrl_scl_state_ffd1_MC_Q
    );
  i2c_ctrl_scl_state_ffd1_MC_D1_PT_0_317 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D1_PT_0_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D1_PT_0_IN1,
      O => i2c_ctrl_scl_state_ffd1_MC_D1_PT_0
    );
  i2c_ctrl_scl_state_ffd1_MC_D1_318 : X_OR2
    port map (
      I0 => i2c_ctrl_scl_state_ffd1_MC_D1_PT_0,
      I1 => i2c_ctrl_scl_state_ffd1_MC_D1_PT_0,
      O => i2c_ctrl_scl_state_ffd1_MC_D1
    );
  i2c_ctrl_scl_state_ffd1_MC_D2_PT_0_319 : X_AND3
    port map (
      I0 => i2c_ctrl_scl_state_ffd1,
      I1 => NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_0_IN1,
      I2 => i2c_ctrl_scl_state_ffd2,
      O => i2c_ctrl_scl_state_ffd1_MC_D2_PT_0
    );
  i2c_ctrl_scl_state_ffd1_MC_D2_PT_1_320 : X_AND4
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_1_IN0,
      I1 => i2c_ctrl_scl_state_ffd3,
      I2 => NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_1_IN2,
      I3 => i2c_ctrl_scl_in,
      O => i2c_ctrl_scl_state_ffd1_MC_D2_PT_1
    );
  i2c_ctrl_scl_state_ffd1_MC_D2_PT_2_321 : X_AND6
    port map (
      I0 => i2c_ctrl_master_slave,
      I1 => NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_2_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_2_IN2,
      I3 => NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_2_IN3,
      I4 => NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_2_IN4,
      I5 => i2c_ctrl_gen_start,
      O => i2c_ctrl_scl_state_ffd1_MC_D2_PT_2
    );
  i2c_ctrl_scl_state_ffd1_MC_D2_PT_3_322 : X_AND6
    port map (
      I0 => i2c_ctrl_scl_state_ffd1,
      I1 => i2c_ctrl_scl_state_ffd2,
      I2 => i2c_ctrl_clk_cnt(0),
      I3 => NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_3_IN3,
      I4 => i2c_ctrl_n0153,
      I5 => NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_3_IN5,
      O => i2c_ctrl_scl_state_ffd1_MC_D2_PT_3
    );
  i2c_ctrl_scl_state_ffd1_MC_D2_323 : X_OR4
    port map (
      I0 => i2c_ctrl_scl_state_ffd1_MC_D2_PT_0,
      I1 => i2c_ctrl_scl_state_ffd1_MC_D2_PT_1,
      I2 => i2c_ctrl_scl_state_ffd1_MC_D2_PT_2,
      I3 => i2c_ctrl_scl_state_ffd1_MC_D2_PT_3,
      O => i2c_ctrl_scl_state_ffd1_MC_D2
    );
  i2c_ctrl_scl_state_ffd1_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_XOR_IN0,
      I1 => i2c_ctrl_scl_state_ffd1_MC_D2,
      O => i2c_ctrl_scl_state_ffd1_MC_D
    );
  i2c_ctrl_scl_state_ffd3_324 : X_BUF
    port map (
      I => i2c_ctrl_scl_state_ffd3_MC_Q,
      O => i2c_ctrl_scl_state_ffd3
    );
  i2c_ctrl_scl_state_ffd3_MC_R_OR_PRLD_325 : X_OR2
    port map (
      I0 => FOOBAR4_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_scl_state_ffd3_MC_R_OR_PRLD
    );
  i2c_ctrl_scl_state_ffd3_MC_REG : X_FF
    port map (
      I => i2c_ctrl_scl_state_ffd3_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_scl_state_ffd3_MC_R_OR_PRLD,
      O => i2c_ctrl_scl_state_ffd3_MC_Q
    );
  i2c_ctrl_scl_state_ffd3_MC_D1_326 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_scl_state_ffd3_MC_D1
    );
  i2c_ctrl_scl_state_ffd3_MC_D2_PT_0_327 : X_AND2
    port map (
      I0 => i2c_ctrl_scl_state_ffd1,
      I1 => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_0_IN1,
      O => i2c_ctrl_scl_state_ffd3_MC_D2_PT_0
    );
  i2c_ctrl_scl_state_ffd3_MC_D2_PT_1_328 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_1_IN1,
      O => i2c_ctrl_scl_state_ffd3_MC_D2_PT_1
    );
  i2c_ctrl_scl_state_ffd3_MC_D2_PT_2_329 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_2_IN0,
      I1 => i2c_ctrl_clk_cnt(1),
      O => i2c_ctrl_scl_state_ffd3_MC_D2_PT_2
    );
  i2c_ctrl_scl_state_ffd3_MC_D2_PT_3_330 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_3_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_3_IN1,
      O => i2c_ctrl_scl_state_ffd3_MC_D2_PT_3
    );
  i2c_ctrl_scl_state_ffd3_MC_D2_PT_4_331 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_4_IN0,
      I1 => i2c_ctrl_clk_cnt(2),
      O => i2c_ctrl_scl_state_ffd3_MC_D2_PT_4
    );
  i2c_ctrl_scl_state_ffd3_MC_D2_PT_5_332 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_5_IN0,
      I1 => i2c_ctrl_scl_state_ffd3,
      I2 => i2c_ctrl_scl_state_ffd2,
      O => i2c_ctrl_scl_state_ffd3_MC_D2_PT_5
    );
  i2c_ctrl_scl_state_ffd3_MC_D2_PT_6_333 : X_AND5
    port map (
      I0 => i2c_ctrl_scl_state_ffd2,
      I1 => i2c_ctrl_clk_cnt(0),
      I2 => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_6_IN2,
      I3 => i2c_ctrl_n0153,
      I4 => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_6_IN4,
      O => i2c_ctrl_scl_state_ffd3_MC_D2_PT_6
    );
  i2c_ctrl_scl_state_ffd3_MC_D2_PT_7_334 : X_AND6
    port map (
      I0 => i2c_ctrl_arb_lost,
      I1 => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_7_IN1,
      I2 => i2c_ctrl_bit_cnt(0),
      I3 => i2c_ctrl_bit_cnt(1),
      I4 => i2c_ctrl_bit_cnt(2),
      I5 => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_7_IN5,
      O => i2c_ctrl_scl_state_ffd3_MC_D2_PT_7
    );
  i2c_ctrl_scl_state_ffd3_MC_D2_PT_8_335 : X_AND6
    port map (
      I0 => i2c_ctrl_scl_state_ffd1,
      I1 => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_8_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_8_IN2,
      I3 => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_8_IN3,
      I4 => i2c_ctrl_n0153,
      I5 => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_8_IN5,
      O => i2c_ctrl_scl_state_ffd3_MC_D2_PT_8
    );
  i2c_ctrl_scl_state_ffd3_MC_D2_PT_9_336 : X_AND7
    port map (
      I0 => i2c_ctrl_scl_state_ffd1,
      I1 => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_9_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_9_IN2,
      I3 => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_9_IN3,
      I4 => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_9_IN4,
      I5 => i2c_ctrl_clk_cnt(2),
      I6 => uc_ctrl_rsta,
      O => i2c_ctrl_scl_state_ffd3_MC_D2_PT_9
    );
  i2c_ctrl_scl_state_ffd3_MC_D2_337 : X_OR16
    port map (
      I0 => i2c_ctrl_scl_state_ffd3_MC_D2_PT_0,
      I1 => i2c_ctrl_scl_state_ffd3_MC_D2_PT_1,
      I2 => i2c_ctrl_scl_state_ffd3_MC_D2_PT_2,
      I3 => i2c_ctrl_scl_state_ffd3_MC_D2_PT_3,
      I4 => i2c_ctrl_scl_state_ffd3_MC_D2_PT_4,
      I5 => i2c_ctrl_scl_state_ffd3_MC_D2_PT_5,
      I6 => i2c_ctrl_scl_state_ffd3_MC_D2_PT_6,
      I7 => i2c_ctrl_scl_state_ffd3_MC_D2_PT_7,
      I8 => i2c_ctrl_scl_state_ffd3_MC_D2_PT_8,
      I9 => i2c_ctrl_scl_state_ffd3_MC_D2_PT_9,
      I10 => GND,
      I11 => GND,
      I12 => GND,
      I13 => GND,
      I14 => GND,
      I15 => GND,
      O => i2c_ctrl_scl_state_ffd3_MC_D2
    );
  i2c_ctrl_scl_state_ffd3_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_XOR_IN0,
      I1 => i2c_ctrl_scl_state_ffd3_MC_D2,
      O => i2c_ctrl_scl_state_ffd3_MC_D
    );
  i2c_ctrl_scl_state_ffd2_338 : X_BUF
    port map (
      I => i2c_ctrl_scl_state_ffd2_MC_Q,
      O => i2c_ctrl_scl_state_ffd2
    );
  i2c_ctrl_scl_state_ffd2_MC_R_OR_PRLD_339 : X_OR2
    port map (
      I0 => FOOBAR4_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_scl_state_ffd2_MC_R_OR_PRLD
    );
  i2c_ctrl_scl_state_ffd2_MC_REG : X_FF
    port map (
      I => i2c_ctrl_scl_state_ffd2_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_scl_state_ffd2_MC_R_OR_PRLD,
      O => i2c_ctrl_scl_state_ffd2_MC_Q
    );
  i2c_ctrl_scl_state_ffd2_MC_D1_340 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_scl_state_ffd2_MC_D1
    );
  i2c_ctrl_scl_state_ffd2_MC_D2_PT_0_341 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_0_IN0,
      I1 => i2c_ctrl_scl_state_ffd3,
      I2 => i2c_ctrl_scl_state_ffd2,
      O => i2c_ctrl_scl_state_ffd2_MC_D2_PT_0
    );
  i2c_ctrl_scl_state_ffd2_MC_D2_PT_1_342 : X_AND6
    port map (
      I0 => i2c_ctrl_scl_state_ffd1,
      I1 => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_1_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_1_IN2,
      I3 => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_1_IN3,
      I4 => i2c_ctrl_n0153,
      I5 => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_1_IN5,
      O => i2c_ctrl_scl_state_ffd2_MC_D2_PT_1
    );
  i2c_ctrl_scl_state_ffd2_MC_D2_PT_2_343 : X_AND6
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_2_IN0,
      I1 => i2c_ctrl_scl_state_ffd2,
      I2 => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_2_IN2,
      I3 => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_2_IN3,
      I4 => i2c_ctrl_n0153,
      I5 => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_2_IN5,
      O => i2c_ctrl_scl_state_ffd2_MC_D2_PT_2
    );
  i2c_ctrl_scl_state_ffd2_MC_D2_PT_3_344 : X_AND6
    port map (
      I0 => i2c_ctrl_scl_state_ffd3,
      I1 => i2c_ctrl_scl_state_ffd2,
      I2 => i2c_ctrl_clk_cnt(0),
      I3 => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_3_IN3,
      I4 => i2c_ctrl_n0153,
      I5 => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_3_IN5,
      O => i2c_ctrl_scl_state_ffd2_MC_D2_PT_3
    );
  i2c_ctrl_scl_state_ffd2_MC_D2_PT_4_345 : X_AND16
    port map (
      I0 => i2c_ctrl_scl_state_ffd1,
      I1 => i2c_ctrl_scl_state_ffd3,
      I2 => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_4_IN2,
      I3 => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_4_IN3,
      I4 => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_4_IN4,
      I5 => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_4_IN5,
      I6 => i2c_ctrl_clk_cnt(2),
      I7 => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_4_IN7,
      I8 => i2c_ctrl_stop_scl_reg,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => i2c_ctrl_scl_state_ffd2_MC_D2_PT_4
    );
  i2c_ctrl_scl_state_ffd2_MC_D2_346 : X_OR5
    port map (
      I0 => i2c_ctrl_scl_state_ffd2_MC_D2_PT_0,
      I1 => i2c_ctrl_scl_state_ffd2_MC_D2_PT_1,
      I2 => i2c_ctrl_scl_state_ffd2_MC_D2_PT_2,
      I3 => i2c_ctrl_scl_state_ffd2_MC_D2_PT_3,
      I4 => i2c_ctrl_scl_state_ffd2_MC_D2_PT_4,
      O => i2c_ctrl_scl_state_ffd2_MC_D2
    );
  i2c_ctrl_scl_state_ffd2_MC_D_347 : X_XOR2
    port map (
      I0 => i2c_ctrl_scl_state_ffd2_MC_D_TFF,
      I1 => i2c_ctrl_scl_state_ffd2_MC_Q,
      O => i2c_ctrl_scl_state_ffd2_MC_D
    );
  i2c_ctrl_scl_state_ffd2_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_scl_state_ffd2_MC_D1,
      I1 => i2c_ctrl_scl_state_ffd2_MC_D2,
      O => i2c_ctrl_scl_state_ffd2_MC_D_TFF
    );
  i2c_ctrl_clk_cnt_0_Q : X_BUF
    port map (
      I => i2c_ctrl_clk_cnt_0_MC_Q,
      O => i2c_ctrl_clk_cnt(0)
    );
  i2c_ctrl_clk_cnt_0_MC_R_OR_PRLD_348 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_clk_cnt_0_MC_R_OR_PRLD
    );
  i2c_ctrl_clk_cnt_0_MC_REG : X_FF
    port map (
      I => i2c_ctrl_clk_cnt_0_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_clk_cnt_0_MC_R_OR_PRLD,
      O => i2c_ctrl_clk_cnt_0_MC_Q
    );
  i2c_ctrl_clk_cnt_0_MC_D1_349 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_clk_cnt_0_MC_D1
    );
  i2c_ctrl_clk_cnt_0_MC_D2_PT_0_350 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_0_IN0,
      I1 => i2c_ctrl_scl_state_ffd3,
      I2 => i2c_ctrl_scl_state_ffd2,
      O => i2c_ctrl_clk_cnt_0_MC_D2_PT_0
    );
  i2c_ctrl_clk_cnt_0_MC_D2_PT_1_351 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_1_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_1_IN2,
      O => i2c_ctrl_clk_cnt_0_MC_D2_PT_1
    );
  i2c_ctrl_clk_cnt_0_MC_D2_PT_2_352 : X_AND4
    port map (
      I0 => i2c_ctrl_scl_state_ffd1,
      I1 => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_2_IN1,
      I2 => i2c_ctrl_scl_state_ffd2,
      I3 => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_2_IN3,
      O => i2c_ctrl_clk_cnt_0_MC_D2_PT_2
    );
  i2c_ctrl_clk_cnt_0_MC_D2_PT_3_353 : X_AND7
    port map (
      I0 => i2c_ctrl_scl_state_ffd3,
      I1 => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_3_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_3_IN2,
      I3 => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_3_IN3,
      I4 => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_3_IN4,
      I5 => i2c_ctrl_clk_cnt(2),
      I6 => uc_ctrl_rsta,
      O => i2c_ctrl_clk_cnt_0_MC_D2_PT_3
    );
  i2c_ctrl_clk_cnt_0_MC_D2_PT_4_354 : X_AND7
    port map (
      I0 => i2c_ctrl_scl_state_ffd3,
      I1 => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_4_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_4_IN2,
      I3 => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_4_IN3,
      I4 => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_4_IN4,
      I5 => i2c_ctrl_clk_cnt(2),
      I6 => i2c_ctrl_stop_scl_reg,
      O => i2c_ctrl_clk_cnt_0_MC_D2_PT_4
    );
  i2c_ctrl_clk_cnt_0_MC_D2_355 : X_OR5
    port map (
      I0 => i2c_ctrl_clk_cnt_0_MC_D2_PT_0,
      I1 => i2c_ctrl_clk_cnt_0_MC_D2_PT_1,
      I2 => i2c_ctrl_clk_cnt_0_MC_D2_PT_2,
      I3 => i2c_ctrl_clk_cnt_0_MC_D2_PT_3,
      I4 => i2c_ctrl_clk_cnt_0_MC_D2_PT_4,
      O => i2c_ctrl_clk_cnt_0_MC_D2
    );
  i2c_ctrl_clk_cnt_0_MC_D_356 : X_XOR2
    port map (
      I0 => i2c_ctrl_clk_cnt_0_MC_D_TFF,
      I1 => i2c_ctrl_clk_cnt_0_MC_Q,
      O => i2c_ctrl_clk_cnt_0_MC_D
    );
  i2c_ctrl_clk_cnt_0_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_XOR_IN0,
      I1 => i2c_ctrl_clk_cnt_0_MC_D2,
      O => i2c_ctrl_clk_cnt_0_MC_D_TFF
    );
  i2c_ctrl_clk_cnt_1_Q : X_BUF
    port map (
      I => i2c_ctrl_clk_cnt_1_MC_Q,
      O => i2c_ctrl_clk_cnt(1)
    );
  i2c_ctrl_clk_cnt_1_MC_R_OR_PRLD_357 : X_OR2
    port map (
      I0 => FOOBAR4_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_clk_cnt_1_MC_R_OR_PRLD
    );
  i2c_ctrl_clk_cnt_1_MC_REG : X_FF
    port map (
      I => i2c_ctrl_clk_cnt_1_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_clk_cnt_1_MC_R_OR_PRLD,
      O => i2c_ctrl_clk_cnt_1_MC_Q
    );
  i2c_ctrl_clk_cnt_1_MC_D1_358 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_clk_cnt_1_MC_D1
    );
  i2c_ctrl_clk_cnt_1_MC_D2_PT_0_359 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_clk_cnt_1_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_clk_cnt_1_MC_D2_PT_0_IN1,
      O => i2c_ctrl_clk_cnt_1_MC_D2_PT_0
    );
  i2c_ctrl_clk_cnt_1_MC_D2_PT_1_360 : X_AND2
    port map (
      I0 => i2c_ctrl_clk_cnt(1),
      I1 => NlwInverterSignal_i2c_ctrl_clk_cnt_1_MC_D2_PT_1_IN1,
      O => i2c_ctrl_clk_cnt_1_MC_D2_PT_1
    );
  i2c_ctrl_clk_cnt_1_MC_D2_PT_2_361 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_clk_cnt_1_MC_D2_PT_2_IN0,
      I1 => N_PZ_654,
      O => i2c_ctrl_clk_cnt_1_MC_D2_PT_2
    );
  i2c_ctrl_clk_cnt_1_MC_D2_PT_3_362 : X_AND3
    port map (
      I0 => i2c_ctrl_scl_state_ffd1,
      I1 => NlwInverterSignal_i2c_ctrl_clk_cnt_1_MC_D2_PT_3_IN1,
      I2 => i2c_ctrl_scl_state_ffd2,
      O => i2c_ctrl_clk_cnt_1_MC_D2_PT_3
    );
  i2c_ctrl_clk_cnt_1_MC_D2_363 : X_OR4
    port map (
      I0 => i2c_ctrl_clk_cnt_1_MC_D2_PT_0,
      I1 => i2c_ctrl_clk_cnt_1_MC_D2_PT_1,
      I2 => i2c_ctrl_clk_cnt_1_MC_D2_PT_2,
      I3 => i2c_ctrl_clk_cnt_1_MC_D2_PT_3,
      O => i2c_ctrl_clk_cnt_1_MC_D2
    );
  i2c_ctrl_clk_cnt_1_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_clk_cnt_1_MC_XOR_IN0,
      I1 => i2c_ctrl_clk_cnt_1_MC_D2,
      O => i2c_ctrl_clk_cnt_1_MC_D
    );
  N_PZ_654_364 : X_BUF
    port map (
      I => N_PZ_654_MC_Q,
      O => N_PZ_654
    );
  N_PZ_654_MC_REG : X_BUF
    port map (
      I => N_PZ_654_MC_D,
      O => N_PZ_654_MC_Q
    );
  N_PZ_654_MC_D1_365 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_654_MC_D1
    );
  N_PZ_654_MC_D2_PT_0_366 : X_AND2
    port map (
      I0 => NlwInverterSignal_N_PZ_654_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_N_PZ_654_MC_D2_PT_0_IN1,
      O => N_PZ_654_MC_D2_PT_0
    );
  N_PZ_654_MC_D2_PT_1_367 : X_AND2
    port map (
      I0 => NlwInverterSignal_N_PZ_654_MC_D2_PT_1_IN0,
      I1 => i2c_ctrl_scl_state_ffd3,
      O => N_PZ_654_MC_D2_PT_1
    );
  N_PZ_654_MC_D2_368 : X_OR2
    port map (
      I0 => N_PZ_654_MC_D2_PT_0,
      I1 => N_PZ_654_MC_D2_PT_1,
      O => N_PZ_654_MC_D2
    );
  N_PZ_654_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_654_MC_D1,
      I1 => N_PZ_654_MC_D2,
      O => N_PZ_654_MC_D
    );
  i2c_ctrl_n0153_369 : X_BUF
    port map (
      I => i2c_ctrl_n0153_MC_Q,
      O => i2c_ctrl_n0153
    );
  i2c_ctrl_n0153_MC_R_OR_PRLD_370 : X_OR2
    port map (
      I0 => FOOBAR4_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_n0153_MC_R_OR_PRLD
    );
  i2c_ctrl_n0153_MC_REG : X_FF
    port map (
      I => i2c_ctrl_n0153_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_n0153_MC_R_OR_PRLD,
      O => i2c_ctrl_n0153_MC_Q
    );
  i2c_ctrl_n0153_MC_D1_371 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_n0153_MC_D1
    );
  i2c_ctrl_n0153_MC_D2_PT_0_372 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_0_IN1,
      O => i2c_ctrl_n0153_MC_D2_PT_0
    );
  i2c_ctrl_n0153_MC_D2_PT_1_373 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_1_IN1,
      O => i2c_ctrl_n0153_MC_D2_PT_1
    );
  i2c_ctrl_n0153_MC_D2_PT_2_374 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_2_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_2_IN1,
      O => i2c_ctrl_n0153_MC_D2_PT_2
    );
  i2c_ctrl_n0153_MC_D2_PT_3_375 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_3_IN0,
      I1 => N_PZ_654,
      O => i2c_ctrl_n0153_MC_D2_PT_3
    );
  i2c_ctrl_n0153_MC_D2_PT_4_376 : X_AND3
    port map (
      I0 => i2c_ctrl_scl_state_ffd1,
      I1 => NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_4_IN1,
      I2 => i2c_ctrl_scl_state_ffd2,
      O => i2c_ctrl_n0153_MC_D2_PT_4
    );
  i2c_ctrl_n0153_MC_D2_PT_5_377 : X_AND4
    port map (
      I0 => i2c_ctrl_clk_cnt(1),
      I1 => i2c_ctrl_n0153,
      I2 => i2c_ctrl_clk_cnt(2),
      I3 => NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_5_IN3,
      O => i2c_ctrl_n0153_MC_D2_PT_5
    );
  i2c_ctrl_n0153_MC_D2_378 : X_OR6
    port map (
      I0 => i2c_ctrl_n0153_MC_D2_PT_0,
      I1 => i2c_ctrl_n0153_MC_D2_PT_1,
      I2 => i2c_ctrl_n0153_MC_D2_PT_2,
      I3 => i2c_ctrl_n0153_MC_D2_PT_3,
      I4 => i2c_ctrl_n0153_MC_D2_PT_4,
      I5 => i2c_ctrl_n0153_MC_D2_PT_5,
      O => i2c_ctrl_n0153_MC_D2
    );
  i2c_ctrl_n0153_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_n0153_MC_XOR_IN0,
      I1 => i2c_ctrl_n0153_MC_D2,
      O => i2c_ctrl_n0153_MC_D
    );
  i2c_ctrl_clk_cnt_2_Q : X_BUF
    port map (
      I => i2c_ctrl_clk_cnt_2_MC_Q,
      O => i2c_ctrl_clk_cnt(2)
    );
  i2c_ctrl_clk_cnt_2_MC_R_OR_PRLD_379 : X_OR2
    port map (
      I0 => FOOBAR4_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_clk_cnt_2_MC_R_OR_PRLD
    );
  i2c_ctrl_clk_cnt_2_MC_REG : X_FF
    port map (
      I => i2c_ctrl_clk_cnt_2_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_clk_cnt_2_MC_R_OR_PRLD,
      O => i2c_ctrl_clk_cnt_2_MC_Q
    );
  i2c_ctrl_clk_cnt_2_MC_D1_380 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_clk_cnt_2_MC_D1
    );
  i2c_ctrl_clk_cnt_2_MC_D2_PT_0_381 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_0_IN1,
      O => i2c_ctrl_clk_cnt_2_MC_D2_PT_0
    );
  i2c_ctrl_clk_cnt_2_MC_D2_PT_1_382 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_1_IN1,
      O => i2c_ctrl_clk_cnt_2_MC_D2_PT_1
    );
  i2c_ctrl_clk_cnt_2_MC_D2_PT_2_383 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_2_IN0,
      I1 => N_PZ_654,
      O => i2c_ctrl_clk_cnt_2_MC_D2_PT_2
    );
  i2c_ctrl_clk_cnt_2_MC_D2_PT_3_384 : X_AND3
    port map (
      I0 => i2c_ctrl_scl_state_ffd1,
      I1 => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_3_IN1,
      I2 => i2c_ctrl_scl_state_ffd2,
      O => i2c_ctrl_clk_cnt_2_MC_D2_PT_3
    );
  i2c_ctrl_clk_cnt_2_MC_D2_PT_4_385 : X_AND3
    port map (
      I0 => i2c_ctrl_clk_cnt(1),
      I1 => i2c_ctrl_clk_cnt(2),
      I2 => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_4_IN2,
      O => i2c_ctrl_clk_cnt_2_MC_D2_PT_4
    );
  i2c_ctrl_clk_cnt_2_MC_D2_PT_5_386 : X_AND6
    port map (
      I0 => i2c_ctrl_scl_state_ffd3,
      I1 => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_5_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_5_IN2,
      I3 => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_5_IN3,
      I4 => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_5_IN4,
      I5 => uc_ctrl_rsta,
      O => i2c_ctrl_clk_cnt_2_MC_D2_PT_5
    );
  i2c_ctrl_clk_cnt_2_MC_D2_PT_6_387 : X_AND6
    port map (
      I0 => i2c_ctrl_scl_state_ffd3,
      I1 => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_6_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_6_IN2,
      I3 => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_6_IN3,
      I4 => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_6_IN4,
      I5 => i2c_ctrl_stop_scl_reg,
      O => i2c_ctrl_clk_cnt_2_MC_D2_PT_6
    );
  i2c_ctrl_clk_cnt_2_MC_D2_388 : X_OR7
    port map (
      I0 => i2c_ctrl_clk_cnt_2_MC_D2_PT_0,
      I1 => i2c_ctrl_clk_cnt_2_MC_D2_PT_1,
      I2 => i2c_ctrl_clk_cnt_2_MC_D2_PT_2,
      I3 => i2c_ctrl_clk_cnt_2_MC_D2_PT_3,
      I4 => i2c_ctrl_clk_cnt_2_MC_D2_PT_4,
      I5 => i2c_ctrl_clk_cnt_2_MC_D2_PT_5,
      I6 => i2c_ctrl_clk_cnt_2_MC_D2_PT_6,
      O => i2c_ctrl_clk_cnt_2_MC_D2
    );
  i2c_ctrl_clk_cnt_2_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_XOR_IN0,
      I1 => i2c_ctrl_clk_cnt_2_MC_D2,
      O => i2c_ctrl_clk_cnt_2_MC_D
    );
  uc_ctrl_rsta_389 : X_BUF
    port map (
      I => uc_ctrl_rsta_MC_Q,
      O => uc_ctrl_rsta
    );
  uc_ctrl_rsta_MC_R_OR_PRLD_390 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_rsta_MC_R_OR_PRLD
    );
  uc_ctrl_rsta_MC_REG : X_FF
    port map (
      I => uc_ctrl_rsta_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_rsta_MC_R_OR_PRLD,
      O => uc_ctrl_rsta_MC_Q
    );
  uc_ctrl_rsta_MC_D1_391 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_rsta_MC_D1
    );
  uc_ctrl_rsta_MC_D2_PT_0_392 : X_AND2
    port map (
      I0 => N_PZ_569,
      I1 => NlwInverterSignal_uc_ctrl_rsta_MC_D2_PT_0_IN1,
      O => uc_ctrl_rsta_MC_D2_PT_0
    );
  uc_ctrl_rsta_MC_D2_PT_1_393 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_rsta_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_uc_ctrl_rsta_MC_D2_PT_1_IN1,
      O => uc_ctrl_rsta_MC_D2_PT_1
    );
  uc_ctrl_rsta_MC_D2_PT_2_394 : X_AND3
    port map (
      I0 => NlwInverterSignal_uc_ctrl_rsta_MC_D2_PT_2_IN0,
      I1 => i2c_ctrl_scl_state_ffd3,
      I2 => i2c_ctrl_scl_state_ffd2,
      O => uc_ctrl_rsta_MC_D2_PT_2
    );
  uc_ctrl_rsta_MC_D2_PT_3_395 : X_AND4
    port map (
      I0 => i2c_ctrl_scl_state_ffd1,
      I1 => NlwInverterSignal_uc_ctrl_rsta_MC_D2_PT_3_IN1,
      I2 => NlwInverterSignal_uc_ctrl_rsta_MC_D2_PT_3_IN2,
      I3 => uc_ctrl_rsta,
      O => uc_ctrl_rsta_MC_D2_PT_3
    );
  uc_ctrl_rsta_MC_D2_396 : X_OR4
    port map (
      I0 => uc_ctrl_rsta_MC_D2_PT_0,
      I1 => uc_ctrl_rsta_MC_D2_PT_1,
      I2 => uc_ctrl_rsta_MC_D2_PT_2,
      I3 => uc_ctrl_rsta_MC_D2_PT_3,
      O => uc_ctrl_rsta_MC_D2
    );
  uc_ctrl_rsta_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_rsta_MC_XOR_IN0,
      I1 => uc_ctrl_rsta_MC_D2,
      O => uc_ctrl_rsta_MC_D
    );
  data_bus_2_II_UIM_397 : X_BUF
    port map (
      I => data_bus(2),
      O => data_bus_2_II_UIM
    );
  i2c_ctrl_stop_scl_reg_398 : X_BUF
    port map (
      I => i2c_ctrl_stop_scl_reg_MC_Q,
      O => i2c_ctrl_stop_scl_reg
    );
  i2c_ctrl_stop_scl_reg_MC_R_OR_PRLD_399 : X_OR2
    port map (
      I0 => FOOBAR4_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_stop_scl_reg_MC_R_OR_PRLD
    );
  i2c_ctrl_stop_scl_reg_MC_REG : X_FF
    port map (
      I => i2c_ctrl_stop_scl_reg_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_stop_scl_reg_MC_R_OR_PRLD,
      O => i2c_ctrl_stop_scl_reg_MC_Q
    );
  i2c_ctrl_stop_scl_reg_MC_D1_400 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_stop_scl_reg_MC_D1
    );
  i2c_ctrl_stop_scl_reg_MC_D2_PT_0_401 : X_AND2
    port map (
      I0 => i2c_ctrl_arb_lost,
      I1 => i2c_ctrl_scl_state_ffd2,
      O => i2c_ctrl_stop_scl_reg_MC_D2_PT_0
    );
  i2c_ctrl_stop_scl_reg_MC_D2_PT_1_402 : X_AND2
    port map (
      I0 => i2c_ctrl_scl_state_ffd1,
      I1 => i2c_ctrl_scl_state_ffd2,
      O => i2c_ctrl_stop_scl_reg_MC_D2_PT_1
    );
  i2c_ctrl_stop_scl_reg_MC_D2_PT_2_403 : X_AND2
    port map (
      I0 => i2c_ctrl_scl_state_ffd1,
      I1 => NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_D2_PT_2_IN1,
      O => i2c_ctrl_stop_scl_reg_MC_D2_PT_2
    );
  i2c_ctrl_stop_scl_reg_MC_D2_PT_3_404 : X_AND2
    port map (
      I0 => i2c_ctrl_scl_state_ffd3,
      I1 => i2c_ctrl_scl_state_ffd2,
      O => i2c_ctrl_stop_scl_reg_MC_D2_PT_3
    );
  i2c_ctrl_stop_scl_reg_MC_D2_PT_4_405 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_D2_PT_4_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_D2_PT_4_IN1,
      O => i2c_ctrl_stop_scl_reg_MC_D2_PT_4
    );
  i2c_ctrl_stop_scl_reg_MC_D2_PT_5_406 : X_AND3
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_D2_PT_5_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_D2_PT_5_IN2,
      O => i2c_ctrl_stop_scl_reg_MC_D2_PT_5
    );
  i2c_ctrl_stop_scl_reg_MC_D2_PT_6_407 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_D2_PT_6_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_D2_PT_6_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_D2_PT_6_IN2,
      O => i2c_ctrl_stop_scl_reg_MC_D2_PT_6
    );
  i2c_ctrl_stop_scl_reg_MC_D2_408 : X_OR7
    port map (
      I0 => i2c_ctrl_stop_scl_reg_MC_D2_PT_0,
      I1 => i2c_ctrl_stop_scl_reg_MC_D2_PT_1,
      I2 => i2c_ctrl_stop_scl_reg_MC_D2_PT_2,
      I3 => i2c_ctrl_stop_scl_reg_MC_D2_PT_3,
      I4 => i2c_ctrl_stop_scl_reg_MC_D2_PT_4,
      I5 => i2c_ctrl_stop_scl_reg_MC_D2_PT_5,
      I6 => i2c_ctrl_stop_scl_reg_MC_D2_PT_6,
      O => i2c_ctrl_stop_scl_reg_MC_D2
    );
  i2c_ctrl_stop_scl_reg_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_XOR_IN0,
      I1 => i2c_ctrl_stop_scl_reg_MC_D2,
      O => i2c_ctrl_stop_scl_reg_MC_D
    );
  i2c_ctrl_gen_stop_409 : X_BUF
    port map (
      I => i2c_ctrl_gen_stop_MC_Q,
      O => i2c_ctrl_gen_stop
    );
  i2c_ctrl_gen_stop_MC_R_OR_PRLD_410 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_gen_stop_MC_R_OR_PRLD
    );
  i2c_ctrl_gen_stop_MC_REG : X_FF
    port map (
      I => i2c_ctrl_gen_stop_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_gen_stop_MC_R_OR_PRLD,
      O => i2c_ctrl_gen_stop_MC_Q
    );
  i2c_ctrl_gen_stop_MC_D1_411 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_gen_stop_MC_D1
    );
  i2c_ctrl_gen_stop_MC_D2_PT_0_412 : X_AND2
    port map (
      I0 => i2c_ctrl_gen_stop,
      I1 => NlwInverterSignal_i2c_ctrl_gen_stop_MC_D2_PT_0_IN1,
      O => i2c_ctrl_gen_stop_MC_D2_PT_0
    );
  i2c_ctrl_gen_stop_MC_D2_PT_1_413 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_gen_stop_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_gen_stop_MC_D2_PT_1_IN1,
      I2 => i2c_ctrl_msta_d1,
      O => i2c_ctrl_gen_stop_MC_D2_PT_1
    );
  i2c_ctrl_gen_stop_MC_D2_414 : X_OR2
    port map (
      I0 => i2c_ctrl_gen_stop_MC_D2_PT_0,
      I1 => i2c_ctrl_gen_stop_MC_D2_PT_1,
      O => i2c_ctrl_gen_stop_MC_D2
    );
  i2c_ctrl_gen_stop_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_gen_stop_MC_D1,
      I1 => i2c_ctrl_gen_stop_MC_D2,
      O => i2c_ctrl_gen_stop_MC_D
    );
  i2c_ctrl_msta_d1_415 : X_BUF
    port map (
      I => i2c_ctrl_msta_d1_MC_Q,
      O => i2c_ctrl_msta_d1
    );
  i2c_ctrl_msta_d1_MC_R_OR_PRLD_416 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_msta_d1_MC_R_OR_PRLD
    );
  i2c_ctrl_msta_d1_MC_REG : X_FF
    port map (
      I => i2c_ctrl_msta_d1_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_msta_d1_MC_R_OR_PRLD,
      O => i2c_ctrl_msta_d1_MC_Q
    );
  i2c_ctrl_msta_d1_MC_D1_PT_0_417 : X_AND2
    port map (
      I0 => uc_ctrl_msta,
      I1 => uc_ctrl_msta,
      O => i2c_ctrl_msta_d1_MC_D1_PT_0
    );
  i2c_ctrl_msta_d1_MC_D1_418 : X_OR2
    port map (
      I0 => i2c_ctrl_msta_d1_MC_D1_PT_0,
      I1 => i2c_ctrl_msta_d1_MC_D1_PT_0,
      O => i2c_ctrl_msta_d1_MC_D1
    );
  i2c_ctrl_msta_d1_MC_D2_419 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_msta_d1_MC_D2
    );
  i2c_ctrl_msta_d1_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_msta_d1_MC_D1,
      I1 => i2c_ctrl_msta_d1_MC_D2,
      O => i2c_ctrl_msta_d1_MC_D
    );
  i2c_ctrl_sm_stop_420 : X_BUF
    port map (
      I => i2c_ctrl_sm_stop_MC_Q,
      O => i2c_ctrl_sm_stop
    );
  i2c_ctrl_sm_stop_MC_R_OR_PRLD_421 : X_OR2
    port map (
      I0 => i2c_ctrl_sm_stop_MC_RSTF,
      I1 => PRLD,
      O => i2c_ctrl_sm_stop_MC_R_OR_PRLD
    );
  i2c_ctrl_sm_stop_MC_REG : X_FF
    port map (
      I => i2c_ctrl_sm_stop_MC_D,
      CE => VCC,
      CLK => scl_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => i2c_ctrl_sm_stop_MC_R_OR_PRLD,
      O => i2c_ctrl_sm_stop_MC_Q
    );
  i2c_ctrl_sm_stop_MC_RSTF_PT_0_422 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_sm_stop_MC_RSTF_PT_0_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_sm_stop_MC_RSTF_PT_0_IN1,
      O => i2c_ctrl_sm_stop_MC_RSTF_PT_0
    );
  i2c_ctrl_sm_stop_MC_RSTF_423 : X_OR2
    port map (
      I0 => i2c_ctrl_sm_stop_MC_RSTF_PT_0,
      I1 => i2c_ctrl_sm_stop_MC_RSTF_PT_0,
      O => i2c_ctrl_sm_stop_MC_RSTF
    );
  i2c_ctrl_sm_stop_MC_D1_424 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_sm_stop_MC_D1
    );
  i2c_ctrl_sm_stop_MC_D2_PT_0_425 : X_AND4
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_sm_stop_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_sm_stop_MC_D2_PT_0_IN1,
      I2 => i2c_ctrl_state_ffd2,
      I3 => i2c_ctrl_sm_stop,
      O => i2c_ctrl_sm_stop_MC_D2_PT_0
    );
  i2c_ctrl_sm_stop_MC_D2_PT_1_426 : X_AND7
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => i2c_ctrl_state_ffd1,
      I2 => i2c_ctrl_master_slave,
      I3 => i2c_ctrl_state_ffd2,
      I4 => NlwInverterSignal_i2c_ctrl_sm_stop_MC_D2_PT_1_IN4,
      I5 => NlwInverterSignal_i2c_ctrl_sm_stop_MC_D2_PT_1_IN5,
      I6 => sda_II_UIM,
      O => i2c_ctrl_sm_stop_MC_D2_PT_1
    );
  i2c_ctrl_sm_stop_MC_D2_PT_2_427 : X_AND7
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => NlwInverterSignal_i2c_ctrl_sm_stop_MC_D2_PT_2_IN1,
      I2 => i2c_ctrl_sda_in,
      I3 => i2c_ctrl_master_slave,
      I4 => i2c_ctrl_state_ffd2,
      I5 => NlwInverterSignal_i2c_ctrl_sm_stop_MC_D2_PT_2_IN5,
      I6 => NlwInverterSignal_i2c_ctrl_sm_stop_MC_D2_PT_2_IN6,
      O => i2c_ctrl_sm_stop_MC_D2_PT_2
    );
  i2c_ctrl_sm_stop_MC_D2_428 : X_OR3
    port map (
      I0 => i2c_ctrl_sm_stop_MC_D2_PT_0,
      I1 => i2c_ctrl_sm_stop_MC_D2_PT_1,
      I2 => i2c_ctrl_sm_stop_MC_D2_PT_2,
      O => i2c_ctrl_sm_stop_MC_D2
    );
  i2c_ctrl_sm_stop_MC_D_429 : X_XOR2
    port map (
      I0 => i2c_ctrl_sm_stop_MC_D_TFF,
      I1 => i2c_ctrl_sm_stop_MC_Q,
      O => i2c_ctrl_sm_stop_MC_D
    );
  i2c_ctrl_sm_stop_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_sm_stop_MC_D1,
      I1 => i2c_ctrl_sm_stop_MC_D2,
      O => i2c_ctrl_sm_stop_MC_D_TFF
    );
  i2c_ctrl_bus_busy_430 : X_BUF
    port map (
      I => i2c_ctrl_bus_busy_MC_Q,
      O => i2c_ctrl_bus_busy
    );
  i2c_ctrl_bus_busy_MC_R_OR_PRLD_431 : X_OR2
    port map (
      I0 => FOOBAR5_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_bus_busy_MC_R_OR_PRLD
    );
  i2c_ctrl_bus_busy_MC_REG : X_FF
    port map (
      I => i2c_ctrl_bus_busy_MC_D,
      CE => i2c_ctrl_bus_busy_MC_CE,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_bus_busy_MC_R_OR_PRLD,
      O => i2c_ctrl_bus_busy_MC_Q
    );
  i2c_ctrl_bus_busy_MC_CE_PT_0_432 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_bus_busy_MC_CE_PT_0_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_bus_busy_MC_CE_PT_0_IN1,
      O => i2c_ctrl_bus_busy_MC_CE_PT_0
    );
  i2c_ctrl_bus_busy_MC_CE_433 : X_OR2
    port map (
      I0 => i2c_ctrl_bus_busy_MC_CE_PT_0,
      I1 => i2c_ctrl_bus_busy_MC_CE_PT_0,
      O => i2c_ctrl_bus_busy_MC_CE
    );
  i2c_ctrl_bus_busy_MC_D1_434 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_bus_busy_MC_D1
    );
  i2c_ctrl_bus_busy_MC_D2_PT_0_435 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_bus_busy_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_bus_busy_MC_D2_PT_0_IN1,
      O => i2c_ctrl_bus_busy_MC_D2_PT_0
    );
  i2c_ctrl_bus_busy_MC_D2_436 : X_OR2
    port map (
      I0 => i2c_ctrl_bus_busy_MC_D2_PT_0,
      I1 => i2c_ctrl_bus_busy_MC_D2_PT_0,
      O => i2c_ctrl_bus_busy_MC_D2
    );
  i2c_ctrl_bus_busy_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_bus_busy_MC_D1,
      I1 => i2c_ctrl_bus_busy_MC_D2,
      O => i2c_ctrl_bus_busy_MC_D
    );
  N_PZ_892_437 : X_BUF
    port map (
      I => N_PZ_892_MC_Q,
      O => N_PZ_892
    );
  N_PZ_892_MC_REG : X_BUF
    port map (
      I => N_PZ_892_MC_D,
      O => N_PZ_892_MC_Q
    );
  N_PZ_892_MC_D1_PT_0_438 : X_AND2
    port map (
      I0 => NlwInverterSignal_N_PZ_892_MC_D1_PT_0_IN0,
      I1 => NlwInverterSignal_N_PZ_892_MC_D1_PT_0_IN1,
      O => N_PZ_892_MC_D1_PT_0
    );
  N_PZ_892_MC_D1_439 : X_OR2
    port map (
      I0 => N_PZ_892_MC_D1_PT_0,
      I1 => N_PZ_892_MC_D1_PT_0,
      O => N_PZ_892_MC_D1
    );
  N_PZ_892_MC_D2_440 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_892_MC_D2
    );
  N_PZ_892_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_892_MC_D1,
      I1 => N_PZ_892_MC_D2,
      O => N_PZ_892_MC_D
    );
  i2c_ctrl_gen_start_441 : X_BUF
    port map (
      I => i2c_ctrl_gen_start_MC_Q,
      O => i2c_ctrl_gen_start
    );
  i2c_ctrl_gen_start_MC_R_OR_PRLD_442 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_gen_start_MC_R_OR_PRLD
    );
  i2c_ctrl_gen_start_MC_REG : X_FF
    port map (
      I => i2c_ctrl_gen_start_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_gen_start_MC_R_OR_PRLD,
      O => i2c_ctrl_gen_start_MC_Q
    );
  i2c_ctrl_gen_start_MC_D1_443 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_gen_start_MC_D1
    );
  i2c_ctrl_gen_start_MC_D2_PT_0_444 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_gen_start_MC_D2_PT_0_IN0,
      I1 => i2c_ctrl_gen_start,
      O => i2c_ctrl_gen_start_MC_D2_PT_0
    );
  i2c_ctrl_gen_start_MC_D2_PT_1_445 : X_AND2
    port map (
      I0 => uc_ctrl_msta,
      I1 => NlwInverterSignal_i2c_ctrl_gen_start_MC_D2_PT_1_IN1,
      O => i2c_ctrl_gen_start_MC_D2_PT_1
    );
  i2c_ctrl_gen_start_MC_D2_446 : X_OR2
    port map (
      I0 => i2c_ctrl_gen_start_MC_D2_PT_0,
      I1 => i2c_ctrl_gen_start_MC_D2_PT_1,
      O => i2c_ctrl_gen_start_MC_D2
    );
  i2c_ctrl_gen_start_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_gen_start_MC_D1,
      I1 => i2c_ctrl_gen_start_MC_D2,
      O => i2c_ctrl_gen_start_MC_D
    );
  i2c_ctrl_master_sda_447 : X_BUF
    port map (
      I => i2c_ctrl_master_sda_MC_Q,
      O => i2c_ctrl_master_sda
    );
  i2c_ctrl_master_sda_MC_REG : X_FF
    port map (
      I => i2c_ctrl_master_sda_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => FOOBAR7_ctinst_6,
      RST => PRLD,
      O => i2c_ctrl_master_sda_MC_Q
    );
  FOOBAR7_ctinst_5_448 : X_AND2
    port map (
      I0 => NlwInverterSignal_FOOBAR7_ctinst_5_IN0,
      I1 => NlwInverterSignal_FOOBAR7_ctinst_5_IN1,
      O => FOOBAR7_ctinst_5
    );
  FOOBAR7_ctinst_6_449 : X_AND2
    port map (
      I0 => NlwInverterSignal_FOOBAR7_ctinst_6_IN0,
      I1 => NlwInverterSignal_FOOBAR7_ctinst_6_IN1,
      O => FOOBAR7_ctinst_6
    );
  i2c_ctrl_master_sda_MC_D1_450 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_master_sda_MC_D1
    );
  i2c_ctrl_master_sda_MC_D2_PT_0_451 : X_AND3
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => n7426,
      I2 => NlwInverterSignal_i2c_ctrl_master_sda_MC_D2_PT_0_IN2,
      O => i2c_ctrl_master_sda_MC_D2_PT_0
    );
  i2c_ctrl_master_sda_MC_D2_PT_1_452 : X_AND4
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => NlwInverterSignal_i2c_ctrl_master_sda_MC_D2_PT_1_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_master_sda_MC_D2_PT_1_IN2,
      I3 => NlwInverterSignal_i2c_ctrl_master_sda_MC_D2_PT_1_IN3,
      O => i2c_ctrl_master_sda_MC_D2_PT_1
    );
  i2c_ctrl_master_sda_MC_D2_PT_2_453 : X_AND5
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_master_sda_MC_D2_PT_2_IN0,
      I1 => i2c_ctrl_state_ffd1,
      I2 => i2c_ctrl_state_ffd2,
      I3 => NlwInverterSignal_i2c_ctrl_master_sda_MC_D2_PT_2_IN3,
      I4 => NlwInverterSignal_i2c_ctrl_master_sda_MC_D2_PT_2_IN4,
      O => i2c_ctrl_master_sda_MC_D2_PT_2
    );
  i2c_ctrl_master_sda_MC_D2_454 : X_OR3
    port map (
      I0 => i2c_ctrl_master_sda_MC_D2_PT_0,
      I1 => i2c_ctrl_master_sda_MC_D2_PT_1,
      I2 => i2c_ctrl_master_sda_MC_D2_PT_2,
      O => i2c_ctrl_master_sda_MC_D2
    );
  i2c_ctrl_master_sda_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_master_sda_MC_XOR_IN0,
      I1 => i2c_ctrl_master_sda_MC_D2,
      O => i2c_ctrl_master_sda_MC_D
    );
  i2c_ctrl_shift_out_455 : X_BUF
    port map (
      I => i2c_ctrl_shift_out_MC_Q,
      O => i2c_ctrl_shift_out
    );
  i2c_ctrl_shift_out_MC_R_OR_PRLD_456 : X_OR2
    port map (
      I0 => FOOBAR9_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_shift_out_MC_R_OR_PRLD
    );
  i2c_ctrl_shift_out_MC_REG : X_FF
    port map (
      I => i2c_ctrl_shift_out_MC_D,
      CE => VCC,
      CLK => scl_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => i2c_ctrl_shift_out_MC_R_OR_PRLD,
      O => i2c_ctrl_shift_out_MC_Q
    );
  FOOBAR9_ctinst_5_457 : X_AND2
    port map (
      I0 => NlwInverterSignal_FOOBAR9_ctinst_5_IN0,
      I1 => NlwInverterSignal_FOOBAR9_ctinst_5_IN1,
      O => FOOBAR9_ctinst_5
    );
  i2c_ctrl_shift_out_MC_D1_458 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_shift_out_MC_D1
    );
  i2c_ctrl_shift_out_MC_D2_PT_0_459 : X_AND2
    port map (
      I0 => i2c_ctrl_shift_reg_ld,
      I1 => uc_ctrl_mbdr_micro(7),
      O => i2c_ctrl_shift_out_MC_D2_PT_0
    );
  i2c_ctrl_shift_out_MC_D2_PT_1_460 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_shift_out_MC_D2_PT_1_IN0,
      I1 => i2c_ctrl_shift_reg_en,
      I2 => i2c_ctrl_shift_reg(6),
      O => i2c_ctrl_shift_out_MC_D2_PT_1
    );
  i2c_ctrl_shift_out_MC_D2_PT_2_461 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_shift_out_MC_D2_PT_2_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_shift_out_MC_D2_PT_2_IN1,
      I2 => i2c_ctrl_shift_out,
      O => i2c_ctrl_shift_out_MC_D2_PT_2
    );
  i2c_ctrl_shift_out_MC_D2_462 : X_OR3
    port map (
      I0 => i2c_ctrl_shift_out_MC_D2_PT_0,
      I1 => i2c_ctrl_shift_out_MC_D2_PT_1,
      I2 => i2c_ctrl_shift_out_MC_D2_PT_2,
      O => i2c_ctrl_shift_out_MC_D2
    );
  i2c_ctrl_shift_out_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_shift_out_MC_D1,
      I1 => i2c_ctrl_shift_out_MC_D2,
      O => i2c_ctrl_shift_out_MC_D
    );
  i2c_ctrl_shift_reg_ld_463 : X_BUF
    port map (
      I => i2c_ctrl_shift_reg_ld_MC_Q,
      O => i2c_ctrl_shift_reg_ld
    );
  i2c_ctrl_shift_reg_ld_MC_R_OR_PRLD_464 : X_OR2
    port map (
      I0 => FOOBAR4_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_shift_reg_ld_MC_R_OR_PRLD
    );
  i2c_ctrl_shift_reg_ld_MC_REG : X_FF
    port map (
      I => i2c_ctrl_shift_reg_ld_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_shift_reg_ld_MC_R_OR_PRLD,
      O => i2c_ctrl_shift_reg_ld_MC_Q
    );
  i2c_ctrl_shift_reg_ld_MC_D1_465 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_shift_reg_ld_MC_D1
    );
  i2c_ctrl_shift_reg_ld_MC_D2_PT_0_466 : X_AND3
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_0_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_0_IN2,
      O => i2c_ctrl_shift_reg_ld_MC_D2_PT_0
    );
  i2c_ctrl_shift_reg_ld_MC_D2_PT_1_467 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_1_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_1_IN2,
      O => i2c_ctrl_shift_reg_ld_MC_D2_PT_1
    );
  i2c_ctrl_shift_reg_ld_MC_D2_PT_2_468 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_2_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_2_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_2_IN2,
      O => i2c_ctrl_shift_reg_ld_MC_D2_PT_2
    );
  i2c_ctrl_shift_reg_ld_MC_D2_PT_3_469 : X_AND4
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_3_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_3_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_3_IN2,
      I3 => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_3_IN3,
      O => i2c_ctrl_shift_reg_ld_MC_D2_PT_3
    );
  i2c_ctrl_shift_reg_ld_MC_D2_PT_4_470 : X_AND5
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_4_IN1,
      I2 => i2c_ctrl_master_slave,
      I3 => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_4_IN3,
      I4 => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_4_IN4,
      O => i2c_ctrl_shift_reg_ld_MC_D2_PT_4
    );
  i2c_ctrl_shift_reg_ld_MC_D2_471 : X_OR5
    port map (
      I0 => i2c_ctrl_shift_reg_ld_MC_D2_PT_0,
      I1 => i2c_ctrl_shift_reg_ld_MC_D2_PT_1,
      I2 => i2c_ctrl_shift_reg_ld_MC_D2_PT_2,
      I3 => i2c_ctrl_shift_reg_ld_MC_D2_PT_3,
      I4 => i2c_ctrl_shift_reg_ld_MC_D2_PT_4,
      O => i2c_ctrl_shift_reg_ld_MC_D2
    );
  i2c_ctrl_shift_reg_ld_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_XOR_IN0,
      I1 => i2c_ctrl_shift_reg_ld_MC_D2,
      O => i2c_ctrl_shift_reg_ld_MC_D
    );
  uc_ctrl_mbdr_micro_7_Q : X_BUF
    port map (
      I => uc_ctrl_mbdr_micro_7_MC_Q,
      O => uc_ctrl_mbdr_micro(7)
    );
  uc_ctrl_mbdr_micro_7_MC_R_OR_PRLD_472 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_mbdr_micro_7_MC_R_OR_PRLD
    );
  uc_ctrl_mbdr_micro_7_MC_REG : X_FF
    port map (
      I => uc_ctrl_mbdr_micro_7_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_mbdr_micro_7_MC_R_OR_PRLD,
      O => uc_ctrl_mbdr_micro_7_MC_Q
    );
  uc_ctrl_mbdr_micro_7_MC_D1_473 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_mbdr_micro_7_MC_D1
    );
  uc_ctrl_mbdr_micro_7_MC_D2_PT_0_474 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mbdr_micro_7_MC_D2_PT_0_IN0,
      I1 => N_PZ_564,
      O => uc_ctrl_mbdr_micro_7_MC_D2_PT_0
    );
  uc_ctrl_mbdr_micro_7_MC_D2_PT_1_475 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mbdr_micro_7_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_uc_ctrl_mbdr_micro_7_MC_D2_PT_1_IN1,
      O => uc_ctrl_mbdr_micro_7_MC_D2_PT_1
    );
  uc_ctrl_mbdr_micro_7_MC_D2_476 : X_OR2
    port map (
      I0 => uc_ctrl_mbdr_micro_7_MC_D2_PT_0,
      I1 => uc_ctrl_mbdr_micro_7_MC_D2_PT_1,
      O => uc_ctrl_mbdr_micro_7_MC_D2
    );
  uc_ctrl_mbdr_micro_7_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mbdr_micro_7_MC_XOR_IN0,
      I1 => uc_ctrl_mbdr_micro_7_MC_D2,
      O => uc_ctrl_mbdr_micro_7_MC_D
    );
  N_PZ_564_477 : X_BUF
    port map (
      I => N_PZ_564_MC_Q,
      O => N_PZ_564
    );
  N_PZ_564_MC_REG : X_BUF
    port map (
      I => N_PZ_564_MC_D,
      O => N_PZ_564_MC_Q
    );
  N_PZ_564_MC_D1_PT_0_478 : X_AND3
    port map (
      I0 => NlwInverterSignal_N_PZ_564_MC_D1_PT_0_IN0,
      I1 => uc_ctrl_data_en,
      I2 => N_PZ_665,
      O => N_PZ_564_MC_D1_PT_0
    );
  N_PZ_564_MC_D1_479 : X_OR2
    port map (
      I0 => N_PZ_564_MC_D1_PT_0,
      I1 => N_PZ_564_MC_D1_PT_0,
      O => N_PZ_564_MC_D1
    );
  N_PZ_564_MC_D2_480 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_564_MC_D2
    );
  N_PZ_564_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_564_MC_D1,
      I1 => N_PZ_564_MC_D2,
      O => N_PZ_564_MC_D
    );
  uc_ctrl_data_en_481 : X_BUF
    port map (
      I => uc_ctrl_data_en_MC_Q,
      O => uc_ctrl_data_en
    );
  uc_ctrl_data_en_MC_R_OR_PRLD_482 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_data_en_MC_R_OR_PRLD
    );
  uc_ctrl_data_en_MC_REG : X_FF
    port map (
      I => uc_ctrl_data_en_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_data_en_MC_R_OR_PRLD,
      O => uc_ctrl_data_en_MC_Q
    );
  uc_ctrl_data_en_MC_D1_PT_0_483 : X_AND16
    port map (
      I0 => addr_bus_0_II_UIM,
      I1 => NlwInverterSignal_uc_ctrl_data_en_MC_D1_PT_0_IN1,
      I2 => addr_bus_2_II_UIM,
      I3 => NlwInverterSignal_uc_ctrl_data_en_MC_D1_PT_0_IN3,
      I4 => addr_bus_4_II_UIM,
      I5 => NlwInverterSignal_uc_ctrl_data_en_MC_D1_PT_0_IN5,
      I6 => NlwInverterSignal_uc_ctrl_data_en_MC_D1_PT_0_IN6,
      I7 => addr_bus_7_II_UIM,
      I8 => uc_ctrl_address_match,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => uc_ctrl_data_en_MC_D1_PT_0
    );
  uc_ctrl_data_en_MC_D1_484 : X_OR2
    port map (
      I0 => uc_ctrl_data_en_MC_D1_PT_0,
      I1 => uc_ctrl_data_en_MC_D1_PT_0,
      O => uc_ctrl_data_en_MC_D1
    );
  uc_ctrl_data_en_MC_D2_485 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_data_en_MC_D2
    );
  uc_ctrl_data_en_MC_XOR : X_XOR2
    port map (
      I0 => uc_ctrl_data_en_MC_D1,
      I1 => uc_ctrl_data_en_MC_D2,
      O => uc_ctrl_data_en_MC_D
    );
  i2c_ctrl_shift_reg_en_486 : X_BUF
    port map (
      I => i2c_ctrl_shift_reg_en_MC_Q,
      O => i2c_ctrl_shift_reg_en
    );
  i2c_ctrl_shift_reg_en_MC_R_OR_PRLD_487 : X_OR2
    port map (
      I0 => FOOBAR7_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_shift_reg_en_MC_R_OR_PRLD
    );
  i2c_ctrl_shift_reg_en_MC_REG : X_FF
    port map (
      I => i2c_ctrl_shift_reg_en_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_shift_reg_en_MC_R_OR_PRLD,
      O => i2c_ctrl_shift_reg_en_MC_Q
    );
  i2c_ctrl_shift_reg_en_MC_D1_488 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_shift_reg_en_MC_D1
    );
  i2c_ctrl_shift_reg_en_MC_D2_PT_0_489 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_shift_reg_en_MC_D2_PT_0_IN0,
      I1 => i2c_ctrl_state_ffd1,
      O => i2c_ctrl_shift_reg_en_MC_D2_PT_0
    );
  i2c_ctrl_shift_reg_en_MC_D2_PT_1_490 : X_AND3
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => i2c_ctrl_master_slave,
      I2 => n7426,
      O => i2c_ctrl_shift_reg_en_MC_D2_PT_1
    );
  i2c_ctrl_shift_reg_en_MC_D2_491 : X_OR2
    port map (
      I0 => i2c_ctrl_shift_reg_en_MC_D2_PT_0,
      I1 => i2c_ctrl_shift_reg_en_MC_D2_PT_1,
      O => i2c_ctrl_shift_reg_en_MC_D2
    );
  i2c_ctrl_shift_reg_en_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_shift_reg_en_MC_D1,
      I1 => i2c_ctrl_shift_reg_en_MC_D2,
      O => i2c_ctrl_shift_reg_en_MC_D
    );
  i2c_ctrl_shift_reg_6_Q : X_BUF
    port map (
      I => i2c_ctrl_shift_reg_6_MC_Q,
      O => i2c_ctrl_shift_reg(6)
    );
  i2c_ctrl_shift_reg_6_MC_R_OR_PRLD_492 : X_OR2
    port map (
      I0 => FOOBAR9_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_shift_reg_6_MC_R_OR_PRLD
    );
  i2c_ctrl_shift_reg_6_MC_REG : X_FF
    port map (
      I => i2c_ctrl_shift_reg_6_MC_D,
      CE => VCC,
      CLK => scl_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => i2c_ctrl_shift_reg_6_MC_R_OR_PRLD,
      O => i2c_ctrl_shift_reg_6_MC_Q
    );
  i2c_ctrl_shift_reg_6_MC_D1_493 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_shift_reg_6_MC_D1
    );
  i2c_ctrl_shift_reg_6_MC_D2_PT_0_494 : X_AND2
    port map (
      I0 => i2c_ctrl_shift_reg_ld,
      I1 => uc_ctrl_mbdr_micro(6),
      O => i2c_ctrl_shift_reg_6_MC_D2_PT_0
    );
  i2c_ctrl_shift_reg_6_MC_D2_PT_1_495 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_shift_reg_6_MC_D2_PT_1_IN0,
      I1 => i2c_ctrl_shift_reg_en,
      I2 => i2c_ctrl_shift_reg(5),
      O => i2c_ctrl_shift_reg_6_MC_D2_PT_1
    );
  i2c_ctrl_shift_reg_6_MC_D2_PT_2_496 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_shift_reg_6_MC_D2_PT_2_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_shift_reg_6_MC_D2_PT_2_IN1,
      I2 => i2c_ctrl_shift_reg(6),
      O => i2c_ctrl_shift_reg_6_MC_D2_PT_2
    );
  i2c_ctrl_shift_reg_6_MC_D2_497 : X_OR3
    port map (
      I0 => i2c_ctrl_shift_reg_6_MC_D2_PT_0,
      I1 => i2c_ctrl_shift_reg_6_MC_D2_PT_1,
      I2 => i2c_ctrl_shift_reg_6_MC_D2_PT_2,
      O => i2c_ctrl_shift_reg_6_MC_D2
    );
  i2c_ctrl_shift_reg_6_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_shift_reg_6_MC_D1,
      I1 => i2c_ctrl_shift_reg_6_MC_D2,
      O => i2c_ctrl_shift_reg_6_MC_D
    );
  uc_ctrl_mbdr_micro_6_Q : X_BUF
    port map (
      I => uc_ctrl_mbdr_micro_6_MC_Q,
      O => uc_ctrl_mbdr_micro(6)
    );
  uc_ctrl_mbdr_micro_6_MC_R_OR_PRLD_498 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_mbdr_micro_6_MC_R_OR_PRLD
    );
  uc_ctrl_mbdr_micro_6_MC_REG : X_FF
    port map (
      I => uc_ctrl_mbdr_micro_6_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_mbdr_micro_6_MC_R_OR_PRLD,
      O => uc_ctrl_mbdr_micro_6_MC_Q
    );
  uc_ctrl_mbdr_micro_6_MC_D1_499 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_mbdr_micro_6_MC_D1
    );
  uc_ctrl_mbdr_micro_6_MC_D2_PT_0_500 : X_AND2
    port map (
      I0 => N_PZ_564,
      I1 => NlwInverterSignal_uc_ctrl_mbdr_micro_6_MC_D2_PT_0_IN1,
      O => uc_ctrl_mbdr_micro_6_MC_D2_PT_0
    );
  uc_ctrl_mbdr_micro_6_MC_D2_PT_1_501 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mbdr_micro_6_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_uc_ctrl_mbdr_micro_6_MC_D2_PT_1_IN1,
      O => uc_ctrl_mbdr_micro_6_MC_D2_PT_1
    );
  uc_ctrl_mbdr_micro_6_MC_D2_502 : X_OR2
    port map (
      I0 => uc_ctrl_mbdr_micro_6_MC_D2_PT_0,
      I1 => uc_ctrl_mbdr_micro_6_MC_D2_PT_1,
      O => uc_ctrl_mbdr_micro_6_MC_D2
    );
  uc_ctrl_mbdr_micro_6_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mbdr_micro_6_MC_XOR_IN0,
      I1 => uc_ctrl_mbdr_micro_6_MC_D2,
      O => uc_ctrl_mbdr_micro_6_MC_D
    );
  data_bus_6_II_UIM_503 : X_BUF
    port map (
      I => data_bus(6),
      O => data_bus_6_II_UIM
    );
  i2c_ctrl_shift_reg_5_Q : X_BUF
    port map (
      I => i2c_ctrl_shift_reg_5_MC_Q,
      O => i2c_ctrl_shift_reg(5)
    );
  i2c_ctrl_shift_reg_5_MC_R_OR_PRLD_504 : X_OR2
    port map (
      I0 => FOOBAR9_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_shift_reg_5_MC_R_OR_PRLD
    );
  i2c_ctrl_shift_reg_5_MC_REG : X_FF
    port map (
      I => i2c_ctrl_shift_reg_5_MC_D,
      CE => VCC,
      CLK => scl_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => i2c_ctrl_shift_reg_5_MC_R_OR_PRLD,
      O => i2c_ctrl_shift_reg_5_MC_Q
    );
  i2c_ctrl_shift_reg_5_MC_D1_505 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_shift_reg_5_MC_D1
    );
  i2c_ctrl_shift_reg_5_MC_D2_PT_0_506 : X_AND2
    port map (
      I0 => i2c_ctrl_shift_reg_ld,
      I1 => uc_ctrl_mbdr_micro(5),
      O => i2c_ctrl_shift_reg_5_MC_D2_PT_0
    );
  i2c_ctrl_shift_reg_5_MC_D2_PT_1_507 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_shift_reg_5_MC_D2_PT_1_IN0,
      I1 => i2c_ctrl_shift_reg_en,
      I2 => i2c_ctrl_shift_reg(4),
      O => i2c_ctrl_shift_reg_5_MC_D2_PT_1
    );
  i2c_ctrl_shift_reg_5_MC_D2_PT_2_508 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_shift_reg_5_MC_D2_PT_2_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_shift_reg_5_MC_D2_PT_2_IN1,
      I2 => i2c_ctrl_shift_reg(5),
      O => i2c_ctrl_shift_reg_5_MC_D2_PT_2
    );
  i2c_ctrl_shift_reg_5_MC_D2_509 : X_OR3
    port map (
      I0 => i2c_ctrl_shift_reg_5_MC_D2_PT_0,
      I1 => i2c_ctrl_shift_reg_5_MC_D2_PT_1,
      I2 => i2c_ctrl_shift_reg_5_MC_D2_PT_2,
      O => i2c_ctrl_shift_reg_5_MC_D2
    );
  i2c_ctrl_shift_reg_5_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_shift_reg_5_MC_D1,
      I1 => i2c_ctrl_shift_reg_5_MC_D2,
      O => i2c_ctrl_shift_reg_5_MC_D
    );
  uc_ctrl_mbdr_micro_5_Q : X_BUF
    port map (
      I => uc_ctrl_mbdr_micro_5_MC_Q,
      O => uc_ctrl_mbdr_micro(5)
    );
  uc_ctrl_mbdr_micro_5_MC_R_OR_PRLD_510 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_mbdr_micro_5_MC_R_OR_PRLD
    );
  uc_ctrl_mbdr_micro_5_MC_REG : X_FF
    port map (
      I => uc_ctrl_mbdr_micro_5_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_mbdr_micro_5_MC_R_OR_PRLD,
      O => uc_ctrl_mbdr_micro_5_MC_Q
    );
  uc_ctrl_mbdr_micro_5_MC_D1_511 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_mbdr_micro_5_MC_D1
    );
  uc_ctrl_mbdr_micro_5_MC_D2_PT_0_512 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mbdr_micro_5_MC_D2_PT_0_IN0,
      I1 => N_PZ_564,
      O => uc_ctrl_mbdr_micro_5_MC_D2_PT_0
    );
  uc_ctrl_mbdr_micro_5_MC_D2_PT_1_513 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mbdr_micro_5_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_uc_ctrl_mbdr_micro_5_MC_D2_PT_1_IN1,
      O => uc_ctrl_mbdr_micro_5_MC_D2_PT_1
    );
  uc_ctrl_mbdr_micro_5_MC_D2_514 : X_OR2
    port map (
      I0 => uc_ctrl_mbdr_micro_5_MC_D2_PT_0,
      I1 => uc_ctrl_mbdr_micro_5_MC_D2_PT_1,
      O => uc_ctrl_mbdr_micro_5_MC_D2
    );
  uc_ctrl_mbdr_micro_5_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mbdr_micro_5_MC_XOR_IN0,
      I1 => uc_ctrl_mbdr_micro_5_MC_D2,
      O => uc_ctrl_mbdr_micro_5_MC_D
    );
  data_bus_5_II_UIM_515 : X_BUF
    port map (
      I => data_bus(5),
      O => data_bus_5_II_UIM
    );
  i2c_ctrl_shift_reg_4_Q : X_BUF
    port map (
      I => i2c_ctrl_shift_reg_4_MC_Q,
      O => i2c_ctrl_shift_reg(4)
    );
  i2c_ctrl_shift_reg_4_MC_R_OR_PRLD_516 : X_OR2
    port map (
      I0 => FOOBAR9_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_shift_reg_4_MC_R_OR_PRLD
    );
  i2c_ctrl_shift_reg_4_MC_REG : X_FF
    port map (
      I => i2c_ctrl_shift_reg_4_MC_D,
      CE => VCC,
      CLK => scl_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => i2c_ctrl_shift_reg_4_MC_R_OR_PRLD,
      O => i2c_ctrl_shift_reg_4_MC_Q
    );
  i2c_ctrl_shift_reg_4_MC_D1_517 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_shift_reg_4_MC_D1
    );
  i2c_ctrl_shift_reg_4_MC_D2_PT_0_518 : X_AND2
    port map (
      I0 => i2c_ctrl_shift_reg_ld,
      I1 => uc_ctrl_mbdr_micro(4),
      O => i2c_ctrl_shift_reg_4_MC_D2_PT_0
    );
  i2c_ctrl_shift_reg_4_MC_D2_PT_1_519 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_shift_reg_4_MC_D2_PT_1_IN0,
      I1 => i2c_ctrl_shift_reg_en,
      I2 => i2c_ctrl_shift_reg(3),
      O => i2c_ctrl_shift_reg_4_MC_D2_PT_1
    );
  i2c_ctrl_shift_reg_4_MC_D2_PT_2_520 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_shift_reg_4_MC_D2_PT_2_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_shift_reg_4_MC_D2_PT_2_IN1,
      I2 => i2c_ctrl_shift_reg(4),
      O => i2c_ctrl_shift_reg_4_MC_D2_PT_2
    );
  i2c_ctrl_shift_reg_4_MC_D2_521 : X_OR3
    port map (
      I0 => i2c_ctrl_shift_reg_4_MC_D2_PT_0,
      I1 => i2c_ctrl_shift_reg_4_MC_D2_PT_1,
      I2 => i2c_ctrl_shift_reg_4_MC_D2_PT_2,
      O => i2c_ctrl_shift_reg_4_MC_D2
    );
  i2c_ctrl_shift_reg_4_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_shift_reg_4_MC_D1,
      I1 => i2c_ctrl_shift_reg_4_MC_D2,
      O => i2c_ctrl_shift_reg_4_MC_D
    );
  uc_ctrl_mbdr_micro_4_Q : X_BUF
    port map (
      I => uc_ctrl_mbdr_micro_4_MC_Q,
      O => uc_ctrl_mbdr_micro(4)
    );
  uc_ctrl_mbdr_micro_4_MC_R_OR_PRLD_522 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_mbdr_micro_4_MC_R_OR_PRLD
    );
  uc_ctrl_mbdr_micro_4_MC_REG : X_FF
    port map (
      I => uc_ctrl_mbdr_micro_4_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_mbdr_micro_4_MC_R_OR_PRLD,
      O => uc_ctrl_mbdr_micro_4_MC_Q
    );
  uc_ctrl_mbdr_micro_4_MC_D1_523 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_mbdr_micro_4_MC_D1
    );
  uc_ctrl_mbdr_micro_4_MC_D2_PT_0_524 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mbdr_micro_4_MC_D2_PT_0_IN0,
      I1 => N_PZ_564,
      O => uc_ctrl_mbdr_micro_4_MC_D2_PT_0
    );
  uc_ctrl_mbdr_micro_4_MC_D2_PT_1_525 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mbdr_micro_4_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_uc_ctrl_mbdr_micro_4_MC_D2_PT_1_IN1,
      O => uc_ctrl_mbdr_micro_4_MC_D2_PT_1
    );
  uc_ctrl_mbdr_micro_4_MC_D2_526 : X_OR2
    port map (
      I0 => uc_ctrl_mbdr_micro_4_MC_D2_PT_0,
      I1 => uc_ctrl_mbdr_micro_4_MC_D2_PT_1,
      O => uc_ctrl_mbdr_micro_4_MC_D2
    );
  uc_ctrl_mbdr_micro_4_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mbdr_micro_4_MC_XOR_IN0,
      I1 => uc_ctrl_mbdr_micro_4_MC_D2,
      O => uc_ctrl_mbdr_micro_4_MC_D
    );
  i2c_ctrl_shift_reg_3_Q : X_BUF
    port map (
      I => i2c_ctrl_shift_reg_3_MC_Q,
      O => i2c_ctrl_shift_reg(3)
    );
  i2c_ctrl_shift_reg_3_MC_R_OR_PRLD_527 : X_OR2
    port map (
      I0 => FOOBAR9_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_shift_reg_3_MC_R_OR_PRLD
    );
  i2c_ctrl_shift_reg_3_MC_REG : X_FF
    port map (
      I => i2c_ctrl_shift_reg_3_MC_D,
      CE => VCC,
      CLK => scl_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => i2c_ctrl_shift_reg_3_MC_R_OR_PRLD,
      O => i2c_ctrl_shift_reg_3_MC_Q
    );
  i2c_ctrl_shift_reg_3_MC_D1_528 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_shift_reg_3_MC_D1
    );
  i2c_ctrl_shift_reg_3_MC_D2_PT_0_529 : X_AND2
    port map (
      I0 => i2c_ctrl_shift_reg_ld,
      I1 => uc_ctrl_mbdr_micro(3),
      O => i2c_ctrl_shift_reg_3_MC_D2_PT_0
    );
  i2c_ctrl_shift_reg_3_MC_D2_PT_1_530 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_shift_reg_3_MC_D2_PT_1_IN0,
      I1 => i2c_ctrl_shift_reg_en,
      I2 => i2c_ctrl_shift_reg(2),
      O => i2c_ctrl_shift_reg_3_MC_D2_PT_1
    );
  i2c_ctrl_shift_reg_3_MC_D2_PT_2_531 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_shift_reg_3_MC_D2_PT_2_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_shift_reg_3_MC_D2_PT_2_IN1,
      I2 => i2c_ctrl_shift_reg(3),
      O => i2c_ctrl_shift_reg_3_MC_D2_PT_2
    );
  i2c_ctrl_shift_reg_3_MC_D2_532 : X_OR3
    port map (
      I0 => i2c_ctrl_shift_reg_3_MC_D2_PT_0,
      I1 => i2c_ctrl_shift_reg_3_MC_D2_PT_1,
      I2 => i2c_ctrl_shift_reg_3_MC_D2_PT_2,
      O => i2c_ctrl_shift_reg_3_MC_D2
    );
  i2c_ctrl_shift_reg_3_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_shift_reg_3_MC_D1,
      I1 => i2c_ctrl_shift_reg_3_MC_D2,
      O => i2c_ctrl_shift_reg_3_MC_D
    );
  uc_ctrl_mbdr_micro_3_Q : X_BUF
    port map (
      I => uc_ctrl_mbdr_micro_3_MC_Q,
      O => uc_ctrl_mbdr_micro(3)
    );
  uc_ctrl_mbdr_micro_3_MC_R_OR_PRLD_533 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_mbdr_micro_3_MC_R_OR_PRLD
    );
  uc_ctrl_mbdr_micro_3_MC_REG : X_FF
    port map (
      I => uc_ctrl_mbdr_micro_3_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_mbdr_micro_3_MC_R_OR_PRLD,
      O => uc_ctrl_mbdr_micro_3_MC_Q
    );
  uc_ctrl_mbdr_micro_3_MC_D1_534 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_mbdr_micro_3_MC_D1
    );
  uc_ctrl_mbdr_micro_3_MC_D2_PT_0_535 : X_AND2
    port map (
      I0 => N_PZ_564,
      I1 => NlwInverterSignal_uc_ctrl_mbdr_micro_3_MC_D2_PT_0_IN1,
      O => uc_ctrl_mbdr_micro_3_MC_D2_PT_0
    );
  uc_ctrl_mbdr_micro_3_MC_D2_PT_1_536 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mbdr_micro_3_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_uc_ctrl_mbdr_micro_3_MC_D2_PT_1_IN1,
      O => uc_ctrl_mbdr_micro_3_MC_D2_PT_1
    );
  uc_ctrl_mbdr_micro_3_MC_D2_537 : X_OR2
    port map (
      I0 => uc_ctrl_mbdr_micro_3_MC_D2_PT_0,
      I1 => uc_ctrl_mbdr_micro_3_MC_D2_PT_1,
      O => uc_ctrl_mbdr_micro_3_MC_D2
    );
  uc_ctrl_mbdr_micro_3_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mbdr_micro_3_MC_XOR_IN0,
      I1 => uc_ctrl_mbdr_micro_3_MC_D2,
      O => uc_ctrl_mbdr_micro_3_MC_D
    );
  data_bus_3_II_UIM_538 : X_BUF
    port map (
      I => data_bus(3),
      O => data_bus_3_II_UIM
    );
  i2c_ctrl_shift_reg_2_Q : X_BUF
    port map (
      I => i2c_ctrl_shift_reg_2_MC_Q,
      O => i2c_ctrl_shift_reg(2)
    );
  i2c_ctrl_shift_reg_2_MC_R_OR_PRLD_539 : X_OR2
    port map (
      I0 => FOOBAR9_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_shift_reg_2_MC_R_OR_PRLD
    );
  i2c_ctrl_shift_reg_2_MC_REG : X_FF
    port map (
      I => i2c_ctrl_shift_reg_2_MC_D,
      CE => VCC,
      CLK => scl_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => i2c_ctrl_shift_reg_2_MC_R_OR_PRLD,
      O => i2c_ctrl_shift_reg_2_MC_Q
    );
  i2c_ctrl_shift_reg_2_MC_D1_540 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_shift_reg_2_MC_D1
    );
  i2c_ctrl_shift_reg_2_MC_D2_PT_0_541 : X_AND2
    port map (
      I0 => i2c_ctrl_shift_reg_ld,
      I1 => uc_ctrl_mbdr_micro(2),
      O => i2c_ctrl_shift_reg_2_MC_D2_PT_0
    );
  i2c_ctrl_shift_reg_2_MC_D2_PT_1_542 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_shift_reg_2_MC_D2_PT_1_IN0,
      I1 => i2c_ctrl_shift_reg_en,
      I2 => i2c_ctrl_shift_reg(1),
      O => i2c_ctrl_shift_reg_2_MC_D2_PT_1
    );
  i2c_ctrl_shift_reg_2_MC_D2_PT_2_543 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_shift_reg_2_MC_D2_PT_2_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_shift_reg_2_MC_D2_PT_2_IN1,
      I2 => i2c_ctrl_shift_reg(2),
      O => i2c_ctrl_shift_reg_2_MC_D2_PT_2
    );
  i2c_ctrl_shift_reg_2_MC_D2_544 : X_OR3
    port map (
      I0 => i2c_ctrl_shift_reg_2_MC_D2_PT_0,
      I1 => i2c_ctrl_shift_reg_2_MC_D2_PT_1,
      I2 => i2c_ctrl_shift_reg_2_MC_D2_PT_2,
      O => i2c_ctrl_shift_reg_2_MC_D2
    );
  i2c_ctrl_shift_reg_2_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_shift_reg_2_MC_D1,
      I1 => i2c_ctrl_shift_reg_2_MC_D2,
      O => i2c_ctrl_shift_reg_2_MC_D
    );
  uc_ctrl_mbdr_micro_2_Q : X_BUF
    port map (
      I => uc_ctrl_mbdr_micro_2_MC_Q,
      O => uc_ctrl_mbdr_micro(2)
    );
  uc_ctrl_mbdr_micro_2_MC_R_OR_PRLD_545 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_mbdr_micro_2_MC_R_OR_PRLD
    );
  uc_ctrl_mbdr_micro_2_MC_REG : X_FF
    port map (
      I => uc_ctrl_mbdr_micro_2_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_mbdr_micro_2_MC_R_OR_PRLD,
      O => uc_ctrl_mbdr_micro_2_MC_Q
    );
  uc_ctrl_mbdr_micro_2_MC_D1_546 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_mbdr_micro_2_MC_D1
    );
  uc_ctrl_mbdr_micro_2_MC_D2_PT_0_547 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mbdr_micro_2_MC_D2_PT_0_IN0,
      I1 => N_PZ_564,
      O => uc_ctrl_mbdr_micro_2_MC_D2_PT_0
    );
  uc_ctrl_mbdr_micro_2_MC_D2_PT_1_548 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mbdr_micro_2_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_uc_ctrl_mbdr_micro_2_MC_D2_PT_1_IN1,
      O => uc_ctrl_mbdr_micro_2_MC_D2_PT_1
    );
  uc_ctrl_mbdr_micro_2_MC_D2_549 : X_OR2
    port map (
      I0 => uc_ctrl_mbdr_micro_2_MC_D2_PT_0,
      I1 => uc_ctrl_mbdr_micro_2_MC_D2_PT_1,
      O => uc_ctrl_mbdr_micro_2_MC_D2
    );
  uc_ctrl_mbdr_micro_2_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mbdr_micro_2_MC_XOR_IN0,
      I1 => uc_ctrl_mbdr_micro_2_MC_D2,
      O => uc_ctrl_mbdr_micro_2_MC_D
    );
  i2c_ctrl_shift_reg_1_Q : X_BUF
    port map (
      I => i2c_ctrl_shift_reg_1_MC_Q,
      O => i2c_ctrl_shift_reg(1)
    );
  i2c_ctrl_shift_reg_1_MC_R_OR_PRLD_550 : X_OR2
    port map (
      I0 => FOOBAR8_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_shift_reg_1_MC_R_OR_PRLD
    );
  i2c_ctrl_shift_reg_1_MC_REG : X_FF
    port map (
      I => i2c_ctrl_shift_reg_1_MC_D,
      CE => VCC,
      CLK => scl_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => i2c_ctrl_shift_reg_1_MC_R_OR_PRLD,
      O => i2c_ctrl_shift_reg_1_MC_Q
    );
  i2c_ctrl_shift_reg_1_MC_D1_551 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_shift_reg_1_MC_D1
    );
  i2c_ctrl_shift_reg_1_MC_D2_PT_0_552 : X_AND2
    port map (
      I0 => i2c_ctrl_shift_reg_ld,
      I1 => uc_ctrl_mbdr_micro(1),
      O => i2c_ctrl_shift_reg_1_MC_D2_PT_0
    );
  i2c_ctrl_shift_reg_1_MC_D2_PT_1_553 : X_AND3
    port map (
      I0 => i2c_ctrl_shift_reg(0),
      I1 => NlwInverterSignal_i2c_ctrl_shift_reg_1_MC_D2_PT_1_IN1,
      I2 => i2c_ctrl_shift_reg_en,
      O => i2c_ctrl_shift_reg_1_MC_D2_PT_1
    );
  i2c_ctrl_shift_reg_1_MC_D2_PT_2_554 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_shift_reg_1_MC_D2_PT_2_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_shift_reg_1_MC_D2_PT_2_IN1,
      I2 => i2c_ctrl_shift_reg(1),
      O => i2c_ctrl_shift_reg_1_MC_D2_PT_2
    );
  i2c_ctrl_shift_reg_1_MC_D2_555 : X_OR3
    port map (
      I0 => i2c_ctrl_shift_reg_1_MC_D2_PT_0,
      I1 => i2c_ctrl_shift_reg_1_MC_D2_PT_1,
      I2 => i2c_ctrl_shift_reg_1_MC_D2_PT_2,
      O => i2c_ctrl_shift_reg_1_MC_D2
    );
  i2c_ctrl_shift_reg_1_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_shift_reg_1_MC_D1,
      I1 => i2c_ctrl_shift_reg_1_MC_D2,
      O => i2c_ctrl_shift_reg_1_MC_D
    );
  uc_ctrl_mbdr_micro_1_Q : X_BUF
    port map (
      I => uc_ctrl_mbdr_micro_1_MC_Q,
      O => uc_ctrl_mbdr_micro(1)
    );
  uc_ctrl_mbdr_micro_1_MC_R_OR_PRLD_556 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_mbdr_micro_1_MC_R_OR_PRLD
    );
  uc_ctrl_mbdr_micro_1_MC_REG : X_FF
    port map (
      I => uc_ctrl_mbdr_micro_1_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_mbdr_micro_1_MC_R_OR_PRLD,
      O => uc_ctrl_mbdr_micro_1_MC_Q
    );
  uc_ctrl_mbdr_micro_1_MC_D1_557 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_mbdr_micro_1_MC_D1
    );
  uc_ctrl_mbdr_micro_1_MC_D2_PT_0_558 : X_AND2
    port map (
      I0 => N_PZ_564,
      I1 => NlwInverterSignal_uc_ctrl_mbdr_micro_1_MC_D2_PT_0_IN1,
      O => uc_ctrl_mbdr_micro_1_MC_D2_PT_0
    );
  uc_ctrl_mbdr_micro_1_MC_D2_PT_1_559 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mbdr_micro_1_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_uc_ctrl_mbdr_micro_1_MC_D2_PT_1_IN1,
      O => uc_ctrl_mbdr_micro_1_MC_D2_PT_1
    );
  uc_ctrl_mbdr_micro_1_MC_D2_560 : X_OR2
    port map (
      I0 => uc_ctrl_mbdr_micro_1_MC_D2_PT_0,
      I1 => uc_ctrl_mbdr_micro_1_MC_D2_PT_1,
      O => uc_ctrl_mbdr_micro_1_MC_D2
    );
  uc_ctrl_mbdr_micro_1_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mbdr_micro_1_MC_XOR_IN0,
      I1 => uc_ctrl_mbdr_micro_1_MC_D2,
      O => uc_ctrl_mbdr_micro_1_MC_D
    );
  i2c_ctrl_shift_reg_0_Q : X_BUF
    port map (
      I => i2c_ctrl_shift_reg_0_MC_Q,
      O => i2c_ctrl_shift_reg(0)
    );
  i2c_ctrl_shift_reg_0_MC_R_OR_PRLD_561 : X_OR2
    port map (
      I0 => FOOBAR8_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_shift_reg_0_MC_R_OR_PRLD
    );
  i2c_ctrl_shift_reg_0_MC_REG : X_FF
    port map (
      I => i2c_ctrl_shift_reg_0_MC_D,
      CE => VCC,
      CLK => scl_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => i2c_ctrl_shift_reg_0_MC_R_OR_PRLD,
      O => i2c_ctrl_shift_reg_0_MC_Q
    );
  i2c_ctrl_shift_reg_0_MC_D1_562 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_shift_reg_0_MC_D1
    );
  i2c_ctrl_shift_reg_0_MC_D2_PT_0_563 : X_AND2
    port map (
      I0 => i2c_ctrl_shift_reg_ld,
      I1 => uc_ctrl_mbdr_micro(0),
      O => i2c_ctrl_shift_reg_0_MC_D2_PT_0
    );
  i2c_ctrl_shift_reg_0_MC_D2_PT_1_564 : X_AND3
    port map (
      I0 => i2c_ctrl_shift_reg(0),
      I1 => NlwInverterSignal_i2c_ctrl_shift_reg_0_MC_D2_PT_1_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_shift_reg_0_MC_D2_PT_1_IN2,
      O => i2c_ctrl_shift_reg_0_MC_D2_PT_1
    );
  i2c_ctrl_shift_reg_0_MC_D2_PT_2_565 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_shift_reg_0_MC_D2_PT_2_IN0,
      I1 => i2c_ctrl_shift_reg_en,
      I2 => i2c_ctrl_sda_in,
      O => i2c_ctrl_shift_reg_0_MC_D2_PT_2
    );
  i2c_ctrl_shift_reg_0_MC_D2_566 : X_OR3
    port map (
      I0 => i2c_ctrl_shift_reg_0_MC_D2_PT_0,
      I1 => i2c_ctrl_shift_reg_0_MC_D2_PT_1,
      I2 => i2c_ctrl_shift_reg_0_MC_D2_PT_2,
      O => i2c_ctrl_shift_reg_0_MC_D2
    );
  i2c_ctrl_shift_reg_0_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_shift_reg_0_MC_D1,
      I1 => i2c_ctrl_shift_reg_0_MC_D2,
      O => i2c_ctrl_shift_reg_0_MC_D
    );
  uc_ctrl_mbdr_micro_0_Q : X_BUF
    port map (
      I => uc_ctrl_mbdr_micro_0_MC_Q,
      O => uc_ctrl_mbdr_micro(0)
    );
  uc_ctrl_mbdr_micro_0_MC_R_OR_PRLD_567 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_mbdr_micro_0_MC_R_OR_PRLD
    );
  uc_ctrl_mbdr_micro_0_MC_REG : X_FF
    port map (
      I => uc_ctrl_mbdr_micro_0_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_mbdr_micro_0_MC_R_OR_PRLD,
      O => uc_ctrl_mbdr_micro_0_MC_Q
    );
  uc_ctrl_mbdr_micro_0_MC_D1_568 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_mbdr_micro_0_MC_D1
    );
  uc_ctrl_mbdr_micro_0_MC_D2_PT_0_569 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mbdr_micro_0_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_uc_ctrl_mbdr_micro_0_MC_D2_PT_0_IN1,
      O => uc_ctrl_mbdr_micro_0_MC_D2_PT_0
    );
  uc_ctrl_mbdr_micro_0_MC_D2_PT_1_570 : X_AND2
    port map (
      I0 => N_PZ_564,
      I1 => NlwInverterSignal_uc_ctrl_mbdr_micro_0_MC_D2_PT_1_IN1,
      O => uc_ctrl_mbdr_micro_0_MC_D2_PT_1
    );
  uc_ctrl_mbdr_micro_0_MC_D2_571 : X_OR2
    port map (
      I0 => uc_ctrl_mbdr_micro_0_MC_D2_PT_0,
      I1 => uc_ctrl_mbdr_micro_0_MC_D2_PT_1,
      O => uc_ctrl_mbdr_micro_0_MC_D2
    );
  uc_ctrl_mbdr_micro_0_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mbdr_micro_0_MC_XOR_IN0,
      I1 => uc_ctrl_mbdr_micro_0_MC_D2,
      O => uc_ctrl_mbdr_micro_0_MC_D
    );
  data_bus_0_II_UIM_572 : X_BUF
    port map (
      I => data_bus(0),
      O => data_bus_0_II_UIM
    );
  uc_ctrl_txak_573 : X_BUF
    port map (
      I => uc_ctrl_txak_MC_Q,
      O => uc_ctrl_txak
    );
  uc_ctrl_txak_MC_R_OR_PRLD_574 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_txak_MC_R_OR_PRLD
    );
  uc_ctrl_txak_MC_REG : X_FF
    port map (
      I => uc_ctrl_txak_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_txak_MC_R_OR_PRLD,
      O => uc_ctrl_txak_MC_Q
    );
  uc_ctrl_txak_MC_D1_575 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_txak_MC_D1
    );
  uc_ctrl_txak_MC_D2_PT_0_576 : X_AND2
    port map (
      I0 => N_PZ_569,
      I1 => NlwInverterSignal_uc_ctrl_txak_MC_D2_PT_0_IN1,
      O => uc_ctrl_txak_MC_D2_PT_0
    );
  uc_ctrl_txak_MC_D2_PT_1_577 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_txak_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_uc_ctrl_txak_MC_D2_PT_1_IN1,
      O => uc_ctrl_txak_MC_D2_PT_1
    );
  uc_ctrl_txak_MC_D2_578 : X_OR2
    port map (
      I0 => uc_ctrl_txak_MC_D2_PT_0,
      I1 => uc_ctrl_txak_MC_D2_PT_1,
      O => uc_ctrl_txak_MC_D2
    );
  uc_ctrl_txak_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_txak_MC_XOR_IN0,
      I1 => uc_ctrl_txak_MC_D2,
      O => uc_ctrl_txak_MC_D
    );
  i2c_ctrl_slave_sda_579 : X_BUF
    port map (
      I => i2c_ctrl_slave_sda_MC_Q,
      O => i2c_ctrl_slave_sda
    );
  i2c_ctrl_slave_sda_MC_REG : X_FF
    port map (
      I => i2c_ctrl_slave_sda_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => FOOBAR7_ctinst_6,
      RST => PRLD,
      O => i2c_ctrl_slave_sda_MC_Q
    );
  i2c_ctrl_slave_sda_MC_D1_580 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_slave_sda_MC_D1
    );
  i2c_ctrl_slave_sda_MC_D2_PT_0_581 : X_AND4
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => i2c_ctrl_state_ffd1,
      I2 => NlwInverterSignal_i2c_ctrl_slave_sda_MC_D2_PT_0_IN2,
      I3 => NlwInverterSignal_i2c_ctrl_slave_sda_MC_D2_PT_0_IN3,
      O => i2c_ctrl_slave_sda_MC_D2_PT_0
    );
  i2c_ctrl_slave_sda_MC_D2_PT_1_582 : X_AND4
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_slave_sda_MC_D2_PT_1_IN0,
      I1 => i2c_ctrl_state_ffd1,
      I2 => i2c_ctrl_state_ffd2,
      I3 => NlwInverterSignal_i2c_ctrl_slave_sda_MC_D2_PT_1_IN3,
      O => i2c_ctrl_slave_sda_MC_D2_PT_1
    );
  i2c_ctrl_slave_sda_MC_D2_PT_2_583 : X_AND5
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => NlwInverterSignal_i2c_ctrl_slave_sda_MC_D2_PT_2_IN1,
      I2 => i2c_ctrl_state_ffd2,
      I3 => NlwInverterSignal_i2c_ctrl_slave_sda_MC_D2_PT_2_IN3,
      I4 => i2c_ctrl_maas,
      O => i2c_ctrl_slave_sda_MC_D2_PT_2
    );
  i2c_ctrl_slave_sda_MC_D2_584 : X_OR3
    port map (
      I0 => i2c_ctrl_slave_sda_MC_D2_PT_0,
      I1 => i2c_ctrl_slave_sda_MC_D2_PT_1,
      I2 => i2c_ctrl_slave_sda_MC_D2_PT_2,
      O => i2c_ctrl_slave_sda_MC_D2
    );
  i2c_ctrl_slave_sda_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_slave_sda_MC_XOR_IN0,
      I1 => i2c_ctrl_slave_sda_MC_D2,
      O => i2c_ctrl_slave_sda_MC_D
    );
  i2c_ctrl_maas_585 : X_BUF
    port map (
      I => i2c_ctrl_maas_MC_Q,
      O => i2c_ctrl_maas
    );
  i2c_ctrl_maas_MC_R_OR_PRLD_586 : X_OR2
    port map (
      I0 => FOOBAR8_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_maas_MC_R_OR_PRLD
    );
  i2c_ctrl_maas_MC_REG : X_FF
    port map (
      I => i2c_ctrl_maas_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_maas_MC_R_OR_PRLD,
      O => i2c_ctrl_maas_MC_Q
    );
  i2c_ctrl_maas_MC_D1_587 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_maas_MC_D1
    );
  i2c_ctrl_maas_MC_D2_PT_0_588 : X_AND2
    port map (
      I0 => i2c_ctrl_maas,
      I1 => uc_ctrl_mbcr_wr,
      O => i2c_ctrl_maas_MC_D2_PT_0
    );
  i2c_ctrl_maas_MC_D2_PT_1_589 : X_AND5
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => NlwInverterSignal_i2c_ctrl_maas_MC_D2_PT_1_IN1,
      I2 => i2c_ctrl_state_ffd2,
      I3 => uc_ctrl_ds_int_MC_COMB,
      I4 => i2c_ctrl_maas,
      O => i2c_ctrl_maas_MC_D2_PT_1
    );
  i2c_ctrl_maas_MC_D2_PT_2_590 : X_AND6
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => NlwInverterSignal_i2c_ctrl_maas_MC_D2_PT_2_IN1,
      I2 => i2c_ctrl_state_ffd2,
      I3 => NlwInverterSignal_i2c_ctrl_maas_MC_D2_PT_2_IN3,
      I4 => NlwInverterSignal_i2c_ctrl_maas_MC_D2_PT_2_IN4,
      I5 => NlwInverterSignal_i2c_ctrl_maas_MC_D2_PT_2_IN5,
      O => i2c_ctrl_maas_MC_D2_PT_2
    );
  i2c_ctrl_maas_MC_D2_591 : X_OR3
    port map (
      I0 => i2c_ctrl_maas_MC_D2_PT_0,
      I1 => i2c_ctrl_maas_MC_D2_PT_1,
      I2 => i2c_ctrl_maas_MC_D2_PT_2,
      O => i2c_ctrl_maas_MC_D2
    );
  i2c_ctrl_maas_MC_D_592 : X_XOR2
    port map (
      I0 => i2c_ctrl_maas_MC_D_TFF,
      I1 => i2c_ctrl_maas_MC_Q,
      O => i2c_ctrl_maas_MC_D
    );
  i2c_ctrl_maas_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_maas_MC_D1,
      I1 => i2c_ctrl_maas_MC_D2,
      O => i2c_ctrl_maas_MC_D_TFF
    );
  uc_ctrl_mbcr_wr_593 : X_BUF
    port map (
      I => uc_ctrl_mbcr_wr_MC_Q,
      O => uc_ctrl_mbcr_wr
    );
  uc_ctrl_mbcr_wr_MC_R_OR_PRLD_594 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_mbcr_wr_MC_R_OR_PRLD
    );
  uc_ctrl_mbcr_wr_MC_REG : X_FF
    port map (
      I => uc_ctrl_mbcr_wr_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_mbcr_wr_MC_R_OR_PRLD,
      O => uc_ctrl_mbcr_wr_MC_Q
    );
  uc_ctrl_mbcr_wr_MC_D1_595 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_mbcr_wr_MC_D1
    );
  uc_ctrl_mbcr_wr_MC_D2_PT_0_596 : X_AND2
    port map (
      I0 => N_PZ_569,
      I1 => N_PZ_569,
      O => uc_ctrl_mbcr_wr_MC_D2_PT_0
    );
  uc_ctrl_mbcr_wr_MC_D2_PT_1_597 : X_AND3
    port map (
      I0 => uc_ctrl_prs_state_ffd2,
      I1 => NlwInverterSignal_uc_ctrl_mbcr_wr_MC_D2_PT_1_IN1,
      I2 => uc_ctrl_mbcr_wr,
      O => uc_ctrl_mbcr_wr_MC_D2_PT_1
    );
  uc_ctrl_mbcr_wr_MC_D2_PT_2_598 : X_AND3
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mbcr_wr_MC_D2_PT_2_IN0,
      I1 => uc_ctrl_prs_state_ffd1,
      I2 => uc_ctrl_mbcr_wr,
      O => uc_ctrl_mbcr_wr_MC_D2_PT_2
    );
  uc_ctrl_mbcr_wr_MC_D2_599 : X_OR3
    port map (
      I0 => uc_ctrl_mbcr_wr_MC_D2_PT_0,
      I1 => uc_ctrl_mbcr_wr_MC_D2_PT_1,
      I2 => uc_ctrl_mbcr_wr_MC_D2_PT_2,
      O => uc_ctrl_mbcr_wr_MC_D2
    );
  uc_ctrl_mbcr_wr_MC_XOR : X_XOR2
    port map (
      I0 => uc_ctrl_mbcr_wr_MC_D1,
      I1 => uc_ctrl_mbcr_wr_MC_D2,
      O => uc_ctrl_mbcr_wr_MC_D
    );
  i2c_ctrl_i2c_header_en_600 : X_BUF
    port map (
      I => i2c_ctrl_i2c_header_en_MC_Q,
      O => i2c_ctrl_i2c_header_en
    );
  i2c_ctrl_i2c_header_en_MC_R_OR_PRLD_601 : X_OR2
    port map (
      I0 => FOOBAR7_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_i2c_header_en_MC_R_OR_PRLD
    );
  i2c_ctrl_i2c_header_en_MC_REG : X_FF
    port map (
      I => i2c_ctrl_i2c_header_en_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_i2c_header_en_MC_R_OR_PRLD,
      O => i2c_ctrl_i2c_header_en_MC_Q
    );
  i2c_ctrl_i2c_header_en_MC_D1_602 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_i2c_header_en_MC_D1
    );
  i2c_ctrl_i2c_header_en_MC_D2_PT_0_603 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_i2c_header_en_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_i2c_header_en_MC_D2_PT_0_IN1,
      O => i2c_ctrl_i2c_header_en_MC_D2_PT_0
    );
  i2c_ctrl_i2c_header_en_MC_D2_PT_1_604 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_i2c_header_en_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_i2c_header_en_MC_D2_PT_1_IN1,
      O => i2c_ctrl_i2c_header_en_MC_D2_PT_1
    );
  i2c_ctrl_i2c_header_en_MC_D2_605 : X_OR2
    port map (
      I0 => i2c_ctrl_i2c_header_en_MC_D2_PT_0,
      I1 => i2c_ctrl_i2c_header_en_MC_D2_PT_1,
      O => i2c_ctrl_i2c_header_en_MC_D2
    );
  i2c_ctrl_i2c_header_en_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_i2c_header_en_MC_XOR_IN0,
      I1 => i2c_ctrl_i2c_header_en_MC_D2,
      O => i2c_ctrl_i2c_header_en_MC_D
    );
  uc_ctrl_madr_2_Q : X_BUF
    port map (
      I => uc_ctrl_madr_2_MC_Q,
      O => uc_ctrl_madr(2)
    );
  uc_ctrl_madr_2_MC_R_OR_PRLD_606 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_madr_2_MC_R_OR_PRLD
    );
  uc_ctrl_madr_2_MC_REG : X_FF
    port map (
      I => uc_ctrl_madr_2_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_madr_2_MC_R_OR_PRLD,
      O => uc_ctrl_madr_2_MC_Q
    );
  uc_ctrl_madr_2_MC_D1_607 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_madr_2_MC_D1
    );
  uc_ctrl_madr_2_MC_D2_PT_0_608 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_madr_2_MC_D2_PT_0_IN0,
      I1 => N_PZ_565,
      O => uc_ctrl_madr_2_MC_D2_PT_0
    );
  uc_ctrl_madr_2_MC_D2_PT_1_609 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_madr_2_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_uc_ctrl_madr_2_MC_D2_PT_1_IN1,
      O => uc_ctrl_madr_2_MC_D2_PT_1
    );
  uc_ctrl_madr_2_MC_D2_610 : X_OR2
    port map (
      I0 => uc_ctrl_madr_2_MC_D2_PT_0,
      I1 => uc_ctrl_madr_2_MC_D2_PT_1,
      O => uc_ctrl_madr_2_MC_D2
    );
  uc_ctrl_madr_2_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_madr_2_MC_XOR_IN0,
      I1 => uc_ctrl_madr_2_MC_D2,
      O => uc_ctrl_madr_2_MC_D
    );
  i2c_ctrl_i2c_header_2_Q : X_BUF
    port map (
      I => i2c_ctrl_i2c_header_2_MC_Q,
      O => i2c_ctrl_i2c_header(2)
    );
  i2c_ctrl_i2c_header_2_MC_R_OR_PRLD_611 : X_OR2
    port map (
      I0 => FOOBAR5_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_i2c_header_2_MC_R_OR_PRLD
    );
  i2c_ctrl_i2c_header_2_MC_REG : X_FF
    port map (
      I => i2c_ctrl_i2c_header_2_MC_D,
      CE => i2c_ctrl_i2c_header_2_MC_CE,
      CLK => scl_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => i2c_ctrl_i2c_header_2_MC_R_OR_PRLD,
      O => i2c_ctrl_i2c_header_2_MC_Q
    );
  i2c_ctrl_i2c_header_2_MC_CE_PT_0_612 : X_AND2
    port map (
      I0 => i2c_ctrl_i2c_header_en,
      I1 => i2c_ctrl_i2c_header_en,
      O => i2c_ctrl_i2c_header_2_MC_CE_PT_0
    );
  i2c_ctrl_i2c_header_2_MC_CE_613 : X_OR2
    port map (
      I0 => i2c_ctrl_i2c_header_2_MC_CE_PT_0,
      I1 => i2c_ctrl_i2c_header_2_MC_CE_PT_0,
      O => i2c_ctrl_i2c_header_2_MC_CE
    );
  i2c_ctrl_i2c_header_2_MC_D1_614 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_i2c_header_2_MC_D1
    );
  i2c_ctrl_i2c_header_2_MC_D2_PT_0_615 : X_AND2
    port map (
      I0 => i2c_ctrl_i2c_header(1),
      I1 => i2c_ctrl_i2c_header(1),
      O => i2c_ctrl_i2c_header_2_MC_D2_PT_0
    );
  i2c_ctrl_i2c_header_2_MC_D2_616 : X_OR2
    port map (
      I0 => i2c_ctrl_i2c_header_2_MC_D2_PT_0,
      I1 => i2c_ctrl_i2c_header_2_MC_D2_PT_0,
      O => i2c_ctrl_i2c_header_2_MC_D2
    );
  i2c_ctrl_i2c_header_2_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_i2c_header_2_MC_D1,
      I1 => i2c_ctrl_i2c_header_2_MC_D2,
      O => i2c_ctrl_i2c_header_2_MC_D
    );
  uc_ctrl_madr_3_Q : X_BUF
    port map (
      I => uc_ctrl_madr_3_MC_Q,
      O => uc_ctrl_madr(3)
    );
  uc_ctrl_madr_3_MC_R_OR_PRLD_617 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_madr_3_MC_R_OR_PRLD
    );
  uc_ctrl_madr_3_MC_REG : X_FF
    port map (
      I => uc_ctrl_madr_3_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_madr_3_MC_R_OR_PRLD,
      O => uc_ctrl_madr_3_MC_Q
    );
  uc_ctrl_madr_3_MC_D1_618 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_madr_3_MC_D1
    );
  uc_ctrl_madr_3_MC_D2_PT_0_619 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_madr_3_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_uc_ctrl_madr_3_MC_D2_PT_0_IN1,
      O => uc_ctrl_madr_3_MC_D2_PT_0
    );
  uc_ctrl_madr_3_MC_D2_PT_1_620 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_madr_3_MC_D2_PT_1_IN0,
      I1 => N_PZ_565,
      O => uc_ctrl_madr_3_MC_D2_PT_1
    );
  uc_ctrl_madr_3_MC_D2_621 : X_OR2
    port map (
      I0 => uc_ctrl_madr_3_MC_D2_PT_0,
      I1 => uc_ctrl_madr_3_MC_D2_PT_1,
      O => uc_ctrl_madr_3_MC_D2
    );
  uc_ctrl_madr_3_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_madr_3_MC_XOR_IN0,
      I1 => uc_ctrl_madr_3_MC_D2,
      O => uc_ctrl_madr_3_MC_D
    );
  i2c_ctrl_i2c_header_3_Q : X_BUF
    port map (
      I => i2c_ctrl_i2c_header_3_MC_Q,
      O => i2c_ctrl_i2c_header(3)
    );
  i2c_ctrl_i2c_header_3_MC_R_OR_PRLD_622 : X_OR2
    port map (
      I0 => FOOBAR5_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_i2c_header_3_MC_R_OR_PRLD
    );
  i2c_ctrl_i2c_header_3_MC_REG : X_FF
    port map (
      I => i2c_ctrl_i2c_header_3_MC_D,
      CE => i2c_ctrl_i2c_header_3_MC_CE,
      CLK => scl_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => i2c_ctrl_i2c_header_3_MC_R_OR_PRLD,
      O => i2c_ctrl_i2c_header_3_MC_Q
    );
  i2c_ctrl_i2c_header_3_MC_CE_PT_0_623 : X_AND2
    port map (
      I0 => i2c_ctrl_i2c_header_en,
      I1 => i2c_ctrl_i2c_header_en,
      O => i2c_ctrl_i2c_header_3_MC_CE_PT_0
    );
  i2c_ctrl_i2c_header_3_MC_CE_624 : X_OR2
    port map (
      I0 => i2c_ctrl_i2c_header_3_MC_CE_PT_0,
      I1 => i2c_ctrl_i2c_header_3_MC_CE_PT_0,
      O => i2c_ctrl_i2c_header_3_MC_CE
    );
  i2c_ctrl_i2c_header_3_MC_D1_625 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_i2c_header_3_MC_D1
    );
  i2c_ctrl_i2c_header_3_MC_D2_PT_0_626 : X_AND2
    port map (
      I0 => i2c_ctrl_i2c_header(2),
      I1 => i2c_ctrl_i2c_header(2),
      O => i2c_ctrl_i2c_header_3_MC_D2_PT_0
    );
  i2c_ctrl_i2c_header_3_MC_D2_627 : X_OR2
    port map (
      I0 => i2c_ctrl_i2c_header_3_MC_D2_PT_0,
      I1 => i2c_ctrl_i2c_header_3_MC_D2_PT_0,
      O => i2c_ctrl_i2c_header_3_MC_D2
    );
  i2c_ctrl_i2c_header_3_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_i2c_header_3_MC_D1,
      I1 => i2c_ctrl_i2c_header_3_MC_D2,
      O => i2c_ctrl_i2c_header_3_MC_D
    );
  uc_ctrl_madr_4_Q : X_BUF
    port map (
      I => uc_ctrl_madr_4_MC_Q,
      O => uc_ctrl_madr(4)
    );
  uc_ctrl_madr_4_MC_R_OR_PRLD_628 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_madr_4_MC_R_OR_PRLD
    );
  uc_ctrl_madr_4_MC_REG : X_FF
    port map (
      I => uc_ctrl_madr_4_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_madr_4_MC_R_OR_PRLD,
      O => uc_ctrl_madr_4_MC_Q
    );
  uc_ctrl_madr_4_MC_D1_629 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_madr_4_MC_D1
    );
  uc_ctrl_madr_4_MC_D2_PT_0_630 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_madr_4_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_uc_ctrl_madr_4_MC_D2_PT_0_IN1,
      O => uc_ctrl_madr_4_MC_D2_PT_0
    );
  uc_ctrl_madr_4_MC_D2_PT_1_631 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_madr_4_MC_D2_PT_1_IN0,
      I1 => N_PZ_565,
      O => uc_ctrl_madr_4_MC_D2_PT_1
    );
  uc_ctrl_madr_4_MC_D2_632 : X_OR2
    port map (
      I0 => uc_ctrl_madr_4_MC_D2_PT_0,
      I1 => uc_ctrl_madr_4_MC_D2_PT_1,
      O => uc_ctrl_madr_4_MC_D2
    );
  uc_ctrl_madr_4_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_madr_4_MC_XOR_IN0,
      I1 => uc_ctrl_madr_4_MC_D2,
      O => uc_ctrl_madr_4_MC_D
    );
  i2c_ctrl_i2c_header_4_Q : X_BUF
    port map (
      I => i2c_ctrl_i2c_header_4_MC_Q,
      O => i2c_ctrl_i2c_header(4)
    );
  i2c_ctrl_i2c_header_4_MC_R_OR_PRLD_633 : X_OR2
    port map (
      I0 => FOOBAR5_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_i2c_header_4_MC_R_OR_PRLD
    );
  i2c_ctrl_i2c_header_4_MC_REG : X_FF
    port map (
      I => i2c_ctrl_i2c_header_4_MC_D,
      CE => i2c_ctrl_i2c_header_4_MC_CE,
      CLK => scl_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => i2c_ctrl_i2c_header_4_MC_R_OR_PRLD,
      O => i2c_ctrl_i2c_header_4_MC_Q
    );
  i2c_ctrl_i2c_header_4_MC_CE_PT_0_634 : X_AND2
    port map (
      I0 => i2c_ctrl_i2c_header_en,
      I1 => i2c_ctrl_i2c_header_en,
      O => i2c_ctrl_i2c_header_4_MC_CE_PT_0
    );
  i2c_ctrl_i2c_header_4_MC_CE_635 : X_OR2
    port map (
      I0 => i2c_ctrl_i2c_header_4_MC_CE_PT_0,
      I1 => i2c_ctrl_i2c_header_4_MC_CE_PT_0,
      O => i2c_ctrl_i2c_header_4_MC_CE
    );
  i2c_ctrl_i2c_header_4_MC_D1_636 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_i2c_header_4_MC_D1
    );
  i2c_ctrl_i2c_header_4_MC_D2_PT_0_637 : X_AND2
    port map (
      I0 => i2c_ctrl_i2c_header(3),
      I1 => i2c_ctrl_i2c_header(3),
      O => i2c_ctrl_i2c_header_4_MC_D2_PT_0
    );
  i2c_ctrl_i2c_header_4_MC_D2_638 : X_OR2
    port map (
      I0 => i2c_ctrl_i2c_header_4_MC_D2_PT_0,
      I1 => i2c_ctrl_i2c_header_4_MC_D2_PT_0,
      O => i2c_ctrl_i2c_header_4_MC_D2
    );
  i2c_ctrl_i2c_header_4_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_i2c_header_4_MC_D1,
      I1 => i2c_ctrl_i2c_header_4_MC_D2,
      O => i2c_ctrl_i2c_header_4_MC_D
    );
  uc_ctrl_madr_5_Q : X_BUF
    port map (
      I => uc_ctrl_madr_5_MC_Q,
      O => uc_ctrl_madr(5)
    );
  uc_ctrl_madr_5_MC_R_OR_PRLD_639 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_madr_5_MC_R_OR_PRLD
    );
  uc_ctrl_madr_5_MC_REG : X_FF
    port map (
      I => uc_ctrl_madr_5_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_madr_5_MC_R_OR_PRLD,
      O => uc_ctrl_madr_5_MC_Q
    );
  uc_ctrl_madr_5_MC_D1_640 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_madr_5_MC_D1
    );
  uc_ctrl_madr_5_MC_D2_PT_0_641 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_madr_5_MC_D2_PT_0_IN0,
      I1 => N_PZ_565,
      O => uc_ctrl_madr_5_MC_D2_PT_0
    );
  uc_ctrl_madr_5_MC_D2_PT_1_642 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_madr_5_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_uc_ctrl_madr_5_MC_D2_PT_1_IN1,
      O => uc_ctrl_madr_5_MC_D2_PT_1
    );
  uc_ctrl_madr_5_MC_D2_643 : X_OR2
    port map (
      I0 => uc_ctrl_madr_5_MC_D2_PT_0,
      I1 => uc_ctrl_madr_5_MC_D2_PT_1,
      O => uc_ctrl_madr_5_MC_D2
    );
  uc_ctrl_madr_5_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_madr_5_MC_XOR_IN0,
      I1 => uc_ctrl_madr_5_MC_D2,
      O => uc_ctrl_madr_5_MC_D
    );
  i2c_ctrl_i2c_header_5_Q : X_BUF
    port map (
      I => i2c_ctrl_i2c_header_5_MC_Q,
      O => i2c_ctrl_i2c_header(5)
    );
  i2c_ctrl_i2c_header_5_MC_R_OR_PRLD_644 : X_OR2
    port map (
      I0 => FOOBAR5_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_i2c_header_5_MC_R_OR_PRLD
    );
  i2c_ctrl_i2c_header_5_MC_REG : X_FF
    port map (
      I => i2c_ctrl_i2c_header_5_MC_D,
      CE => i2c_ctrl_i2c_header_5_MC_CE,
      CLK => scl_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => i2c_ctrl_i2c_header_5_MC_R_OR_PRLD,
      O => i2c_ctrl_i2c_header_5_MC_Q
    );
  i2c_ctrl_i2c_header_5_MC_CE_PT_0_645 : X_AND2
    port map (
      I0 => i2c_ctrl_i2c_header_en,
      I1 => i2c_ctrl_i2c_header_en,
      O => i2c_ctrl_i2c_header_5_MC_CE_PT_0
    );
  i2c_ctrl_i2c_header_5_MC_CE_646 : X_OR2
    port map (
      I0 => i2c_ctrl_i2c_header_5_MC_CE_PT_0,
      I1 => i2c_ctrl_i2c_header_5_MC_CE_PT_0,
      O => i2c_ctrl_i2c_header_5_MC_CE
    );
  i2c_ctrl_i2c_header_5_MC_D1_647 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_i2c_header_5_MC_D1
    );
  i2c_ctrl_i2c_header_5_MC_D2_PT_0_648 : X_AND2
    port map (
      I0 => i2c_ctrl_i2c_header(4),
      I1 => i2c_ctrl_i2c_header(4),
      O => i2c_ctrl_i2c_header_5_MC_D2_PT_0
    );
  i2c_ctrl_i2c_header_5_MC_D2_649 : X_OR2
    port map (
      I0 => i2c_ctrl_i2c_header_5_MC_D2_PT_0,
      I1 => i2c_ctrl_i2c_header_5_MC_D2_PT_0,
      O => i2c_ctrl_i2c_header_5_MC_D2
    );
  i2c_ctrl_i2c_header_5_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_i2c_header_5_MC_D1,
      I1 => i2c_ctrl_i2c_header_5_MC_D2,
      O => i2c_ctrl_i2c_header_5_MC_D
    );
  uc_ctrl_madr_6_Q : X_BUF
    port map (
      I => uc_ctrl_madr_6_MC_Q,
      O => uc_ctrl_madr(6)
    );
  uc_ctrl_madr_6_MC_R_OR_PRLD_650 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_madr_6_MC_R_OR_PRLD
    );
  uc_ctrl_madr_6_MC_REG : X_FF
    port map (
      I => uc_ctrl_madr_6_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_madr_6_MC_R_OR_PRLD,
      O => uc_ctrl_madr_6_MC_Q
    );
  uc_ctrl_madr_6_MC_D1_651 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_madr_6_MC_D1
    );
  uc_ctrl_madr_6_MC_D2_PT_0_652 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_madr_6_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_uc_ctrl_madr_6_MC_D2_PT_0_IN1,
      O => uc_ctrl_madr_6_MC_D2_PT_0
    );
  uc_ctrl_madr_6_MC_D2_PT_1_653 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_madr_6_MC_D2_PT_1_IN0,
      I1 => N_PZ_565,
      O => uc_ctrl_madr_6_MC_D2_PT_1
    );
  uc_ctrl_madr_6_MC_D2_654 : X_OR2
    port map (
      I0 => uc_ctrl_madr_6_MC_D2_PT_0,
      I1 => uc_ctrl_madr_6_MC_D2_PT_1,
      O => uc_ctrl_madr_6_MC_D2
    );
  uc_ctrl_madr_6_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_madr_6_MC_XOR_IN0,
      I1 => uc_ctrl_madr_6_MC_D2,
      O => uc_ctrl_madr_6_MC_D
    );
  i2c_ctrl_i2c_header_6_Q : X_BUF
    port map (
      I => i2c_ctrl_i2c_header_6_MC_Q,
      O => i2c_ctrl_i2c_header(6)
    );
  i2c_ctrl_i2c_header_6_MC_R_OR_PRLD_655 : X_OR2
    port map (
      I0 => FOOBAR5_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_i2c_header_6_MC_R_OR_PRLD
    );
  i2c_ctrl_i2c_header_6_MC_REG : X_FF
    port map (
      I => i2c_ctrl_i2c_header_6_MC_D,
      CE => i2c_ctrl_i2c_header_6_MC_CE,
      CLK => scl_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => i2c_ctrl_i2c_header_6_MC_R_OR_PRLD,
      O => i2c_ctrl_i2c_header_6_MC_Q
    );
  i2c_ctrl_i2c_header_6_MC_CE_PT_0_656 : X_AND2
    port map (
      I0 => i2c_ctrl_i2c_header_en,
      I1 => i2c_ctrl_i2c_header_en,
      O => i2c_ctrl_i2c_header_6_MC_CE_PT_0
    );
  i2c_ctrl_i2c_header_6_MC_CE_657 : X_OR2
    port map (
      I0 => i2c_ctrl_i2c_header_6_MC_CE_PT_0,
      I1 => i2c_ctrl_i2c_header_6_MC_CE_PT_0,
      O => i2c_ctrl_i2c_header_6_MC_CE
    );
  i2c_ctrl_i2c_header_6_MC_D1_658 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_i2c_header_6_MC_D1
    );
  i2c_ctrl_i2c_header_6_MC_D2_PT_0_659 : X_AND2
    port map (
      I0 => i2c_ctrl_i2c_header(5),
      I1 => i2c_ctrl_i2c_header(5),
      O => i2c_ctrl_i2c_header_6_MC_D2_PT_0
    );
  i2c_ctrl_i2c_header_6_MC_D2_660 : X_OR2
    port map (
      I0 => i2c_ctrl_i2c_header_6_MC_D2_PT_0,
      I1 => i2c_ctrl_i2c_header_6_MC_D2_PT_0,
      O => i2c_ctrl_i2c_header_6_MC_D2
    );
  i2c_ctrl_i2c_header_6_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_i2c_header_6_MC_D1,
      I1 => i2c_ctrl_i2c_header_6_MC_D2,
      O => i2c_ctrl_i2c_header_6_MC_D
    );
  uc_ctrl_madr_7_Q : X_BUF
    port map (
      I => uc_ctrl_madr_7_MC_Q,
      O => uc_ctrl_madr(7)
    );
  uc_ctrl_madr_7_MC_R_OR_PRLD_661 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_madr_7_MC_R_OR_PRLD
    );
  uc_ctrl_madr_7_MC_REG : X_FF
    port map (
      I => uc_ctrl_madr_7_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_madr_7_MC_R_OR_PRLD,
      O => uc_ctrl_madr_7_MC_Q
    );
  uc_ctrl_madr_7_MC_D1_662 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_madr_7_MC_D1
    );
  uc_ctrl_madr_7_MC_D2_PT_0_663 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_madr_7_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_uc_ctrl_madr_7_MC_D2_PT_0_IN1,
      O => uc_ctrl_madr_7_MC_D2_PT_0
    );
  uc_ctrl_madr_7_MC_D2_PT_1_664 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_madr_7_MC_D2_PT_1_IN0,
      I1 => N_PZ_565,
      O => uc_ctrl_madr_7_MC_D2_PT_1
    );
  uc_ctrl_madr_7_MC_D2_665 : X_OR2
    port map (
      I0 => uc_ctrl_madr_7_MC_D2_PT_0,
      I1 => uc_ctrl_madr_7_MC_D2_PT_1,
      O => uc_ctrl_madr_7_MC_D2
    );
  uc_ctrl_madr_7_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_madr_7_MC_XOR_IN0,
      I1 => uc_ctrl_madr_7_MC_D2,
      O => uc_ctrl_madr_7_MC_D
    );
  i2c_ctrl_i2c_header_7_Q : X_BUF
    port map (
      I => i2c_ctrl_i2c_header_7_MC_Q,
      O => i2c_ctrl_i2c_header(7)
    );
  i2c_ctrl_i2c_header_7_MC_R_OR_PRLD_666 : X_OR2
    port map (
      I0 => FOOBAR5_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_i2c_header_7_MC_R_OR_PRLD
    );
  i2c_ctrl_i2c_header_7_MC_REG : X_FF
    port map (
      I => i2c_ctrl_i2c_header_7_MC_D,
      CE => i2c_ctrl_i2c_header_7_MC_CE,
      CLK => scl_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => i2c_ctrl_i2c_header_7_MC_R_OR_PRLD,
      O => i2c_ctrl_i2c_header_7_MC_Q
    );
  i2c_ctrl_i2c_header_7_MC_CE_PT_0_667 : X_AND2
    port map (
      I0 => i2c_ctrl_i2c_header_en,
      I1 => i2c_ctrl_i2c_header_en,
      O => i2c_ctrl_i2c_header_7_MC_CE_PT_0
    );
  i2c_ctrl_i2c_header_7_MC_CE_668 : X_OR2
    port map (
      I0 => i2c_ctrl_i2c_header_7_MC_CE_PT_0,
      I1 => i2c_ctrl_i2c_header_7_MC_CE_PT_0,
      O => i2c_ctrl_i2c_header_7_MC_CE
    );
  i2c_ctrl_i2c_header_7_MC_D1_669 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_i2c_header_7_MC_D1
    );
  i2c_ctrl_i2c_header_7_MC_D2_PT_0_670 : X_AND2
    port map (
      I0 => i2c_ctrl_i2c_header(6),
      I1 => i2c_ctrl_i2c_header(6),
      O => i2c_ctrl_i2c_header_7_MC_D2_PT_0
    );
  i2c_ctrl_i2c_header_7_MC_D2_671 : X_OR2
    port map (
      I0 => i2c_ctrl_i2c_header_7_MC_D2_PT_0,
      I1 => i2c_ctrl_i2c_header_7_MC_D2_PT_0,
      O => i2c_ctrl_i2c_header_7_MC_D2
    );
  i2c_ctrl_i2c_header_7_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_i2c_header_7_MC_D1,
      I1 => i2c_ctrl_i2c_header_7_MC_D2,
      O => i2c_ctrl_i2c_header_7_MC_D
    );
  ds_II_IREG : X_FF
    port map (
      I => ds,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => reset_II_FSR_Q,
      RST => PRLD,
      O => uc_ctrl_ds_int_MC_Q_tsim_ireg_Q
    );
  data_bus_0_MC_BUFOE : X_BUF
    port map (
      I => FOOBAR2_ctinst_7,
      O => data_bus_0_MC_BUFOE_OUT
    );
  N_PZ_562_672 : X_BUF
    port map (
      I => N_PZ_562_MC_Q,
      O => N_PZ_562
    );
  N_PZ_562_MC_REG : X_BUF
    port map (
      I => N_PZ_562_MC_D,
      O => N_PZ_562_MC_Q
    );
  N_PZ_562_MC_D1_673 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => N_PZ_562_MC_D1
    );
  N_PZ_562_MC_D2_PT_0_674 : X_AND2
    port map (
      I0 => NlwInverterSignal_N_PZ_562_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_N_PZ_562_MC_D2_PT_0_IN1,
      O => N_PZ_562_MC_D2_PT_0
    );
  N_PZ_562_MC_D2_PT_1_675 : X_AND2
    port map (
      I0 => NlwInverterSignal_N_PZ_562_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_N_PZ_562_MC_D2_PT_1_IN1,
      O => N_PZ_562_MC_D2_PT_1
    );
  N_PZ_562_MC_D2_PT_2_676 : X_AND4
    port map (
      I0 => NlwInverterSignal_N_PZ_562_MC_D2_PT_2_IN0,
      I1 => NlwInverterSignal_N_PZ_562_MC_D2_PT_2_IN1,
      I2 => NlwInverterSignal_N_PZ_562_MC_D2_PT_2_IN2,
      I3 => NlwInverterSignal_N_PZ_562_MC_D2_PT_2_IN3,
      O => N_PZ_562_MC_D2_PT_2
    );
  N_PZ_562_MC_D2_677 : X_OR3
    port map (
      I0 => N_PZ_562_MC_D2_PT_0,
      I1 => N_PZ_562_MC_D2_PT_1,
      I2 => N_PZ_562_MC_D2_PT_2,
      O => N_PZ_562_MC_D2
    );
  N_PZ_562_MC_XOR : X_XOR2
    port map (
      I0 => N_PZ_562_MC_D1,
      I1 => N_PZ_562_MC_D2,
      O => N_PZ_562_MC_D
    );
  uc_ctrl_stat_en_678 : X_BUF
    port map (
      I => uc_ctrl_stat_en_MC_Q,
      O => uc_ctrl_stat_en
    );
  uc_ctrl_stat_en_MC_R_OR_PRLD_679 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_stat_en_MC_R_OR_PRLD
    );
  uc_ctrl_stat_en_MC_REG : X_FF
    port map (
      I => uc_ctrl_stat_en_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_stat_en_MC_R_OR_PRLD,
      O => uc_ctrl_stat_en_MC_Q
    );
  uc_ctrl_stat_en_MC_D1_PT_0_680 : X_AND16
    port map (
      I0 => addr_bus_0_II_UIM,
      I1 => addr_bus_1_II_UIM,
      I2 => NlwInverterSignal_uc_ctrl_stat_en_MC_D1_PT_0_IN2,
      I3 => NlwInverterSignal_uc_ctrl_stat_en_MC_D1_PT_0_IN3,
      I4 => addr_bus_4_II_UIM,
      I5 => NlwInverterSignal_uc_ctrl_stat_en_MC_D1_PT_0_IN5,
      I6 => NlwInverterSignal_uc_ctrl_stat_en_MC_D1_PT_0_IN6,
      I7 => addr_bus_7_II_UIM,
      I8 => uc_ctrl_address_match,
      I9 => VCC,
      I10 => VCC,
      I11 => VCC,
      I12 => VCC,
      I13 => VCC,
      I14 => VCC,
      I15 => VCC,
      O => uc_ctrl_stat_en_MC_D1_PT_0
    );
  uc_ctrl_stat_en_MC_D1_681 : X_OR2
    port map (
      I0 => uc_ctrl_stat_en_MC_D1_PT_0,
      I1 => uc_ctrl_stat_en_MC_D1_PT_0,
      O => uc_ctrl_stat_en_MC_D1
    );
  uc_ctrl_stat_en_MC_D2_682 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_stat_en_MC_D2
    );
  uc_ctrl_stat_en_MC_XOR : X_XOR2
    port map (
      I0 => uc_ctrl_stat_en_MC_D1,
      I1 => uc_ctrl_stat_en_MC_D2,
      O => uc_ctrl_stat_en_MC_D
    );
  i2c_ctrl_mbdr_i2c_0_Q : X_BUF
    port map (
      I => i2c_ctrl_mbdr_i2c_0_MC_Q,
      O => i2c_ctrl_mbdr_i2c(0)
    );
  i2c_ctrl_mbdr_i2c_0_MC_R_OR_PRLD_683 : X_OR2
    port map (
      I0 => FOOBAR8_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_mbdr_i2c_0_MC_R_OR_PRLD
    );
  i2c_ctrl_mbdr_i2c_0_MC_REG : X_FF
    port map (
      I => i2c_ctrl_mbdr_i2c_0_MC_D,
      CE => i2c_ctrl_mbdr_i2c_0_MC_CE,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_mbdr_i2c_0_MC_R_OR_PRLD,
      O => i2c_ctrl_mbdr_i2c_0_MC_Q
    );
  i2c_ctrl_mbdr_i2c_0_MC_CE_PT_0_684 : X_AND2
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => i2c_ctrl_state_ffd1,
      O => i2c_ctrl_mbdr_i2c_0_MC_CE_PT_0
    );
  i2c_ctrl_mbdr_i2c_0_MC_CE_685 : X_OR2
    port map (
      I0 => i2c_ctrl_mbdr_i2c_0_MC_CE_PT_0,
      I1 => i2c_ctrl_mbdr_i2c_0_MC_CE_PT_0,
      O => i2c_ctrl_mbdr_i2c_0_MC_CE
    );
  i2c_ctrl_mbdr_i2c_0_MC_D1_686 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_mbdr_i2c_0_MC_D1
    );
  i2c_ctrl_mbdr_i2c_0_MC_D2_PT_0_687 : X_AND2
    port map (
      I0 => i2c_ctrl_shift_reg(0),
      I1 => i2c_ctrl_shift_reg(0),
      O => i2c_ctrl_mbdr_i2c_0_MC_D2_PT_0
    );
  i2c_ctrl_mbdr_i2c_0_MC_D2_688 : X_OR2
    port map (
      I0 => i2c_ctrl_mbdr_i2c_0_MC_D2_PT_0,
      I1 => i2c_ctrl_mbdr_i2c_0_MC_D2_PT_0,
      O => i2c_ctrl_mbdr_i2c_0_MC_D2
    );
  i2c_ctrl_mbdr_i2c_0_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_mbdr_i2c_0_MC_D1,
      I1 => i2c_ctrl_mbdr_i2c_0_MC_D2,
      O => i2c_ctrl_mbdr_i2c_0_MC_D
    );
  i2c_ctrl_rxak_689 : X_BUF
    port map (
      I => i2c_ctrl_rxak_MC_Q,
      O => i2c_ctrl_rxak
    );
  i2c_ctrl_rxak_MC_REG : X_FF
    port map (
      I => i2c_ctrl_rxak_MC_D,
      CE => i2c_ctrl_rxak_MC_CE,
      CLK => scl_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => PRLD,
      O => i2c_ctrl_rxak_MC_Q
    );
  i2c_ctrl_rxak_MC_CE_PT_0_690 : X_AND2
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => NlwInverterSignal_i2c_ctrl_rxak_MC_CE_PT_0_IN1,
      O => i2c_ctrl_rxak_MC_CE_PT_0
    );
  i2c_ctrl_rxak_MC_CE_691 : X_OR2
    port map (
      I0 => i2c_ctrl_rxak_MC_CE_PT_0,
      I1 => i2c_ctrl_rxak_MC_CE_PT_0,
      O => i2c_ctrl_rxak_MC_CE
    );
  i2c_ctrl_rxak_MC_D1_692 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_rxak_MC_D1
    );
  i2c_ctrl_rxak_MC_D2_PT_0_693 : X_AND2
    port map (
      I0 => i2c_ctrl_sda_in,
      I1 => i2c_ctrl_sda_in,
      O => i2c_ctrl_rxak_MC_D2_PT_0
    );
  i2c_ctrl_rxak_MC_D2_694 : X_OR2
    port map (
      I0 => i2c_ctrl_rxak_MC_D2_PT_0,
      I1 => i2c_ctrl_rxak_MC_D2_PT_0,
      O => i2c_ctrl_rxak_MC_D2
    );
  i2c_ctrl_rxak_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_rxak_MC_D1,
      I1 => i2c_ctrl_rxak_MC_D2,
      O => i2c_ctrl_rxak_MC_D
    );
  uc_ctrl_madr_0_Q : X_BUF
    port map (
      I => uc_ctrl_madr_0_MC_Q,
      O => uc_ctrl_madr(0)
    );
  uc_ctrl_madr_0_MC_R_OR_PRLD_695 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_madr_0_MC_R_OR_PRLD
    );
  uc_ctrl_madr_0_MC_REG : X_FF
    port map (
      I => uc_ctrl_madr_0_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_madr_0_MC_R_OR_PRLD,
      O => uc_ctrl_madr_0_MC_Q
    );
  uc_ctrl_madr_0_MC_D1_PT_0_696 : X_AND2
    port map (
      I0 => uc_ctrl_madr(0),
      I1 => NlwInverterSignal_uc_ctrl_madr_0_MC_D1_PT_0_IN1,
      O => uc_ctrl_madr_0_MC_D1_PT_0
    );
  uc_ctrl_madr_0_MC_D1_697 : X_OR2
    port map (
      I0 => uc_ctrl_madr_0_MC_D1_PT_0,
      I1 => uc_ctrl_madr_0_MC_D1_PT_0,
      O => uc_ctrl_madr_0_MC_D1
    );
  uc_ctrl_madr_0_MC_D2_698 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_madr_0_MC_D2
    );
  uc_ctrl_madr_0_MC_XOR : X_XOR2
    port map (
      I0 => uc_ctrl_madr_0_MC_D1,
      I1 => uc_ctrl_madr_0_MC_D2,
      O => uc_ctrl_madr_0_MC_D
    );
  data_bus_1_Q : X_TRI
    port map (
      I => data_bus_1_MC_Q,
      CTL => data_bus_1_MC_OE,
      O => data_bus(1)
    );
  data_bus_1_MC_Q_699 : X_BUF
    port map (
      I => data_bus_1_MC_Q_tsim_ireg_Q,
      O => data_bus_1_MC_Q
    );
  data_bus_1_MC_R_OR_PRLD_700 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => data_bus_1_MC_R_OR_PRLD
    );
  data_bus_1_MC_REG : X_FF
    port map (
      I => data_bus_1_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => data_bus_1_MC_R_OR_PRLD,
      O => data_bus_1_MC_Q_tsim_ireg_Q
    );
  data_bus_1_MC_D1_701 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => data_bus_1_MC_D1
    );
  data_bus_1_MC_D2_PT_0_702 : X_AND2
    port map (
      I0 => N_PZ_562,
      I1 => data_bus_1_MC_UIM,
      O => data_bus_1_MC_D2_PT_0
    );
  data_bus_1_MC_D2_PT_1_703 : X_AND5
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => uc_ctrl_data_en,
      I4 => i2c_ctrl_mbdr_i2c(1),
      O => data_bus_1_MC_D2_PT_1
    );
  data_bus_1_MC_D2_PT_2_704 : X_AND6
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => NlwInverterSignal_data_bus_1_MC_D2_PT_2_IN3,
      I4 => uc_ctrl_stat_en,
      I5 => i2c_ctrl_mif,
      O => data_bus_1_MC_D2_PT_2
    );
  data_bus_1_MC_D2_PT_3_705 : X_AND8
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => NlwInverterSignal_data_bus_1_MC_D2_PT_3_IN3,
      I4 => NlwInverterSignal_data_bus_1_MC_D2_PT_3_IN4,
      I5 => NlwInverterSignal_data_bus_1_MC_D2_PT_3_IN5,
      I6 => uc_ctrl_addr_en,
      I7 => uc_ctrl_madr(1),
      O => data_bus_1_MC_D2_PT_3
    );
  data_bus_1_MC_D2_706 : X_OR4
    port map (
      I0 => data_bus_1_MC_D2_PT_0,
      I1 => data_bus_1_MC_D2_PT_1,
      I2 => data_bus_1_MC_D2_PT_2,
      I3 => data_bus_1_MC_D2_PT_3,
      O => data_bus_1_MC_D2
    );
  data_bus_1_MC_XOR : X_XOR2
    port map (
      I0 => data_bus_1_MC_D1,
      I1 => data_bus_1_MC_D2,
      O => data_bus_1_MC_D
    );
  data_bus_1_MC_UIM_707 : X_BUF
    port map (
      I => data_bus_1_MC_Q_tsim_ireg_Q,
      O => data_bus_1_MC_UIM
    );
  data_bus_1_MC_OE_708 : X_BUF
    port map (
      I => data_bus_1_MC_BUFOE_OUT,
      O => data_bus_1_MC_OE
    );
  data_bus_1_MC_BUFOE : X_BUF
    port map (
      I => FOOBAR2_ctinst_7,
      O => data_bus_1_MC_BUFOE_OUT
    );
  i2c_ctrl_mbdr_i2c_1_Q : X_BUF
    port map (
      I => i2c_ctrl_mbdr_i2c_1_MC_Q,
      O => i2c_ctrl_mbdr_i2c(1)
    );
  i2c_ctrl_mbdr_i2c_1_MC_R_OR_PRLD_709 : X_OR2
    port map (
      I0 => FOOBAR8_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_mbdr_i2c_1_MC_R_OR_PRLD
    );
  i2c_ctrl_mbdr_i2c_1_MC_REG : X_FF
    port map (
      I => i2c_ctrl_mbdr_i2c_1_MC_D,
      CE => i2c_ctrl_mbdr_i2c_1_MC_CE,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_mbdr_i2c_1_MC_R_OR_PRLD,
      O => i2c_ctrl_mbdr_i2c_1_MC_Q
    );
  i2c_ctrl_mbdr_i2c_1_MC_CE_PT_0_710 : X_AND2
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => i2c_ctrl_state_ffd1,
      O => i2c_ctrl_mbdr_i2c_1_MC_CE_PT_0
    );
  i2c_ctrl_mbdr_i2c_1_MC_CE_711 : X_OR2
    port map (
      I0 => i2c_ctrl_mbdr_i2c_1_MC_CE_PT_0,
      I1 => i2c_ctrl_mbdr_i2c_1_MC_CE_PT_0,
      O => i2c_ctrl_mbdr_i2c_1_MC_CE
    );
  i2c_ctrl_mbdr_i2c_1_MC_D1_712 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_mbdr_i2c_1_MC_D1
    );
  i2c_ctrl_mbdr_i2c_1_MC_D2_PT_0_713 : X_AND2
    port map (
      I0 => i2c_ctrl_shift_reg(1),
      I1 => i2c_ctrl_shift_reg(1),
      O => i2c_ctrl_mbdr_i2c_1_MC_D2_PT_0
    );
  i2c_ctrl_mbdr_i2c_1_MC_D2_714 : X_OR2
    port map (
      I0 => i2c_ctrl_mbdr_i2c_1_MC_D2_PT_0,
      I1 => i2c_ctrl_mbdr_i2c_1_MC_D2_PT_0,
      O => i2c_ctrl_mbdr_i2c_1_MC_D2
    );
  i2c_ctrl_mbdr_i2c_1_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_mbdr_i2c_1_MC_D1,
      I1 => i2c_ctrl_mbdr_i2c_1_MC_D2,
      O => i2c_ctrl_mbdr_i2c_1_MC_D
    );
  i2c_ctrl_mif_715 : X_BUF
    port map (
      I => i2c_ctrl_mif_MC_Q,
      O => i2c_ctrl_mif
    );
  i2c_ctrl_mif_MC_R_OR_PRLD_716 : X_OR2
    port map (
      I0 => FOOBAR6_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_mif_MC_R_OR_PRLD
    );
  i2c_ctrl_mif_MC_REG : X_FF
    port map (
      I => i2c_ctrl_mif_MC_D,
      CE => i2c_ctrl_mif_MC_CE,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_mif_MC_R_OR_PRLD,
      O => i2c_ctrl_mif_MC_Q
    );
  i2c_ctrl_mif_MC_CE_PT_0_717 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_mif_MC_CE_PT_0_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_mif_MC_CE_PT_0_IN1,
      O => i2c_ctrl_mif_MC_CE_PT_0
    );
  i2c_ctrl_mif_MC_CE_718 : X_OR2
    port map (
      I0 => i2c_ctrl_mif_MC_CE_PT_0,
      I1 => i2c_ctrl_mif_MC_CE_PT_0,
      O => i2c_ctrl_mif_MC_CE
    );
  i2c_ctrl_mif_MC_D1_719 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_mif_MC_D1
    );
  i2c_ctrl_mif_MC_D2_PT_0_720 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_mif_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_mif_MC_D2_PT_0_IN1,
      O => i2c_ctrl_mif_MC_D2_PT_0
    );
  i2c_ctrl_mif_MC_D2_721 : X_OR2
    port map (
      I0 => i2c_ctrl_mif_MC_D2_PT_0,
      I1 => i2c_ctrl_mif_MC_D2_PT_0,
      O => i2c_ctrl_mif_MC_D2
    );
  i2c_ctrl_mif_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_mif_MC_D1,
      I1 => i2c_ctrl_mif_MC_D2,
      O => i2c_ctrl_mif_MC_D
    );
  uc_ctrl_mif_bit_reset_722 : X_BUF
    port map (
      I => uc_ctrl_mif_bit_reset_MC_Q,
      O => uc_ctrl_mif_bit_reset
    );
  uc_ctrl_mif_bit_reset_MC_R_OR_PRLD_723 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_mif_bit_reset_MC_R_OR_PRLD
    );
  uc_ctrl_mif_bit_reset_MC_REG : X_FF
    port map (
      I => uc_ctrl_mif_bit_reset_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_mif_bit_reset_MC_R_OR_PRLD,
      O => uc_ctrl_mif_bit_reset_MC_Q
    );
  uc_ctrl_mif_bit_reset_MC_D1_724 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_mif_bit_reset_MC_D1
    );
  uc_ctrl_mif_bit_reset_MC_D2_PT_0_725 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mif_bit_reset_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_uc_ctrl_mif_bit_reset_MC_D2_PT_0_IN1,
      O => uc_ctrl_mif_bit_reset_MC_D2_PT_0
    );
  uc_ctrl_mif_bit_reset_MC_D2_PT_1_726 : X_AND2
    port map (
      I0 => data_bus_2_II_UIM,
      I1 => NlwInverterSignal_uc_ctrl_mif_bit_reset_MC_D2_PT_1_IN1,
      O => uc_ctrl_mif_bit_reset_MC_D2_PT_1
    );
  uc_ctrl_mif_bit_reset_MC_D2_PT_2_727 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mif_bit_reset_MC_D2_PT_2_IN0,
      I1 => NlwInverterSignal_uc_ctrl_mif_bit_reset_MC_D2_PT_2_IN1,
      O => uc_ctrl_mif_bit_reset_MC_D2_PT_2
    );
  uc_ctrl_mif_bit_reset_MC_D2_PT_3_728 : X_AND4
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => uc_ctrl_stat_en,
      O => uc_ctrl_mif_bit_reset_MC_D2_PT_3
    );
  uc_ctrl_mif_bit_reset_MC_D2_729 : X_OR4
    port map (
      I0 => uc_ctrl_mif_bit_reset_MC_D2_PT_0,
      I1 => uc_ctrl_mif_bit_reset_MC_D2_PT_1,
      I2 => uc_ctrl_mif_bit_reset_MC_D2_PT_2,
      I3 => uc_ctrl_mif_bit_reset_MC_D2_PT_3,
      O => uc_ctrl_mif_bit_reset_MC_D2
    );
  uc_ctrl_mif_bit_reset_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mif_bit_reset_MC_XOR_IN0,
      I1 => uc_ctrl_mif_bit_reset_MC_D2,
      O => uc_ctrl_mif_bit_reset_MC_D
    );
  i2c_ctrl_n0171_730 : X_BUF
    port map (
      I => i2c_ctrl_n0171_MC_Q,
      O => i2c_ctrl_n0171
    );
  i2c_ctrl_n0171_MC_REG : X_BUF
    port map (
      I => i2c_ctrl_n0171_MC_D,
      O => i2c_ctrl_n0171_MC_Q
    );
  i2c_ctrl_n0171_MC_D1_PT_0_731 : X_AND3
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_n0171_MC_D1_PT_0_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_n0171_MC_D1_PT_0_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_n0171_MC_D1_PT_0_IN2,
      O => i2c_ctrl_n0171_MC_D1_PT_0
    );
  i2c_ctrl_n0171_MC_D1_732 : X_OR2
    port map (
      I0 => i2c_ctrl_n0171_MC_D1_PT_0,
      I1 => i2c_ctrl_n0171_MC_D1_PT_0,
      O => i2c_ctrl_n0171_MC_D1
    );
  i2c_ctrl_n0171_MC_D2_PT_0_733 : X_AND6
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_n0171_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_n0171_MC_D2_PT_0_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_n0171_MC_D2_PT_0_IN2,
      I3 => NlwInverterSignal_i2c_ctrl_n0171_MC_D2_PT_0_IN3,
      I4 => NlwInverterSignal_i2c_ctrl_n0171_MC_D2_PT_0_IN4,
      I5 => i2c_ctrl_maas,
      O => i2c_ctrl_n0171_MC_D2_PT_0
    );
  i2c_ctrl_n0171_MC_D2_734 : X_OR2
    port map (
      I0 => i2c_ctrl_n0171_MC_D2_PT_0,
      I1 => i2c_ctrl_n0171_MC_D2_PT_0,
      O => i2c_ctrl_n0171_MC_D2
    );
  i2c_ctrl_n0171_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_n0171_MC_D1,
      I1 => i2c_ctrl_n0171_MC_D2,
      O => i2c_ctrl_n0171_MC_D
    );
  mcf_MC_Q_735 : X_BUF
    port map (
      I => mcf_MC_Q_tsim_ireg_Q,
      O => mcf_MC_Q
    );
  mcf_MC_R_OR_PRLD_736 : X_OR2
    port map (
      I0 => FOOBAR9_ctinst_5,
      I1 => PRLD,
      O => mcf_MC_R_OR_PRLD
    );
  mcf_MC_REG : X_FF
    port map (
      I => mcf_MC_D,
      CE => VCC,
      CLK => scl_II_FCLK_tsimcreated_inv_Q,
      SET => GND,
      RST => mcf_MC_R_OR_PRLD,
      O => mcf_MC_Q_tsim_ireg_Q
    );
  mcf_MC_D1_PT_0_737 : X_AND4
    port map (
      I0 => i2c_ctrl_bit_cnt(0),
      I1 => i2c_ctrl_bit_cnt(1),
      I2 => i2c_ctrl_bit_cnt(2),
      I3 => NlwInverterSignal_mcf_MC_D1_PT_0_IN3,
      O => mcf_MC_D1_PT_0
    );
  mcf_MC_D1_738 : X_OR2
    port map (
      I0 => mcf_MC_D1_PT_0,
      I1 => mcf_MC_D1_PT_0,
      O => mcf_MC_D1
    );
  mcf_MC_D2_739 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => mcf_MC_D2
    );
  mcf_MC_XOR : X_XOR2
    port map (
      I0 => mcf_MC_D1,
      I1 => mcf_MC_D2,
      O => mcf_MC_D
    );
  mcf_MC_UIM_740 : X_BUF
    port map (
      I => mcf_MC_Q_tsim_ireg_Q,
      O => mcf_MC_UIM
    );
  i2c_ctrl_mal_741 : X_BUF
    port map (
      I => i2c_ctrl_mal_MC_Q,
      O => i2c_ctrl_mal
    );
  i2c_ctrl_mal_MC_R_OR_PRLD_742 : X_OR2
    port map (
      I0 => FOOBAR6_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_mal_MC_R_OR_PRLD
    );
  i2c_ctrl_mal_MC_REG : X_FF
    port map (
      I => i2c_ctrl_mal_MC_D,
      CE => i2c_ctrl_mal_MC_CE,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_mal_MC_R_OR_PRLD,
      O => i2c_ctrl_mal_MC_Q
    );
  i2c_ctrl_mal_MC_CE_PT_0_743 : X_AND2
    port map (
      I0 => i2c_ctrl_n0170,
      I1 => i2c_ctrl_n0170,
      O => i2c_ctrl_mal_MC_CE_PT_0
    );
  i2c_ctrl_mal_MC_CE_744 : X_OR2
    port map (
      I0 => i2c_ctrl_mal_MC_CE_PT_0,
      I1 => i2c_ctrl_mal_MC_CE_PT_0,
      O => i2c_ctrl_mal_MC_CE
    );
  i2c_ctrl_mal_MC_D1_745 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_mal_MC_D1
    );
  i2c_ctrl_mal_MC_D2_PT_0_746 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_mal_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_i2c_ctrl_mal_MC_D2_PT_0_IN1,
      O => i2c_ctrl_mal_MC_D2_PT_0
    );
  i2c_ctrl_mal_MC_D2_747 : X_OR2
    port map (
      I0 => i2c_ctrl_mal_MC_D2_PT_0,
      I1 => i2c_ctrl_mal_MC_D2_PT_0,
      O => i2c_ctrl_mal_MC_D2
    );
  i2c_ctrl_mal_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_mal_MC_D1,
      I1 => i2c_ctrl_mal_MC_D2,
      O => i2c_ctrl_mal_MC_D
    );
  uc_ctrl_mal_bit_reset_748 : X_BUF
    port map (
      I => uc_ctrl_mal_bit_reset_MC_Q,
      O => uc_ctrl_mal_bit_reset
    );
  uc_ctrl_mal_bit_reset_MC_R_OR_PRLD_749 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_mal_bit_reset_MC_R_OR_PRLD
    );
  uc_ctrl_mal_bit_reset_MC_REG : X_FF
    port map (
      I => uc_ctrl_mal_bit_reset_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_mal_bit_reset_MC_R_OR_PRLD,
      O => uc_ctrl_mal_bit_reset_MC_Q
    );
  uc_ctrl_mal_bit_reset_MC_D1_750 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_mal_bit_reset_MC_D1
    );
  uc_ctrl_mal_bit_reset_MC_D2_PT_0_751 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mal_bit_reset_MC_D2_PT_0_IN0,
      I1 => NlwInverterSignal_uc_ctrl_mal_bit_reset_MC_D2_PT_0_IN1,
      O => uc_ctrl_mal_bit_reset_MC_D2_PT_0
    );
  uc_ctrl_mal_bit_reset_MC_D2_PT_1_752 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mal_bit_reset_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_uc_ctrl_mal_bit_reset_MC_D2_PT_1_IN1,
      O => uc_ctrl_mal_bit_reset_MC_D2_PT_1
    );
  uc_ctrl_mal_bit_reset_MC_D2_PT_2_753 : X_AND2
    port map (
      I0 => data_bus_4_II_UIM,
      I1 => NlwInverterSignal_uc_ctrl_mal_bit_reset_MC_D2_PT_2_IN1,
      O => uc_ctrl_mal_bit_reset_MC_D2_PT_2
    );
  uc_ctrl_mal_bit_reset_MC_D2_PT_3_754 : X_AND4
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => uc_ctrl_stat_en,
      O => uc_ctrl_mal_bit_reset_MC_D2_PT_3
    );
  uc_ctrl_mal_bit_reset_MC_D2_755 : X_OR4
    port map (
      I0 => uc_ctrl_mal_bit_reset_MC_D2_PT_0,
      I1 => uc_ctrl_mal_bit_reset_MC_D2_PT_1,
      I2 => uc_ctrl_mal_bit_reset_MC_D2_PT_2,
      I3 => uc_ctrl_mal_bit_reset_MC_D2_PT_3,
      O => uc_ctrl_mal_bit_reset_MC_D2
    );
  uc_ctrl_mal_bit_reset_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mal_bit_reset_MC_XOR_IN0,
      I1 => uc_ctrl_mal_bit_reset_MC_D2,
      O => uc_ctrl_mal_bit_reset_MC_D
    );
  i2c_ctrl_n0170_756 : X_BUF
    port map (
      I => i2c_ctrl_n0170_MC_Q,
      O => i2c_ctrl_n0170
    );
  i2c_ctrl_n0170_MC_REG : X_BUF
    port map (
      I => i2c_ctrl_n0170_MC_D,
      O => i2c_ctrl_n0170_MC_Q
    );
  i2c_ctrl_n0170_MC_D1_757 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_n0170_MC_D1
    );
  i2c_ctrl_n0170_MC_D2_PT_0_758 : X_AND2
    port map (
      I0 => uc_ctrl_mal_bit_reset,
      I1 => uc_ctrl_mal_bit_reset,
      O => i2c_ctrl_n0170_MC_D2_PT_0
    );
  i2c_ctrl_n0170_MC_D2_PT_1_759 : X_AND2
    port map (
      I0 => i2c_ctrl_master_slave,
      I1 => i2c_ctrl_arb_lost,
      O => i2c_ctrl_n0170_MC_D2_PT_1
    );
  i2c_ctrl_n0170_MC_D2_PT_2_760 : X_AND2
    port map (
      I0 => NlwInverterSignal_i2c_ctrl_n0170_MC_D2_PT_2_IN0,
      I1 => uc_ctrl_rsta,
      O => i2c_ctrl_n0170_MC_D2_PT_2
    );
  i2c_ctrl_n0170_MC_D2_PT_3_761 : X_AND3
    port map (
      I0 => i2c_ctrl_master_slave,
      I1 => i2c_ctrl_gen_start,
      I2 => i2c_ctrl_bus_busy_d1,
      O => i2c_ctrl_n0170_MC_D2_PT_3
    );
  i2c_ctrl_n0170_MC_D2_PT_4_762 : X_AND4
    port map (
      I0 => i2c_ctrl_master_slave,
      I1 => NlwInverterSignal_i2c_ctrl_n0170_MC_D2_PT_4_IN1,
      I2 => NlwInverterSignal_i2c_ctrl_n0170_MC_D2_PT_4_IN2,
      I3 => i2c_ctrl_detect_stop,
      O => i2c_ctrl_n0170_MC_D2_PT_4
    );
  i2c_ctrl_n0170_MC_D2_763 : X_OR5
    port map (
      I0 => i2c_ctrl_n0170_MC_D2_PT_0,
      I1 => i2c_ctrl_n0170_MC_D2_PT_1,
      I2 => i2c_ctrl_n0170_MC_D2_PT_2,
      I3 => i2c_ctrl_n0170_MC_D2_PT_3,
      I4 => i2c_ctrl_n0170_MC_D2_PT_4,
      O => i2c_ctrl_n0170_MC_D2
    );
  i2c_ctrl_n0170_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_n0170_MC_D1,
      I1 => i2c_ctrl_n0170_MC_D2,
      O => i2c_ctrl_n0170_MC_D
    );
  i2c_ctrl_bus_busy_d1_764 : X_BUF
    port map (
      I => i2c_ctrl_bus_busy_d1_MC_Q,
      O => i2c_ctrl_bus_busy_d1
    );
  i2c_ctrl_bus_busy_d1_MC_R_OR_PRLD_765 : X_OR2
    port map (
      I0 => FOOBAR3_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_bus_busy_d1_MC_R_OR_PRLD
    );
  i2c_ctrl_bus_busy_d1_MC_REG : X_FF
    port map (
      I => i2c_ctrl_bus_busy_d1_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_bus_busy_d1_MC_R_OR_PRLD,
      O => i2c_ctrl_bus_busy_d1_MC_Q
    );
  i2c_ctrl_bus_busy_d1_MC_D1_PT_0_766 : X_AND2
    port map (
      I0 => i2c_ctrl_bus_busy,
      I1 => i2c_ctrl_bus_busy,
      O => i2c_ctrl_bus_busy_d1_MC_D1_PT_0
    );
  i2c_ctrl_bus_busy_d1_MC_D1_767 : X_OR2
    port map (
      I0 => i2c_ctrl_bus_busy_d1_MC_D1_PT_0,
      I1 => i2c_ctrl_bus_busy_d1_MC_D1_PT_0,
      O => i2c_ctrl_bus_busy_d1_MC_D1
    );
  i2c_ctrl_bus_busy_d1_MC_D2_768 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_bus_busy_d1_MC_D2
    );
  i2c_ctrl_bus_busy_d1_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_bus_busy_d1_MC_D1,
      I1 => i2c_ctrl_bus_busy_d1_MC_D2,
      O => i2c_ctrl_bus_busy_d1_MC_D
    );
  data_bus_2_Q : X_TRI
    port map (
      I => data_bus_2_MC_Q,
      CTL => data_bus_2_MC_OE,
      O => data_bus(2)
    );
  data_bus_2_MC_Q_769 : X_BUF
    port map (
      I => data_bus_2_MC_Q_tsim_ireg_Q,
      O => data_bus_2_MC_Q
    );
  data_bus_2_MC_R_OR_PRLD_770 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => data_bus_2_MC_R_OR_PRLD
    );
  data_bus_2_MC_REG : X_FF
    port map (
      I => data_bus_2_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => data_bus_2_MC_R_OR_PRLD,
      O => data_bus_2_MC_Q_tsim_ireg_Q
    );
  data_bus_2_MC_D1_771 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => data_bus_2_MC_D1
    );
  data_bus_2_MC_D2_PT_0_772 : X_AND2
    port map (
      I0 => N_PZ_562,
      I1 => NlwInverterSignal_data_bus_2_MC_D2_PT_0_IN1,
      O => data_bus_2_MC_D2_PT_0
    );
  data_bus_2_MC_D2_PT_1_773 : X_AND5
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => uc_ctrl_data_en,
      I4 => NlwInverterSignal_data_bus_2_MC_D2_PT_1_IN4,
      O => data_bus_2_MC_D2_PT_1
    );
  data_bus_2_MC_D2_PT_2_774 : X_AND6
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => NlwInverterSignal_data_bus_2_MC_D2_PT_2_IN3,
      I4 => uc_ctrl_stat_en,
      I5 => NlwInverterSignal_data_bus_2_MC_D2_PT_2_IN5,
      O => data_bus_2_MC_D2_PT_2
    );
  data_bus_2_MC_D2_PT_3_775 : X_AND7
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => NlwInverterSignal_data_bus_2_MC_D2_PT_3_IN3,
      I4 => NlwInverterSignal_data_bus_2_MC_D2_PT_3_IN4,
      I5 => uc_ctrl_cntrl_en,
      I6 => NlwInverterSignal_data_bus_2_MC_D2_PT_3_IN6,
      O => data_bus_2_MC_D2_PT_3
    );
  data_bus_2_MC_D2_PT_4_776 : X_AND8
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => NlwInverterSignal_data_bus_2_MC_D2_PT_4_IN3,
      I4 => NlwInverterSignal_data_bus_2_MC_D2_PT_4_IN4,
      I5 => NlwInverterSignal_data_bus_2_MC_D2_PT_4_IN5,
      I6 => uc_ctrl_addr_en,
      I7 => NlwInverterSignal_data_bus_2_MC_D2_PT_4_IN7,
      O => data_bus_2_MC_D2_PT_4
    );
  data_bus_2_MC_D2_777 : X_OR5
    port map (
      I0 => data_bus_2_MC_D2_PT_0,
      I1 => data_bus_2_MC_D2_PT_1,
      I2 => data_bus_2_MC_D2_PT_2,
      I3 => data_bus_2_MC_D2_PT_3,
      I4 => data_bus_2_MC_D2_PT_4,
      O => data_bus_2_MC_D2
    );
  data_bus_2_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_data_bus_2_MC_XOR_IN0,
      I1 => data_bus_2_MC_D2,
      O => data_bus_2_MC_D
    );
  data_bus_2_MC_UIM_778 : X_BUF
    port map (
      I => data_bus_2_MC_Q_tsim_ireg_Q,
      O => data_bus_2_MC_UIM
    );
  data_bus_2_MC_OE_779 : X_BUF
    port map (
      I => data_bus_2_MC_BUFOE_OUT,
      O => data_bus_2_MC_OE
    );
  data_bus_2_MC_BUFOE : X_BUF
    port map (
      I => FOOBAR2_ctinst_7,
      O => data_bus_2_MC_BUFOE_OUT
    );
  i2c_ctrl_mbdr_i2c_2_Q : X_BUF
    port map (
      I => i2c_ctrl_mbdr_i2c_2_MC_Q,
      O => i2c_ctrl_mbdr_i2c(2)
    );
  i2c_ctrl_mbdr_i2c_2_MC_R_OR_PRLD_780 : X_OR2
    port map (
      I0 => FOOBAR8_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_mbdr_i2c_2_MC_R_OR_PRLD
    );
  i2c_ctrl_mbdr_i2c_2_MC_REG : X_FF
    port map (
      I => i2c_ctrl_mbdr_i2c_2_MC_D,
      CE => i2c_ctrl_mbdr_i2c_2_MC_CE,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_mbdr_i2c_2_MC_R_OR_PRLD,
      O => i2c_ctrl_mbdr_i2c_2_MC_Q
    );
  i2c_ctrl_mbdr_i2c_2_MC_CE_PT_0_781 : X_AND2
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => i2c_ctrl_state_ffd1,
      O => i2c_ctrl_mbdr_i2c_2_MC_CE_PT_0
    );
  i2c_ctrl_mbdr_i2c_2_MC_CE_782 : X_OR2
    port map (
      I0 => i2c_ctrl_mbdr_i2c_2_MC_CE_PT_0,
      I1 => i2c_ctrl_mbdr_i2c_2_MC_CE_PT_0,
      O => i2c_ctrl_mbdr_i2c_2_MC_CE
    );
  i2c_ctrl_mbdr_i2c_2_MC_D1_783 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_mbdr_i2c_2_MC_D1
    );
  i2c_ctrl_mbdr_i2c_2_MC_D2_PT_0_784 : X_AND2
    port map (
      I0 => i2c_ctrl_shift_reg(2),
      I1 => i2c_ctrl_shift_reg(2),
      O => i2c_ctrl_mbdr_i2c_2_MC_D2_PT_0
    );
  i2c_ctrl_mbdr_i2c_2_MC_D2_785 : X_OR2
    port map (
      I0 => i2c_ctrl_mbdr_i2c_2_MC_D2_PT_0,
      I1 => i2c_ctrl_mbdr_i2c_2_MC_D2_PT_0,
      O => i2c_ctrl_mbdr_i2c_2_MC_D2
    );
  i2c_ctrl_mbdr_i2c_2_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_mbdr_i2c_2_MC_D1,
      I1 => i2c_ctrl_mbdr_i2c_2_MC_D2,
      O => i2c_ctrl_mbdr_i2c_2_MC_D
    );
  i2c_ctrl_srw_786 : X_BUF
    port map (
      I => i2c_ctrl_srw_MC_Q,
      O => i2c_ctrl_srw
    );
  i2c_ctrl_srw_MC_R_OR_PRLD_787 : X_OR2
    port map (
      I0 => FOOBAR8_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_srw_MC_R_OR_PRLD
    );
  i2c_ctrl_srw_MC_REG : X_FF
    port map (
      I => i2c_ctrl_srw_MC_D,
      CE => i2c_ctrl_srw_MC_CE,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_srw_MC_R_OR_PRLD,
      O => i2c_ctrl_srw_MC_Q
    );
  i2c_ctrl_srw_MC_CE_PT_0_788 : X_AND3
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => NlwInverterSignal_i2c_ctrl_srw_MC_CE_PT_0_IN1,
      I2 => i2c_ctrl_state_ffd2,
      O => i2c_ctrl_srw_MC_CE_PT_0
    );
  i2c_ctrl_srw_MC_CE_789 : X_OR2
    port map (
      I0 => i2c_ctrl_srw_MC_CE_PT_0,
      I1 => i2c_ctrl_srw_MC_CE_PT_0,
      O => i2c_ctrl_srw_MC_CE
    );
  i2c_ctrl_srw_MC_D1_790 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_srw_MC_D1
    );
  i2c_ctrl_srw_MC_D2_PT_0_791 : X_AND2
    port map (
      I0 => i2c_ctrl_i2c_header(0),
      I1 => i2c_ctrl_i2c_header(0),
      O => i2c_ctrl_srw_MC_D2_PT_0
    );
  i2c_ctrl_srw_MC_D2_792 : X_OR2
    port map (
      I0 => i2c_ctrl_srw_MC_D2_PT_0,
      I1 => i2c_ctrl_srw_MC_D2_PT_0,
      O => i2c_ctrl_srw_MC_D2
    );
  i2c_ctrl_srw_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_srw_MC_D1,
      I1 => i2c_ctrl_srw_MC_D2,
      O => i2c_ctrl_srw_MC_D
    );
  data_bus_3_Q : X_TRI
    port map (
      I => data_bus_3_MC_Q,
      CTL => data_bus_3_MC_OE,
      O => data_bus(3)
    );
  data_bus_3_MC_Q_793 : X_BUF
    port map (
      I => data_bus_3_MC_Q_tsim_ireg_Q,
      O => data_bus_3_MC_Q
    );
  data_bus_3_MC_R_OR_PRLD_794 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => data_bus_3_MC_R_OR_PRLD
    );
  data_bus_3_MC_REG : X_FF
    port map (
      I => data_bus_3_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => data_bus_3_MC_R_OR_PRLD,
      O => data_bus_3_MC_Q_tsim_ireg_Q
    );
  data_bus_3_MC_D1_795 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => data_bus_3_MC_D1
    );
  data_bus_3_MC_D2_PT_0_796 : X_AND2
    port map (
      I0 => N_PZ_562,
      I1 => data_bus_3_MC_UIM,
      O => data_bus_3_MC_D2_PT_0
    );
  data_bus_3_MC_D2_PT_1_797 : X_AND5
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => uc_ctrl_data_en,
      I4 => i2c_ctrl_mbdr_i2c(3),
      O => data_bus_3_MC_D2_PT_1
    );
  data_bus_3_MC_D2_PT_2_798 : X_AND7
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => NlwInverterSignal_data_bus_3_MC_D2_PT_2_IN3,
      I4 => NlwInverterSignal_data_bus_3_MC_D2_PT_2_IN4,
      I5 => uc_ctrl_cntrl_en,
      I6 => uc_ctrl_txak,
      O => data_bus_3_MC_D2_PT_2
    );
  data_bus_3_MC_D2_PT_3_799 : X_AND8
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => NlwInverterSignal_data_bus_3_MC_D2_PT_3_IN3,
      I4 => NlwInverterSignal_data_bus_3_MC_D2_PT_3_IN4,
      I5 => NlwInverterSignal_data_bus_3_MC_D2_PT_3_IN5,
      I6 => uc_ctrl_addr_en,
      I7 => uc_ctrl_madr(3),
      O => data_bus_3_MC_D2_PT_3
    );
  data_bus_3_MC_D2_800 : X_OR4
    port map (
      I0 => data_bus_3_MC_D2_PT_0,
      I1 => data_bus_3_MC_D2_PT_1,
      I2 => data_bus_3_MC_D2_PT_2,
      I3 => data_bus_3_MC_D2_PT_3,
      O => data_bus_3_MC_D2
    );
  data_bus_3_MC_XOR : X_XOR2
    port map (
      I0 => data_bus_3_MC_D1,
      I1 => data_bus_3_MC_D2,
      O => data_bus_3_MC_D
    );
  data_bus_3_MC_UIM_801 : X_BUF
    port map (
      I => data_bus_3_MC_Q_tsim_ireg_Q,
      O => data_bus_3_MC_UIM
    );
  data_bus_3_MC_OE_802 : X_BUF
    port map (
      I => data_bus_3_MC_BUFOE_OUT,
      O => data_bus_3_MC_OE
    );
  data_bus_3_MC_BUFOE : X_BUF
    port map (
      I => FOOBAR2_ctinst_7,
      O => data_bus_3_MC_BUFOE_OUT
    );
  i2c_ctrl_mbdr_i2c_3_Q : X_BUF
    port map (
      I => i2c_ctrl_mbdr_i2c_3_MC_Q,
      O => i2c_ctrl_mbdr_i2c(3)
    );
  i2c_ctrl_mbdr_i2c_3_MC_R_OR_PRLD_803 : X_OR2
    port map (
      I0 => FOOBAR8_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_mbdr_i2c_3_MC_R_OR_PRLD
    );
  i2c_ctrl_mbdr_i2c_3_MC_REG : X_FF
    port map (
      I => i2c_ctrl_mbdr_i2c_3_MC_D,
      CE => i2c_ctrl_mbdr_i2c_3_MC_CE,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_mbdr_i2c_3_MC_R_OR_PRLD,
      O => i2c_ctrl_mbdr_i2c_3_MC_Q
    );
  i2c_ctrl_mbdr_i2c_3_MC_CE_PT_0_804 : X_AND2
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => i2c_ctrl_state_ffd1,
      O => i2c_ctrl_mbdr_i2c_3_MC_CE_PT_0
    );
  i2c_ctrl_mbdr_i2c_3_MC_CE_805 : X_OR2
    port map (
      I0 => i2c_ctrl_mbdr_i2c_3_MC_CE_PT_0,
      I1 => i2c_ctrl_mbdr_i2c_3_MC_CE_PT_0,
      O => i2c_ctrl_mbdr_i2c_3_MC_CE
    );
  i2c_ctrl_mbdr_i2c_3_MC_D1_806 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_mbdr_i2c_3_MC_D1
    );
  i2c_ctrl_mbdr_i2c_3_MC_D2_PT_0_807 : X_AND2
    port map (
      I0 => i2c_ctrl_shift_reg(3),
      I1 => i2c_ctrl_shift_reg(3),
      O => i2c_ctrl_mbdr_i2c_3_MC_D2_PT_0
    );
  i2c_ctrl_mbdr_i2c_3_MC_D2_808 : X_OR2
    port map (
      I0 => i2c_ctrl_mbdr_i2c_3_MC_D2_PT_0,
      I1 => i2c_ctrl_mbdr_i2c_3_MC_D2_PT_0,
      O => i2c_ctrl_mbdr_i2c_3_MC_D2
    );
  i2c_ctrl_mbdr_i2c_3_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_mbdr_i2c_3_MC_D1,
      I1 => i2c_ctrl_mbdr_i2c_3_MC_D2,
      O => i2c_ctrl_mbdr_i2c_3_MC_D
    );
  data_bus_4_Q : X_TRI
    port map (
      I => data_bus_4_MC_Q,
      CTL => data_bus_4_MC_OE,
      O => data_bus(4)
    );
  data_bus_4_MC_Q_809 : X_BUF
    port map (
      I => data_bus_4_MC_Q_tsim_ireg_Q,
      O => data_bus_4_MC_Q
    );
  data_bus_4_MC_R_OR_PRLD_810 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => data_bus_4_MC_R_OR_PRLD
    );
  data_bus_4_MC_REG : X_FF
    port map (
      I => data_bus_4_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => data_bus_4_MC_R_OR_PRLD,
      O => data_bus_4_MC_Q_tsim_ireg_Q
    );
  data_bus_4_MC_D1_811 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => data_bus_4_MC_D1
    );
  data_bus_4_MC_D2_PT_0_812 : X_AND2
    port map (
      I0 => N_PZ_562,
      I1 => NlwInverterSignal_data_bus_4_MC_D2_PT_0_IN1,
      O => data_bus_4_MC_D2_PT_0
    );
  data_bus_4_MC_D2_PT_1_813 : X_AND5
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => uc_ctrl_data_en,
      I4 => NlwInverterSignal_data_bus_4_MC_D2_PT_1_IN4,
      O => data_bus_4_MC_D2_PT_1
    );
  data_bus_4_MC_D2_PT_2_814 : X_AND6
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => NlwInverterSignal_data_bus_4_MC_D2_PT_2_IN3,
      I4 => uc_ctrl_stat_en,
      I5 => NlwInverterSignal_data_bus_4_MC_D2_PT_2_IN5,
      O => data_bus_4_MC_D2_PT_2
    );
  data_bus_4_MC_D2_PT_3_815 : X_AND7
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => NlwInverterSignal_data_bus_4_MC_D2_PT_3_IN3,
      I4 => NlwInverterSignal_data_bus_4_MC_D2_PT_3_IN4,
      I5 => uc_ctrl_cntrl_en,
      I6 => NlwInverterSignal_data_bus_4_MC_D2_PT_3_IN6,
      O => data_bus_4_MC_D2_PT_3
    );
  data_bus_4_MC_D2_PT_4_816 : X_AND8
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => NlwInverterSignal_data_bus_4_MC_D2_PT_4_IN3,
      I4 => NlwInverterSignal_data_bus_4_MC_D2_PT_4_IN4,
      I5 => NlwInverterSignal_data_bus_4_MC_D2_PT_4_IN5,
      I6 => uc_ctrl_addr_en,
      I7 => NlwInverterSignal_data_bus_4_MC_D2_PT_4_IN7,
      O => data_bus_4_MC_D2_PT_4
    );
  data_bus_4_MC_D2_817 : X_OR5
    port map (
      I0 => data_bus_4_MC_D2_PT_0,
      I1 => data_bus_4_MC_D2_PT_1,
      I2 => data_bus_4_MC_D2_PT_2,
      I3 => data_bus_4_MC_D2_PT_3,
      I4 => data_bus_4_MC_D2_PT_4,
      O => data_bus_4_MC_D2
    );
  data_bus_4_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_data_bus_4_MC_XOR_IN0,
      I1 => data_bus_4_MC_D2,
      O => data_bus_4_MC_D
    );
  data_bus_4_MC_UIM_818 : X_BUF
    port map (
      I => data_bus_4_MC_Q_tsim_ireg_Q,
      O => data_bus_4_MC_UIM
    );
  data_bus_4_MC_OE_819 : X_BUF
    port map (
      I => data_bus_4_MC_BUFOE_OUT,
      O => data_bus_4_MC_OE
    );
  data_bus_4_MC_BUFOE : X_BUF
    port map (
      I => FOOBAR6_ctinst_7,
      O => data_bus_4_MC_BUFOE_OUT
    );
  i2c_ctrl_mbdr_i2c_4_Q : X_BUF
    port map (
      I => i2c_ctrl_mbdr_i2c_4_MC_Q,
      O => i2c_ctrl_mbdr_i2c(4)
    );
  i2c_ctrl_mbdr_i2c_4_MC_R_OR_PRLD_820 : X_OR2
    port map (
      I0 => FOOBAR8_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_mbdr_i2c_4_MC_R_OR_PRLD
    );
  i2c_ctrl_mbdr_i2c_4_MC_REG : X_FF
    port map (
      I => i2c_ctrl_mbdr_i2c_4_MC_D,
      CE => i2c_ctrl_mbdr_i2c_4_MC_CE,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_mbdr_i2c_4_MC_R_OR_PRLD,
      O => i2c_ctrl_mbdr_i2c_4_MC_Q
    );
  i2c_ctrl_mbdr_i2c_4_MC_CE_PT_0_821 : X_AND2
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => i2c_ctrl_state_ffd1,
      O => i2c_ctrl_mbdr_i2c_4_MC_CE_PT_0
    );
  i2c_ctrl_mbdr_i2c_4_MC_CE_822 : X_OR2
    port map (
      I0 => i2c_ctrl_mbdr_i2c_4_MC_CE_PT_0,
      I1 => i2c_ctrl_mbdr_i2c_4_MC_CE_PT_0,
      O => i2c_ctrl_mbdr_i2c_4_MC_CE
    );
  i2c_ctrl_mbdr_i2c_4_MC_D1_823 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_mbdr_i2c_4_MC_D1
    );
  i2c_ctrl_mbdr_i2c_4_MC_D2_PT_0_824 : X_AND2
    port map (
      I0 => i2c_ctrl_shift_reg(4),
      I1 => i2c_ctrl_shift_reg(4),
      O => i2c_ctrl_mbdr_i2c_4_MC_D2_PT_0
    );
  i2c_ctrl_mbdr_i2c_4_MC_D2_825 : X_OR2
    port map (
      I0 => i2c_ctrl_mbdr_i2c_4_MC_D2_PT_0,
      I1 => i2c_ctrl_mbdr_i2c_4_MC_D2_PT_0,
      O => i2c_ctrl_mbdr_i2c_4_MC_D2
    );
  i2c_ctrl_mbdr_i2c_4_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_mbdr_i2c_4_MC_D1,
      I1 => i2c_ctrl_mbdr_i2c_4_MC_D2,
      O => i2c_ctrl_mbdr_i2c_4_MC_D
    );
  data_bus_5_Q : X_TRI
    port map (
      I => data_bus_5_MC_Q,
      CTL => data_bus_5_MC_OE,
      O => data_bus(5)
    );
  data_bus_5_MC_Q_826 : X_BUF
    port map (
      I => data_bus_5_MC_Q_tsim_ireg_Q,
      O => data_bus_5_MC_Q
    );
  data_bus_5_MC_R_OR_PRLD_827 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => data_bus_5_MC_R_OR_PRLD
    );
  data_bus_5_MC_REG : X_FF
    port map (
      I => data_bus_5_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => data_bus_5_MC_R_OR_PRLD,
      O => data_bus_5_MC_Q_tsim_ireg_Q
    );
  data_bus_5_MC_D1_828 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => data_bus_5_MC_D1
    );
  data_bus_5_MC_D2_PT_0_829 : X_AND2
    port map (
      I0 => N_PZ_562,
      I1 => NlwInverterSignal_data_bus_5_MC_D2_PT_0_IN1,
      O => data_bus_5_MC_D2_PT_0
    );
  data_bus_5_MC_D2_PT_1_830 : X_AND5
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => uc_ctrl_data_en,
      I4 => NlwInverterSignal_data_bus_5_MC_D2_PT_1_IN4,
      O => data_bus_5_MC_D2_PT_1
    );
  data_bus_5_MC_D2_PT_2_831 : X_AND6
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => NlwInverterSignal_data_bus_5_MC_D2_PT_2_IN3,
      I4 => uc_ctrl_stat_en,
      I5 => NlwInverterSignal_data_bus_5_MC_D2_PT_2_IN5,
      O => data_bus_5_MC_D2_PT_2
    );
  data_bus_5_MC_D2_PT_3_832 : X_AND7
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => NlwInverterSignal_data_bus_5_MC_D2_PT_3_IN3,
      I4 => NlwInverterSignal_data_bus_5_MC_D2_PT_3_IN4,
      I5 => uc_ctrl_cntrl_en,
      I6 => NlwInverterSignal_data_bus_5_MC_D2_PT_3_IN6,
      O => data_bus_5_MC_D2_PT_3
    );
  data_bus_5_MC_D2_PT_4_833 : X_AND8
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => NlwInverterSignal_data_bus_5_MC_D2_PT_4_IN3,
      I4 => NlwInverterSignal_data_bus_5_MC_D2_PT_4_IN4,
      I5 => NlwInverterSignal_data_bus_5_MC_D2_PT_4_IN5,
      I6 => uc_ctrl_addr_en,
      I7 => NlwInverterSignal_data_bus_5_MC_D2_PT_4_IN7,
      O => data_bus_5_MC_D2_PT_4
    );
  data_bus_5_MC_D2_834 : X_OR5
    port map (
      I0 => data_bus_5_MC_D2_PT_0,
      I1 => data_bus_5_MC_D2_PT_1,
      I2 => data_bus_5_MC_D2_PT_2,
      I3 => data_bus_5_MC_D2_PT_3,
      I4 => data_bus_5_MC_D2_PT_4,
      O => data_bus_5_MC_D2
    );
  data_bus_5_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_data_bus_5_MC_XOR_IN0,
      I1 => data_bus_5_MC_D2,
      O => data_bus_5_MC_D
    );
  data_bus_5_MC_UIM_835 : X_BUF
    port map (
      I => data_bus_5_MC_Q_tsim_ireg_Q,
      O => data_bus_5_MC_UIM
    );
  data_bus_5_MC_OE_836 : X_BUF
    port map (
      I => data_bus_5_MC_BUFOE_OUT,
      O => data_bus_5_MC_OE
    );
  data_bus_5_MC_BUFOE : X_BUF
    port map (
      I => FOOBAR6_ctinst_7,
      O => data_bus_5_MC_BUFOE_OUT
    );
  i2c_ctrl_mbdr_i2c_5_Q : X_BUF
    port map (
      I => i2c_ctrl_mbdr_i2c_5_MC_Q,
      O => i2c_ctrl_mbdr_i2c(5)
    );
  i2c_ctrl_mbdr_i2c_5_MC_R_OR_PRLD_837 : X_OR2
    port map (
      I0 => FOOBAR8_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_mbdr_i2c_5_MC_R_OR_PRLD
    );
  i2c_ctrl_mbdr_i2c_5_MC_REG : X_FF
    port map (
      I => i2c_ctrl_mbdr_i2c_5_MC_D,
      CE => i2c_ctrl_mbdr_i2c_5_MC_CE,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_mbdr_i2c_5_MC_R_OR_PRLD,
      O => i2c_ctrl_mbdr_i2c_5_MC_Q
    );
  i2c_ctrl_mbdr_i2c_5_MC_CE_PT_0_838 : X_AND2
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => i2c_ctrl_state_ffd1,
      O => i2c_ctrl_mbdr_i2c_5_MC_CE_PT_0
    );
  i2c_ctrl_mbdr_i2c_5_MC_CE_839 : X_OR2
    port map (
      I0 => i2c_ctrl_mbdr_i2c_5_MC_CE_PT_0,
      I1 => i2c_ctrl_mbdr_i2c_5_MC_CE_PT_0,
      O => i2c_ctrl_mbdr_i2c_5_MC_CE
    );
  i2c_ctrl_mbdr_i2c_5_MC_D1_840 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_mbdr_i2c_5_MC_D1
    );
  i2c_ctrl_mbdr_i2c_5_MC_D2_PT_0_841 : X_AND2
    port map (
      I0 => i2c_ctrl_shift_reg(5),
      I1 => i2c_ctrl_shift_reg(5),
      O => i2c_ctrl_mbdr_i2c_5_MC_D2_PT_0
    );
  i2c_ctrl_mbdr_i2c_5_MC_D2_842 : X_OR2
    port map (
      I0 => i2c_ctrl_mbdr_i2c_5_MC_D2_PT_0,
      I1 => i2c_ctrl_mbdr_i2c_5_MC_D2_PT_0,
      O => i2c_ctrl_mbdr_i2c_5_MC_D2
    );
  i2c_ctrl_mbdr_i2c_5_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_mbdr_i2c_5_MC_D1,
      I1 => i2c_ctrl_mbdr_i2c_5_MC_D2,
      O => i2c_ctrl_mbdr_i2c_5_MC_D
    );
  data_bus_6_Q : X_TRI
    port map (
      I => data_bus_6_MC_Q,
      CTL => data_bus_6_MC_OE,
      O => data_bus(6)
    );
  data_bus_6_MC_Q_843 : X_BUF
    port map (
      I => data_bus_6_MC_Q_tsim_ireg_Q,
      O => data_bus_6_MC_Q
    );
  data_bus_6_MC_R_OR_PRLD_844 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => data_bus_6_MC_R_OR_PRLD
    );
  data_bus_6_MC_REG : X_FF
    port map (
      I => data_bus_6_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => data_bus_6_MC_R_OR_PRLD,
      O => data_bus_6_MC_Q_tsim_ireg_Q
    );
  data_bus_6_MC_D1_845 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => data_bus_6_MC_D1
    );
  data_bus_6_MC_D2_PT_0_846 : X_AND2
    port map (
      I0 => N_PZ_562,
      I1 => NlwInverterSignal_data_bus_6_MC_D2_PT_0_IN1,
      O => data_bus_6_MC_D2_PT_0
    );
  data_bus_6_MC_D2_PT_1_847 : X_AND5
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => uc_ctrl_data_en,
      I4 => NlwInverterSignal_data_bus_6_MC_D2_PT_1_IN4,
      O => data_bus_6_MC_D2_PT_1
    );
  data_bus_6_MC_D2_PT_2_848 : X_AND6
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => NlwInverterSignal_data_bus_6_MC_D2_PT_2_IN3,
      I4 => uc_ctrl_stat_en,
      I5 => NlwInverterSignal_data_bus_6_MC_D2_PT_2_IN5,
      O => data_bus_6_MC_D2_PT_2
    );
  data_bus_6_MC_D2_PT_3_849 : X_AND7
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => NlwInverterSignal_data_bus_6_MC_D2_PT_3_IN3,
      I4 => NlwInverterSignal_data_bus_6_MC_D2_PT_3_IN4,
      I5 => uc_ctrl_cntrl_en,
      I6 => NlwInverterSignal_data_bus_6_MC_D2_PT_3_IN6,
      O => data_bus_6_MC_D2_PT_3
    );
  data_bus_6_MC_D2_PT_4_850 : X_AND8
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => NlwInverterSignal_data_bus_6_MC_D2_PT_4_IN3,
      I4 => NlwInverterSignal_data_bus_6_MC_D2_PT_4_IN4,
      I5 => NlwInverterSignal_data_bus_6_MC_D2_PT_4_IN5,
      I6 => uc_ctrl_addr_en,
      I7 => NlwInverterSignal_data_bus_6_MC_D2_PT_4_IN7,
      O => data_bus_6_MC_D2_PT_4
    );
  data_bus_6_MC_D2_851 : X_OR5
    port map (
      I0 => data_bus_6_MC_D2_PT_0,
      I1 => data_bus_6_MC_D2_PT_1,
      I2 => data_bus_6_MC_D2_PT_2,
      I3 => data_bus_6_MC_D2_PT_3,
      I4 => data_bus_6_MC_D2_PT_4,
      O => data_bus_6_MC_D2
    );
  data_bus_6_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_data_bus_6_MC_XOR_IN0,
      I1 => data_bus_6_MC_D2,
      O => data_bus_6_MC_D
    );
  data_bus_6_MC_UIM_852 : X_BUF
    port map (
      I => data_bus_6_MC_Q_tsim_ireg_Q,
      O => data_bus_6_MC_UIM
    );
  data_bus_6_MC_OE_853 : X_BUF
    port map (
      I => data_bus_6_MC_BUFOE_OUT,
      O => data_bus_6_MC_OE
    );
  data_bus_6_MC_BUFOE : X_BUF
    port map (
      I => FOOBAR6_ctinst_7,
      O => data_bus_6_MC_BUFOE_OUT
    );
  i2c_ctrl_mbdr_i2c_6_Q : X_BUF
    port map (
      I => i2c_ctrl_mbdr_i2c_6_MC_Q,
      O => i2c_ctrl_mbdr_i2c(6)
    );
  i2c_ctrl_mbdr_i2c_6_MC_R_OR_PRLD_854 : X_OR2
    port map (
      I0 => FOOBAR8_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_mbdr_i2c_6_MC_R_OR_PRLD
    );
  i2c_ctrl_mbdr_i2c_6_MC_REG : X_FF
    port map (
      I => i2c_ctrl_mbdr_i2c_6_MC_D,
      CE => i2c_ctrl_mbdr_i2c_6_MC_CE,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_mbdr_i2c_6_MC_R_OR_PRLD,
      O => i2c_ctrl_mbdr_i2c_6_MC_Q
    );
  i2c_ctrl_mbdr_i2c_6_MC_CE_PT_0_855 : X_AND2
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => i2c_ctrl_state_ffd1,
      O => i2c_ctrl_mbdr_i2c_6_MC_CE_PT_0
    );
  i2c_ctrl_mbdr_i2c_6_MC_CE_856 : X_OR2
    port map (
      I0 => i2c_ctrl_mbdr_i2c_6_MC_CE_PT_0,
      I1 => i2c_ctrl_mbdr_i2c_6_MC_CE_PT_0,
      O => i2c_ctrl_mbdr_i2c_6_MC_CE
    );
  i2c_ctrl_mbdr_i2c_6_MC_D1_857 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_mbdr_i2c_6_MC_D1
    );
  i2c_ctrl_mbdr_i2c_6_MC_D2_PT_0_858 : X_AND2
    port map (
      I0 => i2c_ctrl_shift_reg(6),
      I1 => i2c_ctrl_shift_reg(6),
      O => i2c_ctrl_mbdr_i2c_6_MC_D2_PT_0
    );
  i2c_ctrl_mbdr_i2c_6_MC_D2_859 : X_OR2
    port map (
      I0 => i2c_ctrl_mbdr_i2c_6_MC_D2_PT_0,
      I1 => i2c_ctrl_mbdr_i2c_6_MC_D2_PT_0,
      O => i2c_ctrl_mbdr_i2c_6_MC_D2
    );
  i2c_ctrl_mbdr_i2c_6_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_mbdr_i2c_6_MC_D1,
      I1 => i2c_ctrl_mbdr_i2c_6_MC_D2,
      O => i2c_ctrl_mbdr_i2c_6_MC_D
    );
  uc_ctrl_mien_860 : X_BUF
    port map (
      I => uc_ctrl_mien_MC_Q,
      O => uc_ctrl_mien
    );
  uc_ctrl_mien_MC_R_OR_PRLD_861 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => uc_ctrl_mien_MC_R_OR_PRLD
    );
  uc_ctrl_mien_MC_REG : X_FF
    port map (
      I => uc_ctrl_mien_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => uc_ctrl_mien_MC_R_OR_PRLD,
      O => uc_ctrl_mien_MC_Q
    );
  uc_ctrl_mien_MC_D1_862 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => uc_ctrl_mien_MC_D1
    );
  uc_ctrl_mien_MC_D2_PT_0_863 : X_AND2
    port map (
      I0 => N_PZ_569,
      I1 => NlwInverterSignal_uc_ctrl_mien_MC_D2_PT_0_IN1,
      O => uc_ctrl_mien_MC_D2_PT_0
    );
  uc_ctrl_mien_MC_D2_PT_1_864 : X_AND2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mien_MC_D2_PT_1_IN0,
      I1 => NlwInverterSignal_uc_ctrl_mien_MC_D2_PT_1_IN1,
      O => uc_ctrl_mien_MC_D2_PT_1
    );
  uc_ctrl_mien_MC_D2_865 : X_OR2
    port map (
      I0 => uc_ctrl_mien_MC_D2_PT_0,
      I1 => uc_ctrl_mien_MC_D2_PT_1,
      O => uc_ctrl_mien_MC_D2
    );
  uc_ctrl_mien_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_uc_ctrl_mien_MC_XOR_IN0,
      I1 => uc_ctrl_mien_MC_D2,
      O => uc_ctrl_mien_MC_D
    );
  data_bus_7_Q : X_TRI
    port map (
      I => data_bus_7_MC_Q,
      CTL => data_bus_7_MC_OE,
      O => data_bus(7)
    );
  data_bus_7_MC_Q_866 : X_BUF
    port map (
      I => data_bus_7_MC_Q_tsim_ireg_Q,
      O => data_bus_7_MC_Q
    );
  data_bus_7_MC_R_OR_PRLD_867 : X_OR2
    port map (
      I0 => reset_II_FSR_Q,
      I1 => PRLD,
      O => data_bus_7_MC_R_OR_PRLD
    );
  data_bus_7_MC_REG : X_FF
    port map (
      I => data_bus_7_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => data_bus_7_MC_R_OR_PRLD,
      O => data_bus_7_MC_Q_tsim_ireg_Q
    );
  data_bus_7_MC_D1_868 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => data_bus_7_MC_D1
    );
  data_bus_7_MC_D2_PT_0_869 : X_AND2
    port map (
      I0 => N_PZ_562,
      I1 => NlwInverterSignal_data_bus_7_MC_D2_PT_0_IN1,
      O => data_bus_7_MC_D2_PT_0
    );
  data_bus_7_MC_D2_PT_1_870 : X_AND5
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => uc_ctrl_data_en,
      I4 => NlwInverterSignal_data_bus_7_MC_D2_PT_1_IN4,
      O => data_bus_7_MC_D2_PT_1
    );
  data_bus_7_MC_D2_PT_2_871 : X_AND6
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => NlwInverterSignal_data_bus_7_MC_D2_PT_2_IN3,
      I4 => uc_ctrl_stat_en,
      I5 => NlwInverterSignal_data_bus_7_MC_D2_PT_2_IN5,
      O => data_bus_7_MC_D2_PT_2
    );
  data_bus_7_MC_D2_PT_3_872 : X_AND7
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => NlwInverterSignal_data_bus_7_MC_D2_PT_3_IN3,
      I4 => NlwInverterSignal_data_bus_7_MC_D2_PT_3_IN4,
      I5 => uc_ctrl_cntrl_en,
      I6 => NlwInverterSignal_data_bus_7_MC_D2_PT_3_IN6,
      O => data_bus_7_MC_D2_PT_3
    );
  data_bus_7_MC_D2_PT_4_873 : X_AND8
    port map (
      I0 => r_w_II_UIM,
      I1 => uc_ctrl_prs_state_ffd2,
      I2 => uc_ctrl_prs_state_ffd1,
      I3 => NlwInverterSignal_data_bus_7_MC_D2_PT_4_IN3,
      I4 => NlwInverterSignal_data_bus_7_MC_D2_PT_4_IN4,
      I5 => NlwInverterSignal_data_bus_7_MC_D2_PT_4_IN5,
      I6 => uc_ctrl_addr_en,
      I7 => NlwInverterSignal_data_bus_7_MC_D2_PT_4_IN7,
      O => data_bus_7_MC_D2_PT_4
    );
  data_bus_7_MC_D2_874 : X_OR5
    port map (
      I0 => data_bus_7_MC_D2_PT_0,
      I1 => data_bus_7_MC_D2_PT_1,
      I2 => data_bus_7_MC_D2_PT_2,
      I3 => data_bus_7_MC_D2_PT_3,
      I4 => data_bus_7_MC_D2_PT_4,
      O => data_bus_7_MC_D2
    );
  data_bus_7_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_data_bus_7_MC_XOR_IN0,
      I1 => data_bus_7_MC_D2,
      O => data_bus_7_MC_D
    );
  data_bus_7_MC_UIM_875 : X_BUF
    port map (
      I => data_bus_7_MC_Q_tsim_ireg_Q,
      O => data_bus_7_MC_UIM
    );
  data_bus_7_MC_OE_876 : X_BUF
    port map (
      I => data_bus_7_MC_BUFOE_OUT,
      O => data_bus_7_MC_OE
    );
  data_bus_7_MC_BUFOE : X_BUF
    port map (
      I => FOOBAR6_ctinst_7,
      O => data_bus_7_MC_BUFOE_OUT
    );
  i2c_ctrl_mbdr_i2c_7_Q : X_BUF
    port map (
      I => i2c_ctrl_mbdr_i2c_7_MC_Q,
      O => i2c_ctrl_mbdr_i2c(7)
    );
  i2c_ctrl_mbdr_i2c_7_MC_R_OR_PRLD_877 : X_OR2
    port map (
      I0 => FOOBAR7_ctinst_5,
      I1 => PRLD,
      O => i2c_ctrl_mbdr_i2c_7_MC_R_OR_PRLD
    );
  i2c_ctrl_mbdr_i2c_7_MC_REG : X_FF
    port map (
      I => i2c_ctrl_mbdr_i2c_7_MC_D,
      CE => i2c_ctrl_mbdr_i2c_7_MC_CE,
      CLK => clk_II_FCLK,
      SET => GND,
      RST => i2c_ctrl_mbdr_i2c_7_MC_R_OR_PRLD,
      O => i2c_ctrl_mbdr_i2c_7_MC_Q
    );
  i2c_ctrl_mbdr_i2c_7_MC_CE_PT_0_878 : X_AND2
    port map (
      I0 => i2c_ctrl_state_ffd3,
      I1 => i2c_ctrl_state_ffd1,
      O => i2c_ctrl_mbdr_i2c_7_MC_CE_PT_0
    );
  i2c_ctrl_mbdr_i2c_7_MC_CE_879 : X_OR2
    port map (
      I0 => i2c_ctrl_mbdr_i2c_7_MC_CE_PT_0,
      I1 => i2c_ctrl_mbdr_i2c_7_MC_CE_PT_0,
      O => i2c_ctrl_mbdr_i2c_7_MC_CE
    );
  i2c_ctrl_mbdr_i2c_7_MC_D1_880 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => i2c_ctrl_mbdr_i2c_7_MC_D1
    );
  i2c_ctrl_mbdr_i2c_7_MC_D2_PT_0_881 : X_AND2
    port map (
      I0 => i2c_ctrl_shift_out,
      I1 => i2c_ctrl_shift_out,
      O => i2c_ctrl_mbdr_i2c_7_MC_D2_PT_0
    );
  i2c_ctrl_mbdr_i2c_7_MC_D2_882 : X_OR2
    port map (
      I0 => i2c_ctrl_mbdr_i2c_7_MC_D2_PT_0,
      I1 => i2c_ctrl_mbdr_i2c_7_MC_D2_PT_0,
      O => i2c_ctrl_mbdr_i2c_7_MC_D2
    );
  i2c_ctrl_mbdr_i2c_7_MC_XOR : X_XOR2
    port map (
      I0 => i2c_ctrl_mbdr_i2c_7_MC_D1,
      I1 => i2c_ctrl_mbdr_i2c_7_MC_D2,
      O => i2c_ctrl_mbdr_i2c_7_MC_D
    );
  dtack_883 : X_TRI
    port map (
      I => dtack_MC_Q,
      CTL => dtack_MC_OE,
      O => NlwRenamedSig_OI_dtack
    );
  dtack_MC_Q_884 : X_BUF
    port map (
      I => dtack_MC_Q_tsim_ireg_Q,
      O => dtack_MC_Q
    );
  dtack_MC_REG : X_FF
    port map (
      I => dtack_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => reset_II_FSR_Q,
      RST => PRLD,
      O => dtack_MC_Q_tsim_ireg_Q
    );
  dtack_MC_D1_PT_0_885 : X_AND2
    port map (
      I0 => NlwInverterSignal_dtack_MC_D1_PT_0_IN0,
      I1 => uc_ctrl_prs_state_ffd1,
      O => dtack_MC_D1_PT_0
    );
  dtack_MC_D1_886 : X_OR2
    port map (
      I0 => dtack_MC_D1_PT_0,
      I1 => dtack_MC_D1_PT_0,
      O => dtack_MC_D1
    );
  dtack_MC_D2_887 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => dtack_MC_D2
    );
  dtack_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_dtack_MC_XOR_IN0,
      I1 => dtack_MC_D2,
      O => dtack_MC_D
    );
  dtack_MC_OE_888 : X_BUF
    port map (
      I => dtack_MC_BUFOE_OUT,
      O => dtack_MC_OE
    );
  dtack_MC_BUFOE : X_BUF
    port map (
      I => uc_ctrl_prs_state_ffd1_MC_GLB,
      O => dtack_MC_BUFOE_OUT
    );
  irq_889 : X_TRI
    port map (
      I => GND,
      CTL => NlwInverterSignal_irq_CTL,
      O => NlwRenamedSig_OI_irq
    );
  irq_MC_Q_890 : X_BUF
    port map (
      I => irq_MC_Q_tsim_ireg_Q,
      O => irq_MC_Q
    );
  irq_MC_REG : X_BUF
    port map (
      I => irq_MC_D,
      O => irq_MC_Q_tsim_ireg_Q
    );
  irq_MC_D1_PT_0_891 : X_AND2
    port map (
      I0 => i2c_ctrl_mif,
      I1 => uc_ctrl_mien,
      O => irq_MC_D1_PT_0
    );
  irq_MC_D1_892 : X_OR2
    port map (
      I0 => irq_MC_D1_PT_0,
      I1 => irq_MC_D1_PT_0,
      O => irq_MC_D1
    );
  irq_MC_D2_893 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => irq_MC_D2
    );
  irq_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_irq_MC_XOR_IN0,
      I1 => irq_MC_D2,
      O => irq_MC_D
    );
  mcf_894 : X_BUF
    port map (
      I => mcf_MC_Q,
      O => mcf
    );
  scl_895 : X_TRI
    port map (
      I => GND,
      CTL => NlwInverterSignal_scl_CTL,
      O => scl
    );
  scl_MC_Q_896 : X_BUF
    port map (
      I => scl_MC_Q_tsim_ireg_Q,
      O => scl_MC_Q
    );
  scl_MC_REG : X_FF
    port map (
      I => scl_MC_D,
      CE => VCC,
      CLK => clk_II_FCLK,
      SET => FOOBAR5_ctinst_6,
      RST => PRLD,
      O => scl_MC_Q_tsim_ireg_Q
    );
  scl_MC_D1_897 : X_OR2
    port map (
      I0 => GND,
      I1 => GND,
      O => scl_MC_D1
    );
  scl_MC_D2_PT_0_898 : X_AND2
    port map (
      I0 => NlwInverterSignal_scl_MC_D2_PT_0_IN0,
      I1 => i2c_ctrl_scl_state_ffd2,
      O => scl_MC_D2_PT_0
    );
  scl_MC_D2_PT_1_899 : X_AND2
    port map (
      I0 => NlwInverterSignal_scl_MC_D2_PT_1_IN0,
      I1 => i2c_ctrl_scl_state_ffd2,
      O => scl_MC_D2_PT_1
    );
  scl_MC_D2_900 : X_OR2
    port map (
      I0 => scl_MC_D2_PT_0,
      I1 => scl_MC_D2_PT_1,
      O => scl_MC_D2
    );
  scl_MC_XOR : X_XOR2
    port map (
      I0 => NlwInverterSignal_scl_MC_XOR_IN0,
      I1 => scl_MC_D2,
      O => scl_MC_D
    );
  sda_901 : X_TRI
    port map (
      I => GND,
      CTL => NlwInverterSignal_sda_CTL,
      O => sda
    );
  NlwInverterBlock_data_bus_0_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => uc_ctrl_data_en,
      O => NlwInverterSignal_data_bus_0_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_data_bus_0_MC_D2_PT_3_IN3 : X_INV
    port map (
      I => uc_ctrl_data_en,
      O => NlwInverterSignal_data_bus_0_MC_D2_PT_3_IN3
    );
  NlwInverterBlock_data_bus_0_MC_D2_PT_3_IN4 : X_INV
    port map (
      I => uc_ctrl_stat_en,
      O => NlwInverterSignal_data_bus_0_MC_D2_PT_3_IN4
    );
  NlwInverterBlock_data_bus_0_MC_D2_PT_3_IN5 : X_INV
    port map (
      I => uc_ctrl_cntrl_en,
      O => NlwInverterSignal_data_bus_0_MC_D2_PT_3_IN5
    );
  NlwInverterBlock_uc_ctrl_prs_state_ffd1_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => uc_ctrl_prs_state_ffd1,
      O => NlwInverterSignal_uc_ctrl_prs_state_ffd1_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_uc_ctrl_prs_state_ffd1_MC_D1_PT_0_IN1 : X_INV
    port map (
      I => uc_ctrl_prs_state_ffd1,
      O => NlwInverterSignal_uc_ctrl_prs_state_ffd1_MC_D1_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_prs_state_ffd1_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => uc_ctrl_prs_state_ffd1,
      O => NlwInverterSignal_uc_ctrl_prs_state_ffd1_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_prs_state_ffd1_MC_D2_PT_0_IN3 : X_INV
    port map (
      I => uc_ctrl_ds_int,
      O => NlwInverterSignal_uc_ctrl_prs_state_ffd1_MC_D2_PT_0_IN3
    );
  NlwInverterBlock_uc_ctrl_prs_state_ffd1_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => uc_ctrl_prs_state_ffd2,
      O => NlwInverterSignal_uc_ctrl_prs_state_ffd1_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_uc_ctrl_prs_state_ffd1_MC_XOR_IN0 : X_INV
    port map (
      I => uc_ctrl_prs_state_ffd1_MC_D1,
      O => NlwInverterSignal_uc_ctrl_prs_state_ffd1_MC_XOR_IN0
    );
  NlwInverterBlock_uc_ctrl_prs_state_ffd2_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => uc_ctrl_prs_state_ffd1,
      O => NlwInverterSignal_uc_ctrl_prs_state_ffd2_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_prs_state_ffd2_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => uc_ctrl_prs_state_ffd2,
      O => NlwInverterSignal_uc_ctrl_prs_state_ffd2_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_uc_ctrl_prs_state_ffd2_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => uc_ctrl_prs_state_ffd1,
      O => NlwInverterSignal_uc_ctrl_prs_state_ffd2_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_uc_ctrl_prs_state_ffd2_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => as_II_UIM,
      O => NlwInverterSignal_uc_ctrl_prs_state_ffd2_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_uc_ctrl_address_match_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => addr_bus_10_II_UIM,
      O => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_uc_ctrl_address_match_MC_D1_PT_0_IN1 : X_INV
    port map (
      I => addr_bus_11_II_UIM,
      O => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_address_match_MC_D1_PT_0_IN2 : X_INV
    port map (
      I => addr_bus_12_II_UIM,
      O => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN2
    );
  NlwInverterBlock_uc_ctrl_address_match_MC_D1_PT_0_IN3 : X_INV
    port map (
      I => addr_bus_13_II_UIM,
      O => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN3
    );
  NlwInverterBlock_uc_ctrl_address_match_MC_D1_PT_0_IN4 : X_INV
    port map (
      I => addr_bus_14_II_UIM,
      O => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN4
    );
  NlwInverterBlock_uc_ctrl_address_match_MC_D1_PT_0_IN5 : X_INV
    port map (
      I => addr_bus_15_II_UIM,
      O => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN5
    );
  NlwInverterBlock_uc_ctrl_address_match_MC_D1_PT_0_IN6 : X_INV
    port map (
      I => addr_bus_16_II_UIM,
      O => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN6
    );
  NlwInverterBlock_uc_ctrl_address_match_MC_D1_PT_0_IN7 : X_INV
    port map (
      I => addr_bus_17_II_UIM,
      O => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN7
    );
  NlwInverterBlock_uc_ctrl_address_match_MC_D1_PT_0_IN8 : X_INV
    port map (
      I => addr_bus_18_II_UIM,
      O => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN8
    );
  NlwInverterBlock_uc_ctrl_address_match_MC_D1_PT_0_IN9 : X_INV
    port map (
      I => addr_bus_19_II_UIM,
      O => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN9
    );
  NlwInverterBlock_uc_ctrl_address_match_MC_D1_PT_0_IN10 : X_INV
    port map (
      I => addr_bus_20_II_UIM,
      O => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN10
    );
  NlwInverterBlock_uc_ctrl_address_match_MC_D1_PT_0_IN11 : X_INV
    port map (
      I => addr_bus_21_II_UIM,
      O => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN11
    );
  NlwInverterBlock_uc_ctrl_address_match_MC_D1_PT_0_IN12 : X_INV
    port map (
      I => addr_bus_22_II_UIM,
      O => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN12
    );
  NlwInverterBlock_uc_ctrl_address_match_MC_D1_PT_0_IN13 : X_INV
    port map (
      I => addr_bus_23_II_UIM,
      O => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN13
    );
  NlwInverterBlock_uc_ctrl_address_match_MC_D1_PT_0_IN14 : X_INV
    port map (
      I => addr_bus_8_II_UIM,
      O => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN14
    );
  NlwInverterBlock_uc_ctrl_address_match_MC_D1_PT_0_IN15 : X_INV
    port map (
      I => addr_bus_9_II_UIM,
      O => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN15
    );
  NlwInverterBlock_uc_ctrl_address_match_MC_D1_PT_0_IN16 : X_INV
    port map (
      I => as_II_UIM,
      O => NlwInverterSignal_uc_ctrl_address_match_MC_D1_PT_0_IN16
    );
  NlwInverterBlock_uc_ctrl_ds_int_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => i2c_ctrl_i2c_header(1),
      O => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_ds_int_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => uc_ctrl_madr(1),
      O => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_uc_ctrl_ds_int_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => i2c_ctrl_i2c_header(2),
      O => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_uc_ctrl_ds_int_MC_D2_PT_3_IN0 : X_INV
    port map (
      I => uc_ctrl_madr(2),
      O => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_3_IN0
    );
  NlwInverterBlock_uc_ctrl_ds_int_MC_D2_PT_4_IN1 : X_INV
    port map (
      I => i2c_ctrl_i2c_header(3),
      O => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_4_IN1
    );
  NlwInverterBlock_uc_ctrl_ds_int_MC_D2_PT_5_IN0 : X_INV
    port map (
      I => uc_ctrl_madr(3),
      O => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_5_IN0
    );
  NlwInverterBlock_uc_ctrl_ds_int_MC_D2_PT_6_IN1 : X_INV
    port map (
      I => i2c_ctrl_i2c_header(4),
      O => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_6_IN1
    );
  NlwInverterBlock_uc_ctrl_ds_int_MC_D2_PT_7_IN0 : X_INV
    port map (
      I => uc_ctrl_madr(4),
      O => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_7_IN0
    );
  NlwInverterBlock_uc_ctrl_ds_int_MC_D2_PT_8_IN1 : X_INV
    port map (
      I => i2c_ctrl_i2c_header(5),
      O => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_8_IN1
    );
  NlwInverterBlock_uc_ctrl_ds_int_MC_D2_PT_9_IN0 : X_INV
    port map (
      I => uc_ctrl_madr(5),
      O => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_9_IN0
    );
  NlwInverterBlock_uc_ctrl_ds_int_MC_D2_PT_10_IN1 : X_INV
    port map (
      I => i2c_ctrl_i2c_header(6),
      O => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_10_IN1
    );
  NlwInverterBlock_uc_ctrl_ds_int_MC_D2_PT_11_IN0 : X_INV
    port map (
      I => uc_ctrl_madr(6),
      O => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_11_IN0
    );
  NlwInverterBlock_uc_ctrl_ds_int_MC_D2_PT_12_IN1 : X_INV
    port map (
      I => i2c_ctrl_i2c_header(7),
      O => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_12_IN1
    );
  NlwInverterBlock_uc_ctrl_ds_int_MC_D2_PT_13_IN0 : X_INV
    port map (
      I => uc_ctrl_madr(7),
      O => NlwInverterSignal_uc_ctrl_ds_int_MC_D2_PT_13_IN0
    );
  NlwInverterBlock_uc_ctrl_madr_1_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => uc_ctrl_madr(1),
      O => NlwInverterSignal_uc_ctrl_madr_1_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_uc_ctrl_madr_1_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => N_PZ_565,
      O => NlwInverterSignal_uc_ctrl_madr_1_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_madr_1_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => data_bus_1_II_UIM,
      O => NlwInverterSignal_uc_ctrl_madr_1_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_uc_ctrl_madr_1_MC_XOR_IN0 : X_INV
    port map (
      I => uc_ctrl_madr_1_MC_D1,
      O => NlwInverterSignal_uc_ctrl_madr_1_MC_XOR_IN0
    );
  NlwInverterBlock_N_PZ_565_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => r_w_II_UIM,
      O => NlwInverterSignal_N_PZ_565_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_uc_ctrl_addr_en_MC_D1_PT_0_IN1 : X_INV
    port map (
      I => addr_bus_1_II_UIM,
      O => NlwInverterSignal_uc_ctrl_addr_en_MC_D1_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_addr_en_MC_D1_PT_0_IN4 : X_INV
    port map (
      I => addr_bus_4_II_UIM,
      O => NlwInverterSignal_uc_ctrl_addr_en_MC_D1_PT_0_IN4
    );
  NlwInverterBlock_uc_ctrl_addr_en_MC_D1_PT_0_IN5 : X_INV
    port map (
      I => addr_bus_5_II_UIM,
      O => NlwInverterSignal_uc_ctrl_addr_en_MC_D1_PT_0_IN5
    );
  NlwInverterBlock_uc_ctrl_addr_en_MC_D1_PT_0_IN6 : X_INV
    port map (
      I => addr_bus_6_II_UIM,
      O => NlwInverterSignal_uc_ctrl_addr_en_MC_D1_PT_0_IN6
    );
  NlwInverterBlock_FOOBAR5_ctinst_5_IN0 : X_INV
    port map (
      I => uc_ctrl_men,
      O => NlwInverterSignal_FOOBAR5_ctinst_5_IN0
    );
  NlwInverterBlock_FOOBAR5_ctinst_5_IN1 : X_INV
    port map (
      I => uc_ctrl_men,
      O => NlwInverterSignal_FOOBAR5_ctinst_5_IN1
    );
  NlwInverterBlock_FOOBAR5_ctinst_6_IN0 : X_INV
    port map (
      I => uc_ctrl_men,
      O => NlwInverterSignal_FOOBAR5_ctinst_6_IN0
    );
  NlwInverterBlock_FOOBAR5_ctinst_6_IN1 : X_INV
    port map (
      I => uc_ctrl_men,
      O => NlwInverterSignal_FOOBAR5_ctinst_6_IN1
    );
  NlwInverterBlock_uc_ctrl_men_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => data_bus_7_II_UIM,
      O => NlwInverterSignal_uc_ctrl_men_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_men_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => N_PZ_569,
      O => NlwInverterSignal_uc_ctrl_men_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_uc_ctrl_men_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => uc_ctrl_men,
      O => NlwInverterSignal_uc_ctrl_men_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_uc_ctrl_men_MC_XOR_IN0 : X_INV
    port map (
      I => uc_ctrl_men_MC_D1,
      O => NlwInverterSignal_uc_ctrl_men_MC_XOR_IN0
    );
  NlwInverterBlock_N_PZ_569_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => r_w_II_UIM,
      O => NlwInverterSignal_N_PZ_569_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_uc_ctrl_cntrl_en_MC_D1_PT_0_IN1 : X_INV
    port map (
      I => addr_bus_1_II_UIM,
      O => NlwInverterSignal_uc_ctrl_cntrl_en_MC_D1_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_cntrl_en_MC_D1_PT_0_IN2 : X_INV
    port map (
      I => addr_bus_2_II_UIM,
      O => NlwInverterSignal_uc_ctrl_cntrl_en_MC_D1_PT_0_IN2
    );
  NlwInverterBlock_uc_ctrl_cntrl_en_MC_D1_PT_0_IN3 : X_INV
    port map (
      I => addr_bus_3_II_UIM,
      O => NlwInverterSignal_uc_ctrl_cntrl_en_MC_D1_PT_0_IN3
    );
  NlwInverterBlock_uc_ctrl_cntrl_en_MC_D1_PT_0_IN5 : X_INV
    port map (
      I => addr_bus_5_II_UIM,
      O => NlwInverterSignal_uc_ctrl_cntrl_en_MC_D1_PT_0_IN5
    );
  NlwInverterBlock_uc_ctrl_cntrl_en_MC_D1_PT_0_IN6 : X_INV
    port map (
      I => addr_bus_6_II_UIM,
      O => NlwInverterSignal_uc_ctrl_cntrl_en_MC_D1_PT_0_IN6
    );
  NlwInverterBlock_i2c_ctrl_sda_in_MC_D2_PT_0_IN2 : X_INV
    port map (
      I => i2c_ctrl_stop_scl_reg,
      O => NlwInverterSignal_i2c_ctrl_sda_in_MC_D2_PT_0_IN2
    );
  NlwInverterBlock_i2c_ctrl_sda_in_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => i2c_ctrl_stop_scl_reg,
      O => NlwInverterSignal_i2c_ctrl_sda_in_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_i2c_ctrl_sda_in_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => i2c_ctrl_master_slave,
      O => NlwInverterSignal_i2c_ctrl_sda_in_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_i2c_ctrl_sda_in_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => i2c_ctrl_stop_scl_reg,
      O => NlwInverterSignal_i2c_ctrl_sda_in_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_FOOBAR3_ctinst_5_IN0 : X_INV
    port map (
      I => uc_ctrl_men,
      O => NlwInverterSignal_FOOBAR3_ctinst_5_IN0
    );
  NlwInverterBlock_FOOBAR3_ctinst_5_IN1 : X_INV
    port map (
      I => uc_ctrl_men,
      O => NlwInverterSignal_FOOBAR3_ctinst_5_IN1
    );
  NlwInverterBlock_FOOBAR3_ctinst_6_IN0 : X_INV
    port map (
      I => uc_ctrl_men,
      O => NlwInverterSignal_FOOBAR3_ctinst_6_IN0
    );
  NlwInverterBlock_FOOBAR3_ctinst_6_IN1 : X_INV
    port map (
      I => uc_ctrl_men,
      O => NlwInverterSignal_FOOBAR3_ctinst_6_IN1
    );
  NlwInverterBlock_i2c_ctrl_master_slave_MC_CE_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_bus_busy,
      O => NlwInverterSignal_i2c_ctrl_master_slave_MC_CE_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_master_slave_MC_CE_PT_0_IN1 : X_INV
    port map (
      I => i2c_ctrl_bus_busy,
      O => NlwInverterSignal_i2c_ctrl_master_slave_MC_CE_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_msta_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => i2c_ctrl_msta_rst,
      O => NlwInverterSignal_uc_ctrl_msta_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_msta_MC_D2_PT_0_IN2 : X_INV
    port map (
      I => N_PZ_569,
      O => NlwInverterSignal_uc_ctrl_msta_MC_D2_PT_0_IN2
    );
  NlwInverterBlock_uc_ctrl_msta_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => i2c_ctrl_msta_rst,
      O => NlwInverterSignal_uc_ctrl_msta_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_i2c_ctrl_msta_rst_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => N_PZ_687,
      O => NlwInverterSignal_i2c_ctrl_msta_rst_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_i2c_ctrl_msta_rst_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => i2c_ctrl_master_slave,
      O => NlwInverterSignal_i2c_ctrl_msta_rst_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_i2c_ctrl_msta_rst_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => i2c_ctrl_msta_rst,
      O => NlwInverterSignal_i2c_ctrl_msta_rst_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_i2c_ctrl_msta_rst_MC_D2_PT_3_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_msta_rst_MC_D2_PT_3_IN0
    );
  NlwInverterBlock_i2c_ctrl_msta_rst_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_msta_rst_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_i2c_ctrl_msta_rst_MC_D2_PT_3_IN2 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd2,
      O => NlwInverterSignal_i2c_ctrl_msta_rst_MC_D2_PT_3_IN2
    );
  NlwInverterBlock_i2c_ctrl_msta_rst_MC_XOR_IN0 : X_INV
    port map (
      I => i2c_ctrl_msta_rst_MC_D1,
      O => NlwInverterSignal_i2c_ctrl_msta_rst_MC_XOR_IN0
    );
  NlwInverterBlock_i2c_ctrl_arb_lost_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_master_slave,
      O => NlwInverterSignal_i2c_ctrl_arb_lost_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_arb_lost_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => i2c_ctrl_arb_lost,
      O => NlwInverterSignal_i2c_ctrl_arb_lost_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_i2c_ctrl_arb_lost_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => i2c_ctrl_arb_lost,
      O => NlwInverterSignal_i2c_ctrl_arb_lost_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_i2c_ctrl_arb_lost_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => N_PZ_687,
      O => NlwInverterSignal_i2c_ctrl_arb_lost_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_i2c_ctrl_arb_lost_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_arb_lost_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_i2c_ctrl_arb_lost_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_arb_lost_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_i2c_ctrl_arb_lost_MC_D2_PT_2_IN2 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd2,
      O => NlwInverterSignal_i2c_ctrl_arb_lost_MC_D2_PT_2_IN2
    );
  NlwInverterBlock_i2c_ctrl_arb_lost_MC_XOR_IN0 : X_INV
    port map (
      I => i2c_ctrl_arb_lost_MC_D1,
      O => NlwInverterSignal_i2c_ctrl_arb_lost_MC_XOR_IN0
    );
  NlwInverterBlock_N_PZ_687_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_state_ffd1,
      O => NlwInverterSignal_N_PZ_687_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_N_PZ_687_MC_D2_PT_0_IN2 : X_INV
    port map (
      I => i2c_ctrl_state_ffd2,
      O => NlwInverterSignal_N_PZ_687_MC_D2_PT_0_IN2
    );
  NlwInverterBlock_N_PZ_687_MC_D2_PT_0_IN5 : X_INV
    port map (
      I => i2c_ctrl_sda_out_reg_d1,
      O => NlwInverterSignal_N_PZ_687_MC_D2_PT_0_IN5
    );
  NlwInverterBlock_N_PZ_687_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => i2c_ctrl_state_ffd1,
      O => NlwInverterSignal_N_PZ_687_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_N_PZ_687_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => i2c_ctrl_sda_in,
      O => NlwInverterSignal_N_PZ_687_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_N_PZ_687_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => i2c_ctrl_state_ffd2,
      O => NlwInverterSignal_N_PZ_687_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_N_PZ_687_MC_D2_PT_2_IN5 : X_INV
    port map (
      I => i2c_ctrl_sda_out_reg_d1,
      O => NlwInverterSignal_N_PZ_687_MC_D2_PT_2_IN5
    );
  NlwInverterBlock_N_PZ_687_MC_D2_PT_3_IN0 : X_INV
    port map (
      I => i2c_ctrl_sda_in,
      O => NlwInverterSignal_N_PZ_687_MC_D2_PT_3_IN0
    );
  NlwInverterBlock_i2c_ctrl_state_ffd1_MC_RSTF_PT_0_IN0 : X_INV
    port map (
      I => N_PZ_897,
      O => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_RSTF_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_state_ffd1_MC_RSTF_PT_0_IN1 : X_INV
    port map (
      I => N_PZ_897,
      O => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_RSTF_PT_0_IN1
    );
  NlwInverterBlock_i2c_ctrl_state_ffd1_MC_D2_PT_0_IN2 : X_INV
    port map (
      I => i2c_ctrl_state_ffd2,
      O => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_0_IN2
    );
  NlwInverterBlock_i2c_ctrl_state_ffd1_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => i2c_ctrl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_i2c_ctrl_state_ffd1_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => i2c_ctrl_detect_start,
      O => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_i2c_ctrl_state_ffd1_MC_D2_PT_2_IN2 : X_INV
    port map (
      I => i2c_ctrl_arb_lost,
      O => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_2_IN2
    );
  NlwInverterBlock_i2c_ctrl_state_ffd1_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => sda_II_UIM,
      O => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_i2c_ctrl_state_ffd1_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => i2c_ctrl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_i2c_ctrl_state_ffd1_MC_D2_PT_3_IN2 : X_INV
    port map (
      I => i2c_ctrl_sda_in,
      O => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_3_IN2
    );
  NlwInverterBlock_i2c_ctrl_state_ffd1_MC_D2_PT_3_IN5 : X_INV
    port map (
      I => i2c_ctrl_arb_lost,
      O => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_3_IN5
    );
  NlwInverterBlock_i2c_ctrl_state_ffd1_MC_D2_PT_4_IN1 : X_INV
    port map (
      I => i2c_ctrl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_4_IN1
    );
  NlwInverterBlock_i2c_ctrl_state_ffd1_MC_D2_PT_4_IN2 : X_INV
    port map (
      I => i2c_ctrl_sda_in,
      O => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_4_IN2
    );
  NlwInverterBlock_i2c_ctrl_state_ffd1_MC_D2_PT_4_IN4 : X_INV
    port map (
      I => i2c_ctrl_arb_lost,
      O => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_4_IN4
    );
  NlwInverterBlock_i2c_ctrl_state_ffd1_MC_D2_PT_4_IN5 : X_INV
    port map (
      I => uc_ctrl_ds_int_MC_COMB,
      O => NlwInverterSignal_i2c_ctrl_state_ffd1_MC_D2_PT_4_IN5
    );
  NlwInverterBlock_i2c_ctrl_state_ffd3_MC_RSTF_PT_0_IN0 : X_INV
    port map (
      I => N_PZ_897,
      O => NlwInverterSignal_i2c_ctrl_state_ffd3_MC_RSTF_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_state_ffd3_MC_RSTF_PT_0_IN1 : X_INV
    port map (
      I => N_PZ_897,
      O => NlwInverterSignal_i2c_ctrl_state_ffd3_MC_RSTF_PT_0_IN1
    );
  NlwInverterBlock_i2c_ctrl_state_ffd3_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => i2c_ctrl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_state_ffd3_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_i2c_ctrl_state_ffd3_MC_D2_PT_0_IN2 : X_INV
    port map (
      I => i2c_ctrl_state_ffd2,
      O => NlwInverterSignal_i2c_ctrl_state_ffd3_MC_D2_PT_0_IN2
    );
  NlwInverterBlock_i2c_ctrl_state_ffd3_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => i2c_ctrl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_state_ffd3_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_i2c_ctrl_state_ffd3_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => i2c_ctrl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_state_ffd3_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_i2c_ctrl_state_ffd3_MC_D2_PT_2_IN2 : X_INV
    port map (
      I => i2c_ctrl_state_ffd2,
      O => NlwInverterSignal_i2c_ctrl_state_ffd3_MC_D2_PT_2_IN2
    );
  NlwInverterBlock_i2c_ctrl_state_ffd3_MC_D2_PT_3_IN0 : X_INV
    port map (
      I => i2c_ctrl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_state_ffd3_MC_D2_PT_3_IN0
    );
  NlwInverterBlock_i2c_ctrl_state_ffd3_MC_D2_PT_3_IN5 : X_INV
    port map (
      I => i2c_ctrl_n0159,
      O => NlwInverterSignal_i2c_ctrl_state_ffd3_MC_D2_PT_3_IN5
    );
  NlwInverterBlock_i2c_ctrl_state_ffd2_MC_RSTF_PT_0_IN0 : X_INV
    port map (
      I => N_PZ_897,
      O => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_RSTF_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_state_ffd2_MC_RSTF_PT_0_IN1 : X_INV
    port map (
      I => N_PZ_897,
      O => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_RSTF_PT_0_IN1
    );
  NlwInverterBlock_i2c_ctrl_state_ffd2_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_state_ffd2_MC_D2_PT_0_IN2 : X_INV
    port map (
      I => i2c_ctrl_detect_start,
      O => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_0_IN2
    );
  NlwInverterBlock_i2c_ctrl_state_ffd2_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => i2c_ctrl_arb_lost,
      O => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_i2c_ctrl_state_ffd2_MC_D2_PT_1_IN4 : X_INV
    port map (
      I => sda_II_UIM,
      O => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_1_IN4
    );
  NlwInverterBlock_i2c_ctrl_state_ffd2_MC_D2_PT_2_IN5 : X_INV
    port map (
      I => i2c_ctrl_n0159,
      O => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_2_IN5
    );
  NlwInverterBlock_i2c_ctrl_state_ffd2_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => i2c_ctrl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_i2c_ctrl_state_ffd2_MC_D2_PT_3_IN2 : X_INV
    port map (
      I => i2c_ctrl_sda_in,
      O => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_3_IN2
    );
  NlwInverterBlock_i2c_ctrl_state_ffd2_MC_D2_PT_3_IN6 : X_INV
    port map (
      I => i2c_ctrl_arb_lost,
      O => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_3_IN6
    );
  NlwInverterBlock_i2c_ctrl_state_ffd2_MC_D2_PT_4_IN1 : X_INV
    port map (
      I => i2c_ctrl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_4_IN1
    );
  NlwInverterBlock_i2c_ctrl_state_ffd2_MC_D2_PT_4_IN2 : X_INV
    port map (
      I => i2c_ctrl_sda_in,
      O => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_4_IN2
    );
  NlwInverterBlock_i2c_ctrl_state_ffd2_MC_D2_PT_4_IN3 : X_INV
    port map (
      I => i2c_ctrl_master_slave,
      O => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_4_IN3
    );
  NlwInverterBlock_i2c_ctrl_state_ffd2_MC_D2_PT_4_IN6 : X_INV
    port map (
      I => i2c_ctrl_arb_lost,
      O => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_4_IN6
    );
  NlwInverterBlock_i2c_ctrl_state_ffd2_MC_D2_PT_4_IN7 : X_INV
    port map (
      I => uc_ctrl_ds_int_MC_COMB,
      O => NlwInverterSignal_i2c_ctrl_state_ffd2_MC_D2_PT_4_IN7
    );
  NlwInverterBlock_i2c_ctrl_detect_start_MC_RSTF_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_n0073,
      O => NlwInverterSignal_i2c_ctrl_detect_start_MC_RSTF_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_detect_start_MC_RSTF_PT_0_IN1 : X_INV
    port map (
      I => i2c_ctrl_n0073,
      O => NlwInverterSignal_i2c_ctrl_detect_start_MC_RSTF_PT_0_IN1
    );
  NlwInverterBlock_i2c_ctrl_n0073_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_n0073_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_n0073_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => n7426,
      O => NlwInverterSignal_i2c_ctrl_n0073_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_n7426_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_state_ffd1,
      O => NlwInverterSignal_n7426_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_n7426_MC_D1_PT_0_IN1 : X_INV
    port map (
      I => i2c_ctrl_state_ffd2,
      O => NlwInverterSignal_n7426_MC_D1_PT_0_IN1
    );
  NlwInverterBlock_FOOBAR6_ctinst_5_IN0 : X_INV
    port map (
      I => uc_ctrl_men,
      O => NlwInverterSignal_FOOBAR6_ctinst_5_IN0
    );
  NlwInverterBlock_FOOBAR6_ctinst_5_IN1 : X_INV
    port map (
      I => uc_ctrl_men,
      O => NlwInverterSignal_FOOBAR6_ctinst_5_IN1
    );
  NlwInverterBlock_FOOBAR6_ctinst_6_IN0 : X_INV
    port map (
      I => uc_ctrl_men,
      O => NlwInverterSignal_FOOBAR6_ctinst_6_IN0
    );
  NlwInverterBlock_FOOBAR6_ctinst_6_IN1 : X_INV
    port map (
      I => uc_ctrl_men,
      O => NlwInverterSignal_FOOBAR6_ctinst_6_IN1
    );
  NlwInverterBlock_FOOBAR4_ctinst_5_IN0 : X_INV
    port map (
      I => uc_ctrl_men,
      O => NlwInverterSignal_FOOBAR4_ctinst_5_IN0
    );
  NlwInverterBlock_FOOBAR4_ctinst_5_IN1 : X_INV
    port map (
      I => uc_ctrl_men,
      O => NlwInverterSignal_FOOBAR4_ctinst_5_IN1
    );
  NlwInverterBlock_i2c_ctrl_bit_cnt_0_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_bit_cnt(0),
      O => NlwInverterSignal_i2c_ctrl_bit_cnt_0_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_bit_cnt_0_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => N_PZ_672,
      O => NlwInverterSignal_i2c_ctrl_bit_cnt_0_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_i2c_ctrl_bit_cnt_0_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => i2c_ctrl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_bit_cnt_0_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_i2c_ctrl_bit_cnt_0_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => i2c_ctrl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_bit_cnt_0_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_i2c_ctrl_bit_cnt_0_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => i2c_ctrl_detect_start,
      O => NlwInverterSignal_i2c_ctrl_bit_cnt_0_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_i2c_ctrl_bit_cnt_0_MC_XOR_IN0 : X_INV
    port map (
      I => i2c_ctrl_bit_cnt_0_MC_D1,
      O => NlwInverterSignal_i2c_ctrl_bit_cnt_0_MC_XOR_IN0
    );
  NlwInverterBlock_N_PZ_672_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => i2c_ctrl_detect_start,
      O => NlwInverterSignal_N_PZ_672_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_N_PZ_672_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => i2c_ctrl_state_ffd3,
      O => NlwInverterSignal_N_PZ_672_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_N_PZ_672_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => i2c_ctrl_detect_start,
      O => NlwInverterSignal_N_PZ_672_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_N_PZ_672_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => n7426,
      O => NlwInverterSignal_N_PZ_672_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_FOOBAR8_ctinst_5_IN0 : X_INV
    port map (
      I => uc_ctrl_men,
      O => NlwInverterSignal_FOOBAR8_ctinst_5_IN0
    );
  NlwInverterBlock_FOOBAR8_ctinst_5_IN1 : X_INV
    port map (
      I => uc_ctrl_men,
      O => NlwInverterSignal_FOOBAR8_ctinst_5_IN1
    );
  NlwInverterBlock_i2c_ctrl_bit_cnt_1_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => N_PZ_672,
      O => NlwInverterSignal_i2c_ctrl_bit_cnt_1_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_N_PZ_652_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_state_ffd3,
      O => NlwInverterSignal_N_PZ_652_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_N_PZ_652_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => i2c_ctrl_state_ffd1,
      O => NlwInverterSignal_N_PZ_652_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_N_PZ_652_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => i2c_ctrl_state_ffd2,
      O => NlwInverterSignal_N_PZ_652_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_i2c_ctrl_bit_cnt_2_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => N_PZ_672,
      O => NlwInverterSignal_i2c_ctrl_bit_cnt_2_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_i2c_ctrl_bit_cnt_2_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => i2c_ctrl_detect_start,
      O => NlwInverterSignal_i2c_ctrl_bit_cnt_2_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_i2c_ctrl_n0159_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => N_PZ_672,
      O => NlwInverterSignal_i2c_ctrl_n0159_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_i2c_ctrl_n0159_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => i2c_ctrl_detect_start,
      O => NlwInverterSignal_i2c_ctrl_n0159_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_uc_ctrl_mtx_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => uc_ctrl_mtx,
      O => NlwInverterSignal_uc_ctrl_mtx_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_uc_ctrl_mtx_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => N_PZ_569,
      O => NlwInverterSignal_uc_ctrl_mtx_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_mtx_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => data_bus_4_II_UIM,
      O => NlwInverterSignal_uc_ctrl_mtx_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_uc_ctrl_mtx_MC_XOR_IN0 : X_INV
    port map (
      I => uc_ctrl_mtx_MC_D1,
      O => NlwInverterSignal_uc_ctrl_mtx_MC_XOR_IN0
    );
  NlwInverterBlock_N_PZ_897_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_detect_stop,
      O => NlwInverterSignal_N_PZ_897_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_detect_stop_MC_RSTF_PT_0_IN0 : X_INV
    port map (
      I => N_PZ_896,
      O => NlwInverterSignal_i2c_ctrl_detect_stop_MC_RSTF_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_detect_stop_MC_RSTF_PT_0_IN1 : X_INV
    port map (
      I => N_PZ_896,
      O => NlwInverterSignal_i2c_ctrl_detect_stop_MC_RSTF_PT_0_IN1
    );
  NlwInverterBlock_N_PZ_896_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_detect_start,
      O => NlwInverterSignal_N_PZ_896_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_0_IN2 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd2,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_0_IN2
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => i2c_ctrl_sda_out_reg,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd2,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_3_IN2 : X_INV
    port map (
      I => i2c_ctrl_sda_out_reg,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_3_IN2
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_4_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_4_IN1
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_4_IN3 : X_INV
    port map (
      I => i2c_ctrl_sda_out_reg,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_4_IN3
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_5_IN0 : X_INV
    port map (
      I => i2c_ctrl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_5_IN0
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_5_IN1 : X_INV
    port map (
      I => i2c_ctrl_arb_lost,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_5_IN1
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_5_IN2 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_5_IN2
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_6_IN0 : X_INV
    port map (
      I => i2c_ctrl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_6_IN0
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_6_IN1 : X_INV
    port map (
      I => i2c_ctrl_arb_lost,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_6_IN1
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_6_IN2 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_6_IN2
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_7_IN1 : X_INV
    port map (
      I => i2c_ctrl_arb_lost,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_7_IN1
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_7_IN2 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_7_IN2
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_8_IN1 : X_INV
    port map (
      I => i2c_ctrl_arb_lost,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_8_IN1
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_8_IN2 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_8_IN2
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_9_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_9_IN0
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_9_IN2 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(0),
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_9_IN2
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_9_IN3 : X_INV
    port map (
      I => uc_ctrl_rsta,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_9_IN3
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_9_IN4 : X_INV
    port map (
      I => i2c_ctrl_sda_out_reg,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_9_IN4
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_10_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_10_IN0
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_10_IN3 : X_INV
    port map (
      I => uc_ctrl_rsta,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_10_IN3
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_10_IN4 : X_INV
    port map (
      I => i2c_ctrl_sda_out_reg,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_10_IN4
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_11_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_11_IN0
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_11_IN3 : X_INV
    port map (
      I => uc_ctrl_rsta,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_11_IN3
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_11_IN4 : X_INV
    port map (
      I => i2c_ctrl_sda_out_reg,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_11_IN4
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_12_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_12_IN0
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_12_IN3 : X_INV
    port map (
      I => uc_ctrl_rsta,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_12_IN3
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_12_IN4 : X_INV
    port map (
      I => i2c_ctrl_sda_out_reg,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_12_IN4
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN0 : X_INV
    port map (
      I => i2c_ctrl_arb_lost,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN0
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN1
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN4 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(1),
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN4
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN5 : X_INV
    port map (
      I => i2c_ctrl_n0153,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN5
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN6 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(2),
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN6
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN7 : X_INV
    port map (
      I => uc_ctrl_rsta,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN7
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN8 : X_INV
    port map (
      I => i2c_ctrl_master_sda,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_D2_PT_13_IN8
    );
  NlwInverterBlock_i2c_ctrl_sda_out_reg_MC_XOR_IN0 : X_INV
    port map (
      I => i2c_ctrl_sda_out_reg_MC_D1,
      O => NlwInverterSignal_i2c_ctrl_sda_out_reg_MC_XOR_IN0
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd1_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd1_MC_D1_PT_0_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D1_PT_0_IN1
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd1_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd1_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd1_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd2,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd1_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => i2c_ctrl_bus_busy,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd1_MC_D2_PT_2_IN2 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_2_IN2
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd1_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd1_MC_D2_PT_2_IN4 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd2,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_2_IN4
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd1_MC_D2_PT_3_IN3 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(1),
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_3_IN3
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd1_MC_D2_PT_3_IN5 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(2),
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_D2_PT_3_IN5
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd1_MC_XOR_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1_MC_D1,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd1_MC_XOR_IN0
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd3_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd3_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd3_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd2,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd3_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd3_MC_D2_PT_3_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_3_IN0
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd3_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => i2c_ctrl_n0153,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd3_MC_D2_PT_4_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_4_IN0
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd3_MC_D2_PT_5_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_5_IN0
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd3_MC_D2_PT_6_IN2 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(1),
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_6_IN2
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd3_MC_D2_PT_6_IN4 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(2),
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_6_IN4
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd3_MC_D2_PT_7_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_7_IN1
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd3_MC_D2_PT_7_IN5 : X_INV
    port map (
      I => i2c_ctrl_n0159,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_7_IN5
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd3_MC_D2_PT_8_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd2,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_8_IN1
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd3_MC_D2_PT_8_IN2 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(0),
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_8_IN2
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd3_MC_D2_PT_8_IN3 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(1),
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_8_IN3
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd3_MC_D2_PT_8_IN5 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(2),
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_8_IN5
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd3_MC_D2_PT_9_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd2,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_9_IN1
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd3_MC_D2_PT_9_IN2 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(0),
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_9_IN2
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd3_MC_D2_PT_9_IN3 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(1),
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_9_IN3
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd3_MC_D2_PT_9_IN4 : X_INV
    port map (
      I => i2c_ctrl_n0153,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_D2_PT_9_IN4
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd3_MC_XOR_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd3_MC_D1,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd3_MC_XOR_IN0
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd2_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd2_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd2,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd2_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(0),
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd2_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(1),
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd2_MC_D2_PT_1_IN5 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(2),
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_1_IN5
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd2_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd2_MC_D2_PT_2_IN2 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(0),
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_2_IN2
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd2_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(1),
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd2_MC_D2_PT_2_IN5 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(2),
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_2_IN5
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd2_MC_D2_PT_3_IN3 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(1),
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_3_IN3
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd2_MC_D2_PT_3_IN5 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(2),
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_3_IN5
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd2_MC_D2_PT_4_IN2 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd2,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_4_IN2
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd2_MC_D2_PT_4_IN3 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(0),
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_4_IN3
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd2_MC_D2_PT_4_IN4 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(1),
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_4_IN4
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd2_MC_D2_PT_4_IN5 : X_INV
    port map (
      I => i2c_ctrl_n0153,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_4_IN5
    );
  NlwInverterBlock_i2c_ctrl_scl_state_ffd2_MC_D2_PT_4_IN7 : X_INV
    port map (
      I => uc_ctrl_rsta,
      O => NlwInverterSignal_i2c_ctrl_scl_state_ffd2_MC_D2_PT_4_IN7
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_0_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_0_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_0_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd2,
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_0_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(0),
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_0_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_0_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(0),
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_0_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd2,
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_0_MC_D2_PT_3_IN2 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(0),
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_3_IN2
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_0_MC_D2_PT_3_IN3 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(1),
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_3_IN3
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_0_MC_D2_PT_3_IN4 : X_INV
    port map (
      I => i2c_ctrl_n0153,
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_3_IN4
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_0_MC_D2_PT_4_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd2,
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_4_IN1
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_0_MC_D2_PT_4_IN2 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(0),
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_4_IN2
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_0_MC_D2_PT_4_IN3 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(1),
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_4_IN3
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_0_MC_D2_PT_4_IN4 : X_INV
    port map (
      I => i2c_ctrl_n0153,
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_D2_PT_4_IN4
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_0_MC_XOR_IN0 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt_0_MC_D1,
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_0_MC_XOR_IN0
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_1_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_1_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_1_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd2,
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_1_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_1_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => N_PZ_654,
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_1_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_1_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(1),
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_1_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_1_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_1_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_1_MC_XOR_IN0 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt_1_MC_D1,
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_1_MC_XOR_IN0
    );
  NlwInverterBlock_N_PZ_654_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(0),
      O => NlwInverterSignal_N_PZ_654_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_N_PZ_654_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(0),
      O => NlwInverterSignal_N_PZ_654_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_N_PZ_654_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_N_PZ_654_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_i2c_ctrl_n0153_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_n0153_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd2,
      O => NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_i2c_ctrl_n0153_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(1),
      O => NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_i2c_ctrl_n0153_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => i2c_ctrl_n0153,
      O => NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_i2c_ctrl_n0153_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => i2c_ctrl_n0153,
      O => NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_i2c_ctrl_n0153_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(2),
      O => NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_i2c_ctrl_n0153_MC_D2_PT_3_IN0 : X_INV
    port map (
      I => i2c_ctrl_n0153,
      O => NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_3_IN0
    );
  NlwInverterBlock_i2c_ctrl_n0153_MC_D2_PT_4_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_4_IN1
    );
  NlwInverterBlock_i2c_ctrl_n0153_MC_D2_PT_5_IN3 : X_INV
    port map (
      I => N_PZ_654,
      O => NlwInverterSignal_i2c_ctrl_n0153_MC_D2_PT_5_IN3
    );
  NlwInverterBlock_i2c_ctrl_n0153_MC_XOR_IN0 : X_INV
    port map (
      I => i2c_ctrl_n0153_MC_D1,
      O => NlwInverterSignal_i2c_ctrl_n0153_MC_XOR_IN0
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_2_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_2_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd2,
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_2_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(1),
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_2_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(2),
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_2_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(2),
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_2_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_2_MC_D2_PT_4_IN2 : X_INV
    port map (
      I => N_PZ_654,
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_4_IN2
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_2_MC_D2_PT_5_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd2,
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_5_IN1
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_2_MC_D2_PT_5_IN2 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(0),
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_5_IN2
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_2_MC_D2_PT_5_IN3 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(1),
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_5_IN3
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_2_MC_D2_PT_5_IN4 : X_INV
    port map (
      I => i2c_ctrl_n0153,
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_5_IN4
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_2_MC_D2_PT_6_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd2,
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_6_IN1
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_2_MC_D2_PT_6_IN2 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(0),
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_6_IN2
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_2_MC_D2_PT_6_IN3 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt(1),
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_6_IN3
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_2_MC_D2_PT_6_IN4 : X_INV
    port map (
      I => i2c_ctrl_n0153,
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_D2_PT_6_IN4
    );
  NlwInverterBlock_i2c_ctrl_clk_cnt_2_MC_XOR_IN0 : X_INV
    port map (
      I => i2c_ctrl_clk_cnt_2_MC_D1,
      O => NlwInverterSignal_i2c_ctrl_clk_cnt_2_MC_XOR_IN0
    );
  NlwInverterBlock_uc_ctrl_rsta_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => data_bus_2_II_UIM,
      O => NlwInverterSignal_uc_ctrl_rsta_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_rsta_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => N_PZ_569,
      O => NlwInverterSignal_uc_ctrl_rsta_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_uc_ctrl_rsta_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => uc_ctrl_rsta,
      O => NlwInverterSignal_uc_ctrl_rsta_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_uc_ctrl_rsta_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_uc_ctrl_rsta_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_uc_ctrl_rsta_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd3,
      O => NlwInverterSignal_uc_ctrl_rsta_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_uc_ctrl_rsta_MC_D2_PT_3_IN2 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd2,
      O => NlwInverterSignal_uc_ctrl_rsta_MC_D2_PT_3_IN2
    );
  NlwInverterBlock_uc_ctrl_rsta_MC_XOR_IN0 : X_INV
    port map (
      I => uc_ctrl_rsta_MC_D1,
      O => NlwInverterSignal_uc_ctrl_rsta_MC_XOR_IN0
    );
  NlwInverterBlock_i2c_ctrl_stop_scl_reg_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => i2c_ctrl_stop_scl_reg,
      O => NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_i2c_ctrl_stop_scl_reg_MC_D2_PT_4_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_D2_PT_4_IN0
    );
  NlwInverterBlock_i2c_ctrl_stop_scl_reg_MC_D2_PT_4_IN1 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd2,
      O => NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_D2_PT_4_IN1
    );
  NlwInverterBlock_i2c_ctrl_stop_scl_reg_MC_D2_PT_5_IN1 : X_INV
    port map (
      I => n7426,
      O => NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_D2_PT_5_IN1
    );
  NlwInverterBlock_i2c_ctrl_stop_scl_reg_MC_D2_PT_5_IN2 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_D2_PT_5_IN2
    );
  NlwInverterBlock_i2c_ctrl_stop_scl_reg_MC_D2_PT_6_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_D2_PT_6_IN0
    );
  NlwInverterBlock_i2c_ctrl_stop_scl_reg_MC_D2_PT_6_IN1 : X_INV
    port map (
      I => i2c_ctrl_gen_stop,
      O => NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_D2_PT_6_IN1
    );
  NlwInverterBlock_i2c_ctrl_stop_scl_reg_MC_D2_PT_6_IN2 : X_INV
    port map (
      I => i2c_ctrl_sm_stop,
      O => NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_D2_PT_6_IN2
    );
  NlwInverterBlock_i2c_ctrl_stop_scl_reg_MC_XOR_IN0 : X_INV
    port map (
      I => i2c_ctrl_stop_scl_reg_MC_D1,
      O => NlwInverterSignal_i2c_ctrl_stop_scl_reg_MC_XOR_IN0
    );
  NlwInverterBlock_i2c_ctrl_gen_stop_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => i2c_ctrl_detect_stop,
      O => NlwInverterSignal_i2c_ctrl_gen_stop_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_i2c_ctrl_gen_stop_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => uc_ctrl_msta,
      O => NlwInverterSignal_i2c_ctrl_gen_stop_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_i2c_ctrl_gen_stop_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => i2c_ctrl_arb_lost,
      O => NlwInverterSignal_i2c_ctrl_gen_stop_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_i2c_ctrl_sm_stop_MC_RSTF_PT_0_IN0 : X_INV
    port map (
      I => N_PZ_897,
      O => NlwInverterSignal_i2c_ctrl_sm_stop_MC_RSTF_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_sm_stop_MC_RSTF_PT_0_IN1 : X_INV
    port map (
      I => N_PZ_897,
      O => NlwInverterSignal_i2c_ctrl_sm_stop_MC_RSTF_PT_0_IN1
    );
  NlwInverterBlock_i2c_ctrl_sm_stop_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_sm_stop_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_sm_stop_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => i2c_ctrl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_sm_stop_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_i2c_ctrl_sm_stop_MC_D2_PT_1_IN4 : X_INV
    port map (
      I => i2c_ctrl_arb_lost,
      O => NlwInverterSignal_i2c_ctrl_sm_stop_MC_D2_PT_1_IN4
    );
  NlwInverterBlock_i2c_ctrl_sm_stop_MC_D2_PT_1_IN5 : X_INV
    port map (
      I => i2c_ctrl_sm_stop,
      O => NlwInverterSignal_i2c_ctrl_sm_stop_MC_D2_PT_1_IN5
    );
  NlwInverterBlock_i2c_ctrl_sm_stop_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => i2c_ctrl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_sm_stop_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_i2c_ctrl_sm_stop_MC_D2_PT_2_IN5 : X_INV
    port map (
      I => i2c_ctrl_arb_lost,
      O => NlwInverterSignal_i2c_ctrl_sm_stop_MC_D2_PT_2_IN5
    );
  NlwInverterBlock_i2c_ctrl_sm_stop_MC_D2_PT_2_IN6 : X_INV
    port map (
      I => i2c_ctrl_sm_stop,
      O => NlwInverterSignal_i2c_ctrl_sm_stop_MC_D2_PT_2_IN6
    );
  NlwInverterBlock_i2c_ctrl_bus_busy_MC_CE_PT_0_IN0 : X_INV
    port map (
      I => N_PZ_892,
      O => NlwInverterSignal_i2c_ctrl_bus_busy_MC_CE_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_bus_busy_MC_CE_PT_0_IN1 : X_INV
    port map (
      I => N_PZ_892,
      O => NlwInverterSignal_i2c_ctrl_bus_busy_MC_CE_PT_0_IN1
    );
  NlwInverterBlock_i2c_ctrl_bus_busy_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_detect_stop,
      O => NlwInverterSignal_i2c_ctrl_bus_busy_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_bus_busy_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => i2c_ctrl_detect_stop,
      O => NlwInverterSignal_i2c_ctrl_bus_busy_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_N_PZ_892_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_detect_start,
      O => NlwInverterSignal_N_PZ_892_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_N_PZ_892_MC_D1_PT_0_IN1 : X_INV
    port map (
      I => i2c_ctrl_detect_stop,
      O => NlwInverterSignal_N_PZ_892_MC_D1_PT_0_IN1
    );
  NlwInverterBlock_i2c_ctrl_gen_start_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_detect_start,
      O => NlwInverterSignal_i2c_ctrl_gen_start_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_gen_start_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => i2c_ctrl_msta_d1,
      O => NlwInverterSignal_i2c_ctrl_gen_start_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_FOOBAR7_ctinst_5_IN0 : X_INV
    port map (
      I => uc_ctrl_men,
      O => NlwInverterSignal_FOOBAR7_ctinst_5_IN0
    );
  NlwInverterBlock_FOOBAR7_ctinst_5_IN1 : X_INV
    port map (
      I => uc_ctrl_men,
      O => NlwInverterSignal_FOOBAR7_ctinst_5_IN1
    );
  NlwInverterBlock_FOOBAR7_ctinst_6_IN0 : X_INV
    port map (
      I => uc_ctrl_men,
      O => NlwInverterSignal_FOOBAR7_ctinst_6_IN0
    );
  NlwInverterBlock_FOOBAR7_ctinst_6_IN1 : X_INV
    port map (
      I => uc_ctrl_men,
      O => NlwInverterSignal_FOOBAR7_ctinst_6_IN1
    );
  NlwInverterBlock_i2c_ctrl_master_sda_MC_D2_PT_0_IN2 : X_INV
    port map (
      I => i2c_ctrl_shift_out,
      O => NlwInverterSignal_i2c_ctrl_master_sda_MC_D2_PT_0_IN2
    );
  NlwInverterBlock_i2c_ctrl_master_sda_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => i2c_ctrl_state_ffd2,
      O => NlwInverterSignal_i2c_ctrl_master_sda_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_i2c_ctrl_master_sda_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => n7426,
      O => NlwInverterSignal_i2c_ctrl_master_sda_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_i2c_ctrl_master_sda_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => uc_ctrl_txak,
      O => NlwInverterSignal_i2c_ctrl_master_sda_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_i2c_ctrl_master_sda_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => i2c_ctrl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_master_sda_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_i2c_ctrl_master_sda_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => n7426,
      O => NlwInverterSignal_i2c_ctrl_master_sda_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_i2c_ctrl_master_sda_MC_D2_PT_2_IN4 : X_INV
    port map (
      I => i2c_ctrl_shift_out,
      O => NlwInverterSignal_i2c_ctrl_master_sda_MC_D2_PT_2_IN4
    );
  NlwInverterBlock_i2c_ctrl_master_sda_MC_XOR_IN0 : X_INV
    port map (
      I => i2c_ctrl_master_sda_MC_D1,
      O => NlwInverterSignal_i2c_ctrl_master_sda_MC_XOR_IN0
    );
  NlwInverterBlock_FOOBAR9_ctinst_5_IN0 : X_INV
    port map (
      I => uc_ctrl_men,
      O => NlwInverterSignal_FOOBAR9_ctinst_5_IN0
    );
  NlwInverterBlock_FOOBAR9_ctinst_5_IN1 : X_INV
    port map (
      I => uc_ctrl_men,
      O => NlwInverterSignal_FOOBAR9_ctinst_5_IN1
    );
  NlwInverterBlock_i2c_ctrl_shift_out_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => i2c_ctrl_shift_reg_ld,
      O => NlwInverterSignal_i2c_ctrl_shift_out_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_i2c_ctrl_shift_out_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => i2c_ctrl_shift_reg_ld,
      O => NlwInverterSignal_i2c_ctrl_shift_out_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_i2c_ctrl_shift_out_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => i2c_ctrl_shift_reg_en,
      O => NlwInverterSignal_i2c_ctrl_shift_out_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_ld_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => i2c_ctrl_detect_start,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_ld_MC_D2_PT_0_IN2 : X_INV
    port map (
      I => i2c_ctrl_state_ffd2,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_0_IN2
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_ld_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => i2c_ctrl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_ld_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => i2c_ctrl_master_slave,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_ld_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => i2c_ctrl_detect_start,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_ld_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => i2c_ctrl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_ld_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => i2c_ctrl_detect_start,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_ld_MC_D2_PT_2_IN2 : X_INV
    port map (
      I => n7426,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_2_IN2
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_ld_MC_D2_PT_3_IN0 : X_INV
    port map (
      I => i2c_ctrl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_3_IN0
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_ld_MC_D2_PT_3_IN1 : X_INV
    port map (
      I => i2c_ctrl_master_slave,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_3_IN1
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_ld_MC_D2_PT_3_IN2 : X_INV
    port map (
      I => i2c_ctrl_detect_start,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_3_IN2
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_ld_MC_D2_PT_3_IN3 : X_INV
    port map (
      I => i2c_ctrl_i2c_header(0),
      O => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_3_IN3
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_ld_MC_D2_PT_4_IN1 : X_INV
    port map (
      I => i2c_ctrl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_4_IN1
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_ld_MC_D2_PT_4_IN3 : X_INV
    port map (
      I => i2c_ctrl_detect_start,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_4_IN3
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_ld_MC_D2_PT_4_IN4 : X_INV
    port map (
      I => uc_ctrl_mtx,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_D2_PT_4_IN4
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_ld_MC_XOR_IN0 : X_INV
    port map (
      I => i2c_ctrl_shift_reg_ld_MC_D1,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_ld_MC_XOR_IN0
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_7_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => data_bus_7_II_UIM,
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_7_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_7_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => uc_ctrl_mbdr_micro(7),
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_7_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_7_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => N_PZ_564,
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_7_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_7_MC_XOR_IN0 : X_INV
    port map (
      I => uc_ctrl_mbdr_micro_7_MC_D1,
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_7_MC_XOR_IN0
    );
  NlwInverterBlock_N_PZ_564_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => r_w_II_UIM,
      O => NlwInverterSignal_N_PZ_564_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_uc_ctrl_data_en_MC_D1_PT_0_IN1 : X_INV
    port map (
      I => addr_bus_1_II_UIM,
      O => NlwInverterSignal_uc_ctrl_data_en_MC_D1_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_data_en_MC_D1_PT_0_IN3 : X_INV
    port map (
      I => addr_bus_3_II_UIM,
      O => NlwInverterSignal_uc_ctrl_data_en_MC_D1_PT_0_IN3
    );
  NlwInverterBlock_uc_ctrl_data_en_MC_D1_PT_0_IN5 : X_INV
    port map (
      I => addr_bus_5_II_UIM,
      O => NlwInverterSignal_uc_ctrl_data_en_MC_D1_PT_0_IN5
    );
  NlwInverterBlock_uc_ctrl_data_en_MC_D1_PT_0_IN6 : X_INV
    port map (
      I => addr_bus_6_II_UIM,
      O => NlwInverterSignal_uc_ctrl_data_en_MC_D1_PT_0_IN6
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_en_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_en_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_6_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => i2c_ctrl_shift_reg_ld,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_6_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_6_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => i2c_ctrl_shift_reg_ld,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_6_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_6_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => i2c_ctrl_shift_reg_en,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_6_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_6_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => data_bus_6_II_UIM,
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_6_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_6_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => N_PZ_564,
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_6_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_6_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => uc_ctrl_mbdr_micro(6),
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_6_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_6_MC_XOR_IN0 : X_INV
    port map (
      I => uc_ctrl_mbdr_micro_6_MC_D1,
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_6_MC_XOR_IN0
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_5_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => i2c_ctrl_shift_reg_ld,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_5_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_5_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => i2c_ctrl_shift_reg_ld,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_5_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_5_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => i2c_ctrl_shift_reg_en,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_5_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_5_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => data_bus_5_II_UIM,
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_5_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_5_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => N_PZ_564,
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_5_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_5_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => uc_ctrl_mbdr_micro(5),
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_5_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_5_MC_XOR_IN0 : X_INV
    port map (
      I => uc_ctrl_mbdr_micro_5_MC_D1,
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_5_MC_XOR_IN0
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_4_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => i2c_ctrl_shift_reg_ld,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_4_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_4_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => i2c_ctrl_shift_reg_ld,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_4_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_4_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => i2c_ctrl_shift_reg_en,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_4_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_4_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => data_bus_4_II_UIM,
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_4_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_4_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => N_PZ_564,
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_4_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_4_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => uc_ctrl_mbdr_micro(4),
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_4_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_4_MC_XOR_IN0 : X_INV
    port map (
      I => uc_ctrl_mbdr_micro_4_MC_D1,
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_4_MC_XOR_IN0
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_3_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => i2c_ctrl_shift_reg_ld,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_3_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_3_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => i2c_ctrl_shift_reg_ld,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_3_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_3_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => i2c_ctrl_shift_reg_en,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_3_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_3_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => data_bus_3_II_UIM,
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_3_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_3_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => N_PZ_564,
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_3_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_3_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => uc_ctrl_mbdr_micro(3),
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_3_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_3_MC_XOR_IN0 : X_INV
    port map (
      I => uc_ctrl_mbdr_micro_3_MC_D1,
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_3_MC_XOR_IN0
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_2_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => i2c_ctrl_shift_reg_ld,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_2_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_2_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => i2c_ctrl_shift_reg_ld,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_2_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_2_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => i2c_ctrl_shift_reg_en,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_2_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_2_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => data_bus_2_II_UIM,
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_2_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_2_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => N_PZ_564,
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_2_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_2_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => uc_ctrl_mbdr_micro(2),
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_2_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_2_MC_XOR_IN0 : X_INV
    port map (
      I => uc_ctrl_mbdr_micro_2_MC_D1,
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_2_MC_XOR_IN0
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_1_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => i2c_ctrl_shift_reg_ld,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_1_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_1_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => i2c_ctrl_shift_reg_ld,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_1_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_1_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => i2c_ctrl_shift_reg_en,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_1_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_1_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => data_bus_1_II_UIM,
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_1_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_1_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => N_PZ_564,
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_1_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_1_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => uc_ctrl_mbdr_micro(1),
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_1_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_1_MC_XOR_IN0 : X_INV
    port map (
      I => uc_ctrl_mbdr_micro_1_MC_D1,
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_1_MC_XOR_IN0
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_0_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => i2c_ctrl_shift_reg_ld,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_0_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_0_MC_D2_PT_1_IN2 : X_INV
    port map (
      I => i2c_ctrl_shift_reg_en,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_0_MC_D2_PT_1_IN2
    );
  NlwInverterBlock_i2c_ctrl_shift_reg_0_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => i2c_ctrl_shift_reg_ld,
      O => NlwInverterSignal_i2c_ctrl_shift_reg_0_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_0_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => uc_ctrl_mbdr_micro(0),
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_0_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_0_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => N_PZ_564,
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_0_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_0_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => data_bus_0_II_UIM,
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_0_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_uc_ctrl_mbdr_micro_0_MC_XOR_IN0 : X_INV
    port map (
      I => uc_ctrl_mbdr_micro_0_MC_D1,
      O => NlwInverterSignal_uc_ctrl_mbdr_micro_0_MC_XOR_IN0
    );
  NlwInverterBlock_uc_ctrl_txak_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => data_bus_3_II_UIM,
      O => NlwInverterSignal_uc_ctrl_txak_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_txak_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => N_PZ_569,
      O => NlwInverterSignal_uc_ctrl_txak_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_uc_ctrl_txak_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => uc_ctrl_txak,
      O => NlwInverterSignal_uc_ctrl_txak_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_uc_ctrl_txak_MC_XOR_IN0 : X_INV
    port map (
      I => uc_ctrl_txak_MC_D1,
      O => NlwInverterSignal_uc_ctrl_txak_MC_XOR_IN0
    );
  NlwInverterBlock_i2c_ctrl_slave_sda_MC_D2_PT_0_IN2 : X_INV
    port map (
      I => i2c_ctrl_state_ffd2,
      O => NlwInverterSignal_i2c_ctrl_slave_sda_MC_D2_PT_0_IN2
    );
  NlwInverterBlock_i2c_ctrl_slave_sda_MC_D2_PT_0_IN3 : X_INV
    port map (
      I => uc_ctrl_txak,
      O => NlwInverterSignal_i2c_ctrl_slave_sda_MC_D2_PT_0_IN3
    );
  NlwInverterBlock_i2c_ctrl_slave_sda_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => i2c_ctrl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_slave_sda_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_i2c_ctrl_slave_sda_MC_D2_PT_1_IN3 : X_INV
    port map (
      I => i2c_ctrl_shift_out,
      O => NlwInverterSignal_i2c_ctrl_slave_sda_MC_D2_PT_1_IN3
    );
  NlwInverterBlock_i2c_ctrl_slave_sda_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => i2c_ctrl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_slave_sda_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_i2c_ctrl_slave_sda_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => uc_ctrl_txak,
      O => NlwInverterSignal_i2c_ctrl_slave_sda_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_i2c_ctrl_slave_sda_MC_XOR_IN0 : X_INV
    port map (
      I => i2c_ctrl_slave_sda_MC_D1,
      O => NlwInverterSignal_i2c_ctrl_slave_sda_MC_XOR_IN0
    );
  NlwInverterBlock_i2c_ctrl_maas_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => i2c_ctrl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_maas_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_i2c_ctrl_maas_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => i2c_ctrl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_maas_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_i2c_ctrl_maas_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => uc_ctrl_ds_int_MC_COMB,
      O => NlwInverterSignal_i2c_ctrl_maas_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_i2c_ctrl_maas_MC_D2_PT_2_IN4 : X_INV
    port map (
      I => i2c_ctrl_maas,
      O => NlwInverterSignal_i2c_ctrl_maas_MC_D2_PT_2_IN4
    );
  NlwInverterBlock_i2c_ctrl_maas_MC_D2_PT_2_IN5 : X_INV
    port map (
      I => uc_ctrl_mbcr_wr,
      O => NlwInverterSignal_i2c_ctrl_maas_MC_D2_PT_2_IN5
    );
  NlwInverterBlock_uc_ctrl_mbcr_wr_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => uc_ctrl_prs_state_ffd1,
      O => NlwInverterSignal_uc_ctrl_mbcr_wr_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_uc_ctrl_mbcr_wr_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => uc_ctrl_prs_state_ffd2,
      O => NlwInverterSignal_uc_ctrl_mbcr_wr_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_i2c_ctrl_i2c_header_en_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_state_ffd3,
      O => NlwInverterSignal_i2c_ctrl_i2c_header_en_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_i2c_header_en_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => i2c_ctrl_detect_start,
      O => NlwInverterSignal_i2c_ctrl_i2c_header_en_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_i2c_ctrl_i2c_header_en_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => i2c_ctrl_detect_start,
      O => NlwInverterSignal_i2c_ctrl_i2c_header_en_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_i2c_ctrl_i2c_header_en_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => n7426,
      O => NlwInverterSignal_i2c_ctrl_i2c_header_en_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_i2c_ctrl_i2c_header_en_MC_XOR_IN0 : X_INV
    port map (
      I => i2c_ctrl_i2c_header_en_MC_D1,
      O => NlwInverterSignal_i2c_ctrl_i2c_header_en_MC_XOR_IN0
    );
  NlwInverterBlock_uc_ctrl_madr_2_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => data_bus_2_II_UIM,
      O => NlwInverterSignal_uc_ctrl_madr_2_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_uc_ctrl_madr_2_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => uc_ctrl_madr(2),
      O => NlwInverterSignal_uc_ctrl_madr_2_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_uc_ctrl_madr_2_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => N_PZ_565,
      O => NlwInverterSignal_uc_ctrl_madr_2_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_uc_ctrl_madr_2_MC_XOR_IN0 : X_INV
    port map (
      I => uc_ctrl_madr_2_MC_D1,
      O => NlwInverterSignal_uc_ctrl_madr_2_MC_XOR_IN0
    );
  NlwInverterBlock_uc_ctrl_madr_3_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => uc_ctrl_madr(3),
      O => NlwInverterSignal_uc_ctrl_madr_3_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_uc_ctrl_madr_3_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => N_PZ_565,
      O => NlwInverterSignal_uc_ctrl_madr_3_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_madr_3_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => data_bus_3_II_UIM,
      O => NlwInverterSignal_uc_ctrl_madr_3_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_uc_ctrl_madr_3_MC_XOR_IN0 : X_INV
    port map (
      I => uc_ctrl_madr_3_MC_D1,
      O => NlwInverterSignal_uc_ctrl_madr_3_MC_XOR_IN0
    );
  NlwInverterBlock_uc_ctrl_madr_4_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => uc_ctrl_madr(4),
      O => NlwInverterSignal_uc_ctrl_madr_4_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_uc_ctrl_madr_4_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => N_PZ_565,
      O => NlwInverterSignal_uc_ctrl_madr_4_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_madr_4_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => data_bus_4_II_UIM,
      O => NlwInverterSignal_uc_ctrl_madr_4_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_uc_ctrl_madr_4_MC_XOR_IN0 : X_INV
    port map (
      I => uc_ctrl_madr_4_MC_D1,
      O => NlwInverterSignal_uc_ctrl_madr_4_MC_XOR_IN0
    );
  NlwInverterBlock_uc_ctrl_madr_5_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => data_bus_5_II_UIM,
      O => NlwInverterSignal_uc_ctrl_madr_5_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_uc_ctrl_madr_5_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => uc_ctrl_madr(5),
      O => NlwInverterSignal_uc_ctrl_madr_5_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_uc_ctrl_madr_5_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => N_PZ_565,
      O => NlwInverterSignal_uc_ctrl_madr_5_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_uc_ctrl_madr_5_MC_XOR_IN0 : X_INV
    port map (
      I => uc_ctrl_madr_5_MC_D1,
      O => NlwInverterSignal_uc_ctrl_madr_5_MC_XOR_IN0
    );
  NlwInverterBlock_uc_ctrl_madr_6_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => uc_ctrl_madr(6),
      O => NlwInverterSignal_uc_ctrl_madr_6_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_uc_ctrl_madr_6_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => N_PZ_565,
      O => NlwInverterSignal_uc_ctrl_madr_6_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_madr_6_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => data_bus_6_II_UIM,
      O => NlwInverterSignal_uc_ctrl_madr_6_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_uc_ctrl_madr_6_MC_XOR_IN0 : X_INV
    port map (
      I => uc_ctrl_madr_6_MC_D1,
      O => NlwInverterSignal_uc_ctrl_madr_6_MC_XOR_IN0
    );
  NlwInverterBlock_uc_ctrl_madr_7_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => uc_ctrl_madr(7),
      O => NlwInverterSignal_uc_ctrl_madr_7_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_uc_ctrl_madr_7_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => N_PZ_565,
      O => NlwInverterSignal_uc_ctrl_madr_7_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_madr_7_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => data_bus_7_II_UIM,
      O => NlwInverterSignal_uc_ctrl_madr_7_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_uc_ctrl_madr_7_MC_XOR_IN0 : X_INV
    port map (
      I => uc_ctrl_madr_7_MC_D1,
      O => NlwInverterSignal_uc_ctrl_madr_7_MC_XOR_IN0
    );
  NlwInverterBlock_N_PZ_562_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => r_w_II_UIM,
      O => NlwInverterSignal_N_PZ_562_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_N_PZ_562_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => r_w_II_UIM,
      O => NlwInverterSignal_N_PZ_562_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_N_PZ_562_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => N_PZ_665,
      O => NlwInverterSignal_N_PZ_562_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_N_PZ_562_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => N_PZ_665,
      O => NlwInverterSignal_N_PZ_562_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_N_PZ_562_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => uc_ctrl_data_en,
      O => NlwInverterSignal_N_PZ_562_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_N_PZ_562_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => uc_ctrl_stat_en,
      O => NlwInverterSignal_N_PZ_562_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_N_PZ_562_MC_D2_PT_2_IN2 : X_INV
    port map (
      I => uc_ctrl_cntrl_en,
      O => NlwInverterSignal_N_PZ_562_MC_D2_PT_2_IN2
    );
  NlwInverterBlock_N_PZ_562_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => uc_ctrl_addr_en,
      O => NlwInverterSignal_N_PZ_562_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_uc_ctrl_stat_en_MC_D1_PT_0_IN2 : X_INV
    port map (
      I => addr_bus_2_II_UIM,
      O => NlwInverterSignal_uc_ctrl_stat_en_MC_D1_PT_0_IN2
    );
  NlwInverterBlock_uc_ctrl_stat_en_MC_D1_PT_0_IN3 : X_INV
    port map (
      I => addr_bus_3_II_UIM,
      O => NlwInverterSignal_uc_ctrl_stat_en_MC_D1_PT_0_IN3
    );
  NlwInverterBlock_uc_ctrl_stat_en_MC_D1_PT_0_IN5 : X_INV
    port map (
      I => addr_bus_5_II_UIM,
      O => NlwInverterSignal_uc_ctrl_stat_en_MC_D1_PT_0_IN5
    );
  NlwInverterBlock_uc_ctrl_stat_en_MC_D1_PT_0_IN6 : X_INV
    port map (
      I => addr_bus_6_II_UIM,
      O => NlwInverterSignal_uc_ctrl_stat_en_MC_D1_PT_0_IN6
    );
  NlwInverterBlock_i2c_ctrl_rxak_MC_CE_PT_0_IN1 : X_INV
    port map (
      I => n7426,
      O => NlwInverterSignal_i2c_ctrl_rxak_MC_CE_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_madr_0_MC_D1_PT_0_IN1 : X_INV
    port map (
      I => N_PZ_565,
      O => NlwInverterSignal_uc_ctrl_madr_0_MC_D1_PT_0_IN1
    );
  NlwInverterBlock_data_bus_1_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => uc_ctrl_data_en,
      O => NlwInverterSignal_data_bus_1_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_data_bus_1_MC_D2_PT_3_IN3 : X_INV
    port map (
      I => uc_ctrl_data_en,
      O => NlwInverterSignal_data_bus_1_MC_D2_PT_3_IN3
    );
  NlwInverterBlock_data_bus_1_MC_D2_PT_3_IN4 : X_INV
    port map (
      I => uc_ctrl_stat_en,
      O => NlwInverterSignal_data_bus_1_MC_D2_PT_3_IN4
    );
  NlwInverterBlock_data_bus_1_MC_D2_PT_3_IN5 : X_INV
    port map (
      I => uc_ctrl_cntrl_en,
      O => NlwInverterSignal_data_bus_1_MC_D2_PT_3_IN5
    );
  NlwInverterBlock_i2c_ctrl_mif_MC_CE_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_n0171,
      O => NlwInverterSignal_i2c_ctrl_mif_MC_CE_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_mif_MC_CE_PT_0_IN1 : X_INV
    port map (
      I => i2c_ctrl_n0171,
      O => NlwInverterSignal_i2c_ctrl_mif_MC_CE_PT_0_IN1
    );
  NlwInverterBlock_i2c_ctrl_mif_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => uc_ctrl_mif_bit_reset,
      O => NlwInverterSignal_i2c_ctrl_mif_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_mif_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => uc_ctrl_mif_bit_reset,
      O => NlwInverterSignal_i2c_ctrl_mif_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_mif_bit_reset_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => uc_ctrl_stat_en,
      O => NlwInverterSignal_uc_ctrl_mif_bit_reset_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_uc_ctrl_mif_bit_reset_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => uc_ctrl_mif_bit_reset,
      O => NlwInverterSignal_uc_ctrl_mif_bit_reset_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_mif_bit_reset_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => uc_ctrl_mif_bit_reset,
      O => NlwInverterSignal_uc_ctrl_mif_bit_reset_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_uc_ctrl_mif_bit_reset_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => N_PZ_665,
      O => NlwInverterSignal_uc_ctrl_mif_bit_reset_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_uc_ctrl_mif_bit_reset_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => uc_ctrl_mif_bit_reset,
      O => NlwInverterSignal_uc_ctrl_mif_bit_reset_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_uc_ctrl_mif_bit_reset_MC_XOR_IN0 : X_INV
    port map (
      I => uc_ctrl_mif_bit_reset_MC_D1,
      O => NlwInverterSignal_uc_ctrl_mif_bit_reset_MC_XOR_IN0
    );
  NlwInverterBlock_i2c_ctrl_n0171_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => uc_ctrl_mif_bit_reset,
      O => NlwInverterSignal_i2c_ctrl_n0171_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_n0171_MC_D1_PT_0_IN1 : X_INV
    port map (
      I => mcf_MC_UIM,
      O => NlwInverterSignal_i2c_ctrl_n0171_MC_D1_PT_0_IN1
    );
  NlwInverterBlock_i2c_ctrl_n0171_MC_D1_PT_0_IN2 : X_INV
    port map (
      I => i2c_ctrl_mal,
      O => NlwInverterSignal_i2c_ctrl_n0171_MC_D1_PT_0_IN2
    );
  NlwInverterBlock_i2c_ctrl_n0171_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_master_slave,
      O => NlwInverterSignal_i2c_ctrl_n0171_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_n0171_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => i2c_ctrl_i2c_header(0),
      O => NlwInverterSignal_i2c_ctrl_n0171_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_i2c_ctrl_n0171_MC_D2_PT_0_IN2 : X_INV
    port map (
      I => uc_ctrl_mif_bit_reset,
      O => NlwInverterSignal_i2c_ctrl_n0171_MC_D2_PT_0_IN2
    );
  NlwInverterBlock_i2c_ctrl_n0171_MC_D2_PT_0_IN3 : X_INV
    port map (
      I => mcf_MC_UIM,
      O => NlwInverterSignal_i2c_ctrl_n0171_MC_D2_PT_0_IN3
    );
  NlwInverterBlock_i2c_ctrl_n0171_MC_D2_PT_0_IN4 : X_INV
    port map (
      I => i2c_ctrl_mal,
      O => NlwInverterSignal_i2c_ctrl_n0171_MC_D2_PT_0_IN4
    );
  NlwInverterBlock_mcf_MC_D1_PT_0_IN3 : X_INV
    port map (
      I => i2c_ctrl_n0159,
      O => NlwInverterSignal_mcf_MC_D1_PT_0_IN3
    );
  NlwInverterBlock_i2c_ctrl_mal_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => uc_ctrl_mal_bit_reset,
      O => NlwInverterSignal_i2c_ctrl_mal_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_i2c_ctrl_mal_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => uc_ctrl_mal_bit_reset,
      O => NlwInverterSignal_i2c_ctrl_mal_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_mal_bit_reset_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => uc_ctrl_stat_en,
      O => NlwInverterSignal_uc_ctrl_mal_bit_reset_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_uc_ctrl_mal_bit_reset_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => uc_ctrl_mal_bit_reset,
      O => NlwInverterSignal_uc_ctrl_mal_bit_reset_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_mal_bit_reset_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => N_PZ_665,
      O => NlwInverterSignal_uc_ctrl_mal_bit_reset_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_uc_ctrl_mal_bit_reset_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => uc_ctrl_mal_bit_reset,
      O => NlwInverterSignal_uc_ctrl_mal_bit_reset_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_uc_ctrl_mal_bit_reset_MC_D2_PT_2_IN1 : X_INV
    port map (
      I => uc_ctrl_mal_bit_reset,
      O => NlwInverterSignal_uc_ctrl_mal_bit_reset_MC_D2_PT_2_IN1
    );
  NlwInverterBlock_uc_ctrl_mal_bit_reset_MC_XOR_IN0 : X_INV
    port map (
      I => uc_ctrl_mal_bit_reset_MC_D1,
      O => NlwInverterSignal_uc_ctrl_mal_bit_reset_MC_XOR_IN0
    );
  NlwInverterBlock_i2c_ctrl_n0170_MC_D2_PT_2_IN0 : X_INV
    port map (
      I => i2c_ctrl_master_slave,
      O => NlwInverterSignal_i2c_ctrl_n0170_MC_D2_PT_2_IN0
    );
  NlwInverterBlock_i2c_ctrl_n0170_MC_D2_PT_4_IN1 : X_INV
    port map (
      I => i2c_ctrl_gen_stop,
      O => NlwInverterSignal_i2c_ctrl_n0170_MC_D2_PT_4_IN1
    );
  NlwInverterBlock_i2c_ctrl_n0170_MC_D2_PT_4_IN2 : X_INV
    port map (
      I => i2c_ctrl_sm_stop,
      O => NlwInverterSignal_i2c_ctrl_n0170_MC_D2_PT_4_IN2
    );
  NlwInverterBlock_data_bus_2_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => data_bus_2_MC_UIM,
      O => NlwInverterSignal_data_bus_2_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_data_bus_2_MC_D2_PT_1_IN4 : X_INV
    port map (
      I => i2c_ctrl_mbdr_i2c(2),
      O => NlwInverterSignal_data_bus_2_MC_D2_PT_1_IN4
    );
  NlwInverterBlock_data_bus_2_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => uc_ctrl_data_en,
      O => NlwInverterSignal_data_bus_2_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_data_bus_2_MC_D2_PT_2_IN5 : X_INV
    port map (
      I => i2c_ctrl_srw,
      O => NlwInverterSignal_data_bus_2_MC_D2_PT_2_IN5
    );
  NlwInverterBlock_data_bus_2_MC_D2_PT_3_IN3 : X_INV
    port map (
      I => uc_ctrl_data_en,
      O => NlwInverterSignal_data_bus_2_MC_D2_PT_3_IN3
    );
  NlwInverterBlock_data_bus_2_MC_D2_PT_3_IN4 : X_INV
    port map (
      I => uc_ctrl_stat_en,
      O => NlwInverterSignal_data_bus_2_MC_D2_PT_3_IN4
    );
  NlwInverterBlock_data_bus_2_MC_D2_PT_3_IN6 : X_INV
    port map (
      I => uc_ctrl_rsta,
      O => NlwInverterSignal_data_bus_2_MC_D2_PT_3_IN6
    );
  NlwInverterBlock_data_bus_2_MC_D2_PT_4_IN3 : X_INV
    port map (
      I => uc_ctrl_data_en,
      O => NlwInverterSignal_data_bus_2_MC_D2_PT_4_IN3
    );
  NlwInverterBlock_data_bus_2_MC_D2_PT_4_IN4 : X_INV
    port map (
      I => uc_ctrl_stat_en,
      O => NlwInverterSignal_data_bus_2_MC_D2_PT_4_IN4
    );
  NlwInverterBlock_data_bus_2_MC_D2_PT_4_IN5 : X_INV
    port map (
      I => uc_ctrl_cntrl_en,
      O => NlwInverterSignal_data_bus_2_MC_D2_PT_4_IN5
    );
  NlwInverterBlock_data_bus_2_MC_D2_PT_4_IN7 : X_INV
    port map (
      I => uc_ctrl_madr(2),
      O => NlwInverterSignal_data_bus_2_MC_D2_PT_4_IN7
    );
  NlwInverterBlock_data_bus_2_MC_XOR_IN0 : X_INV
    port map (
      I => data_bus_2_MC_D1,
      O => NlwInverterSignal_data_bus_2_MC_XOR_IN0
    );
  NlwInverterBlock_i2c_ctrl_srw_MC_CE_PT_0_IN1 : X_INV
    port map (
      I => i2c_ctrl_state_ffd1,
      O => NlwInverterSignal_i2c_ctrl_srw_MC_CE_PT_0_IN1
    );
  NlwInverterBlock_data_bus_3_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => uc_ctrl_data_en,
      O => NlwInverterSignal_data_bus_3_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_data_bus_3_MC_D2_PT_2_IN4 : X_INV
    port map (
      I => uc_ctrl_stat_en,
      O => NlwInverterSignal_data_bus_3_MC_D2_PT_2_IN4
    );
  NlwInverterBlock_data_bus_3_MC_D2_PT_3_IN3 : X_INV
    port map (
      I => uc_ctrl_data_en,
      O => NlwInverterSignal_data_bus_3_MC_D2_PT_3_IN3
    );
  NlwInverterBlock_data_bus_3_MC_D2_PT_3_IN4 : X_INV
    port map (
      I => uc_ctrl_stat_en,
      O => NlwInverterSignal_data_bus_3_MC_D2_PT_3_IN4
    );
  NlwInverterBlock_data_bus_3_MC_D2_PT_3_IN5 : X_INV
    port map (
      I => uc_ctrl_cntrl_en,
      O => NlwInverterSignal_data_bus_3_MC_D2_PT_3_IN5
    );
  NlwInverterBlock_data_bus_4_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => data_bus_4_MC_UIM,
      O => NlwInverterSignal_data_bus_4_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_data_bus_4_MC_D2_PT_1_IN4 : X_INV
    port map (
      I => i2c_ctrl_mbdr_i2c(4),
      O => NlwInverterSignal_data_bus_4_MC_D2_PT_1_IN4
    );
  NlwInverterBlock_data_bus_4_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => uc_ctrl_data_en,
      O => NlwInverterSignal_data_bus_4_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_data_bus_4_MC_D2_PT_2_IN5 : X_INV
    port map (
      I => i2c_ctrl_mal,
      O => NlwInverterSignal_data_bus_4_MC_D2_PT_2_IN5
    );
  NlwInverterBlock_data_bus_4_MC_D2_PT_3_IN3 : X_INV
    port map (
      I => uc_ctrl_data_en,
      O => NlwInverterSignal_data_bus_4_MC_D2_PT_3_IN3
    );
  NlwInverterBlock_data_bus_4_MC_D2_PT_3_IN4 : X_INV
    port map (
      I => uc_ctrl_stat_en,
      O => NlwInverterSignal_data_bus_4_MC_D2_PT_3_IN4
    );
  NlwInverterBlock_data_bus_4_MC_D2_PT_3_IN6 : X_INV
    port map (
      I => uc_ctrl_mtx,
      O => NlwInverterSignal_data_bus_4_MC_D2_PT_3_IN6
    );
  NlwInverterBlock_data_bus_4_MC_D2_PT_4_IN3 : X_INV
    port map (
      I => uc_ctrl_data_en,
      O => NlwInverterSignal_data_bus_4_MC_D2_PT_4_IN3
    );
  NlwInverterBlock_data_bus_4_MC_D2_PT_4_IN4 : X_INV
    port map (
      I => uc_ctrl_stat_en,
      O => NlwInverterSignal_data_bus_4_MC_D2_PT_4_IN4
    );
  NlwInverterBlock_data_bus_4_MC_D2_PT_4_IN5 : X_INV
    port map (
      I => uc_ctrl_cntrl_en,
      O => NlwInverterSignal_data_bus_4_MC_D2_PT_4_IN5
    );
  NlwInverterBlock_data_bus_4_MC_D2_PT_4_IN7 : X_INV
    port map (
      I => uc_ctrl_madr(4),
      O => NlwInverterSignal_data_bus_4_MC_D2_PT_4_IN7
    );
  NlwInverterBlock_data_bus_4_MC_XOR_IN0 : X_INV
    port map (
      I => data_bus_4_MC_D1,
      O => NlwInverterSignal_data_bus_4_MC_XOR_IN0
    );
  NlwInverterBlock_data_bus_5_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => data_bus_5_MC_UIM,
      O => NlwInverterSignal_data_bus_5_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_data_bus_5_MC_D2_PT_1_IN4 : X_INV
    port map (
      I => i2c_ctrl_mbdr_i2c(5),
      O => NlwInverterSignal_data_bus_5_MC_D2_PT_1_IN4
    );
  NlwInverterBlock_data_bus_5_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => uc_ctrl_data_en,
      O => NlwInverterSignal_data_bus_5_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_data_bus_5_MC_D2_PT_2_IN5 : X_INV
    port map (
      I => i2c_ctrl_bus_busy,
      O => NlwInverterSignal_data_bus_5_MC_D2_PT_2_IN5
    );
  NlwInverterBlock_data_bus_5_MC_D2_PT_3_IN3 : X_INV
    port map (
      I => uc_ctrl_data_en,
      O => NlwInverterSignal_data_bus_5_MC_D2_PT_3_IN3
    );
  NlwInverterBlock_data_bus_5_MC_D2_PT_3_IN4 : X_INV
    port map (
      I => uc_ctrl_stat_en,
      O => NlwInverterSignal_data_bus_5_MC_D2_PT_3_IN4
    );
  NlwInverterBlock_data_bus_5_MC_D2_PT_3_IN6 : X_INV
    port map (
      I => uc_ctrl_msta,
      O => NlwInverterSignal_data_bus_5_MC_D2_PT_3_IN6
    );
  NlwInverterBlock_data_bus_5_MC_D2_PT_4_IN3 : X_INV
    port map (
      I => uc_ctrl_data_en,
      O => NlwInverterSignal_data_bus_5_MC_D2_PT_4_IN3
    );
  NlwInverterBlock_data_bus_5_MC_D2_PT_4_IN4 : X_INV
    port map (
      I => uc_ctrl_stat_en,
      O => NlwInverterSignal_data_bus_5_MC_D2_PT_4_IN4
    );
  NlwInverterBlock_data_bus_5_MC_D2_PT_4_IN5 : X_INV
    port map (
      I => uc_ctrl_cntrl_en,
      O => NlwInverterSignal_data_bus_5_MC_D2_PT_4_IN5
    );
  NlwInverterBlock_data_bus_5_MC_D2_PT_4_IN7 : X_INV
    port map (
      I => uc_ctrl_madr(5),
      O => NlwInverterSignal_data_bus_5_MC_D2_PT_4_IN7
    );
  NlwInverterBlock_data_bus_5_MC_XOR_IN0 : X_INV
    port map (
      I => data_bus_5_MC_D1,
      O => NlwInverterSignal_data_bus_5_MC_XOR_IN0
    );
  NlwInverterBlock_data_bus_6_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => data_bus_6_MC_UIM,
      O => NlwInverterSignal_data_bus_6_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_data_bus_6_MC_D2_PT_1_IN4 : X_INV
    port map (
      I => i2c_ctrl_mbdr_i2c(6),
      O => NlwInverterSignal_data_bus_6_MC_D2_PT_1_IN4
    );
  NlwInverterBlock_data_bus_6_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => uc_ctrl_data_en,
      O => NlwInverterSignal_data_bus_6_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_data_bus_6_MC_D2_PT_2_IN5 : X_INV
    port map (
      I => i2c_ctrl_maas,
      O => NlwInverterSignal_data_bus_6_MC_D2_PT_2_IN5
    );
  NlwInverterBlock_data_bus_6_MC_D2_PT_3_IN3 : X_INV
    port map (
      I => uc_ctrl_data_en,
      O => NlwInverterSignal_data_bus_6_MC_D2_PT_3_IN3
    );
  NlwInverterBlock_data_bus_6_MC_D2_PT_3_IN4 : X_INV
    port map (
      I => uc_ctrl_stat_en,
      O => NlwInverterSignal_data_bus_6_MC_D2_PT_3_IN4
    );
  NlwInverterBlock_data_bus_6_MC_D2_PT_3_IN6 : X_INV
    port map (
      I => uc_ctrl_mien,
      O => NlwInverterSignal_data_bus_6_MC_D2_PT_3_IN6
    );
  NlwInverterBlock_data_bus_6_MC_D2_PT_4_IN3 : X_INV
    port map (
      I => uc_ctrl_data_en,
      O => NlwInverterSignal_data_bus_6_MC_D2_PT_4_IN3
    );
  NlwInverterBlock_data_bus_6_MC_D2_PT_4_IN4 : X_INV
    port map (
      I => uc_ctrl_stat_en,
      O => NlwInverterSignal_data_bus_6_MC_D2_PT_4_IN4
    );
  NlwInverterBlock_data_bus_6_MC_D2_PT_4_IN5 : X_INV
    port map (
      I => uc_ctrl_cntrl_en,
      O => NlwInverterSignal_data_bus_6_MC_D2_PT_4_IN5
    );
  NlwInverterBlock_data_bus_6_MC_D2_PT_4_IN7 : X_INV
    port map (
      I => uc_ctrl_madr(6),
      O => NlwInverterSignal_data_bus_6_MC_D2_PT_4_IN7
    );
  NlwInverterBlock_data_bus_6_MC_XOR_IN0 : X_INV
    port map (
      I => data_bus_6_MC_D1,
      O => NlwInverterSignal_data_bus_6_MC_XOR_IN0
    );
  NlwInverterBlock_uc_ctrl_mien_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => data_bus_6_II_UIM,
      O => NlwInverterSignal_uc_ctrl_mien_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_uc_ctrl_mien_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => N_PZ_569,
      O => NlwInverterSignal_uc_ctrl_mien_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_uc_ctrl_mien_MC_D2_PT_1_IN1 : X_INV
    port map (
      I => uc_ctrl_mien,
      O => NlwInverterSignal_uc_ctrl_mien_MC_D2_PT_1_IN1
    );
  NlwInverterBlock_uc_ctrl_mien_MC_XOR_IN0 : X_INV
    port map (
      I => uc_ctrl_mien_MC_D1,
      O => NlwInverterSignal_uc_ctrl_mien_MC_XOR_IN0
    );
  NlwInverterBlock_data_bus_7_MC_D2_PT_0_IN1 : X_INV
    port map (
      I => data_bus_7_MC_UIM,
      O => NlwInverterSignal_data_bus_7_MC_D2_PT_0_IN1
    );
  NlwInverterBlock_data_bus_7_MC_D2_PT_1_IN4 : X_INV
    port map (
      I => i2c_ctrl_mbdr_i2c(7),
      O => NlwInverterSignal_data_bus_7_MC_D2_PT_1_IN4
    );
  NlwInverterBlock_data_bus_7_MC_D2_PT_2_IN3 : X_INV
    port map (
      I => uc_ctrl_data_en,
      O => NlwInverterSignal_data_bus_7_MC_D2_PT_2_IN3
    );
  NlwInverterBlock_data_bus_7_MC_D2_PT_2_IN5 : X_INV
    port map (
      I => mcf_MC_UIM,
      O => NlwInverterSignal_data_bus_7_MC_D2_PT_2_IN5
    );
  NlwInverterBlock_data_bus_7_MC_D2_PT_3_IN3 : X_INV
    port map (
      I => uc_ctrl_data_en,
      O => NlwInverterSignal_data_bus_7_MC_D2_PT_3_IN3
    );
  NlwInverterBlock_data_bus_7_MC_D2_PT_3_IN4 : X_INV
    port map (
      I => uc_ctrl_stat_en,
      O => NlwInverterSignal_data_bus_7_MC_D2_PT_3_IN4
    );
  NlwInverterBlock_data_bus_7_MC_D2_PT_3_IN6 : X_INV
    port map (
      I => uc_ctrl_men,
      O => NlwInverterSignal_data_bus_7_MC_D2_PT_3_IN6
    );
  NlwInverterBlock_data_bus_7_MC_D2_PT_4_IN3 : X_INV
    port map (
      I => uc_ctrl_data_en,
      O => NlwInverterSignal_data_bus_7_MC_D2_PT_4_IN3
    );
  NlwInverterBlock_data_bus_7_MC_D2_PT_4_IN4 : X_INV
    port map (
      I => uc_ctrl_stat_en,
      O => NlwInverterSignal_data_bus_7_MC_D2_PT_4_IN4
    );
  NlwInverterBlock_data_bus_7_MC_D2_PT_4_IN5 : X_INV
    port map (
      I => uc_ctrl_cntrl_en,
      O => NlwInverterSignal_data_bus_7_MC_D2_PT_4_IN5
    );
  NlwInverterBlock_data_bus_7_MC_D2_PT_4_IN7 : X_INV
    port map (
      I => uc_ctrl_madr(7),
      O => NlwInverterSignal_data_bus_7_MC_D2_PT_4_IN7
    );
  NlwInverterBlock_data_bus_7_MC_XOR_IN0 : X_INV
    port map (
      I => data_bus_7_MC_D1,
      O => NlwInverterSignal_data_bus_7_MC_XOR_IN0
    );
  NlwInverterBlock_dtack_MC_D1_PT_0_IN0 : X_INV
    port map (
      I => uc_ctrl_prs_state_ffd2,
      O => NlwInverterSignal_dtack_MC_D1_PT_0_IN0
    );
  NlwInverterBlock_dtack_MC_XOR_IN0 : X_INV
    port map (
      I => dtack_MC_D1,
      O => NlwInverterSignal_dtack_MC_XOR_IN0
    );
  NlwInverterBlock_irq_CTL : X_INV
    port map (
      I => irq_MC_Q,
      O => NlwInverterSignal_irq_CTL
    );
  NlwInverterBlock_irq_MC_XOR_IN0 : X_INV
    port map (
      I => irq_MC_D1,
      O => NlwInverterSignal_irq_MC_XOR_IN0
    );
  NlwInverterBlock_scl_CTL : X_INV
    port map (
      I => scl_MC_Q,
      O => NlwInverterSignal_scl_CTL
    );
  NlwInverterBlock_scl_MC_D2_PT_0_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd1,
      O => NlwInverterSignal_scl_MC_D2_PT_0_IN0
    );
  NlwInverterBlock_scl_MC_D2_PT_1_IN0 : X_INV
    port map (
      I => i2c_ctrl_scl_state_ffd3,
      O => NlwInverterSignal_scl_MC_D2_PT_1_IN0
    );
  NlwInverterBlock_scl_MC_XOR_IN0 : X_INV
    port map (
      I => scl_MC_D1,
      O => NlwInverterSignal_scl_MC_XOR_IN0
    );
  NlwInverterBlock_sda_CTL : X_INV
    port map (
      I => i2c_ctrl_sda_in_MC_Q,
      O => NlwInverterSignal_sda_CTL
    );
  NlwBlockROC : ROC generic map ( WIDTH => 100 ns)
     port map (O => PRLD);
end Structure;

