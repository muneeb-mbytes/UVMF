//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the spi_m interface signals.
//      It is instantiated once per spi_m bus.  Bus Functional Models, 
//      BFM's named spi_m_driver_bfm, are used to drive signals on the bus.
//      BFM's named spi_m_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(spi_m_bus.sclk), // Agent output 
// .dut_signal_port(spi_m_bus.ss), // Agent output 
// .dut_signal_port(spi_m_bus.mosi), // Agent output 
// .dut_signal_port(spi_m_bus.miso), // Agent input 

import uvmf_base_pkg_hdl::*;
import spi_m_pkg_hdl::*;

interface  spi_m_if 

  (
  input logic sck, 
  input logic rst,
  output logic  sclk,
  output logic  ss,
  output logic [bit [7:0]-1:0] mosi,
  input logic [bit [7:0]-1:0] miso
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
  output sclk,
  output ss,
  output mosi,
  input miso
  );

modport responder_port 
  (
  input sck,
  input rst,  
  input sclk,
  input ss,
  input mosi,
  output miso
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

