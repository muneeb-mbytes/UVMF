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
// .dut_signal_port(spi_slave_bus.sck), // Agent output 
// .dut_signal_port(spi_slave_bus.mosi), // Agent output 
// .dut_signal_port(spi_slave_bus.cs), // Agent output 
// .dut_signal_port(spi_slave_bus.miso), // Agent input 

import uvmf_base_pkg_hdl::*;
import spi_slave_pkg_hdl::*;

interface  spi_slave_if 

  (
  input tri clk, 
  input tri rst,
  inout tri  sck,
  inout tri  mosi,
  inout tri  cs,
  inout tri  miso
  );

modport monitor_port 
  (
  input clk,
  input rst,
  input sck,
  input mosi,
  input cs,
  input miso
  );

modport initiator_port 
  (
  input clk,
  input rst,
  output sck,
  output mosi,
  output cs,
  input miso
  );

modport responder_port 
  (
  input clk,
  input rst,  
  input sck,
  input mosi,
  input cs,
  output miso
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

