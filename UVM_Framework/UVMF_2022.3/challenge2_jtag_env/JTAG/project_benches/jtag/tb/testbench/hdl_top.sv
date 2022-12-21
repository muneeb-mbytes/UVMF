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

import jtag_parameters_pkg::*;
import uvmf_base_pkg_hdl::*;

  // pragma attribute hdl_top partition_module_xrtl                                            
// pragma uvmf custom clock_generator begin
  bit clk;
  // Instantiate a clk driver 
  // tbx clkgen
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
  // tbx clkgen
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
  jtag_a_if  jtag_agent_a_bus(
     // pragma uvmf custom jtag_agent_a_bus_connections begin
     .clock(clk), .reset(rst)
     // pragma uvmf custom jtag_agent_a_bus_connections end
     );
  jtag_b_if  jtag_agent_b_bus(
     // pragma uvmf custom jtag_agent_b_bus_connections begin
     .clock(clk), .reset(rst)
     // pragma uvmf custom jtag_agent_b_bus_connections end
     );
  jtag_a_monitor_bfm  jtag_agent_a_mon_bfm(jtag_agent_a_bus.monitor_port);
  jtag_b_monitor_bfm  jtag_agent_b_mon_bfm(jtag_agent_b_bus.monitor_port);
  jtag_a_driver_bfm  jtag_agent_a_drv_bfm(jtag_agent_a_bus.initiator_port);
  jtag_b_driver_bfm  jtag_agent_b_drv_bfm(jtag_agent_b_bus.initiator_port);

  // pragma uvmf custom dut_instantiation begin
  // UVMF_CHANGE_ME : Add DUT and connect to signals in _bus interfaces listed above
  // Instantiate your DUT here
  // These DUT's instantiated to show verilog and vhdl instantiation
  verilog_dut         dut_verilog(   .clk(clk), .rst(rst), .in_signal(vhdl_to_verilog_signal), .out_signal(verilog_to_vhdl_signal));
  vhdl_dut            dut_vhdl   (   .clk(clk), .rst(rst), .in_signal(verilog_to_vhdl_signal), .out_signal(vhdl_to_verilog_signal));
  // pragma uvmf custom dut_instantiation end

  initial begin      // tbx vif_binding_block 
    import uvm_pkg::uvm_config_db;
    // The monitor_bfm and driver_bfm for each interface is placed into the uvm_config_db.
    // They are placed into the uvm_config_db using the string names defined in the parameters package.
    // The string names are passed to the agent configurations by test_top through the top level configuration.
    // They are retrieved by the agents configuration class for use by the agent.
    uvm_config_db #( virtual jtag_a_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , jtag_agent_a_BFM , jtag_agent_a_mon_bfm ); 
    uvm_config_db #( virtual jtag_b_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , jtag_agent_b_BFM , jtag_agent_b_mon_bfm ); 
    uvm_config_db #( virtual jtag_a_driver_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , jtag_agent_a_BFM , jtag_agent_a_drv_bfm  );
    uvm_config_db #( virtual jtag_b_driver_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , jtag_agent_b_BFM , jtag_agent_b_drv_bfm  );
  end

endmodule

// pragma uvmf custom external begin
// pragma uvmf custom external end

