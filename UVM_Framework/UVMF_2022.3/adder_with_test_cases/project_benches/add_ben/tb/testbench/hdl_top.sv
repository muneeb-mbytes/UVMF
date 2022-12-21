//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------                     
//               
// Description: This top level module instantiates all synthesizable
//    static content.  This and tb_top.sv are the two top level modules
//    of the simulation.  
//
//    This module instantiates the following:
//        DUT: The Design Under Test
//        Interfaces:  Signal bundles that contain signals connected to DUT
//        Driver BFM's: BFM's that actively drive interface signals
//        Monitor BFM's: BFM's that passively monitor interface signals
//
//----------------------------------------------------------------------

//----------------------------------------------------------------------
//

module hdl_top;

import add_ben_parameters_pkg::*;
import uvmf_base_pkg_hdl::*;

// pragma uvmf custom clock_generator begin
  bit clk;
  // Instantiate a clk driver 
  initial begin
    clk = 0;
    #9ns;
    forever begin
      clk = ~clk;
      #5ns;
    end
  end
// pragma uvmf custom clock_generator end

// pragma uvmf custom reset_generator begin
  bit rst;
  // Instantiate a rst driver
  initial begin
    rst = 0; 
    #200ns;
    rst =  1; 
  end
// pragma uvmf custom reset_generator end

  // pragma uvmf custom module_item_additional begin
  // pragma uvmf custom module_item_additional end

  // Instantiate the signal bundle, monitor bfm and driver bfm for each interface.
  // The signal bundle, _if, contains signals to be connected to the DUT.
  // The monitor, monitor_bfm, observes the bus, _if, and captures transactions.
  // The driver, driver_bfm, drives transactions onto the bus, _if.
  add_in_if  add_in_agent_bus(
     // pragma uvmf custom add_in_agent_bus_connections begin
     .clk(clk), .rst(rst)
     // pragma uvmf custom add_in_agent_bus_connections end
     );
  add_out_if  add_out_agent_bus(
     // pragma uvmf custom add_out_agent_bus_connections begin
     .clk(clk), .rst(rst)
     // pragma uvmf custom add_out_agent_bus_connections end
     );
  add_in_monitor_bfm  add_in_agent_mon_bfm(add_in_agent_bus.monitor_port);
  add_out_monitor_bfm  add_out_agent_mon_bfm(add_out_agent_bus.monitor_port);
  add_in_driver_bfm  add_in_agent_drv_bfm(add_in_agent_bus.initiator_port);

  // pragma uvmf custom dut_instantiation begin
  // UVMF_CHANGE_ME : Add DUT and connect to signals in _bus interfaces listed above
  // Instantiate your DUT here
  // These DUT's instantiated to show verilog and vhdl instantiation
  //verilog_dut         dut_verilog(   .clk(clk), .rst(rst), .in_signal(vhdl_to_verilog_signal), .out_signal(verilog_to_vhdl_signal)); 
  verilog_dut dut_verilog(.clk(clk), .rst(rst), .a(add_in_agent_bus.a), .b(add_in_agent_bus.b),.sum(add_out_agent_bus.sum),.c_out(add_out_agent_bus.cout));
  //vhdl_dut            dut_vhdl   (   .clk(clk), .rst(rst), .in_signal(verilog_to_vhdl_signal), .out_signal(vhdl_to_verilog_signal));
  // pragma uvmf custom dut_instantiation end

  initial begin 
    import uvm_pkg::uvm_config_db;
    // The monitor_bfm and driver_bfm for each interface is placed into the uvm_config_db.
    // They are placed into the uvm_config_db using the string names defined in the parameters package.
    // The string names are passed to the agent configurations by test_top through the top level configuration.
    // They are retrieved by the agents configuration class for use by the agent.
    uvm_config_db #( virtual add_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , add_in_agent_BFM , add_in_agent_mon_bfm ); 
    uvm_config_db #( virtual add_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , add_out_agent_BFM , add_out_agent_mon_bfm ); 
    uvm_config_db #( virtual add_in_driver_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , add_in_agent_BFM , add_in_agent_drv_bfm  );
  end

endmodule

// pragma uvmf custom external begin
// pragma uvmf custom external end

