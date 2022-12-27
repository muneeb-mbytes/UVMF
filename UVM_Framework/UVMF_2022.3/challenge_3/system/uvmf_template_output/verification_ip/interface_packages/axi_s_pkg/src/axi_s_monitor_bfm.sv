`ifndef AXI_S_MONITOR_BFM
`define AXI_S_MONITOR_BFM
//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface performs the axi_s signal monitoring.
//      It is accessed by the uvm axi_s monitor through a virtual
//      interface handle in the axi_s configuration.  It monitors the
//      signals passed in through the port connection named bus of
//      type axi_s_if.
//
//     Input signals from the axi_s_if are assigned to an internal input
//     signal with a _i suffix.  The _i signal should be used for sampling.
//
//     The input signal connections are as follows:
//       bus.signal -> signal_i 
//
//      Interface functions and tasks used by UVM components:
//             monitor(inout TRANS_T txn);
//                   This task receives the transaction, txn, from the
//                   UVM monitor and then populates variables in txn
//                   from values observed on bus activity.  This task
//                   blocks until an operation on the axi_s bus is complete.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
import uvmf_base_pkg_hdl::*;
import axi_s_pkg_hdl::*;
`include "src/axi_s_macros.svh"


interface axi_s_monitor_bfm #(
  int AW_WIDTH = 32,
  int LEN = 8,
  int DATA_WIDTH = 32,
  int X = 16
  )
  ( axi_s_if  bus );
  // The pragma below and additional ones in-lined further down are for running this BFM on Veloce
  // pragma attribute axi_s_monitor_bfm partition_interface_xif                                  

`ifndef XRTL
// This code is to aid in debugging parameter mismatches between the BFM and its corresponding agent.
// Enable this debug by setting UVM_VERBOSITY to UVM_DEBUG
// Setting UVM_VERBOSITY to UVM_DEBUG causes all BFM's and all agents to display their parameter settings.
// All of the messages from this feature have a UVM messaging id value of "CFG"
// The transcript or run.log can be parsed to ensure BFM parameter settings match its corresponding agents parameter settings.
import uvm_pkg::*;
`include "uvm_macros.svh"
initial begin : bfm_vs_agent_parameter_debug
  `uvm_info("CFG", 
      $psprintf("The BFM at '%m' has the following parameters: AW_WIDTH=%x LEN=%x DATA_WIDTH=%x X=%x ", AW_WIDTH,LEN,DATA_WIDTH,X),
      UVM_DEBUG)
