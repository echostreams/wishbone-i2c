vlib work
vcom -just e -87 -explicit   -work work upcnt4.vhd
vcom -skip e -87 -explicit   -work work upcnt4.vhd
vcom -just e -87 -explicit   -work work shift.vhd
vcom -skip e -87 -explicit   -work work shift.vhd
vcom -just e -87 -explicit   -work work uc_interface.vhd
vcom -skip e -87 -explicit   -work work uc_interface.vhd
vcom -just e -87 -explicit   -work work i2c_control.vhd
vcom -skip e -87 -explicit   -work work i2c_control.vhd
vcom -just e -87 -explicit   -work work i2c.vhd
vcom -skip e -87 -explicit   -work work i2c.vhd
vcom -just e -87 -explicit   -work work pullup.vhd
vcom -skip e -87 -explicit   -work work pullup.vhd
vcom -just e -93 -explicit   -work work micro_tb.vhd
vcom -skip e -93 -explicit   -work work micro_tb.vhd
vcom -just e -93 -explicit   -work work micro_test.vhd
vcom -skip e -93 -explicit   -work work micro_test.vhd

vsim work.micro_test
view wave
view structure
view signals
do wave.do
run 2600000 ns
