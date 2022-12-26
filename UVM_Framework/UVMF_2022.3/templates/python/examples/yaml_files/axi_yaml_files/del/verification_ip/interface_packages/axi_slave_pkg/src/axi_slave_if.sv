//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface contains the axi_slave interface signals.
//      It is instantiated once per axi_slave bus.  Bus Functional Models, 
//      BFM's named axi_slave_driver_bfm, are used to drive signals on the bus.
//      BFM's named axi_slave_monitor_bfm are used to monitor signals on the 
//      bus. This interface signal bundle is passed in the port list of
//      the BFM in order to give the BFM access to the signals in this
//      interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// This template can be used to connect a DUT to these signals
//
// .dut_signal_port(axi_slave_bus.awvalid), // Agent input 
// .dut_signal_port(axi_slave_bus.awready), // Agent output 
// .dut_signal_port(axi_slave_bus.awid), // Agent input 
// .dut_signal_port(axi_slave_bus.awlen), // Agent input 
// .dut_signal_port(axi_slave_bus.awsize), // Agent input 
// .dut_signal_port(axi_slave_bus.awaddr), // Agent input 
// .dut_signal_port(axi_slave_bus.awburst), // Agent input 
// .dut_signal_port(axi_slave_bus.wvalid), // Agent input 
// .dut_signal_port(axi_slave_bus.wready), // Agent output 
// .dut_signal_port(axi_slave_bus.wid), // Agent input 
// .dut_signal_port(axi_slave_bus.wdata), // Agent input 
// .dut_signal_port(axi_slave_bus.wstrb), // Agent input 
// .dut_signal_port(axi_slave_bus.wlast), // Agent input 
// .dut_signal_port(axi_slave_bus.bready), // Agent input 
// .dut_signal_port(axi_slave_bus.bvalid), // Agent output 
// .dut_signal_port(axi_slave_bus.bid), // Agent output 
// .dut_signal_port(axi_slave_bus.bresp), // Agent input 
// .dut_signal_port(axi_slave_bus.arvalid), // Agent input 
// .dut_signal_port(axi_slave_bus.arready), // Agent output 
// .dut_signal_port(axi_slave_bus.arid), // Agent input 
// .dut_signal_port(axi_slave_bus.arlen), // Agent input 
// .dut_signal_port(axi_slave_bus.arsize), // Agent input 
// .dut_signal_port(axi_slave_bus.araddr), // Agent input 
// .dut_signal_port(axi_slave_bus.arburst), // Agent input 
// .dut_signal_port(axi_slave_bus.rvalid), // Agent output 
// .dut_signal_port(axi_slave_bus.rready), // Agent input 
// .dut_signal_port(axi_slave_bus.rid), // Agent output 
// .dut_signal_port(axi_slave_bus.rdata), // Agent output 
// .dut_signal_port(axi_slave_bus.rlast), // Agent output 
// .dut_signal_port(axi_slave_bus.rresp), // Agent input 

import uvmf_base_pkg_hdl::*;
import axi_slave_pkg_hdl::*;

interface  axi_slave_if #(
  int ADDR_WIDTH = 32,
  int DATA_WIDTH = 32,
  int RESP_WIDTH = 2,
  int ID_WIDTH = 4,
  int STRB_WIDTH = 4,
  int LEN_WIDTH = 8,
  int SIZE_WIDTH = 3,
  int BURST_WIDTH = 2
  )

  (
  input tri clk, 
  input tri rst,
  inout tri  awvalid,
  inout tri  awready,
  inout tri [ID_WIDTH-1:0] awid,
  inout tri [LEN_WIDTH-1:0] awlen,
  inout tri [SIZE_WIDTH-1:0] awsize,
  inout tri [ADDR_WIDTH-1:0] awaddr,
  inout tri [BURST_WIDTH-1:0] awburst,
  inout tri  wvalid,
  inout tri  wready,
  inout tri [ID_WIDTH-1:0] wid,
  inout tri [DATA_WIDTH-1:0] wdata,
  inout tri [STRB_WIDTH-1:0] wstrb,
  inout tri  wlast,
  inout tri  bready,
  inout tri  bvalid,
  inout tri [ID_WIDTH-1:0] bid,
  inout tri [RESP_WIDTH-1:0] bresp,
  inout tri  arvalid,
  inout tri  arready,
  inout tri [ID_WIDTH-1:0] arid,
  inout tri [LEN_WIDTH-1:0] arlen,
  inout tri [SIZE_WIDTH-1:0] arsize,
  inout tri [ADDR_WIDTH-1:0] araddr,
  inout tri [BURST_WIDTH-1:0] arburst,
  inout tri  rvalid,
  inout tri  rready,
  inout tri [ID_WIDTH-1:0] rid,
  inout tri [DATA_WIDTH-1:0] rdata,
  inout tri  rlast,
  inout tri [RESP_WIDTH-1:0] rresp
  );

modport monitor_port 
  (
  input clk,
  input rst,
  input awvalid,
  input awready,
  input awid,
  input awlen,
  input awsize,
  input awaddr,
  input awburst,
  input wvalid,
  input wready,
  input wid,
  input wdata,
  input wstrb,
  input wlast,
  input bready,
  input bvalid,
  input bid,
  input bresp,
  input arvalid,
  input arready,
  input arid,
  input arlen,
  input arsize,
  input araddr,
  input arburst,
  input rvalid,
  input rready,
  input rid,
  input rdata,
  input rlast,
  input rresp
  );

modport initiator_port 
  (
  input clk,
  input rst,
  input awvalid,
  output awready,
  input awid,
  input awlen,
  input awsize,
  input awaddr,
  input awburst,
  input wvalid,
  output wready,
  input wid,
  input wdata,
  input wstrb,
  input wlast,
  input bready,
  output bvalid,
  output bid,
  input bresp,
  input arvalid,
  output arready,
  input arid,
  input arlen,
  input arsize,
  input araddr,
  input arburst,
  output rvalid,
  input rready,
  output rid,
  output rdata,
  output rlast,
  input rresp
  );

modport responder_port 
  (
  input clk,
  input rst,  
  output awvalid,
  input awready,
  output awid,
  output awlen,
  output awsize,
  output awaddr,
  output awburst,
  output wvalid,
  input wready,
  output wid,
  output wdata,
  output wstrb,
  output wlast,
  output bready,
  input bvalid,
  input bid,
  output bresp,
  output arvalid,
  input arready,
  output arid,
  output arlen,
  output arsize,
  output araddr,
  output arburst,
  input rvalid,
  output rready,
  input rid,
  input rdata,
  input rlast,
  output rresp
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