end
`endif


  // Structure used to pass transaction data from monitor BFM to monitor class in agent.
`axi_s_MONITOR_STRUCT
  axi_s_monitor_s axi_s_monitor_struct;

  // Structure used to pass configuration data from monitor class to monitor BFM.
 `axi_s_CONFIGURATION_STRUCT
 

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase

  logic axi_clk_i;
  logic rst_i;
  tri  awvalid_i;
  tri  awready_i;
  tri [AW_WIDTH-1:0] awaddr_i;
  tri [2:0] awsize_i;
  tri [1:0] awburst_i;
  tri [3:0] awcache_i;
  tri [2:0] awprot_i;
  tri [X-1:0] awid_i;
  tri [LEN-1:0] awlen_i;
  tri  awlock_i;
  tri [3:0] awqos_i;
  tri [3:0] awregion_i;
  tri [X-1:0] awuser_i;
  tri  wvalid_i;
  tri  wready_i;
  tri  wlast_i;
  tri [DATA_WIDTH-1:0] wdata_i;
  tri [DATA_WIDTH/8-1:0] wstrb_i;
  tri [X-1:0] wid_i;
  tri [X-1:0] wuser_i;
  tri  bwvalid_i;
  tri  bwready_i;
  tri [1:0] bresp_i;
  tri [X-1:0] bid_i;
  tri [X-1:0] buser_i;
  tri  arvalid_i;
  tri  aready_i;
  tri [AW_WIDTH-1:0] araddr_i;
  tri [2:0] arsize_i;
  tri [1:0] arburst_i;
  tri [3:0] arcache_i;
  tri [2:0] arprot_i;
  tri [X-1:0] arid_i;
  tri [LEN-1:0] arlen_i;
  tri  arlock_i;
  tri [3:0] arqos_i;
  tri [3:0] aregion_i;
  tri [X-1:0] aruser_i;
  tri  rvalid_i;
  tri  rready_i;
  tri  rlast_i;
  tri [DATA_WIDTH-1:0] rdata_i;
  tri [X-1:0] rid_i;
  tri [X-1:0] ruser_i;
  tri [1:0] rresp_i;
  assign axi_clk_i = bus.axi_clk;
  assign rst_i = bus.rst;
  assign awvalid_i = bus.awvalid;
  assign awready_i = bus.awready;
  assign awaddr_i = bus.awaddr;
  assign awsize_i = bus.awsize;
  assign awburst_i = bus.awburst;
  assign awcache_i = bus.awcache;
  assign awprot_i = bus.awprot;
  assign awid_i = bus.awid;
  assign awlen_i = bus.awlen;
  assign awlock_i = bus.awlock;
  assign awqos_i = bus.awqos;
  assign awregion_i = bus.awregion;
  assign awuser_i = bus.awuser;
  assign wvalid_i = bus.wvalid;
  assign wready_i = bus.wready;
  assign wlast_i = bus.wlast;
  assign wdata_i = bus.wdata;
  assign wstrb_i = bus.wstrb;
  assign wid_i = bus.wid;
  assign wuser_i = bus.wuser;
  assign bwvalid_i = bus.bwvalid;
  assign bwready_i = bus.bwready;
  assign bresp_i = bus.bresp;
  assign bid_i = bus.bid;
  assign buser_i = bus.buser;
  assign arvalid_i = bus.arvalid;
  assign aready_i = bus.aready;
  assign araddr_i = bus.araddr;
  assign arsize_i = bus.arsize;
  assign arburst_i = bus.arburst;
  assign arcache_i = bus.arcache;
  assign arprot_i = bus.arprot;
  assign arid_i = bus.arid;
  assign arlen_i = bus.arlen;
  assign arlock_i = bus.arlock;
  assign arqos_i = bus.arqos;
  assign aregion_i = bus.aregion;
  assign aruser_i = bus.aruser;
  assign rvalid_i = bus.rvalid;
  assign rready_i = bus.rready;
  assign rlast_i = bus.rlast;
  assign rdata_i = bus.rdata;
  assign rid_i = bus.rid;
  assign ruser_i = bus.ruser;
  assign rresp_i = bus.rresp;

  // Proxy handle to UVM monitor
  axi_s_pkg::axi_s_monitor #(
    .AW_WIDTH(AW_WIDTH),
    .LEN(LEN),
    .DATA_WIDTH(DATA_WIDTH),
    .X(X)
    ) proxy;
  // pragma tbx oneway proxy.notify_transaction                 

  // pragma uvmf custom interface_item_additional begin
  // pragma uvmf custom interface_item_additional end
  
  //******************************************************************                         
  task wait_for_reset();// pragma tbx xtf  
    @(posedge axi_clk_i) ;                                                                    
    do_wait_for_reset();                                                                   
  endtask                                                                                   

  // ****************************************************************************              
  task do_wait_for_reset(); 
  // pragma uvmf custom reset_condition begin
    wait ( rst_i === 1 ) ;                                                              
    @(posedge axi_clk_i) ;                                                                    
  // pragma uvmf custom reset_condition end                                                                
  endtask    

  //******************************************************************                         
 
  task wait_for_num_clocks(input int unsigned count); // pragma tbx xtf 
    @(posedge axi_clk_i);  
                                                                   
    repeat (count-1) @(posedge axi_clk_i);                                                    
  endtask      

  //******************************************************************                         
  event go;                                                                                 
  function void start_monitoring();// pragma tbx xtf    
    -> go;
  endfunction                                                                               
  
  // ****************************************************************************              
  initial begin                                                                             
    @go;                                                                                   
    forever begin                                                                        
      @(posedge axi_clk_i);  
      do_monitor( axi_s_monitor_struct );
                                                                 
 
      proxy.notify_transaction( axi_s_monitor_struct );
 
    end                                                                                    
  end                                                                                       

  //******************************************************************
  // The configure() function is used to pass agent configuration
  // variables to the monitor BFM.  It is called by the monitor within
  // the agent at the beginning of the simulation.  It may be called 
  // during the simulation if agent configuration variables are updated
  // and the monitor BFM needs to be aware of the new configuration 
  // variables.
  //
    function void configure(axi_s_configuration_s axi_s_configuration_arg); // pragma tbx xtf  
    initiator_responder = axi_s_configuration_arg.initiator_responder;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction   


  // ****************************************************************************  
            
  task do_monitor(output axi_s_monitor_s axi_s_monitor_struct);
    //
    // Available struct members:
    //     //    axi_s_monitor_struct.awvalid
    //     //    axi_s_monitor_struct.awready
    //     //    axi_s_monitor_struct.awaddr
    //     //    axi_s_monitor_struct.awsize
    //     //    axi_s_monitor_struct.awburst
    //     //    axi_s_monitor_struct.awcache
    //     //    axi_s_monitor_struct.awprot
    //     //    axi_s_monitor_struct.awid
    //     //    axi_s_monitor_struct.awlen
    //     //    axi_s_monitor_struct.awlock
    //     //    axi_s_monitor_struct.awqos
    //     //    axi_s_monitor_struct.awregion
    //     //    axi_s_monitor_struct.awuser
    //     //    axi_s_monitor_struct.wvalid
    //     //    axi_s_monitor_struct.wready
    //     //    axi_s_monitor_struct.wlast
    //     //    axi_s_monitor_struct.wdata
    //     //    axi_s_monitor_struct.wstrb
    //     //    axi_s_monitor_struct.wid
    //     //    axi_s_monitor_struct.wuser
    //     //    axi_s_monitor_struct.bwvalid
    //     //    axi_s_monitor_struct.bwready
    //     //    axi_s_monitor_struct.bresp
    //     //    axi_s_monitor_struct.bid
    //     //    axi_s_monitor_struct.buser
    //     //    axi_s_monitor_struct.arvalid
    //     //    axi_s_monitor_struct.aready
    //     //    axi_s_monitor_struct.araddr
    //     //    axi_s_monitor_struct.arsize
    //     //    axi_s_monitor_struct.arburst
    //     //    axi_s_monitor_struct.arcache
    //     //    axi_s_monitor_struct.arprot
    //     //    axi_s_monitor_struct.arid
    //     //    axi_s_monitor_struct.arlen
    //     //    axi_s_monitor_struct.arlock
    //     //    axi_s_monitor_struct.arqos
    //     //    axi_s_monitor_struct.aregion
    //     //    axi_s_monitor_struct.aruser
    //     //    axi_s_monitor_struct.rvalid
    //     //    axi_s_monitor_struct.rready
    //     //    axi_s_monitor_struct.rlast
    //     //    axi_s_monitor_struct.rdata
    //     //    axi_s_monitor_struct.rid
    //     //    axi_s_monitor_struct.ruser
    //     //    axi_s_monitor_struct.rresp
    //     //
    // Reference code;
    //    How to wait for signal value
    //      while (control_signal === 1'b1) @(posedge axi_clk_i);
    //    
    //    How to assign a struct member, named xyz, from a signal.   
    //    All available input signals listed.
    //      axi_s_monitor_struct.xyz = awvalid_i;  //     
    //      axi_s_monitor_struct.xyz = awready_i;  //     
    //      axi_s_monitor_struct.xyz = awaddr_i;  //    [AW_WIDTH-1:0] 
    //      axi_s_monitor_struct.xyz = awsize_i;  //    [2:0] 
    //      axi_s_monitor_struct.xyz = awburst_i;  //    [1:0] 
    //      axi_s_monitor_struct.xyz = awcache_i;  //    [3:0] 
    //      axi_s_monitor_struct.xyz = awprot_i;  //    [2:0] 
    //      axi_s_monitor_struct.xyz = awid_i;  //    [X-1:0] 
    //      axi_s_monitor_struct.xyz = awlen_i;  //    [LEN-1:0] 
    //      axi_s_monitor_struct.xyz = awlock_i;  //     
    //      axi_s_monitor_struct.xyz = awqos_i;  //    [3:0] 
    //      axi_s_monitor_struct.xyz = awregion_i;  //    [3:0] 
    //      axi_s_monitor_struct.xyz = awuser_i;  //    [X-1:0] 
    //      axi_s_monitor_struct.xyz = wvalid_i;  //     
    //      axi_s_monitor_struct.xyz = wready_i;  //     
    //      axi_s_monitor_struct.xyz = wlast_i;  //     
    //      axi_s_monitor_struct.xyz = wdata_i;  //    [DATA_WIDTH-1:0] 
    //      axi_s_monitor_struct.xyz = wstrb_i;  //    [DATA_WIDTH/8-1:0] 
    //      axi_s_monitor_struct.xyz = wid_i;  //    [X-1:0] 
    //      axi_s_monitor_struct.xyz = wuser_i;  //    [X-1:0] 
    //      axi_s_monitor_struct.xyz = bwvalid_i;  //     
    //      axi_s_monitor_struct.xyz = bwready_i;  //     
    //      axi_s_monitor_struct.xyz = bresp_i;  //    [1:0] 
    //      axi_s_monitor_struct.xyz = bid_i;  //    [X-1:0] 
    //      axi_s_monitor_struct.xyz = buser_i;  //    [X-1:0] 
    //      axi_s_monitor_struct.xyz = arvalid_i;  //     
    //      axi_s_monitor_struct.xyz = aready_i;  //     
    //      axi_s_monitor_struct.xyz = araddr_i;  //    [AW_WIDTH-1:0] 
    //      axi_s_monitor_struct.xyz = arsize_i;  //    [2:0] 
    //      axi_s_monitor_struct.xyz = arburst_i;  //    [1:0] 
    //      axi_s_monitor_struct.xyz = arcache_i;  //    [3:0] 
    //      axi_s_monitor_struct.xyz = arprot_i;  //    [2:0] 
    //      axi_s_monitor_struct.xyz = arid_i;  //    [X-1:0] 
    //      axi_s_monitor_struct.xyz = arlen_i;  //    [LEN-1:0] 
    //      axi_s_monitor_struct.xyz = arlock_i;  //     
    //      axi_s_monitor_struct.xyz = arqos_i;  //    [3:0] 
    //      axi_s_monitor_struct.xyz = aregion_i;  //    [3:0] 
    //      axi_s_monitor_struct.xyz = aruser_i;  //    [X-1:0] 
    //      axi_s_monitor_struct.xyz = rvalid_i;  //     
    //      axi_s_monitor_struct.xyz = rready_i;  //     
    //      axi_s_monitor_struct.xyz = rlast_i;  //     
    //      axi_s_monitor_struct.xyz = rdata_i;  //    [DATA_WIDTH-1:0] 
    //      axi_s_monitor_struct.xyz = rid_i;  //    [X-1:0] 
    //      axi_s_monitor_struct.xyz = ruser_i;  //    [X-1:0] 
    //      axi_s_monitor_struct.xyz = rresp_i;  //    [1:0] 
    // pragma uvmf custom do_monitor begin
    // UVMF_CHANGE_ME : Implement protocol monitoring.  The commented reference code 
    // below are examples of how to capture signal values and assign them to 
    // structure members.  All available input signals are listed.  The 'while' 
    // code example shows how to wait for a synchronous flow control signal.  This
    // task should return when a complete transfer has been observed.  Once this task is
    // exited with captured values, it is then called again to wait for and observe 
    // the next transfer. One clock cycle is consumed between calls to do_monitor.
    @(posedge axi_clk_i);
    @(posedge axi_clk_i);
    @(posedge axi_clk_i);
    @(posedge axi_clk_i);
    // pragma uvmf custom do_monitor end
  endtask         
  
 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end
`endif
