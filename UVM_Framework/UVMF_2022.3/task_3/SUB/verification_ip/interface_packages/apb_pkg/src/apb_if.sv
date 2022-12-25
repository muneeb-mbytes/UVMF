//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the apb interface signals.
//      It is instantiated once per apb bus.  Bus Functional Models, 
//      BFM's named apb_driver_bfm, are used to drive signals on the bus.
//      BFM's named apb_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(apb_bus.psel), // Agent output 
// .dut_signal_port(apb_bus.penable), // Agent output 
// .dut_signal_port(apb_bus.paddr), // Agent output 
// .dut_signal_port(apb_bus.pwdata), // Agent output 
// .dut_signal_port(apb_bus.pwrite), // Agent output 
// .dut_signal_port(apb_bus.pstrb), // Agent output 
// .dut_signal_port(apb_bus.pprot), // Agent output 
// .dut_signal_port(apb_bus.prdata), // Agent input 
// .dut_signal_port(apb_bus.pready), // Agent input 
// .dut_signal_port(apb_bus.pslverr), // Agent input 

import uvmf_base_pkg_hdl::*;
import apb_pkg_hdl::*;

interface  apb_if #(
  int APB_ADDR_WIDTH = 32,
  int APB_DATA_WIDTH = 32,
  int STRB_LEN = APB_ADDR_WIDTH/8
  )

  (
  input logic pclk, 
  input logic presetn,
  output logic [15:0] psel,
  output logic  penable,
  output logic [APB_ADDR_WIDTH-1:0] paddr,
  output logic [APB_DATA_WIDTH-1:0] pwdata,
  output logic  pwrite,
  output logic [STRB_LEN-1:0] pstrb,
  output logic [2:0] pprot,
  input logic [APB_DATA_WIDTH-1:0] prdata,
  input logic  pready,
  input logic  pslverr
  );

modport monitor_port 
  (
  input pclk,
  input presetn,
  input psel,
  input penable,
  input paddr,
  input pwdata,
  input pwrite,
  input pstrb,
  input pprot,
  input prdata,
  input pready,
  input pslverr
  );

modport initiator_port 
  (
  input pclk,
  input presetn,
  output psel,
  output penable,
  output paddr,
  output pwdata,
  output pwrite,
  output pstrb,
  output pprot,
  input prdata,
  input pready,
  input pslverr
  );

modport responder_port 
  (
  input pclk,
  input presetn,  
  input psel,
  input penable,
  input paddr,
  input pwdata,
  input pwrite,
  input pstrb,
  input pprot,
  output prdata,
  output pready,
  output pslverr
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

