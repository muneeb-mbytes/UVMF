//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the axi_s interface signals.
//      It is instantiated once per axi_s bus.  Bus Functional Models, 
//      BFM's named axi_s_driver_bfm, are used to drive signals on the bus.
//      BFM's named axi_s_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
`ifndef AXI_S_IF
`define AXI_S_IF
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(axi_s_bus.awvalid), // Agent input 
// .dut_signal_port(axi_s_bus.awready), // Agent output 
// .dut_signal_port(axi_s_bus.awaddr), // Agent input 
// .dut_signal_port(axi_s_bus.awsize), // Agent input 
// .dut_signal_port(axi_s_bus.awburst), // Agent input 
// .dut_signal_port(axi_s_bus.awcache), // Agent input 
// .dut_signal_port(axi_s_bus.awprot), // Agent input 
// .dut_signal_port(axi_s_bus.awid), // Agent input 
// .dut_signal_port(axi_s_bus.awlen), // Agent input 
// .dut_signal_port(axi_s_bus.awlock), // Agent input 
// .dut_signal_port(axi_s_bus.awqos), // Agent input 
// .dut_signal_port(axi_s_bus.awregion), // Agent input 
// .dut_signal_port(axi_s_bus.awuser), // Agent input 
// .dut_signal_port(axi_s_bus.wvalid), // Agent input 
// .dut_signal_port(axi_s_bus.wready), // Agent output 
// .dut_signal_port(axi_s_bus.wlast), // Agent input 
// .dut_signal_port(axi_s_bus.wdata), // Agent input 
// .dut_signal_port(axi_s_bus.wstrb), // Agent input 
// .dut_signal_port(axi_s_bus.wid), // Agent input 
// .dut_signal_port(axi_s_bus.wuser), // Agent input 
// .dut_signal_port(axi_s_bus.bwvalid), // Agent output 
// .dut_signal_port(axi_s_bus.bwready), // Agent output 
// .dut_signal_port(axi_s_bus.bresp), // Agent input 
// .dut_signal_port(axi_s_bus.bid), // Agent output 
// .dut_signal_port(axi_s_bus.buser), // Agent output 
// .dut_signal_port(axi_s_bus.arvalid), // Agent input 
// .dut_signal_port(axi_s_bus.aready), // Agent output 
// .dut_signal_port(axi_s_bus.araddr), // Agent input 
// .dut_signal_port(axi_s_bus.arsize), // Agent input 
// .dut_signal_port(axi_s_bus.arburst), // Agent input 
// .dut_signal_port(axi_s_bus.arcache), // Agent input 
// .dut_signal_port(axi_s_bus.arprot), // Agent input 
// .dut_signal_port(axi_s_bus.arid), // Agent input 
// .dut_signal_port(axi_s_bus.arlen), // Agent input 
// .dut_signal_port(axi_s_bus.arlock), // Agent input 
// .dut_signal_port(axi_s_bus.arqos), // Agent input 
// .dut_signal_port(axi_s_bus.aregion), // Agent input 
// .dut_signal_port(axi_s_bus.aruser), // Agent input 
// .dut_signal_port(axi_s_bus.rvalid), // Agent output 
// .dut_signal_port(axi_s_bus.rready), // Agent input 
// .dut_signal_port(axi_s_bus.rlast), // Agent output 
// .dut_signal_port(axi_s_bus.rdata), // Agent output 
// .dut_signal_port(axi_s_bus.rid), // Agent output 
// .dut_signal_port(axi_s_bus.ruser), // Agent output 
// .dut_signal_port(axi_s_bus.rresp), // Agent output 

import uvmf_base_pkg_hdl::*;
import axi_s_pkg_hdl::*;

