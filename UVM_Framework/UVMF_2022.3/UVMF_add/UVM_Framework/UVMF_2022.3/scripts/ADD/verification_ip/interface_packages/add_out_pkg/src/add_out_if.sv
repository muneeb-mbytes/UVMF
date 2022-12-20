//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the add_out interface signals.
//      It is instantiated once per add_out bus.  Bus Functional Models, 
//      BFM's named add_out_driver_bfm, are used to drive signals on the bus.
//      BFM's named add_out_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(add_out_bus.sum), // Agent input 
// .dut_signal_port(add_out_bus.cout), // Agent input 

import uvmf_base_pkg_hdl::*;
import add_out_pkg_hdl::*;

interface  add_out_if #(
  int add_width = 4
  )

  (
  input tri clk, 
  input tri rst,
  inout logic [add_width-1:0] sum,
  inout logic  cout
  );

modport monitor_port 
  (
  input clk,
  input rst,
  input sum,
  input cout
  );

modport initiator_port 
  (
  input clk,
  input rst,
  input sum,
  input cout
  );

modport responder_port 
  (
  input clk,
  input rst,  
  output sum,
  output cout
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

