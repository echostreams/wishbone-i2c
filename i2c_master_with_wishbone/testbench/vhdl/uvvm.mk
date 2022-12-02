UVVM_PATH=~/projects/UVVM
UVVM_UTIL_FILES=\
	$(UVVM_PATH)/uvvm_util/src/types_pkg.vhd \
	$(UVVM_PATH)/uvvm_util/src/adaptations_pkg.vhd \
	$(UVVM_PATH)/uvvm_util/src/string_methods_pkg.vhd \
	$(UVVM_PATH)/uvvm_util/src/protected_types_pkg.vhd \
	$(UVVM_PATH)/uvvm_util/src/global_signals_and_shared_variables_pkg.vhd \
	$(UVVM_PATH)/uvvm_util/src/hierarchy_linked_list_pkg.vhd \
	$(UVVM_PATH)/uvvm_util/src/alert_hierarchy_pkg.vhd \
	$(UVVM_PATH)/uvvm_util/src/license_pkg.vhd \
	$(UVVM_PATH)/uvvm_util/src/methods_pkg.vhd \
	$(UVVM_PATH)/uvvm_util/src/bfm_common_pkg.vhd \
	$(UVVM_PATH)/uvvm_util/src/generic_queue_pkg.vhd \
	$(UVVM_PATH)/uvvm_util/src/data_queue_pkg.vhd \
	$(UVVM_PATH)/uvvm_util/src/data_fifo_pkg.vhd \
	$(UVVM_PATH)/uvvm_util/src/data_stack_pkg.vhd \
	$(UVVM_PATH)/uvvm_util/src/rand_pkg.vhd \
	$(UVVM_PATH)/uvvm_util/src/func_cov_pkg.vhd \
	$(UVVM_PATH)/uvvm_util/src/uvvm_util_context.vhd

uvvm: uvvm_util uvvm_vvc_framework bitvis_vip_scoreboard bitvis_vip_sbi bitvis_vip_wishbone bitvis_vip_i2c bitvis_vip_clock_generator
	@echo "Done compiling UVVM..."

uvvm_util:
	@echo "Compiling UVVM Utility Library..."
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=uvvm_util $(UVVM_UTIL_FILES)

uvvm_vvc_framework:
	@echo "Compiling UVVM VVC Framework..."
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=uvvm_vvc_framework $(UVVM_PATH)/uvvm_vvc_framework/src/ti_protected_types_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=uvvm_vvc_framework $(UVVM_PATH)/uvvm_vvc_framework/src/ti_vvc_framework_support_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=uvvm_vvc_framework $(UVVM_PATH)/uvvm_vvc_framework/src/ti_generic_queue_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=uvvm_vvc_framework $(UVVM_PATH)/uvvm_vvc_framework/src/ti_data_queue_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=uvvm_vvc_framework $(UVVM_PATH)/uvvm_vvc_framework/src/ti_data_fifo_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=uvvm_vvc_framework $(UVVM_PATH)/uvvm_vvc_framework/src/ti_data_stack_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=uvvm_vvc_framework $(UVVM_PATH)/uvvm_vvc_framework/src/ti_uvvm_engine.vhd

bitvis_vip_scoreboard:
	@echo "Compiling Bitvis VIP Scoreboard..."
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_scoreboard $(UVVM_PATH)/bitvis_vip_scoreboard/src/generic_sb_support_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_scoreboard $(UVVM_PATH)/bitvis_vip_scoreboard/src/generic_sb_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_scoreboard $(UVVM_PATH)/bitvis_vip_scoreboard/src/predefined_sb.vhd

