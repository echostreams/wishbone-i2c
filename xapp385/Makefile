GHDL_CMD=ghdl
GHDL_ARG=--std=08 -frelaxed-rules -fsynopsys -Wno-hide -Wno-shared
#add GHDL_FLAGS fro uvvm.mk
GHDL_FLAGS=$(GHDL_ARG)
MODULES=upcnt4.vhd shift.vhd uc_interface.vhd \
	i2c_control.vhd i2c.vhd pullup.vhd \
	micro_tb.vhd micro_test.vhd \
	tmp175_simmodel.vhd tmp175_tb.vhd tmp175_test.vhd

#run 2600000 ns
STOP_TIME=2600000ns

all: uvvm work-obj08.cf elaborate sim

include ./uvvm.mk

work-obj08.cf : $(MODULES)
	@$(GHDL_CMD) -a $(GHDL_ARG) --work=work $(MODULES)

elaborate:
	@$(GHDL_CMD) -e $(GHDL_ARG) --work=work micro_test
	@$(GHDL_CMD) -e $(GHDL_ARG) --work=work tmp175_test

sim:
	@$(GHDL_CMD) -r $(GHDL_ARG) --work=work micro_test \
		--vcd=micro_test.vcd --stop-time=$(STOP_TIME)
sim175:
	@$(GHDL_CMD) -r $(GHDL_ARG) --work=work tmp175_test \
		--vcd=tmp175_test.vcd --stop-time=$(STOP_TIME)

clean:
	@rm -f *.cf *.vcd
