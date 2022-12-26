 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { apb_master }
wave add uvm_test_top.environment.apb_master.apb_master_monitor.txn_stream -radix string -tag F0
wave group apb_master_bus
wave add -group apb_master_bus hdl_top.apb_master_bus.* -radix hexadecimal -tag F0
wave group apb_master_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { axi_master1 }
wave add uvm_test_top.environment.axi_master1.axi_master1_monitor.txn_stream -radix string -tag F0
wave group axi_master1_bus
wave add -group axi_master1_bus hdl_top.axi_master1_bus.* -radix hexadecimal -tag F0
wave group axi_master1_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { axi_master2 }
wave add uvm_test_top.environment.axi_master2.axi_master2_monitor.txn_stream -radix string -tag F0
wave group axi_master2_bus
wave add -group axi_master2_bus hdl_top.axi_master2_bus.* -radix hexadecimal -tag F0
wave group axi_master2_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { spi_slave }
wave add uvm_test_top.environment.spi_slave.spi_slave_monitor.txn_stream -radix string -tag F0
wave group spi_slave_bus
wave add -group spi_slave_bus hdl_top.spi_slave_bus.* -radix hexadecimal -tag F0
wave group spi_slave_bus -collapse
wave insertion [expr [wave index insertpoint] +1]

wave update on
WaveSetStreamView

