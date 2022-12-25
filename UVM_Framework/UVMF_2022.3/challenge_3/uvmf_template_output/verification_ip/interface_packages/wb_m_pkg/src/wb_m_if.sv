//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the wb_m interface signals.
//      It is instantiated once per wb_m bus.  Bus Functional Models, 
//      BFM's named wb_m_driver_bfm, are used to drive signals on the bus.
//      BFM's named wb_m_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(wb_m_bus.din), // Agent input 
// .dut_signal_port(wb_m_bus.dout), // Agent output 
// .dut_signal_port(wb_m_bus.TGD_I), // Agent input 
// .dut_signal_port(wb_m_bus.TGD_O), // Agent output 
// .dut_signal_port(wb_m_bus.ack), // Agent output 
// .dut_signal_port(wb_m_bus.adr), // Agent output 
// .dut_signal_port(wb_m_bus.cyc), // Agent output 
// .dut_signal_port(wb_m_bus.err), // Agent input 
// .dut_signal_port(wb_m_bus.we), // Agent output 
// .dut_signal_port(wb_m_bus.stb), // Agent output 
// .dut_signal_port(wb_m_bus.sel), // Agent output 

import uvmf_base_pkg_hdl::*;
import wb_m_pkg_hdl::*;

interface  wb_m_if #(
  int WB_ADDR_WIDTH = 32,
  int WB_DATA_WIDTH = 16
  )

  (
  input logic clock, 
  input logic reset,
  input logic [WB_DATA_WIDTH-1:0] din,
  output logic [WB_DATA_WIDTH-1:0] dout,
  input logic [WB_DATA_WIDTH-1:0] TGD_I,
  output logic [WB_DATA_WIDTH-1:0] TGD_O,
  output logic  ack,
  output logic [WB_ADDR_WIDTH-1:0] adr,
  output logic  cyc,
  input logic  err,
  output logic  we,
  output logic  stb,
  output logic [WB_DATA_WIDTH/8-1:0] sel
  );

modport monitor_port 
  (
  input clock,
  input reset,
  input din,
  input dout,
  input TGD_I,
  input TGD_O,
  input ack,
  input adr,
  input cyc,
  input err,
  input we,
  input stb,
  input sel
  );

modport initiator_port 
  (
  input clock,
  input reset,
  input din,
  output dout,
  input TGD_I,
  output TGD_O,
  output ack,
  output adr,
  output cyc,
  input err,
  output we,
  output stb,
  output sel
  );

modport responder_port 
  (
  input clock,
  input reset,  
  output din,
  input dout,
  output TGD_I,
  input TGD_O,
  input ack,
  input adr,
  input cyc,
  output err,
  input we,
  input stb,
  input sel
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

