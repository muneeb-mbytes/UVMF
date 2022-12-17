//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the jtag interface signals.
//      It is instantiated once per jtag bus.  Bus Functional Models, 
//      BFM's named jtag_driver_bfm, are used to drive signals on the bus.
//      BFM's named jtag_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(jtag_bus.tck), // Agent output 
// .dut_signal_port(jtag_bus.tms), // Agent output 
// .dut_signal_port(jtag_bus.tdi), // Agent output 
// .dut_signal_port(jtag_bus.tdo), // Agent input 

import uvmf_base_pkg_hdl::*;
import jtag_pkg_hdl::*;

interface  jtag_if 

  (
  input tri clk, 
  input tri rst,
  inout tri  tck,
  inout tri  tms,
  inout tri  tdi,
  inout tri  tdo
  );

modport monitor_port 
  (
  input clk,
  input rst,
  input tck,
  input tms,
  input tdi,
  input tdo
  );

modport initiator_port 
  (
  input clk,
  input rst,
  output tck,
  output tms,
  output tdi,
  input tdo
  );

modport responder_port 
  (
  input clk,
  input rst,  
  input tck,
  input tms,
  input tdi,
  output tdo
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

