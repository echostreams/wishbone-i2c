vlib work
vcom -just e -87 -explicit   -work work i2c_timesim.vhd
vcom -skip e -87 -explicit   -work work i2c_timesim.vhd
vcom -just e -87 -explicit   -work work pullup.vhd
vcom -skip e -87 -explicit   -work work pullup.vhd
vcom -just e -87 -explicit   -work work micro_slave_tb.vhd
vcom -skip e -87 -explicit   -work work micro_slave_tb.vhd
vcom -just e -87 -explicit   -work work micro_master_tb.vhd
vcom -skip e -87 -explicit   -work work micro_master_tb.vhd
vcom -just e -93 -explicit   -work work micro_test_post.vhd
vcom -skip e -93 -explicit   -work work micro_test_post.vhd

vsim work.micro_test_post
view wave
view structure
view signals
do wave_post.do
run 2.6ms
