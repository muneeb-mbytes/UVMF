 

onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider apb_master 
add wave -noupdate /uvm_root/uvm_test_top/environment/apb_master/apb_master_monitor/txn_stream
add wave -noupdate -group apb_master_bus /hdl_top/apb_master_bus/*
add wave -noupdate -divider axi_master1 
add wave -noupdate /uvm_root/uvm_test_top/environment/axi_master1/axi_master1_monitor/txn_stream
add wave -noupdate -group axi_master1_bus /hdl_top/axi_master1_bus/*
add wave -noupdate -divider axi_master2 
add wave -noupdate /uvm_root/uvm_test_top/environment/axi_master2/axi_master2_monitor/txn_stream
add wave -noupdate -group axi_master2_bus /hdl_top/axi_master2_bus/*
add wave -noupdate -divider spi_slave 
add wave -noupdate /uvm_root/uvm_test_top/environment/spi_slave/spi_slave_monitor/txn_stream
add wave -noupdate -group spi_slave_bus /hdl_top/spi_slave_bus/*

TreeUpdate [SetDefaultTree]
quietly wave cursor active 0
configure wave -namecolwidth 472
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {27 ns} {168 ns}

