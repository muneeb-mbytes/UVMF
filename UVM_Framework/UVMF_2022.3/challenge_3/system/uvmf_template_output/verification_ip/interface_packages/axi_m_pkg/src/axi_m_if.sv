`ifndef AXI_M_IF
`define AXI_M_IF
//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the axi_m interface signals.
//      It is instantiated once per axi_m bus.  Bus Functional Models, 
//      BFM's named axi_m_driver_bfm, are used to drive signals on the bus.
//      BFM's named axi_m_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(axi_m_bus.awvalid), // Agent output 
// .dut_signal_port(axi_m_bus.awready), // Agent input 
// .dut_signal_port(axi_m_bus.awaddr), // Agent output 
// .dut_signal_port(axi_m_bus.awsize), // Agent output 
// .dut_signal_port(axi_m_bus.awburst), // Agent output 
// .dut_signal_port(axi_m_bus.awcache), // Agent output 
// .dut_signal_port(axi_m_bus.awprot), // Agent output 
// .dut_signal_port(axi_m_bus.awid), // Agent output 
// .dut_signal_port(axi_m_bus.awlen), // Agent output 
// .dut_signal_port(axi_m_bus.awlock), // Agent output 
// .dut_signal_port(axi_m_bus.awqos), // Agent output 
// .dut_signal_port(axi_m_bus.awregion), // Agent output 
// .dut_signal_port(axi_m_bus.awuser), // Agent output 
// .dut_signal_port(axi_m_bus.wvalid), // Agent output 
// .dut_signal_port(axi_m_bus.wready), // Agent input 
// .dut_signal_port(axi_m_bus.wlast), // Agent output 
// .dut_signal_port(axi_m_bus.wdata), // Agent output 
// .dut_signal_port(axi_m_bus.wstrb), // Agent output 
// .dut_signal_port(axi_m_bus.wid), // Agent output 
// .dut_signal_port(axi_m_bus.wuser), // Agent output 
// .dut_signal_port(axi_m_bus.bwvalid), // Agent input 
// .dut_signal_port(axi_m_bus.bwready), // Agent output 
// .dut_signal_port(axi_m_bus.bresp), // Agent input 
// .dut_signal_port(axi_m_bus.bid), // Agent input 
// .dut_signal_port(axi_m_bus.buser), // Agent input 
// .dut_signal_port(axi_m_bus.arvalid), // Agent output 
// .dut_signal_port(axi_m_bus.aready), // Agent input 
// .dut_signal_port(axi_m_bus.araddr), // Agent output 
// .dut_signal_port(axi_m_bus.arsize), // Agent output 
// .dut_signal_port(axi_m_bus.arburst), // Agent output 
// .dut_signal_port(axi_m_bus.arcache), // Agent output 
// .dut_signal_port(axi_m_bus.arprot), // Agent output 
// .dut_signal_port(axi_m_bus.arid), // Agent output 
// .dut_signal_port(axi_m_bus.arlen), // Agent output 
// .dut_signal_port(axi_m_bus.arlock), // Agent output 
// .dut_signal_port(axi_m_bus.arqos), // Agent output 
// .dut_signal_port(axi_m_bus.aregion), // Agent output 
// .dut_signal_port(axi_m_bus.aruser), // Agent output 
// .dut_signal_port(axi_m_bus.rvalid), // Agent input 
// .dut_signal_port(axi_m_bus.rready), // Agent output 
// .dut_signal_port(axi_m_bus.rlast), // Agent input 
// .dut_signal_port(axi_m_bus.rdata), // Agent input 
// .dut_signal_port(axi_m_bus.rid), // Agent input 
// .dut_signal_port(axi_m_bus.ruser), // Agent input 
// .dut_signal_port(axi_m_bus.rresp), // Agent input 

import uvmf_base_pkg_hdl::*;
import axi_m_pkg_hdl::*;

interface  axi_m_if #(
  int AW_WIDTH = 32,
  int LEN = 8,
  int DATA_WIDTH = 32,
  int X = 16
  )

  (
  input logic axi_clk, 
  input logic rst,
  output logic  awvalid,
  input logic  awready,
  output logic [AW_WIDTH-1:0] awaddr,
  output logic [2:0] awsize,
  output logic [1:0] awburst,
  output logic [3:0] awcache,
  output logic [2:0] awprot,
  output logic [X-1:0] awid,
  output logic [LEN-1:0] awlen,
  output logic  awlock,
  output logic [3:0] awqos,
  output logic [3:0] awregion,
  output logic [X-1:0] awuser,
  output logic  wvalid,
  input logic  wready,
  output logic  wlast,
  output logic [DATA_WIDTH-1:0] wdata,
  output logic [DATA_WIDTH/8-1:0] wstrb,
  output logic [X-1:0] wid,
  output logic [X-1:0] wuser,
  input logic  bwvalid,
  output logic  bwready,
  input logic [1:0] bresp,
  input logic [X-1:0] bid,
  input logic [X-1:0] buser,
  output logic  arvalid,
  input logic  aready,
  output logic [AW_WIDTH-1:0] araddr,
  output logic [2:0] arsize,
  output logic [1:0] arburst,
  output logic [3:0] arcache,
  output logic [2:0] arprot,
  output logic [X-1:0] arid,
  output logic [LEN-1:0] arlen,
  output logic  arlock,
  output logic [3:0] arqos,
  output logic [3:0] aregion,
  output logic [X-1:0] aruser,
  input logic  rvalid,
  output logic  rready,
  input logic  rlast,
  input logic [DATA_WIDTH-1:0] rdata,
  input logic [X-1:0] rid,
  input logic [X-1:0] ruser,
  input logic [1:0] rresp
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
  output bwready,
  input bresp,
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

modport responder_port 
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
  input bwready,
  output bresp,
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
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

`endif
