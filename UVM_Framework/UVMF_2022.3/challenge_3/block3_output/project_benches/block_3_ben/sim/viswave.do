 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { wishbone_master_agent }
wave add uvm_test_top.environment.wishbone_master_agent.wishbone_master_agent_monitor.txn_stream -radix string -tag F0
wave group wishbone_master_agent_bus
wave add -group wishbone_master_agent_bus hdl_top.wishbone_master_agent_bus.* -radix hexadecimal -tag F0
wave group wishbone_master_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { axi_slave_agent }
wave add uvm_test_top.environment.axi_slave_agent.axi_slave_agent_monitor.txn_stream -radix string -tag F0
wave group axi_slave_agent_bus
wave add -group axi_slave_agent_bus hdl_top.axi_slave_agent_bus.* -radix hexadecimal -tag F0
wave group axi_slave_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]

wave update on
WaveSetStreamView

