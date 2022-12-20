//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the dma interface signals.
//      It is instantiated once per dma bus.  Bus Functional Models, 
//      BFM's named dma_driver_bfm, are used to drive signals on the bus.
//      BFM's named dma_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(dma_bus.rd_en), // Agent output 
// .dut_signal_port(dma_bus.wr_en), // Agent output 
// .dut_signal_port(dma_bus.addr), // Agent output 
// .dut_signal_port(dma_bus.wdata), // Agent output 
// .dut_signal_port(dma_bus.rdata), // Agent input 

import uvmf_base_pkg_hdl::*;
import dma_pkg_hdl::*;

interface  dma_if #(
  int DATA_WIDTH = 16,
  int ADDR_WIDTH = 8
  )

  (
  input tri clock, 
  input tri reset,
  inout tri  rd_en,
  inout tri  wr_en,
  inout tri [ADDR_WIDTH-1:0] addr,
  inout tri [DATA_WIDTH-1:0] wdata,
  inout tri [DATA_WIDTH-1:0] rdata
  );

modport monitor_port 
  (
  input clock,
  input reset,
  input rd_en,
  input wr_en,
  input addr,
  input wdata,
  input rdata
  );

modport initiator_port 
  (
  input clock,
  input reset,
  output rd_en,
  output wr_en,
  output addr,
  output wdata,
  input rdata
  );

modport responder_port 
  (
  input clock,
  input reset,  
  input rd_en,
  input wr_en,
  input addr,
  input wdata,
  output rdata
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

