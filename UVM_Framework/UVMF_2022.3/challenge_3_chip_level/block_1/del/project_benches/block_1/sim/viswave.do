 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { apb_master_agent }
wave add uvm_test_top.environment.apb_master_agent.apb_master_agent_monitor.txn_stream -radix string -tag F0
wave group apb_master_agent_bus
wave add -group apb_master_agent_bus hdl_top.apb_master_agent_bus.* -radix hexadecimal -tag F0
wave group apb_master_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { axi_master_agent_1 }
wave add uvm_test_top.environment.axi_master_agent_1.axi_master_agent_1_monitor.txn_stream -radix string -tag F0
wave group axi_master_agent_1_bus
wave add -group axi_master_agent_1_bus hdl_top.axi_master_agent_1_bus.* -radix hexadecimal -tag F0
wave group axi_master_agent_1_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { axi_master_agent_2 }
wave add uvm_test_top.environment.axi_master_agent_2.axi_master_agent_2_monitor.txn_stream -radix string -tag F0
wave group axi_master_agent_2_bus
wave add -group axi_master_agent_2_bus hdl_top.axi_master_agent_2_bus.* -radix hexadecimal -tag F0
wave group axi_master_agent_2_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { spi_slave_agent }
wave add uvm_test_top.environment.spi_slave_agent.spi_slave_agent_monitor.txn_stream -radix string -tag F0
wave group spi_slave_agent_bus
wave add -group spi_slave_agent_bus hdl_top.spi_slave_agent_bus.* -radix hexadecimal -tag F0
wave group spi_slave_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]

wave update on
WaveSetStreamView

