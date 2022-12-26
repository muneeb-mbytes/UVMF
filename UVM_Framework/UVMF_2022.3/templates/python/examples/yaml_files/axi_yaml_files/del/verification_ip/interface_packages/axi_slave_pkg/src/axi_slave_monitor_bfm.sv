//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface performs the axi_slave signal monitoring.
//      It is accessed by the uvm axi_slave monitor through a virtual
//      interface handle in the axi_slave configuration.  It monitors the
//      signals passed in through the port connection named bus of
//      type axi_slave_if.
//
//     Input signals from the axi_slave_if are assigned to an internal input
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
//                   blocks until an operation on the axi_slave bus is complete.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
import uvmf_base_pkg_hdl::*;
import axi_slave_pkg_hdl::*;
`include "src/axi_slave_macros.svh"


interface axi_slave_monitor_bfm #(
  int ADDR_WIDTH = 32,
  int DATA_WIDTH = 32,
  int RESP_WIDTH = 2,
  int ID_WIDTH = 4,
  int STRB_WIDTH = 4,
  int LEN_WIDTH = 8,
  int SIZE_WIDTH = 3,
  int BURST_WIDTH = 2
  )
  ( axi_slave_if  bus );
  // The pragma below and additional ones in-lined further down are for running this BFM on Veloce
  // pragma attribute axi_slave_monitor_bfm partition_interface_xif                                  

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
      $psprintf("The BFM at '%m' has the following parameters: ADDR_WIDTH=%x DATA_WIDTH=%x RESP_WIDTH=%x ID_WIDTH=%x STRB_WIDTH=%x LEN_WIDTH=%x SIZE_WIDTH=%x BURST_WIDTH=%x ", ADDR_WIDTH,DATA_WIDTH,RESP_WIDTH,ID_WIDTH,STRB_WIDTH,LEN_WIDTH,SIZE_WIDTH,BURST_WIDTH),
      UVM_DEBUG)
end
`endif


  // Structure used to pass transaction data from monitor BFM to monitor class in agent.
