//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the jtag_b interface signals.
//      It is instantiated once per jtag_b bus.  Bus Functional Models, 
//      BFM's named jtag_b_driver_bfm, are used to drive signals on the bus.
//      BFM's named jtag_b_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(jtag_b_bus.tck), // Agent input 
// .dut_signal_port(jtag_b_bus.tms), // Agent input 
// .dut_signal_port(jtag_b_bus.tdi), // Agent input 
// .dut_signal_port(jtag_b_bus.tdo), // Agent output 

import uvmf_base_pkg_hdl::*;
import jtag_b_pkg_hdl::*;

interface  jtag_b_if 

  (
  input tri clock, 
  input tri reset,
  inout logic  tck,
  inout logic  tms,
  inout logic  tdi,
  inout logic  tdo
  );

modport monitor_port 
  (
  input clock,
  input reset,
  input tck,
  input tms,
  input tdi,
  input tdo
  );

modport initiator_port 
  (
  input clock,
  input reset,
  input tck,
  input tms,
  input tdi,
  output tdo
  );

modport responder_port 
  (
  input clock,
  input reset,  
  output tck,
  output tms,
  output tdi,
  input tdo
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

