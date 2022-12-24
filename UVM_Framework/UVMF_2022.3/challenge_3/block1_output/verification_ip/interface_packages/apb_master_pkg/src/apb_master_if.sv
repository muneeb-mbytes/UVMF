//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the apb_master interface signals.
//      It is instantiated once per apb_master bus.  Bus Functional Models, 
//      BFM's named apb_master_driver_bfm, are used to drive signals on the bus.
//      BFM's named apb_master_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(apb_master_bus.pclk), // Agent output 
// .dut_signal_port(apb_master_bus.preset_n), // Agent output 
// .dut_signal_port(apb_master_bus.pselx), // Agent output 
// .dut_signal_port(apb_master_bus.penable), // Agent output 
// .dut_signal_port(apb_master_bus.paddr), // Agent output 
// .dut_signal_port(apb_master_bus.pwdata), // Agent output 
// .dut_signal_port(apb_master_bus.pwrite), // Agent output 
// .dut_signal_port(apb_master_bus.pprot), // Agent output 
// .dut_signal_port(apb_master_bus.pstrobe), // Agent output 
// .dut_signal_port(apb_master_bus.prdata), // Agent input 
// .dut_signal_port(apb_master_bus.pready), // Agent input 
// .dut_signal_port(apb_master_bus.pslverr), // Agent input 

import uvmf_base_pkg_hdl::*;
import apb_master_pkg_hdl::*;

interface  apb_master_if 

  (
  input tri clock, 
  input tri reset,
  inout logic  pclk,
  inout logic  preset_n,
  inout logic  pselx,
  inout logic  penable,
  inout logic [31:0] paddr,
  inout logic [31:0] pwdata,
  inout logic [31:0] pwrite,
  inout logic [2:0] pprot,
  inout logic [3:0] pstrobe,
  inout logic [31:0] prdata,
  inout logic  pready,
  inout logic [3:0] pslverr
  );

modport monitor_port 
  (
  input clock,
  input reset,
  input pclk,
  input preset_n,
  input pselx,
  input penable,
  input paddr,
  input pwdata,
  input pwrite,
  input pprot,
  input pstrobe,
  input prdata,
  input pready,
  input pslverr
  );

modport initiator_port 
  (
  input clock,
  input reset,
  output pclk,
  output preset_n,
  output pselx,
  output penable,
  output paddr,
  output pwdata,
  output pwrite,
  output pprot,
  output pstrobe,
  input prdata,
  input pready,
  input pslverr
  );

modport responder_port 
  (
  input clock,
  input reset,  
  input pclk,
  input preset_n,
  input pselx,
  input penable,
  input paddr,
  input pwdata,
  input pwrite,
  input pprot,
  input pstrobe,
  output prdata,
  output pready,
  output pslverr
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

