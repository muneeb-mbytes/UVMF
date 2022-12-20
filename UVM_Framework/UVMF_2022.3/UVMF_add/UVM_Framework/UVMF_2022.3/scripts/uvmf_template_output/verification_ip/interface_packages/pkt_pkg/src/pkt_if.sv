//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the pkt interface signals.
//      It is instantiated once per pkt bus.  Bus Functional Models, 
//      BFM's named pkt_driver_bfm, are used to drive signals on the bus.
//      BFM's named pkt_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(pkt_bus.sop), // Agent output 
// .dut_signal_port(pkt_bus.eop), // Agent output 
// .dut_signal_port(pkt_bus.rdy), // Agent input 
// .dut_signal_port(pkt_bus.data), // Agent output 
// .dut_signal_port(pkt_bus.status), // Agent input 

import uvmf_base_pkg_hdl::*;
import pkt_pkg_hdl::*;

interface  pkt_if #(
  int DATA_WIDTH = 240,
  int STATUS_WIDTH = 230
  )

  (
  input tri pclk, 
  input tri prst,
  inout tri  sop,
  inout tri  eop,
  inout tri  rdy,
  inout tri [DATA_WIDTH-1:0] data,
  inout tri [STATUS_WIDTH-1:0] status
  );

modport monitor_port 
  (
  input pclk,
  input prst,
  input sop,
  input eop,
  input rdy,
  input data,
  input status
  );

modport initiator_port 
  (
  input pclk,
  input prst,
  output sop,
  output eop,
  input rdy,
  output data,
  input status
  );

modport responder_port 
  (
  input pclk,
  input prst,  
  input sop,
  input eop,
  output rdy,
  input data,
  output status
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

