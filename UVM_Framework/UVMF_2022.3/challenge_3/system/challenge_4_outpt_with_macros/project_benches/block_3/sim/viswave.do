 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { wb_master }
wave add uvm_test_top.environment.wb_master.wb_master_monitor.txn_stream -radix string -tag F0
wave group wb_master_bus
wave add -group wb_master_bus hdl_top.wb_master_bus.* -radix hexadecimal -tag F0
wave group wb_master_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { axi_slave }
wave add uvm_test_top.environment.axi_slave.axi_slave_monitor.txn_stream -radix string -tag F0
wave group axi_slave_bus
wave add -group axi_slave_bus hdl_top.axi_slave_bus.* -radix hexadecimal -tag F0
wave group axi_slave_bus -collapse
wave insertion [expr [wave index insertpoint] +1]

wave update on
WaveSetStreamView

