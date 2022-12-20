//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the mem interface signals.
//      It is instantiated once per mem bus.  Bus Functional Models, 
//      BFM's named mem_driver_bfm, are used to drive signals on the bus.
//      BFM's named mem_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(mem_bus.cs), // Agent output 
// .dut_signal_port(mem_bus.rwn), // Agent output 
// .dut_signal_port(mem_bus.rdy), // Agent input 
// .dut_signal_port(mem_bus.addr), // Agent output 
// .dut_signal_port(mem_bus.wdata), // Agent output 
// .dut_signal_port(mem_bus.rdata), // Agent input 

import uvmf_base_pkg_hdl::*;
import mem_pkg_hdl::*;

interface  mem_if #(
  int DATA_WIDTH = 220,
  int ADDR_WIDTH = 210
  )

  (
  input tri clock, 
  input tri reset,
  inout tri  cs,
  inout tri  rwn,
  inout tri  rdy,
  inout tri [ADDR_WIDTH-1:0] addr,
  inout tri [DATA_WIDTH-1:0] wdata,
  inout tri [DATA_WIDTH-1:0] rdata
  );

modport monitor_port 
  (
  input clock,
  input reset,
  input cs,
  input rwn,
  input rdy,
  input addr,
  input wdata,
  input rdata
  );

modport initiator_port 
  (
  input clock,
  input reset,
  output cs,
  output rwn,
  input rdy,
  output addr,
  output wdata,
  input rdata
  );

modport responder_port 
  (
  input clock,
  input reset,  
  input cs,
  input rwn,
  output rdy,
  input addr,
  input wdata,
  output rdata
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

