 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { block_a_env_control_plane_in }
wave add uvm_test_top.environment.block_a_env.control_plane_in.control_plane_in_monitor.txn_stream -radix string -tag F0
wave group block_a_env_control_plane_in_bus
wave add -group block_a_env_control_plane_in_bus hdl_top.block_a_env_control_plane_in_bus.* -radix hexadecimal -tag F0
wave group block_a_env_control_plane_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { block_a_env_control_plane_out }
wave add uvm_test_top.environment.block_a_env.control_plane_out.control_plane_out_monitor.txn_stream -radix string -tag F0
wave group block_a_env_control_plane_out_bus
wave add -group block_a_env_control_plane_out_bus hdl_top.block_a_env_control_plane_out_bus.* -radix hexadecimal -tag F0
wave group block_a_env_control_plane_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { block_a_env_secure_data_plane_in }
wave add uvm_test_top.environment.block_a_env.secure_data_plane_in.secure_data_plane_in_monitor.txn_stream -radix string -tag F0
wave group block_a_env_secure_data_plane_in_bus
wave add -group block_a_env_secure_data_plane_in_bus hdl_top.block_a_env_secure_data_plane_in_bus.* -radix hexadecimal -tag F0
wave group block_a_env_secure_data_plane_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { block_a_env_secure_data_plane_out }
wave add uvm_test_top.environment.block_a_env.secure_data_plane_out.secure_data_plane_out_monitor.txn_stream -radix string -tag F0
wave group block_a_env_secure_data_plane_out_bus
wave add -group block_a_env_secure_data_plane_out_bus hdl_top.block_a_env_secure_data_plane_out_bus.* -radix hexadecimal -tag F0
wave group block_a_env_secure_data_plane_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { block_b_env_control_plane_in }
wave add uvm_test_top.environment.block_b_env.control_plane_in.control_plane_in_monitor.txn_stream -radix string -tag F0
wave group block_b_env_control_plane_in_bus
wave add -group block_b_env_control_plane_in_bus hdl_top.block_b_env_control_plane_in_bus.* -radix hexadecimal -tag F0
wave group block_b_env_control_plane_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { block_b_env_control_plane_out }
wave add uvm_test_top.environment.block_b_env.control_plane_out.control_plane_out_monitor.txn_stream -radix string -tag F0
wave group block_b_env_control_plane_out_bus
wave add -group block_b_env_control_plane_out_bus hdl_top.block_b_env_control_plane_out_bus.* -radix hexadecimal -tag F0
wave group block_b_env_control_plane_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { block_b_env_unsecure_data_plane_in }
wave add uvm_test_top.environment.block_b_env.unsecure_data_plane_in.unsecure_data_plane_in_monitor.txn_stream -radix string -tag F0
wave group block_b_env_unsecure_data_plane_in_bus
wave add -group block_b_env_unsecure_data_plane_in_bus hdl_top.block_b_env_unsecure_data_plane_in_bus.* -radix hexadecimal -tag F0
wave group block_b_env_unsecure_data_plane_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { block_b_env_unsecure_data_plane_out }
wave add uvm_test_top.environment.block_b_env.unsecure_data_plane_out.unsecure_data_plane_out_monitor.txn_stream -radix string -tag F0
wave group block_b_env_unsecure_data_plane_out_bus
wave add -group block_b_env_unsecure_data_plane_out_bus hdl_top.block_b_env_unsecure_data_plane_out_bus.* -radix hexadecimal -tag F0
wave group block_b_env_unsecure_data_plane_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]

wave update on
WaveSetStreamView

