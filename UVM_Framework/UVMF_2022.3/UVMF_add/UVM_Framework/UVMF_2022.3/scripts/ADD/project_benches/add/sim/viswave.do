 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { add_in_agent }
wave add uvm_test_top.environment.add_in_agent.add_in_agent_monitor.txn_stream -radix string -tag F0
wave group add_in_agent_bus
wave add -group add_in_agent_bus hdl_top.add_in_agent_bus.* -radix hexadecimal -tag F0
wave group add_in_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { add_out_agent }
wave add uvm_test_top.environment.add_out_agent.add_out_agent_monitor.txn_stream -radix string -tag F0
wave group add_out_agent_bus
wave add -group add_out_agent_bus hdl_top.add_out_agent_bus.* -radix hexadecimal -tag F0
wave group add_out_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]

wave update on
WaveSetStreamView

