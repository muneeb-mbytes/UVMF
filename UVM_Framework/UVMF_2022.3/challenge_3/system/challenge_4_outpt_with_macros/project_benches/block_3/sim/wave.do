 

onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider wb_master 
add wave -noupdate /uvm_root/uvm_test_top/environment/wb_master/wb_master_monitor/txn_stream
add wave -noupdate -group wb_master_bus /hdl_top/wb_master_bus/*
add wave -noupdate -divider axi_slave 
add wave -noupdate /uvm_root/uvm_test_top/environment/axi_slave/axi_slave_monitor/txn_stream
add wave -noupdate -group axi_slave_bus /hdl_top/axi_slave_bus/*

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

