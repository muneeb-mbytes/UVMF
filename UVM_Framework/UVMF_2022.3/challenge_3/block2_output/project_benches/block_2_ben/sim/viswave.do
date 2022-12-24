 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { spi_master_agent }
wave add uvm_test_top.environment.spi_master_agent.spi_master_agent_monitor.txn_stream -radix string -tag F0
wave group spi_master_agent_bus
wave add -group spi_master_agent_bus hdl_top.spi_master_agent_bus.* -radix hexadecimal -tag F0
wave group spi_master_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { wishbone_slave_agent }
wave add uvm_test_top.environment.wishbone_slave_agent.wishbone_slave_agent_monitor.txn_stream -radix string -tag F0
wave group wishbone_slave_agent_bus
wave add -group wishbone_slave_agent_bus hdl_top.wishbone_slave_agent_bus.* -radix hexadecimal -tag F0
wave group wishbone_slave_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]

wave update on
WaveSetStreamView

