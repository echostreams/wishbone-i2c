onerror {resume}
quietly WaveActivateNextPane {} 0
virtual signal -install /micro_test_post/i2c_post_master { (context /micro_test_post/i2c_post_master )(uc_ctrl_madr_7_mc_q & uc_ctrl_madr_6_mc_q & uc_ctrl_madr_5_mc_q & uc_ctrl_madr_4_mc_q & uc_ctrl_madr_3_mc_q & uc_ctrl_madr_2_mc_q & uc_ctrl_madr_1_mc_q & uc_ctrl_madr_0_mc_q )} master_madr
virtual signal -install /micro_test_post/i2c_post_slave { (context /micro_test_post/i2c_post_slave )(uc_ctrl_madr_7_mc_q & uc_ctrl_madr_6_mc_q & uc_ctrl_madr_5_mc_q & uc_ctrl_madr_4_mc_q & uc_ctrl_madr_3_mc_q & uc_ctrl_madr_2_mc_q & uc_ctrl_madr_1_mc_q & uc_ctrl_madr_0_mc_q )} slave_madr
virtual signal -install /micro_test_post/i2c_post_master { (context /micro_test_post/i2c_post_master )(uc_ctrl_mbdr_micro_7_mc_q & uc_ctrl_mbdr_micro_6_mc_q & uc_ctrl_mbdr_micro_5_mc_q & uc_ctrl_mbdr_micro_4_mc_q & uc_ctrl_mbdr_micro_3_mc_q & uc_ctrl_mbdr_micro_2_mc_q & uc_ctrl_mbdr_micro_1_mc_q & uc_ctrl_mbdr_micro_0_mc_q )} master_mbdr_micro
virtual signal -install /micro_test_post/i2c_post_master { (context /micro_test_post/i2c_post_master )(i2c_ctrl_mbdr_i2c_7_mc_q & i2c_ctrl_mbdr_i2c_6_mc_q & i2c_ctrl_mbdr_i2c_5_mc_q & i2c_ctrl_mbdr_i2c_4_mc_q & i2c_ctrl_mbdr_i2c_3_mc_q & i2c_ctrl_mbdr_i2c_2_mc_q & i2c_ctrl_mbdr_i2c_1_mc_q & i2c_ctrl_mbdr_i2c_0_mc_q )} master_mbdr_i2c
virtual signal -install /micro_test_post/i2c_post_slave { (context /micro_test_post/i2c_post_slave )(uc_ctrl_mbdr_micro_7_mc_q & uc_ctrl_mbdr_micro_6_mc_q & uc_ctrl_mbdr_micro_5_mc_q & uc_ctrl_mbdr_micro_4_mc_q & uc_ctrl_mbdr_micro_3_mc_q & uc_ctrl_mbdr_micro_2_mc_q & uc_ctrl_mbdr_micro_1_mc_q & uc_ctrl_mbdr_micro_0_mc_q )} slave_mbdr_micro
virtual signal -install /micro_test_post/i2c_post_slave { (context /micro_test_post/i2c_post_slave )(i2c_ctrl_mbdr_i2c_7_mc_q & i2c_ctrl_mbdr_i2c_6_mc_q & i2c_ctrl_mbdr_i2c_5_mc_q & i2c_ctrl_mbdr_i2c_4_mc_q & i2c_ctrl_mbdr_i2c_3_mc_q & i2c_ctrl_mbdr_i2c_2_mc_q & i2c_ctrl_mbdr_i2c_1_mc_q & i2c_ctrl_mbdr_i2c_0_mc_q )} slave_mbdr_i2c
virtual signal -install /micro_test_post/i2c_post_master { (context /micro_test_post/i2c_post_master )(i2c_ctrl_scl_state_ffd3 & i2c_ctrl_scl_state_ffd2 & i2c_ctrl_scl_state_ffd1 )} master_i2c_ctrl_scl_state
virtual signal -install /micro_test_post/i2c_post_master { (context /micro_test_post/i2c_post_master )(i2c_ctrl_state_ffd3 & i2c_ctrl_state_ffd2 & i2c_ctrl_state_ffd1 )} master_i2c_ctrl_state
add wave -noupdate -color #ff0000 -format Logic /micro_test_post/m_reset
add wave -noupdate -color #ff8040 -format Logic /micro_test_post/s_reset
add wave -noupdate -color #ffff00 -format Logic /micro_test_post/m_clk
add wave -noupdate -color #00ff00 -format Logic /micro_test_post/s_clk
add wave -noupdate -color #0080ff -format Logic /micro_test_post/m_as
add wave -noupdate -color #ff0000 -format Logic /micro_test_post/m_ds
add wave -noupdate -color #ffff00 -format Logic /micro_test_post/master_dtack
add wave -noupdate -color #ffff00 -format Logic /micro_test_post/master_irq
add wave -noupdate -color #ff80ff -format Logic /micro_test_post/m_r_w
add wave -noupdate -color #ff0080 -format Literal -radix hexadecimal /micro_test_post/m_address
add wave -noupdate -color #ff8040 -format Literal -radix hexadecimal /micro_test_post/m_data_bus
add wave -noupdate -format Literal -label master_madr -radix hexadecimal /micro_test_post/i2c_post_master/master_madr
add wave -noupdate -format Logic /micro_test_post/master_mcf
add wave -noupdate -color #00ff00 -format Logic /micro_test_post/s_as
add wave -noupdate -color #ff80ff -format Logic /micro_test_post/s_ds
add wave -noupdate -color #ff8040 -format Logic /micro_test_post/slave_dtack
add wave -noupdate -color #00ff00 -format Logic /micro_test_post/slave_irq
add wave -noupdate -color #ff0080 -format Logic /micro_test_post/s_r_w
add wave -noupdate -color #0080ff -format Literal -radix hexadecimal /micro_test_post/s_address
add wave -noupdate -color #ff0000 -format Literal -radix hexadecimal /micro_test_post/s_data_bus
add wave -noupdate -format Literal -label slave_madr -radix hexadecimal /micro_test_post/i2c_post_slave/slave_madr
add wave -noupdate -color #ff0000 -format Logic /micro_test_post/slave_mcf
add wave -noupdate -color #0080ff -format Logic /micro_test_post/sda
add wave -noupdate -color #ff0080 -format Logic /micro_test_post/scl
add wave -noupdate -color #ffff00 -format Literal -label master_mbdr_micro -radix hexadecimal /micro_test_post/i2c_post_master/master_mbdr_micro
add wave -noupdate -color #ff8040 -format Literal -label master_mbdr_i2c -radix hexadecimal /micro_test_post/i2c_post_master/master_mbdr_i2c
add wave -noupdate -color #0080ff -format Literal -label slave_mbdr_micro -radix hexadecimal /micro_test_post/i2c_post_slave/slave_mbdr_micro
add wave -noupdate -color #00ff00 -format Literal -label slave_mbdr_i2c -radix hexadecimal /micro_test_post/i2c_post_slave/slave_mbdr_i2c
add wave -noupdate -format Literal -label master_i2c_ctrl_scl_state -radix hexadecimal /micro_test_post/i2c_post_master/master_i2c_ctrl_scl_state
add wave -noupdate -format Literal -label master_i2c_ctrl_state -radix hexadecimal /micro_test_post/i2c_post_master/master_i2c_ctrl_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {5906309 ps}
WaveRestoreZoom {0 ps} {10076225 ps}
