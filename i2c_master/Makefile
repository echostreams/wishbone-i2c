GHDL_CMD = ghdl
GHDL_ARG = --std=08 -frelaxed-rules -fsynopsys -Wno-hide -Wno-shared

.PHONY: all

all: uvvm compile elaborate run

uvvm:
	@echo "source ghdl_compile_uvvm.sh..."
	. ./ghdl_compile_uvvm.sh

compile:
	@$(GHDL_CMD) -a $(GHDL_ARG) --work=work i2c_master_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_ARG) --work=work i2c_master.vhd
	@$(GHDL_CMD) -a $(GHDL_ARG) --work=work tmp175_simmodel.vhd
	@$(GHDL_CMD) -a $(GHDL_ARG) --work=work i2c_master_tb.vhd

elaborate:
	@$(GHDL_CMD) -e $(GHDL_ARG) --work=work i2c_master_tb

run:
	@$(GHDL_CMD) -r $(GHDL_ARG) --work=work i2c_master_tb

clean:
	@rm -f *.cf *.vcd
	@echo "remove _Alert.txt _Log.txt..."
	@rm -f _*.txt

