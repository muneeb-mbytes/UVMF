 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { mem_in }
wave add uvm_test_top.environment.mem_in.mem_in_monitor.txn_stream -radix string -tag F0
wave group mem_in_bus
wave add -group mem_in_bus hdl_top.mem_in_bus.* -radix hexadecimal -tag F0
wave group mem_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { mem_out }
wave add uvm_test_top.environment.mem_out.mem_out_monitor.txn_stream -radix string -tag F0
wave group mem_out_bus
wave add -group mem_out_bus hdl_top.mem_out_bus.* -radix hexadecimal -tag F0
wave group mem_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { pkt_out }
wave add uvm_test_top.environment.pkt_out.pkt_out_monitor.txn_stream -radix string -tag F0
wave group pkt_out_bus
wave add -group pkt_out_bus hdl_top.pkt_out_bus.* -radix hexadecimal -tag F0
wave group pkt_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]

wave update on
WaveSetStreamView

