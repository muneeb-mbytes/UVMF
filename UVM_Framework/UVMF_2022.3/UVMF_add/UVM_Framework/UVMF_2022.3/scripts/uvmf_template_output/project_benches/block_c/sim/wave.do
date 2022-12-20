 

onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider mem_in 
add wave -noupdate /uvm_root/uvm_test_top/environment/mem_in/mem_in_monitor/txn_stream
add wave -noupdate -group mem_in_bus /hdl_top/mem_in_bus/*
add wave -noupdate -divider mem_out 
add wave -noupdate /uvm_root/uvm_test_top/environment/mem_out/mem_out_monitor/txn_stream
add wave -noupdate -group mem_out_bus /hdl_top/mem_out_bus/*
add wave -noupdate -divider pkt_out 
add wave -noupdate /uvm_root/uvm_test_top/environment/pkt_out/pkt_out_monitor/txn_stream
add wave -noupdate -group pkt_out_bus /hdl_top/pkt_out_bus/*

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

