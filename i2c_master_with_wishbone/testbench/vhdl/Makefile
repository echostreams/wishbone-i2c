GHDL_CMD=ghdl
GHDL_FLAGS=--std=08 -frelaxed-rules -fsynopsys -Wno-hide -Wno-shared
TESTBENCH=tst_bench_top

.PHONY: all

all: compile run

include ./uvvm.mk

compile:
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=work ../../source/vhdl/*.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=work ./i2c_slave_model.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=work $(TESTBENCH).vhd
	@$(GHDL_CMD) -e $(GHDL_FLAGS) --work=work $(TESTBENCH)

run:
	@$(GHDL_CMD) -r $(GHDL_FLAGS) --work=work $(TESTBENCH)

clean:
	@rm *.cf
