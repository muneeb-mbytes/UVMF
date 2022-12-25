 

onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider s1_b1_apb_master 
add wave -noupdate /uvm_root/uvm_test_top/environment.s1.b1/apb_master/apb_master_monitor/txn_stream
add wave -noupdate -group s1_b1_apb_master_bus /hdl_top/s1_b1_apb_master_bus/*
add wave -noupdate -divider s1_b1_axi_master1 
add wave -noupdate /uvm_root/uvm_test_top/environment.s1.b1/axi_master1/axi_master1_monitor/txn_stream
add wave -noupdate -group s1_b1_axi_master1_bus /hdl_top/s1_b1_axi_master1_bus/*
add wave -noupdate -divider s1_b1_axi_master2 
add wave -noupdate /uvm_root/uvm_test_top/environment.s1.b1/axi_master2/axi_master2_monitor/txn_stream
add wave -noupdate -group s1_b1_axi_master2_bus /hdl_top/s1_b1_axi_master2_bus/*
add wave -noupdate -divider s1_b1_spi_slave 
add wave -noupdate /uvm_root/uvm_test_top/environment.s1.b1/spi_slave/spi_slave_monitor/txn_stream
add wave -noupdate -group s1_b1_spi_slave_bus /hdl_top/s1_b1_spi_slave_bus/*
add wave -noupdate -divider s1_b2_spi_master 
add wave -noupdate /uvm_root/uvm_test_top/environment.s1.b2/spi_master/spi_master_monitor/txn_stream
add wave -noupdate -group s1_b2_spi_master_bus /hdl_top/s1_b2_spi_master_bus/*
add wave -noupdate -divider s1_b2_wb_slave 
add wave -noupdate /uvm_root/uvm_test_top/environment.s1.b2/wb_slave/wb_slave_monitor/txn_stream
add wave -noupdate -group s1_b2_wb_slave_bus /hdl_top/s1_b2_wb_slave_bus/*
add wave -noupdate -divider b3_wb_master 
add wave -noupdate /uvm_root/uvm_test_top/environment.b3/wb_master/wb_master_monitor/txn_stream
add wave -noupdate -group b3_wb_master_bus /hdl_top/b3_wb_master_bus/*
add wave -noupdate -divider b3_axi_slave 
add wave -noupdate /uvm_root/uvm_test_top/environment.b3/axi_slave/axi_slave_monitor/txn_stream
add wave -noupdate -group b3_axi_slave_bus /hdl_top/b3_axi_slave_bus/*

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

