//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the axi_master interface signals.
//      It is instantiated once per axi_master bus.  Bus Functional Models, 
//      BFM's named axi_master_driver_bfm, are used to drive signals on the bus.
//      BFM's named axi_master_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(axi_master_bus.pclk), // Agent output 
// .dut_signal_port(axi_master_bus.preset_n), // Agent output 
// .dut_signal_port(axi_master_bus.AWADDER), // Agent input 
// .dut_signal_port(axi_master_bus.AWBURST), // Agent input 
// .dut_signal_port(axi_master_bus.AWCACHE), // Agent input 
// .dut_signal_port(axi_master_bus.AWID), // Agent input 
// .dut_signal_port(axi_master_bus.AWLENGTH), // Agent input 
// .dut_signal_port(axi_master_bus.AWLOCK), // Agent input 
// .dut_signal_port(axi_master_bus.AWPROT), // Agent input 
// .dut_signal_port(axi_master_bus.AWREADDY), // Agent output 
// .dut_signal_port(axi_master_bus.AWSIZE), // Agent input 
// .dut_signal_port(axi_master_bus.AWVALID), // Agent input 
// .dut_signal_port(axi_master_bus.WDATA), // Agent input 
// .dut_signal_port(axi_master_bus.WSTRB), // Agent input 
// .dut_signal_port(axi_master_bus.WUSER), // Agent input 
// .dut_signal_port(axi_master_bus.BID), // Agent input 
// .dut_signal_port(axi_master_bus.BRESP), // Agent input 
// .dut_signal_port(axi_master_bus.BUSER), // Agent input 
// .dut_signal_port(axi_master_bus.BVALID), // Agent output 
// .dut_signal_port(axi_master_bus.ARID), // Agent input 
// .dut_signal_port(axi_master_bus.ARADDR), // Agent input 
// .dut_signal_port(axi_master_bus.ARLEN), // Agent input 
// .dut_signal_port(axi_master_bus.ARSIZE), // Agent input 
// .dut_signal_port(axi_master_bus.ARBURST), // Agent input 
// .dut_signal_port(axi_master_bus.ARCACHE), // Agent input 
// .dut_signal_port(axi_master_bus.ARPROT), // Agent input 
// .dut_signal_port(axi_master_bus.ARQOS), // Agent input 
// .dut_signal_port(axi_master_bus.ARREGION), // Agent input 
// .dut_signal_port(axi_master_bus.ARUSER), // Agent input 
// .dut_signal_port(axi_master_bus.ARLOCK), // Agent input 
// .dut_signal_port(axi_master_bus.RID), // Agent output 
// .dut_signal_port(axi_master_bus.RDATA), // Agent output 
// .dut_signal_port(axi_master_bus.RRESP), // Agent output 
// .dut_signal_port(axi_master_bus.RUSER), // Agent output 
// .dut_signal_port(axi_master_bus.RLAST), // Agent output 
// .dut_signal_port(axi_master_bus.RVALID), // Agent output 

import uvmf_base_pkg_hdl::*;
import axi_master_pkg_hdl::*;

interface  axi_master_if 

  (
  input tri clock, 
  input tri reset,
  inout logic  pclk,
  inout logic  preset_n,
  inout logic [31:0] AWADDER,
  inout logic  AWBURST,
  inout logic [3:0] AWCACHE,
  inout logic [3:0] AWID,
  inout logic [3:0] AWLENGTH,
  inout logic [1:0] AWLOCK,
  inout logic [2:0] AWPROT,
  inout logic  AWREADDY,
  inout logic [2:0] AWSIZE,
  inout logic  AWVALID,
  inout logic [31:0] WDATA,
  inout logic [3:0] WSTRB,
  inout logic [16:0] WUSER,
  inout logic [3:0] BID,
  inout logic [1:0] BRESP,
  inout logic [7:0] BUSER,
  inout logic  BVALID,
  inout logic [3:0] ARID,
  inout logic [31:0] ARADDR,
  inout logic [7:0] ARLEN,
  inout logic [2:0] ARSIZE,
  inout logic [1:0] ARBURST,
  inout logic [3:0] ARCACHE,
  inout logic [2:0] ARPROT,
  inout logic [3:0] ARQOS,
  inout logic [3:0] ARREGION,
  inout logic [3:0] ARUSER,
  inout logic  ARLOCK,
  inout logic [3:0] RID,
  inout logic [31:0] RDATA,
  inout logic [3:0] RRESP,
  inout logic [63:0] RUSER,
  inout logic [1:0] RLAST,
  inout logic  RVALID
  );

modport monitor_port 
  (
  input clock,
  input reset,
  input pclk,
  input preset_n,
  input AWADDER,
  input AWBURST,
  input AWCACHE,
  input AWID,
  input AWLENGTH,
  input AWLOCK,
  input AWPROT,
  input AWREADDY,
  input AWSIZE,
  input AWVALID,
  input WDATA,
  input WSTRB,
  input WUSER,
  input BID,
  input BRESP,
  input BUSER,
  input BVALID,
  input ARID,
  input ARADDR,
  input ARLEN,
  input ARSIZE,
  input ARBURST,
  input ARCACHE,
  input ARPROT,
  input ARQOS,
  input ARREGION,
  input ARUSER,
  input ARLOCK,
  input RID,
  input RDATA,
  input RRESP,
  input RUSER,
  input RLAST,
  input RVALID
  );

modport initiator_port 
  (
  input clock,
  input reset,
  output pclk,
  output preset_n,
  input AWADDER,
  input AWBURST,
  input AWCACHE,
  input AWID,
  input AWLENGTH,
  input AWLOCK,
  input AWPROT,
  output AWREADDY,
  input AWSIZE,
  input AWVALID,
  input WDATA,
  input WSTRB,
  input WUSER,
  input BID,
  input BRESP,
  input BUSER,
  output BVALID,
  input ARID,
  input ARADDR,
  input ARLEN,
  input ARSIZE,
  input ARBURST,
  input ARCACHE,
  input ARPROT,
  input ARQOS,
  input ARREGION,
  input ARUSER,
  input ARLOCK,
  output RID,
  output RDATA,
  output RRESP,
  output RUSER,
  output RLAST,
  output RVALID
  );

modport responder_port 
  (
  input clock,
  input reset,  
  input pclk,
  input preset_n,
  output AWADDER,
  output AWBURST,
  output AWCACHE,
  output AWID,
  output AWLENGTH,
  output AWLOCK,
  output AWPROT,
  input AWREADDY,
  output AWSIZE,
  output AWVALID,
  output WDATA,
  output WSTRB,
  output WUSER,
  output BID,
  output BRESP,
  output BUSER,
  input BVALID,
  output ARID,
  output ARADDR,
  output ARLEN,
  output ARSIZE,
  output ARBURST,
  output ARCACHE,
  output ARPROT,
  output ARQOS,
  output ARREGION,
  output ARUSER,
  output ARLOCK,
  input RID,
  input RDATA,
  input RRESP,
  input RUSER,
  input RLAST,
  input RVALID
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

