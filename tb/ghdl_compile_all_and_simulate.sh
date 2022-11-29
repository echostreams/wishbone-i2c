#!/bin/zsh

#==================================================================
# This script has been tested with GHDL version 0.37 and 2.0.0-dev
#==================================================================
echo "\nThis script has been tested with GHDL version 0.37 and 2.0.0-dev\n"

UVVM_PATH=~/projects/UVVM

# Compiling UVVM Util
echo "Compiling UVVM Utility Library..."
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=uvvm_util $UVVM_PATH/uvvm_util/src/types_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=uvvm_util $UVVM_PATH/uvvm_util/src/adaptations_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=uvvm_util $UVVM_PATH/uvvm_util/src/string_methods_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=uvvm_util $UVVM_PATH/uvvm_util/src/protected_types_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=uvvm_util $UVVM_PATH/uvvm_util/src/global_signals_and_shared_variables_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=uvvm_util $UVVM_PATH/uvvm_util/src/hierarchy_linked_list_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=uvvm_util $UVVM_PATH/uvvm_util/src/alert_hierarchy_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=uvvm_util $UVVM_PATH/uvvm_util/src/license_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=uvvm_util $UVVM_PATH/uvvm_util/src/methods_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=uvvm_util $UVVM_PATH/uvvm_util/src/bfm_common_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=uvvm_util $UVVM_PATH/uvvm_util/src/generic_queue_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=uvvm_util $UVVM_PATH/uvvm_util/src/data_queue_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=uvvm_util $UVVM_PATH/uvvm_util/src/data_fifo_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=uvvm_util $UVVM_PATH/uvvm_util/src/data_stack_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=uvvm_util $UVVM_PATH/uvvm_util/src/rand_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=uvvm_util $UVVM_PATH/uvvm_util/src/func_cov_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=uvvm_util $UVVM_PATH/uvvm_util/src/uvvm_util_context.vhd

# Compiling UVVM VVC Framework
echo "Compiling UVVM VVC Framework..."
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=uvvm_vvc_framework $UVVM_PATH/uvvm_vvc_framework/src/ti_protected_types_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=uvvm_vvc_framework $UVVM_PATH/uvvm_vvc_framework/src/ti_vvc_framework_support_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=uvvm_vvc_framework $UVVM_PATH/uvvm_vvc_framework/src/ti_generic_queue_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=uvvm_vvc_framework $UVVM_PATH/uvvm_vvc_framework/src/ti_data_queue_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=uvvm_vvc_framework $UVVM_PATH/uvvm_vvc_framework/src/ti_data_fifo_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=uvvm_vvc_framework $UVVM_PATH/uvvm_vvc_framework/src/ti_data_stack_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=uvvm_vvc_framework $UVVM_PATH/uvvm_vvc_framework/src/ti_uvvm_engine.vhd

# Compiling Bitvis VIP Scoreboard
echo "Compiling Bitvis VIP Scoreboard..."
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_scoreboard $UVVM_PATH/bitvis_vip_scoreboard/src/generic_sb_support_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_scoreboard $UVVM_PATH/bitvis_vip_scoreboard/src/generic_sb_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_scoreboard $UVVM_PATH/bitvis_vip_scoreboard/src/predefined_sb.vhd

# Compiling Bitvis VIP SBI
echo "Compiling Bitvis VIP SBI..."
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_sbi $UVVM_PATH/bitvis_vip_sbi/src/transaction_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_sbi $UVVM_PATH/bitvis_vip_sbi/src/sbi_bfm_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_sbi $UVVM_PATH/bitvis_vip_sbi/src/vvc_cmd_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_sbi $UVVM_PATH/uvvm_vvc_framework/src_target_dependent/td_target_support_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_sbi $UVVM_PATH/uvvm_vvc_framework/src_target_dependent/td_vvc_framework_common_methods_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_sbi $UVVM_PATH/bitvis_vip_sbi/src/vvc_methods_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_sbi $UVVM_PATH/uvvm_vvc_framework/src_target_dependent/td_queue_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_sbi $UVVM_PATH/uvvm_vvc_framework/src_target_dependent/td_vvc_entity_support_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_sbi $UVVM_PATH/bitvis_vip_sbi/src/sbi_vvc.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_sbi $UVVM_PATH/bitvis_vip_sbi/src/vvc_context.vhd

