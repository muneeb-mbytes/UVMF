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
// .dut_signal_port(axi_master_bus.awvalid), // Agent output 
// .dut_signal_port(axi_master_bus.awid), // Agent output 
// .dut_signal_port(axi_master_bus.awlen), // Agent output 
// .dut_signal_port(axi_master_bus.awsize), // Agent output 
// .dut_signal_port(axi_master_bus.awaddr), // Agent output 
// .dut_signal_port(axi_master_bus.awburst), // Agent output 
// .dut_signal_port(axi_master_bus.wvalid), // Agent output 
// .dut_signal_port(axi_master_bus.wready), // Agent input 
// .dut_signal_port(axi_master_bus.wid), // Agent output 
// .dut_signal_port(axi_master_bus.wsize), // Agent output 
// .dut_signal_port(axi_master_bus.wdata), // Agent output 
// .dut_signal_port(axi_master_bus.wstrb), // Agent output 
// .dut_signal_port(axi_master_bus.wlast), // Agent output 
// .dut_signal_port(axi_master_bus.arvalid), // Agent output 
// .dut_signal_port(axi_master_bus.arready), // Agent input 
// .dut_signal_port(axi_master_bus.arid), // Agent output 
// .dut_signal_port(axi_master_bus.arlen), // Agent output 
// .dut_signal_port(axi_master_bus.arsize), // Agent output 
// .dut_signal_port(axi_master_bus.arburst), // Agent output 

import uvmf_base_pkg_hdl::*;
import axi_master_pkg_hdl::*;

interface  axi_master_if #(
  int id_width = 4,
  int len_width = 4,
  int size_width = 3,
  int addr_width = 32,
  int burst_width = 2,
  int data_width = 32,
  int strb_width = 4,
  int resp_width = 2
  )

  (
  input tri clock, 
  input tri reset,
  inout tri  awvalid,
  inout tri [id_width-1:0] awid,
  inout tri [len_width-1:0] awlen,
  inout tri [size_width-1:0] awsize,
  inout tri [addr_width-1:0] awaddr,
  inout tri [burst_width-1:0] awburst,
  inout tri  wvalid,
  inout tri  wready,
  inout tri [id_width-1:0] wid,
  inout tri [size_width-1:0] wsize,
  inout tri [data_width-1:0] wdata,
  inout tri [strb_width-1:0] wstrb,
  inout tri  wlast,
  inout tri  arvalid,
  inout tri  arready,
  inout tri [id_width-1:0] arid,
  inout tri [len_width-1:0] arlen,
  inout tri [size_width-1:0] arsize,
  inout tri [burst_width-1:0] arburst
  );

modport monitor_port 
  (
  input clock,
  input reset,
  input awvalid,
  input awid,
  input awlen,
  input awsize,
  input awaddr,
  input awburst,
  input wvalid,
  input wready,
  input wid,
  input wsize,
  input wdata,
  input wstrb,
  input wlast,
  input arvalid,
  input arready,
  input arid,
  input arlen,
  input arsize,
  input arburst
  );

modport initiator_port 
  (
  input clock,
  input reset,
  output awvalid,
  output awid,
  output awlen,
  output awsize,
  output awaddr,
  output awburst,
  output wvalid,
  input wready,
  output wid,
  output wsize,
  output wdata,
  output wstrb,
  output wlast,
  output arvalid,
  input arready,
  output arid,
  output arlen,
  output arsize,
  output arburst
  );

modport responder_port 
  (
  input clock,
  input reset,  
  input awvalid,
  input awid,
  input awlen,
  input awsize,
  input awaddr,
  input awburst,
  input wvalid,
  output wready,
  input wid,
  input wsize,
  input wdata,
  input wstrb,
  input wlast,
  input arvalid,
  output arready,
  input arid,
  input arlen,
  input arsize,
  input arburst
  );
  

// pragma uvmf custom interface_item_additional begin
// pragma uvmf custom interface_item_additional end

endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

