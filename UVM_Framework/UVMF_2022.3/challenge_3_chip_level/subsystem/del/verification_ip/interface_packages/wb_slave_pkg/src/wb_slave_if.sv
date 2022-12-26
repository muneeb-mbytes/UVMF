//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the wb_slave interface signals.
//      It is instantiated once per wb_slave bus.  Bus Functional Models, 
//      BFM's named wb_slave_driver_bfm, are used to drive signals on the bus.
//      BFM's named wb_slave_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(wb_slave_bus.adr_i), // Agent input 
// .dut_signal_port(wb_slave_bus.dat_i), // Agent input 
// .dut_signal_port(wb_slave_bus.dat_o), // Agent output 
// .dut_signal_port(wb_slave_bus.we_i), // Agent input 
// .dut_signal_port(wb_slave_bus.sel_i), // Agent input 
// .dut_signal_port(wb_slave_bus.stb_i), // Agent input 
// .dut_signal_port(wb_slave_bus.ack_o), // Agent output 
// .dut_signal_port(wb_slave_bus.cyc_i), // Agent input 

import uvmf_base_pkg_hdl::*;
import wb_slave_pkg_hdl::*;

interface  wb_slave_if #(
  bit ADDR_WIDTH = 32,
  bit DATA_WIDTH = 32
  )

  (
  input tri clk, 
  input tri rst,
  inout tri [ADDR_WIDTH-1:0] adr_i,
  inout tri [DATA_WIDTH-1:0] dat_i,
  inout tri [DATA_WIDTH-1:0] dat_o,
  inout tri  we_i,
  inout tri [7:0] sel_i,
  inout tri [7:0] stb_i,
  inout tri  ack_o,
  inout tri  cyc_i
  );

modport monitor_port 
  (
  input clk,
  input rst,
  input adr_i,
  input dat_i,
  input dat_o,
  input we_i,
  input sel_i,
  input stb_i,
  input ack_o,
  input cyc_i
  );

modport initiator_port 
  (
  input clk,
  input rst,
  input adr_i,
  input dat_i,
  output dat_o,
  input we_i,
  input sel_i,
  input stb_i,
  output ack_o,
  input cyc_i
  );

modport responder_port 
  (
  input clk,
  input rst,  
  output adr_i,
  output dat_i,
  input dat_o,
  output we_i,
  output sel_i,
  output stb_i,
  input ack_o,
  output cyc_i
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