bitvis_vip_sbi:
	@echo "Compiling Bitvis VIP SBI..."
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_sbi $(UVVM_PATH)/bitvis_vip_sbi/src/transaction_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_sbi $(UVVM_PATH)/bitvis_vip_sbi/src/sbi_bfm_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_sbi $(UVVM_PATH)/bitvis_vip_sbi/src/vvc_cmd_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_sbi $(UVVM_PATH)/uvvm_vvc_framework/src_target_dependent/td_target_support_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_sbi $(UVVM_PATH)/uvvm_vvc_framework/src_target_dependent/td_vvc_framework_common_methods_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_sbi $(UVVM_PATH)/bitvis_vip_sbi/src/vvc_methods_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_sbi $(UVVM_PATH)/uvvm_vvc_framework/src_target_dependent/td_queue_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_sbi $(UVVM_PATH)/uvvm_vvc_framework/src_target_dependent/td_vvc_entity_support_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_sbi $(UVVM_PATH)/bitvis_vip_sbi/src/sbi_vvc.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_sbi $(UVVM_PATH)/bitvis_vip_sbi/src/vvc_context.vhd

bitvis_vip_wishbone:
	@echo "Compiling Bitvis VIP Wishbone..."
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_wishbone $(UVVM_PATH)/bitvis_vip_wishbone/src/wishbone_bfm_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_wishbone $(UVVM_PATH)/bitvis_vip_wishbone/src/vvc_cmd_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_wishbone $(UVVM_PATH)/uvvm_vvc_framework/src_target_dependent/td_target_support_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_wishbone $(UVVM_PATH)/uvvm_vvc_framework/src_target_dependent/td_vvc_framework_common_methods_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_wishbone $(UVVM_PATH)/bitvis_vip_wishbone/src/vvc_methods_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_wishbone $(UVVM_PATH)/uvvm_vvc_framework/src_target_dependent/td_queue_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_wishbone $(UVVM_PATH)/uvvm_vvc_framework/src_target_dependent/td_vvc_entity_support_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_wishbone $(UVVM_PATH)/bitvis_vip_wishbone/src/wishbone_vvc.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_wishbone $(UVVM_PATH)/bitvis_vip_wishbone/src/vvc_context.vhd

bitvis_vip_i2c:
	@echo "Compiling Bitvis VIP I2C..."
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_i2c $(UVVM_PATH)/bitvis_vip_i2c/src/i2c_bfm_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_i2c $(UVVM_PATH)/bitvis_vip_i2c/src/transaction_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_i2c $(UVVM_PATH)/bitvis_vip_i2c/src/vvc_cmd_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_i2c $(UVVM_PATH)/uvvm_vvc_framework/src_target_dependent/td_target_support_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_i2c $(UVVM_PATH)/uvvm_vvc_framework/src_target_dependent/td_vvc_framework_common_methods_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_i2c $(UVVM_PATH)/bitvis_vip_i2c/src/vvc_methods_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_i2c $(UVVM_PATH)/uvvm_vvc_framework/src_target_dependent/td_queue_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_i2c $(UVVM_PATH)/uvvm_vvc_framework/src_target_dependent/td_vvc_entity_support_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_i2c $(UVVM_PATH)/bitvis_vip_i2c/src/i2c_vvc.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_i2c $(UVVM_PATH)/bitvis_vip_i2c/src/vvc_context.vhd

bitvis_vip_clock_generator:
	@echo "Compiling Bitvis VIP Clock Generator..."
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_clock_generator $(UVVM_PATH)/bitvis_vip_clock_generator/src/vvc_cmd_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_clock_generator $(UVVM_PATH)/uvvm_vvc_framework/src_target_dependent/td_target_support_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_clock_generator $(UVVM_PATH)/uvvm_vvc_framework/src_target_dependent/td_vvc_framework_common_methods_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_clock_generator $(UVVM_PATH)/bitvis_vip_clock_generator/src/vvc_methods_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_clock_generator $(UVVM_PATH)/uvvm_vvc_framework/src_target_dependent/td_queue_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_clock_generator $(UVVM_PATH)/uvvm_vvc_framework/src_target_dependent/td_vvc_entity_support_pkg.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_clock_generator $(UVVM_PATH)/bitvis_vip_clock_generator/src/clock_generator_vvc.vhd
	@$(GHDL_CMD) -a $(GHDL_FLAGS) --work=bitvis_vip_clock_generator $(UVVM_PATH)/bitvis_vip_clock_generator/src/vvc_context.vhd

