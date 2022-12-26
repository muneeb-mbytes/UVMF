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
// .dut_signal_port(apb_master_bus.psel), // Agent output 
// .dut_signal_port(apb_master_bus.penable), // Agent output 
// .dut_signal_port(apb_master_bus.pwrite), // Agent output 
// .dut_signal_port(apb_master_bus.paddr), // Agent output 
// .dut_signal_port(apb_master_bus.pstrb), // Agent output 
// .dut_signal_port(apb_master_bus.pwdata), // Agent output 
// .dut_signal_port(apb_master_bus.pready), // Agent input 
// .dut_signal_port(apb_master_bus.pslverr), // Agent input 
// .dut_signal_port(apb_master_bus.prdata), // Agent input 

import uvmf_base_pkg_hdl::*;
import apb_master_pkg_hdl::*;

interface  apb_master_if #(
  int ADDRESS_WIDTH = 32,
  int DATA_WIDTH = 32,
  int NO_OF_SLAVES = 1
  )

  (
  input tri clk, 
  input tri rst,
  inout tri [NO_OF_SLAVES-1:0] psel,
  inout tri  penable,
  inout tri  pwrite,
  inout tri [ADDRESS_WIDTH-1:0] paddr,
  inout tri [DATA_WIDTH-1:0] pstrb,
  inout tri [ADDRESS_WIDTH-1:0] pwdata,
  inout tri  pready,
  inout tri  pslverr,
  inout tri [DATA_WIDTH-1:0] prdata
  );

modport monitor_port 
  (
  input clk,
  input rst,
  input psel,
  input penable,
  input pwrite,
  input paddr,
  input pstrb,
  input pwdata,
  input pready,
  input pslverr,
  input prdata
  );

modport initiator_port 
  (
  input clk,
  input rst,
  output psel,
  output penable,
  output pwrite,
  output paddr,
  output pstrb,
  output pwdata,
  input pready,
  input pslverr,
  input prdata
  );

modport responder_port 
  (
  input clk,
  input rst,  
  input psel,
  input penable,
  input pwrite,
  input paddr,
  input pstrb,
  input pwdata,
  output pready,
  output pslverr,
  output prdata
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