`axi_slave_MONITOR_STRUCT
  axi_slave_monitor_s axi_slave_monitor_struct;

  // Structure used to pass configuration data from monitor class to monitor BFM.
 `axi_slave_CONFIGURATION_STRUCT
 

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase

  tri clk_i;
  tri rst_i;
  tri  awvalid_i;
  tri  awready_i;
  tri [ID_WIDTH-1:0] awid_i;
  tri [LEN_WIDTH-1:0] awlen_i;
  tri [SIZE_WIDTH-1:0] awsize_i;
  tri [ADDR_WIDTH-1:0] awaddr_i;
  tri [BURST_WIDTH-1:0] awburst_i;
  tri  wvalid_i;
  tri  wready_i;
  tri [ID_WIDTH-1:0] wid_i;
  tri [DATA_WIDTH-1:0] wdata_i;
  tri [STRB_WIDTH-1:0] wstrb_i;
  tri  wlast_i;
  tri  bready_i;
  tri  bvalid_i;
  tri [ID_WIDTH-1:0] bid_i;
  tri [RESP_WIDTH-1:0] bresp_i;
  tri  arvalid_i;
  tri  arready_i;
  tri [ID_WIDTH-1:0] arid_i;
  tri [LEN_WIDTH-1:0] arlen_i;
  tri [SIZE_WIDTH-1:0] arsize_i;
  tri [ADDR_WIDTH-1:0] araddr_i;
  tri [BURST_WIDTH-1:0] arburst_i;
  tri  rvalid_i;
  tri  rready_i;
  tri [ID_WIDTH-1:0] rid_i;
  tri [DATA_WIDTH-1:0] rdata_i;
  tri  rlast_i;
  tri [RESP_WIDTH-1:0] rresp_i;
  assign clk_i = bus.clk;
  assign rst_i = bus.rst;
  assign awvalid_i = bus.awvalid;
  assign awready_i = bus.awready;
  assign awid_i = bus.awid;
  assign awlen_i = bus.awlen;
  assign awsize_i = bus.awsize;
  assign awaddr_i = bus.awaddr;
  assign awburst_i = bus.awburst;
  assign wvalid_i = bus.wvalid;
  assign wready_i = bus.wready;
  assign wid_i = bus.wid;
  assign wdata_i = bus.wdata;
  assign wstrb_i = bus.wstrb;
  assign wlast_i = bus.wlast;
  assign bready_i = bus.bready;
  assign bvalid_i = bus.bvalid;
  assign bid_i = bus.bid;
  assign bresp_i = bus.bresp;
  assign arvalid_i = bus.arvalid;
  assign arready_i = bus.arready;
  assign arid_i = bus.arid;
  assign arlen_i = bus.arlen;
  assign arsize_i = bus.arsize;
  assign araddr_i = bus.araddr;
  assign arburst_i = bus.arburst;
  assign rvalid_i = bus.rvalid;
  assign rready_i = bus.rready;
  assign rid_i = bus.rid;
  assign rdata_i = bus.rdata;
  assign rlast_i = bus.rlast;
  assign rresp_i = bus.rresp;

  // Proxy handle to UVM monitor
  axi_slave_pkg::axi_slave_monitor #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH),
    .RESP_WIDTH(RESP_WIDTH),
    .ID_WIDTH(ID_WIDTH),
    .STRB_WIDTH(STRB_WIDTH),
    .LEN_WIDTH(LEN_WIDTH),
    .SIZE_WIDTH(SIZE_WIDTH),
    .BURST_WIDTH(BURST_WIDTH)
    ) proxy;
  // pragma tbx oneway proxy.notify_transaction                 

  // pragma uvmf custom interface_item_additional begin
  // pragma uvmf custom interface_item_additional end
  
  //******************************************************************                         
  task wait_for_reset();// pragma tbx xtf  
    @(posedge clk_i) ;                                                                    
    do_wait_for_reset();                                                                   
  endtask                                                                                   

  // ****************************************************************************              
  task do_wait_for_reset(); 
  // pragma uvmf custom reset_condition begin
    wait ( rst_i === 1 ) ;                                                              
    @(posedge clk_i) ;                                                                    
  // pragma uvmf custom reset_condition end                                                                
  endtask    

  //******************************************************************                         
 
  task wait_for_num_clocks(input int unsigned count); // pragma tbx xtf 
    @(posedge clk_i);  
                                                                   
    repeat (count-1) @(posedge clk_i);                                                    
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
      @(posedge clk_i);  
      do_monitor( axi_slave_monitor_struct );
                                                                 
 
      proxy.notify_transaction( axi_slave_monitor_struct );
 
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
    function void configure(axi_slave_configuration_s axi_slave_configuration_arg); // pragma tbx xtf  
    initiator_responder = axi_slave_configuration_arg.initiator_responder;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction   


  // ****************************************************************************  
            
  task do_monitor(output axi_slave_monitor_s axi_slave_monitor_struct);
    //
    // Available struct members:
    //     //    axi_slave_monitor_struct.awvalid
    //     //    axi_slave_monitor_struct.awready
    //     //    axi_slave_monitor_struct.awid
    //     //    axi_slave_monitor_struct.awlen
    //     //    axi_slave_monitor_struct.awsize
    //     //    axi_slave_monitor_struct.awaddr
    //     //    axi_slave_monitor_struct.awburst
    //     //    axi_slave_monitor_struct.wvalid
    //     //    axi_slave_monitor_struct.wready
    //     //    axi_slave_monitor_struct.wid
    //     //    axi_slave_monitor_struct.wdata
    //     //    axi_slave_monitor_struct.wstrb
    //     //    axi_slave_monitor_struct.wlast
    //     //    axi_slave_monitor_struct.bready
    //     //    axi_slave_monitor_struct.bvalid
    //     //    axi_slave_monitor_struct.bid
    //     //    axi_slave_monitor_struct.bresp
    //     //    axi_slave_monitor_struct.arvalid
    //     //    axi_slave_monitor_struct.arready
    //     //    axi_slave_monitor_struct.arid
    //     //    axi_slave_monitor_struct.arlen
    //     //    axi_slave_monitor_struct.arsize
    //     //    axi_slave_monitor_struct.araddr
    //     //    axi_slave_monitor_struct.arburst
    //     //    axi_slave_monitor_struct.rvalid
    //     //    axi_slave_monitor_struct.rready
    //     //    axi_slave_monitor_struct.rid
    //     //    axi_slave_monitor_struct.rdata
    //     //    axi_slave_monitor_struct.rlast
    //     //    axi_slave_monitor_struct.rresp
    //     //
    // Reference code;
    //    How to wait for signal value
    //      while (control_signal === 1'b1) @(posedge clk_i);
    //    
    //    How to assign a struct member, named xyz, from a signal.   
    //    All available input signals listed.
    //      axi_slave_monitor_struct.xyz = awvalid_i;  //     
    //      axi_slave_monitor_struct.xyz = awready_i;  //     
    //      axi_slave_monitor_struct.xyz = awid_i;  //    [ID_WIDTH-1:0] 
    //      axi_slave_monitor_struct.xyz = awlen_i;  //    [LEN_WIDTH-1:0] 
    //      axi_slave_monitor_struct.xyz = awsize_i;  //    [SIZE_WIDTH-1:0] 
    //      axi_slave_monitor_struct.xyz = awaddr_i;  //    [ADDR_WIDTH-1:0] 
    //      axi_slave_monitor_struct.xyz = awburst_i;  //    [BURST_WIDTH-1:0] 
    //      axi_slave_monitor_struct.xyz = wvalid_i;  //     
    //      axi_slave_monitor_struct.xyz = wready_i;  //     
    //      axi_slave_monitor_struct.xyz = wid_i;  //    [ID_WIDTH-1:0] 
    //      axi_slave_monitor_struct.xyz = wdata_i;  //    [DATA_WIDTH-1:0] 
    //      axi_slave_monitor_struct.xyz = wstrb_i;  //    [STRB_WIDTH-1:0] 
    //      axi_slave_monitor_struct.xyz = wlast_i;  //     
    //      axi_slave_monitor_struct.xyz = bready_i;  //     
    //      axi_slave_monitor_struct.xyz = bvalid_i;  //     
    //      axi_slave_monitor_struct.xyz = bid_i;  //    [ID_WIDTH-1:0] 
    //      axi_slave_monitor_struct.xyz = bresp_i;  //    [RESP_WIDTH-1:0] 
    //      axi_slave_monitor_struct.xyz = arvalid_i;  //     
    //      axi_slave_monitor_struct.xyz = arready_i;  //     
    //      axi_slave_monitor_struct.xyz = arid_i;  //    [ID_WIDTH-1:0] 
    //      axi_slave_monitor_struct.xyz = arlen_i;  //    [LEN_WIDTH-1:0] 
    //      axi_slave_monitor_struct.xyz = arsize_i;  //    [SIZE_WIDTH-1:0] 
    //      axi_slave_monitor_struct.xyz = araddr_i;  //    [ADDR_WIDTH-1:0] 
    //      axi_slave_monitor_struct.xyz = arburst_i;  //    [BURST_WIDTH-1:0] 
    //      axi_slave_monitor_struct.xyz = rvalid_i;  //     
    //      axi_slave_monitor_struct.xyz = rready_i;  //     
    //      axi_slave_monitor_struct.xyz = rid_i;  //    [ID_WIDTH-1:0] 
    //      axi_slave_monitor_struct.xyz = rdata_i;  //    [DATA_WIDTH-1:0] 
    //      axi_slave_monitor_struct.xyz = rlast_i;  //     
    //      axi_slave_monitor_struct.xyz = rresp_i;  //    [RESP_WIDTH-1:0] 
    // pragma uvmf custom do_monitor begin
    // UVMF_CHANGE_ME : Implement protocol monitoring.  The commented reference code 
    // below are examples of how to capture signal values and assign them to 
    // structure members.  All available input signals are listed.  The 'while' 
    // code example shows how to wait for a synchronous flow control signal.  This
    // task should return when a complete transfer has been observed.  Once this task is
    // exited with captured values, it is then called again to wait for and observe 
    // the next transfer. One clock cycle is consumed between calls to do_monitor.
    @(posedge clk_i);
    @(posedge clk_i);
    @(posedge clk_i);
    @(posedge clk_i);
    // pragma uvmf custom do_monitor end
  endtask         
  
 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

