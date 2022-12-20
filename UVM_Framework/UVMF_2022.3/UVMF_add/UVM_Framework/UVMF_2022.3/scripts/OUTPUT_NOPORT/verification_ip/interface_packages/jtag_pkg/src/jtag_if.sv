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

import uvmf_base_pkg_hdl::*;
import jtag_pkg_hdl::*;

interface  jtag_if 

  (
  input tri clock, 
  input tri reset

  );

modport monitor_port 
  (
  input clock,
  input reset

  );

modport initiator_port 
  (
  input clock,
  input reset

  );

modport responder_port 
  (
  input clock,
  input reset  

  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

