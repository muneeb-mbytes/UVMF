 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { s1_b1_apb_master }
wave add uvm_test_top.environment.s1.b1.apb_master.apb_master_monitor.txn_stream -radix string -tag F0
wave group s1_b1_apb_master_bus
wave add -group s1_b1_apb_master_bus hdl_top.s1_b1_apb_master_bus.* -radix hexadecimal -tag F0
wave group s1_b1_apb_master_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { s1_b1_axi_master1 }
wave add uvm_test_top.environment.s1.b1.axi_master1.axi_master1_monitor.txn_stream -radix string -tag F0
wave group s1_b1_axi_master1_bus
wave add -group s1_b1_axi_master1_bus hdl_top.s1_b1_axi_master1_bus.* -radix hexadecimal -tag F0
wave group s1_b1_axi_master1_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { s1_b1_axi_master2 }
wave add uvm_test_top.environment.s1.b1.axi_master2.axi_master2_monitor.txn_stream -radix string -tag F0
wave group s1_b1_axi_master2_bus
wave add -group s1_b1_axi_master2_bus hdl_top.s1_b1_axi_master2_bus.* -radix hexadecimal -tag F0
wave group s1_b1_axi_master2_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { s1_b1_spi_slave }
wave add uvm_test_top.environment.s1.b1.spi_slave.spi_slave_monitor.txn_stream -radix string -tag F0
wave group s1_b1_spi_slave_bus
wave add -group s1_b1_spi_slave_bus hdl_top.s1_b1_spi_slave_bus.* -radix hexadecimal -tag F0
wave group s1_b1_spi_slave_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { s1_b2_spi_master }
wave add uvm_test_top.environment.s1.b2.spi_master.spi_master_monitor.txn_stream -radix string -tag F0
wave group s1_b2_spi_master_bus
wave add -group s1_b2_spi_master_bus hdl_top.s1_b2_spi_master_bus.* -radix hexadecimal -tag F0
wave group s1_b2_spi_master_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { s1_b2_wb_slave }
wave add uvm_test_top.environment.s1.b2.wb_slave.wb_slave_monitor.txn_stream -radix string -tag F0
wave group s1_b2_wb_slave_bus
wave add -group s1_b2_wb_slave_bus hdl_top.s1_b2_wb_slave_bus.* -radix hexadecimal -tag F0
wave group s1_b2_wb_slave_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { b3_wb_master }
wave add uvm_test_top.environment.b3.wb_master.wb_master_monitor.txn_stream -radix string -tag F0
wave group b3_wb_master_bus
wave add -group b3_wb_master_bus hdl_top.b3_wb_master_bus.* -radix hexadecimal -tag F0
wave group b3_wb_master_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { b3_axi_slave }
wave add uvm_test_top.environment.b3.axi_slave.axi_slave_monitor.txn_stream -radix string -tag F0
wave group b3_axi_slave_bus
wave add -group b3_axi_slave_bus hdl_top.b3_axi_slave_bus.* -radix hexadecimal -tag F0
wave group b3_axi_slave_bus -collapse
wave insertion [expr [wave index insertpoint] +1]

wave update on
WaveSetStreamView

