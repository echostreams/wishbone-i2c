# i2c core
nvc --std=2008 -a pullup.vhd upcnt4.vhd shift.vhd uc_interface.vhd \
       i2c_control.vhd i2c.vhd

# micro_test
nvc --std=2008 -a micro_tb.vhd micro_test.vhd

# tmp175_test
nvc --std=2008 -a tmp175_simmodel.vhd tmp175_tb.vhd tmp175_test.vhd

# wb uvvm
nvc --std=2008 -a wb_ram.vhd wb_ram_tb_uvvm.vhd

# i2c wb
nvc --std=2008 -a i2c_wb.vhd

nvc -e micro_test
nvc -e wb_ram_tb_uvvm
nvc -e tmp175_test

echo "Run micro_test simulation..."
nvc -r micro_test  --stop-time=2600000ns

echo "Run tmp175_test simulation..."
nvc -r tmp175_test --stop-time=2600000ns