# Compiling Bitvis VIP wishbone
echo "Compiling Bitvis VIP wishbone..."
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_wishbone $UVVM_PATH/bitvis_vip_wishbone/src/wishbone_bfm_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_wishbone $UVVM_PATH/bitvis_vip_wishbone/src/vvc_cmd_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_wishbone $UVVM_PATH/uvvm_vvc_framework/src_target_dependent/td_target_support_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_wishbone $UVVM_PATH/uvvm_vvc_framework/src_target_dependent/td_vvc_framework_common_methods_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_wishbone $UVVM_PATH/bitvis_vip_wishbone/src/vvc_methods_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_wishbone $UVVM_PATH/uvvm_vvc_framework/src_target_dependent/td_queue_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_wishbone $UVVM_PATH/uvvm_vvc_framework/src_target_dependent/td_vvc_entity_support_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_wishbone $UVVM_PATH/bitvis_vip_wishbone/src/wishbone_vvc.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_wishbone $UVVM_PATH/bitvis_vip_wishbone/src/vvc_context.vhd

# Compiling Bitvis VIP I2C
echo "Compiling Bitvis VIP I2C..."
GHDL_PLUS_ARG='ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_i2c'
$GHDL_PLUS_ARG $UVVM_PATH/bitvis_vip_i2c/src/i2c_bfm_pkg.vhd
$GHDL_PLUS_ARG $UVVM_PATH/bitvis_vip_i2c/src/transaction_pkg.vhd
$GHDL_PLUS_ARG $UVVM_PATH/bitvis_vip_i2c/src/vvc_cmd_pkg.vhd
$GHDL_PLUS_ARG $UVVM_PATH/uvvm_vvc_framework/src_target_dependent/td_target_support_pkg.vhd
$GHDL_PLUS_ARG $UVVM_PATH/uvvm_vvc_framework/src_target_dependent/td_vvc_framework_common_methods_pkg.vhd
$GHDL_PLUS_ARG $UVVM_PATH/bitvis_vip_i2c/src/vvc_methods_pkg.vhd
$GHDL_PLUS_ARG $UVVM_PATH/uvvm_vvc_framework/src_target_dependent/td_queue_pkg.vhd
$GHDL_PLUS_ARG $UVVM_PATH/uvvm_vvc_framework/src_target_dependent/td_vvc_entity_support_pkg.vhd
$GHDL_PLUS_ARG $UVVM_PATH/bitvis_vip_i2c/src/i2c_vvc.vhd
$GHDL_PLUS_ARG $UVVM_PATH/bitvis_vip_i2c/src/vvc_context.vhd

# Compiling Bitvis VIP Clock Generator
echo "Compiling Bitvis VIP Clock Generator..."
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_clock_generator $UVVM_PATH/bitvis_vip_clock_generator/src/vvc_cmd_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_clock_generator $UVVM_PATH/uvvm_vvc_framework/src_target_dependent/td_target_support_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_clock_generator $UVVM_PATH/uvvm_vvc_framework/src_target_dependent/td_vvc_framework_common_methods_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_clock_generator $UVVM_PATH/bitvis_vip_clock_generator/src/vvc_methods_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_clock_generator $UVVM_PATH/uvvm_vvc_framework/src_target_dependent/td_queue_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_clock_generator $UVVM_PATH/uvvm_vvc_framework/src_target_dependent/td_vvc_entity_support_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_clock_generator $UVVM_PATH/bitvis_vip_clock_generator/src/clock_generator_vvc.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_vip_clock_generator $UVVM_PATH/bitvis_vip_clock_generator/src/vvc_context.vhd

# Compiling Bitvis wishbone i2c
echo "Compiling Bitvis wishbone i2c..."
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_wishbone ../rtl/interrupt_generator.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_wishbone ../rtl/clock_generator.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_wishbone ../rtl/fifo_buffer.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_wishbone ../rtl/register_pkg.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_wishbone ../rtl/register_block.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_wishbone ../rtl/transaction_controller.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_wishbone ../rtl/wishbone_i2c_ip_core.vhd

# Compiling I2C VVC demo TB
echo "Compiling I2C VVC demo TB..."
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_wishbone ./wishbone_i2c_ip_core_th.vhd
ghdl -a --std=08 -frelaxed-rules -Wno-hide -Wno-shared --work=bitvis_wishbone ./wishbone_i2c_ip_core_tb.vhd

# Running simulations
echo "Starting simulations..."
ghdl -e --std=08 -frelaxed-rules --work=bitvis_wishbone wishbone_i2c_ip_core_tb
ghdl -r --std=08 -frelaxed-rules --work=bitvis_wishbone wishbone_i2c_ip_core_tb


