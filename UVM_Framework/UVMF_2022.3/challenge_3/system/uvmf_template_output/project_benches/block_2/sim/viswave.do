 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { spi_master }
wave add uvm_test_top.environment.spi_master.spi_master_monitor.txn_stream -radix string -tag F0
wave group spi_master_bus
wave add -group spi_master_bus hdl_top.spi_master_bus.* -radix hexadecimal -tag F0
wave group spi_master_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { wb_slave }
wave add uvm_test_top.environment.wb_slave.wb_slave_monitor.txn_stream -radix string -tag F0
wave group wb_slave_bus
wave add -group wb_slave_bus hdl_top.wb_slave_bus.* -radix hexadecimal -tag F0
wave group wb_slave_bus -collapse
wave insertion [expr [wave index insertpoint] +1]

wave update on
WaveSetStreamView

