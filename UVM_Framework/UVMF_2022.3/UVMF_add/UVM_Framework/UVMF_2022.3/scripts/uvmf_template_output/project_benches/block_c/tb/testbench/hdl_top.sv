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

import block_c_parameters_pkg::*;
import qvip_agents_params_pkg::*;
import uvmf_base_pkg_hdl::*;

  // pragma attribute hdl_top partition_module_xrtl                                            
  hdl_qvip_agents 
      #(
        .PCIE_EP_ACTIVE(1),
        .AXI4_MASTER_0_ACTIVE(1),
        .AXI4_MASTER_1_ACTIVE(1),
        .AXI4_SLAVE_ACTIVE(1),
        .APB3_CONFIG_MASTER_ACTIVE(1),
        .UNIQUE_ID("uvm_test_top.environment.qvip_env.")
        /*.EXT_CLK_RESET(0)*/ 
       ) uvm_test_top_environment_qvip_env_qvip_hdl();

// pragma uvmf custom clock_generator begin
  bit clk;
  // Instantiate a clk driver 
  // tbx clkgen
  initial begin
    clk = 0;
    #21ns;
    forever begin
      clk = ~clk;
      #6ns;
    end
  end
// pragma uvmf custom clock_generator end

// pragma uvmf custom reset_generator begin
  bit rst;
  // Instantiate a rst driver
  // tbx clkgen
  initial begin
    rst = 1; 
    #250ns;
    rst =  0; 
  end
// pragma uvmf custom reset_generator end

  // pragma uvmf custom module_item_additional begin
  // pragma uvmf custom module_item_additional end

  // Instantiate the signal bundle, monitor bfm and driver bfm for each interface.
  // The signal bundle, _if, contains signals to be connected to the DUT.
  // The monitor, monitor_bfm, observes the bus, _if, and captures transactions.
  // The driver, driver_bfm, drives transactions onto the bus, _if.
  mem_if  mem_in_bus(
     // pragma uvmf custom mem_in_bus_connections begin
     .clock(clk), .reset(rst)
     // pragma uvmf custom mem_in_bus_connections end
     );
  mem_if  mem_out_bus(
     // pragma uvmf custom mem_out_bus_connections begin
     .clock(clk), .reset(rst)
     // pragma uvmf custom mem_out_bus_connections end
     );
  pkt_if  pkt_out_bus(
     // pragma uvmf custom pkt_out_bus_connections begin
     .pclk(clk), .prst(rst)
     // pragma uvmf custom pkt_out_bus_connections end
     );
  mem_monitor_bfm  mem_in_mon_bfm(mem_in_bus.monitor_port);
  mem_monitor_bfm  mem_out_mon_bfm(mem_out_bus.monitor_port);
  pkt_monitor_bfm  pkt_out_mon_bfm(pkt_out_bus.monitor_port);
  mem_driver_bfm  mem_in_drv_bfm(mem_in_bus.initiator_port);
  mem_driver_bfm  mem_out_drv_bfm(mem_out_bus.initiator_port);
  pkt_driver_bfm  pkt_out_drv_bfm(pkt_out_bus.initiator_port);

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
    uvm_config_db #( virtual mem_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , mem_in_BFM , mem_in_mon_bfm ); 
    uvm_config_db #( virtual mem_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , mem_out_BFM , mem_out_mon_bfm ); 
    uvm_config_db #( virtual pkt_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , pkt_out_BFM , pkt_out_mon_bfm ); 
    uvm_config_db #( virtual mem_driver_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , mem_in_BFM , mem_in_drv_bfm  );
    uvm_config_db #( virtual mem_driver_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , mem_out_BFM , mem_out_drv_bfm  );
    uvm_config_db #( virtual pkt_driver_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , pkt_out_BFM , pkt_out_drv_bfm  );
  end

endmodule

// pragma uvmf custom external begin
// pragma uvmf custom external end

