//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the spi_slave interface signals.
//      It is instantiated once per spi_slave bus.  Bus Functional Models, 
//      BFM's named spi_slave_driver_bfm, are used to drive signals on the bus.
//      BFM's named spi_slave_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(spi_slave_bus.sck), // Agent input 
// .dut_signal_port(spi_slave_bus.cs), // Agent input 
// .dut_signal_port(spi_slave_bus.mosi), // Agent input 
// .dut_signal_port(spi_slave_bus.miso), // Agent output 

import uvmf_base_pkg_hdl::*;
import spi_slave_pkg_hdl::*;

interface  spi_slave_if 

  (
  input tri clock, 
  input tri reset,
  inout logic  sck,
  inout logic  cs,
  inout logic [7:0] mosi,
  inout logic [7:0] miso
  );

modport monitor_port 
  (
  input clock,
  input reset,
  input sck,
  input cs,
  input mosi,
  input miso
  );

modport initiator_port 
  (
  input clock,
  input reset,
  input sck,
  input cs,
  input mosi,
  output miso
  );

modport responder_port 
  (
  input clock,
  input reset,  
  output sck,
  output cs,
  output mosi,
  input miso
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

