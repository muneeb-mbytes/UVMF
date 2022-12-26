 

onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider apb_master_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment/apb_master_agent/apb_master_agent_monitor/txn_stream
add wave -noupdate -group apb_master_agent_bus /hdl_top/apb_master_agent_bus/*
add wave -noupdate -divider axi_master_agent_1 
add wave -noupdate /uvm_root/uvm_test_top/environment/axi_master_agent_1/axi_master_agent_1_monitor/txn_stream
add wave -noupdate -group axi_master_agent_1_bus /hdl_top/axi_master_agent_1_bus/*
add wave -noupdate -divider axi_master_agent_2 
add wave -noupdate /uvm_root/uvm_test_top/environment/axi_master_agent_2/axi_master_agent_2_monitor/txn_stream
add wave -noupdate -group axi_master_agent_2_bus /hdl_top/axi_master_agent_2_bus/*
add wave -noupdate -divider spi_slave_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment/spi_slave_agent/spi_slave_agent_monitor/txn_stream
add wave -noupdate -group spi_slave_agent_bus /hdl_top/spi_slave_agent_bus/*

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

