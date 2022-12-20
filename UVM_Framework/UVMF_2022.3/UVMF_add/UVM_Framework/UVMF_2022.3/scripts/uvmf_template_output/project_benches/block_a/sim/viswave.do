 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { control_plane_in }
wave add uvm_test_top.environment.control_plane_in.control_plane_in_monitor.txn_stream -radix string -tag F0
wave group control_plane_in_bus
wave add -group control_plane_in_bus hdl_top.control_plane_in_bus.* -radix hexadecimal -tag F0
wave group control_plane_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { control_plane_out }
wave add uvm_test_top.environment.control_plane_out.control_plane_out_monitor.txn_stream -radix string -tag F0
wave group control_plane_out_bus
wave add -group control_plane_out_bus hdl_top.control_plane_out_bus.* -radix hexadecimal -tag F0
wave group control_plane_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { secure_data_plane_in }
wave add uvm_test_top.environment.secure_data_plane_in.secure_data_plane_in_monitor.txn_stream -radix string -tag F0
wave group secure_data_plane_in_bus
wave add -group secure_data_plane_in_bus hdl_top.secure_data_plane_in_bus.* -radix hexadecimal -tag F0
wave group secure_data_plane_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { secure_data_plane_out }
wave add uvm_test_top.environment.secure_data_plane_out.secure_data_plane_out_monitor.txn_stream -radix string -tag F0
wave group secure_data_plane_out_bus
wave add -group secure_data_plane_out_bus hdl_top.secure_data_plane_out_bus.* -radix hexadecimal -tag F0
wave group secure_data_plane_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]

wave update on
WaveSetStreamView

