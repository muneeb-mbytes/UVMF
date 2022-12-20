 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { jtag_agent }
wave add uvm_test_top.environment.jtag_agent.jtag_agent_monitor.txn_stream -radix string -tag F0
wave group jtag_agent_bus
wave add -group jtag_agent_bus hdl_top.jtag_agent_bus.* -radix hexadecimal -tag F0
wave group jtag_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]

wave update on
WaveSetStreamView