interface  axi_s_if #(
  int AW_WIDTH = 32,
  int LEN = 8,
  int DATA_WIDTH = 32,
  int X = 16
  )

  (
  input logic axi_clk, 
  input logic rst,
  input logic  awvalid,
  output logic  awready,
  input logic [AW_WIDTH-1:0] awaddr,
  input logic [2:0] awsize,
  input logic [1:0] awburst,
  input logic [3:0] awcache,
  input logic [2:0] awprot,
  input logic [X-1:0] awid,
  input logic [LEN-1:0] awlen,
  input logic  awlock,
  input logic [3:0] awqos,
  input logic [3:0] awregion,
  input logic [X-1:0] awuser,
  input logic  wvalid,
  output logic  wready,
  input logic  wlast,
  input logic [DATA_WIDTH-1:0] wdata,
  input logic [DATA_WIDTH/8-1:0] wstrb,
  input logic [X-1:0] wid,
  input logic [X-1:0] wuser,
  output logic  bwvalid,
  output logic  bwready,
  input logic [1:0] bresp,
  output logic [X-1:0] bid,
  output logic [X-1:0] buser,
  input logic  arvalid,
  output logic  aready,
  input logic [AW_WIDTH-1:0] araddr,
  input logic [2:0] arsize,
  input logic [1:0] arburst,
  input logic [3:0] arcache,
  input logic [2:0] arprot,
  input logic [X-1:0] arid,
  input logic [LEN-1:0] arlen,
  input logic  arlock,
  input logic [3:0] arqos,
  input logic [3:0] aregion,
  input logic [X-1:0] aruser,
  output logic  rvalid,
  input logic  rready,
  output logic  rlast,
  output logic [DATA_WIDTH-1:0] rdata,
  output logic [X-1:0] rid,
  output logic [X-1:0] ruser,
  output logic [1:0] rresp
  );

modport monitor_port 
  (
  input axi_clk,
  input rst,
  input awvalid,
  input awready,
  input awaddr,
  input awsize,
  input awburst,
  input awcache,
  input awprot,
  input awid,
  input awlen,
  input awlock,
  input awqos,
  input awregion,
  input awuser,
  input wvalid,
  input wready,
  input wlast,
  input wdata,
  input wstrb,
  input wid,
  input wuser,
  input bwvalid,
  input bwready,
  input bresp,
  input bid,
  input buser,
  input arvalid,
  input aready,
  input araddr,
  input arsize,
  input arburst,
  input arcache,
  input arprot,
  input arid,
  input arlen,
  input arlock,
  input arqos,
  input aregion,
  input aruser,
  input rvalid,
  input rready,
  input rlast,
  input rdata,
  input rid,
  input ruser,
  input rresp
  );

modport initiator_port 
  (
  input axi_clk,
  input rst,
  input awvalid,
  output awready,
  input awaddr,
  input awsize,
  input awburst,
  input awcache,
  input awprot,
  input awid,
  input awlen,
  input awlock,
  input awqos,
  input awregion,
  input awuser,
  input wvalid,
  output wready,
  input wlast,
  input wdata,
  input wstrb,
  input wid,
  input wuser,
  output bwvalid,
  output bwready,
  input bresp,
  output bid,
  output buser,
  input arvalid,
  output aready,
  input araddr,
  input arsize,
  input arburst,
  input arcache,
  input arprot,
  input arid,
  input arlen,
  input arlock,
  input arqos,
  input aregion,
  input aruser,
  output rvalid,
  input rready,
  output rlast,
  output rdata,
  output rid,
  output ruser,
  output rresp
  );

modport responder_port 
  (
  input axi_clk,
  input rst,  
  output awvalid,
  input awready,
  output awaddr,
  output awsize,
  output awburst,
  output awcache,
  output awprot,
  output awid,
  output awlen,
  output awlock,
  output awqos,
  output awregion,
  output awuser,
  output wvalid,
  input wready,
  output wlast,
  output wdata,
  output wstrb,
  output wid,
  output wuser,
  input bwvalid,
  input bwready,
  output bresp,
  input bid,
  input buser,
  output arvalid,
  input aready,
  output araddr,
  output arsize,
  output arburst,
  output arcache,
  output arprot,
  output arid,
  output arlen,
  output arlock,
  output arqos,
  output aregion,
  output aruser,
  input rvalid,
  output rready,
  input rlast,
  input rdata,
  input rid,
  input ruser,
  input rresp
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end
`endif
