 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { jtag_in }
wave add uvm_test_top.environment.jtag_in.jtag_in_monitor.txn_stream -radix string -tag F0
wave group jtag_in_bus
wave add -group jtag_in_bus hdl_top.jtag_in_bus.* -radix hexadecimal -tag F0
wave group jtag_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { jtag_out }
wave add uvm_test_top.environment.jtag_out.jtag_out_monitor.txn_stream -radix string -tag F0
wave group jtag_out_bus
wave add -group jtag_out_bus hdl_top.jtag_out_bus.* -radix hexadecimal -tag F0
wave group jtag_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]

wave update on
WaveSetStreamView

