 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { agent_instance_name }
wave add uvm_test_top.environment.agent_instance_name.agent_instance_name_monitor.txn_stream -radix string -tag F0
wave group agent_instance_name_bus
wave add -group agent_instance_name_bus hdl_top.agent_instance_name_bus.* -radix hexadecimal -tag F0
wave group agent_instance_name_bus -collapse
wave insertion [expr [wave index insertpoint] +1]

wave update on
WaveSetStreamView

