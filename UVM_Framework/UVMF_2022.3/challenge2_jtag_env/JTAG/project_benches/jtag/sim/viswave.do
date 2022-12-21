 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { jtag_agent_a }
wave add uvm_test_top.environment.jtag_agent_a.jtag_agent_a_monitor.txn_stream -radix string -tag F0
wave group jtag_agent_a_bus
wave add -group jtag_agent_a_bus hdl_top.jtag_agent_a_bus.* -radix hexadecimal -tag F0
wave group jtag_agent_a_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { jtag_agent_b }
wave add uvm_test_top.environment.jtag_agent_b.jtag_agent_b_monitor.txn_stream -radix string -tag F0
wave group jtag_agent_b_bus
wave add -group jtag_agent_b_bus hdl_top.jtag_agent_b_bus.* -radix hexadecimal -tag F0
wave group jtag_agent_b_bus -collapse
wave insertion [expr [wave index insertpoint] +1]

wave update on
WaveSetStreamView

