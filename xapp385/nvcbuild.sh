nvc --std=2008 -a upcnt4.vhd shift.vhd uc_interface.vhd \
       i2c_control.vhd i2c.vhd pullup.vhd \
       micro_tb.vhd micro_test.vhd \
       tmp175_simmodel.vhd tmp175_tb.vhd tmp175_test.vhd \
       i2c_wb.vhd \
       wb_ram.vhd wb_ram_tb_uvvm.vhd

nvc -e micro_test
nvc -e wb_ram_tb_uvvm

nvc -r micro_test --stop-time=2600000ns

