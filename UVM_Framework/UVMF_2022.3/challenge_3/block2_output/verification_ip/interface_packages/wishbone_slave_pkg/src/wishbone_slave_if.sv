//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the wishbone_slave interface signals.
//      It is instantiated once per wishbone_slave bus.  Bus Functional Models, 
//      BFM's named wishbone_slave_driver_bfm, are used to drive signals on the bus.
//      BFM's named wishbone_slave_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(wishbone_slave_bus.ADR_O), // Agent output 
// .dut_signal_port(wishbone_slave_bus.DATA_I), // Agent input 
// .dut_signal_port(wishbone_slave_bus.DATA_O), // Agent output 
// .dut_signal_port(wishbone_slave_bus.WE_O), // Agent output 
// .dut_signal_port(wishbone_slave_bus.SEL_O), // Agent output 
// .dut_signal_port(wishbone_slave_bus.STB_O), // Agent output 
// .dut_signal_port(wishbone_slave_bus.ACK_I), // Agent input 
// .dut_signal_port(wishbone_slave_bus.CYC_O), // Agent output 
// .dut_signal_port(wishbone_slave_bus.TAGN_O), // Agent output 
// .dut_signal_port(wishbone_slave_bus.TAGN_I), // Agent input 

import uvmf_base_pkg_hdl::*;
import wishbone_slave_pkg_hdl::*;

interface  wishbone_slave_if 

  (
  input tri clock, 
  input tri reset,
  inout logic [31:0] ADR_O,
  inout logic [31:0] DATA_I,
  inout logic [31:0] DATA_O,
  inout logic  WE_O,
  inout logic  SEL_O,
  inout logic  STB_O,
  inout logic  ACK_I,
  inout logic  CYC_O,
  inout logic  TAGN_O,
  inout logic  TAGN_I
  );

modport monitor_port 
  (
  input clock,
  input reset,
  input ADR_O,
  input DATA_I,
  input DATA_O,
  input WE_O,
  input SEL_O,
  input STB_O,
  input ACK_I,
  input CYC_O,
  input TAGN_O,
  input TAGN_I
  );

modport initiator_port 
  (
  input clock,
  input reset,
  output ADR_O,
  input DATA_I,
  output DATA_O,
  output WE_O,
  output SEL_O,
  output STB_O,
  input ACK_I,
  output CYC_O,
  output TAGN_O,
  input TAGN_I
  );

modport responder_port 
  (
  input clock,
  input reset,  
  input ADR_O,
  output DATA_I,
  input DATA_O,
  input WE_O,
  input SEL_O,
  input STB_O,
  output ACK_I,
  input CYC_O,
  input TAGN_O,
  output TAGN_I
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

