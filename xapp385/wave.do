onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix default -format Logic -color #ff0000 /micro_test/reset
add wave -noupdate -radix default -format Logic -color #ff8040 /micro_test/clk
add wave -noupdate -radix hexadecimal -color #ffff00 /micro_test/data_bus
add wave -noupdate -radix hexadecimal -color #00ff40 /micro_test/address
add wave -noupdate -radix default -format Logic -color #0080ff /micro_test/as
add wave -noupdate -radix default -format Logic -color #ff0080 /micro_test/ds
add wave -noupdate -radix default -format Logic -color #ff80ff /micro_test/dtack
add wave -noupdate -radix default -format Logic -color #ff0000 /micro_test/irq
add wave -noupdate -radix default -format Logic -color #ff8040 /micro_test/r_w
add wave -noupdate -radix hexadecimal -color #ffff00 /micro_test/master/addr_bus
add wave -noupdate -radix hexadecimal /micro_test/master/data_bus
add wave -noupdate -radix hexadecimal -color #0080ff /micro_test/master/madr
add wave -noupdate -radix default -format Logic -color #ff0080 /micro_test/mcf
add wave -noupdate -radix hexadecimal -color #ff0000 /micro_test/slave/addr_bus
add wave -noupdate -radix hexadecimal -color #ff8040 /micro_test/slave/data_bus
add wave -noupdate -radix hexadecimal -color #ffff00 /micro_test/slave/madr
add wave -noupdate -radix default -format Logic /micro_test/slave_mcf
add wave -noupdate -radix default -format Logic -color #0080ff /micro_test/sda
add wave -noupdate -radix default -format Logic -color Violet /micro_test/scl
add wave -noupdate -radix hexadecimal -color #ff0000 /micro_test/master/mbdr_micro
add wave -noupdate -radix hexadecimal -color #ff8040 /micro_test/master/mbdr_i2c
add wave -noupdate -radix hexadecimal -color #ffff00 /micro_test/slave/mbdr_micro
add wave -noupdate -radix hexadecimal /micro_test/slave/mbdr_i2c
add wave -noupdate -radix default -color {Cornflower Blue} /micro_test/master/i2c_ctrl/scl_state
add wave -noupdate -radix default -color {Violet Red} /micro_test/master/i2c_ctrl/state
add wave -noupdate -radix default -color Red /micro_test/master/i2c_ctrl/clk_cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {1424250 ns} {1435250 ns}
WaveRestoreZoom {1388987993 ps} {1454288794 ps}
