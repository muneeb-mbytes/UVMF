`ifndef SPI_S_IF
`define SPI_S_IF
//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the spi_s interface signals.
//      It is instantiated once per spi_s bus.  Bus Functional Models, 
//      BFM's named spi_s_driver_bfm, are used to drive signals on the bus.
//      BFM's named spi_s_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(spi_s_bus.sclk), // Agent input 
// .dut_signal_port(spi_s_bus.ss), // Agent input 
// .dut_signal_port(spi_s_bus.mosi), // Agent input 
// .dut_signal_port(spi_s_bus.miso), // Agent output 

import uvmf_base_pkg_hdl::*;
import spi_s_pkg_hdl::*;

interface  spi_s_if 

  (
  input logic sck, 
  input logic rst,
  input logic  sclk,
  input logic  ss,
  input logic [7:0] mosi,
  output logic [7:0] miso
  );

modport monitor_port 
  (
  input sck,
  input rst,
  input sclk,
  input ss,
  input mosi,
  input miso
  );

modport initiator_port 
  (
  input sck,
  input rst,
  input sclk,
  input ss,
  input mosi,
  output miso
  );

modport responder_port 
  (
  input sck,
  input rst,  
  output sclk,
  output ss,
  output mosi,
  input miso
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

`endif
