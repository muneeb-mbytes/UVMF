 

onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider control_plane_in 
add wave -noupdate /uvm_root/uvm_test_top/environment/control_plane_in/control_plane_in_monitor/txn_stream
add wave -noupdate -group control_plane_in_bus /hdl_top/control_plane_in_bus/*
add wave -noupdate -divider control_plane_out 
add wave -noupdate /uvm_root/uvm_test_top/environment/control_plane_out/control_plane_out_monitor/txn_stream
add wave -noupdate -group control_plane_out_bus /hdl_top/control_plane_out_bus/*
add wave -noupdate -divider unsecure_data_plane_in 
add wave -noupdate /uvm_root/uvm_test_top/environment/unsecure_data_plane_in/unsecure_data_plane_in_monitor/txn_stream
add wave -noupdate -group unsecure_data_plane_in_bus /hdl_top/unsecure_data_plane_in_bus/*
add wave -noupdate -divider unsecure_data_plane_out 
add wave -noupdate /uvm_root/uvm_test_top/environment/unsecure_data_plane_out/unsecure_data_plane_out_monitor/txn_stream
add wave -noupdate -group unsecure_data_plane_out_bus /hdl_top/unsecure_data_plane_out_bus/*

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

