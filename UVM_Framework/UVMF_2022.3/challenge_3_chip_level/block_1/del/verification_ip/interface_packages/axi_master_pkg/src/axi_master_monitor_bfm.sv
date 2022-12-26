//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface performs the axi_master signal monitoring.
//      It is accessed by the uvm axi_master monitor through a virtual
//      interface handle in the axi_master configuration.  It monitors the
//      signals passed in through the port connection named bus of
//      type axi_master_if.
//
//     Input signals from the axi_master_if are assigned to an internal input
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
//                   blocks until an operation on the axi_master bus is complete.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
import uvmf_base_pkg_hdl::*;
import axi_master_pkg_hdl::*;
`include "src/axi_master_macros.svh"


interface axi_master_monitor_bfm #(
  int id_width = 4,
  int len_width = 4,
  int size_width = 3,
  int addr_width = 32,
  int burst_width = 2,
  int data_width = 32,
  int strb_width = 4,
  int resp_width = 2
  )
  ( axi_master_if  bus );
  // The pragma below and additional ones in-lined further down are for running this BFM on Veloce
  // pragma attribute axi_master_monitor_bfm partition_interface_xif                                  

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
      $psprintf("The BFM at '%m' has the following parameters: id_width=%x len_width=%x size_width=%x addr_width=%x burst_width=%x data_width=%x strb_width=%x resp_width=%x ", id_width,len_width,size_width,addr_width,burst_width,data_width,strb_width,resp_width),
      UVM_DEBUG)
end
`endif


  // Structure used to pass transaction data from monitor BFM to monitor class in agent.
`axi_master_MONITOR_STRUCT
  axi_master_monitor_s axi_master_monitor_struct;

  // Structure used to pass configuration data from monitor class to monitor BFM.
 `axi_master_CONFIGURATION_STRUCT
 

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase

  tri clock_i;
  tri reset_i;
  tri  awvalid_i;
  tri [id_width-1:0] awid_i;
  tri [len_width-1:0] awlen_i;
  tri [size_width-1:0] awsize_i;
  tri [addr_width-1:0] awaddr_i;
  tri [burst_width-1:0] awburst_i;
  tri  wvalid_i;
  tri  wready_i;
  tri [id_width-1:0] wid_i;
  tri [size_width-1:0] wsize_i;
  tri [data_width-1:0] wdata_i;
  tri [strb_width-1:0] wstrb_i;
  tri  wlast_i;
  tri  arvalid_i;
  tri  arready_i;
  tri [id_width-1:0] arid_i;
  tri [len_width-1:0] arlen_i;
  tri [size_width-1:0] arsize_i;
  tri [burst_width-1:0] arburst_i;
  assign clock_i = bus.clock;
  assign reset_i = bus.reset;
  assign awvalid_i = bus.awvalid;
  assign awid_i = bus.awid;
  assign awlen_i = bus.awlen;
  assign awsize_i = bus.awsize;
  assign awaddr_i = bus.awaddr;
  assign awburst_i = bus.awburst;
  assign wvalid_i = bus.wvalid;
  assign wready_i = bus.wready;
  assign wid_i = bus.wid;
  assign wsize_i = bus.wsize;
  assign wdata_i = bus.wdata;
  assign wstrb_i = bus.wstrb;
  assign wlast_i = bus.wlast;
  assign arvalid_i = bus.arvalid;
  assign arready_i = bus.arready;
  assign arid_i = bus.arid;
  assign arlen_i = bus.arlen;
  assign arsize_i = bus.arsize;
  assign arburst_i = bus.arburst;

  // Proxy handle to UVM monitor
  axi_master_pkg::axi_master_monitor #(
    .id_width(id_width),
    .len_width(len_width),
    .size_width(size_width),
    .addr_width(addr_width),
    .burst_width(burst_width),
    .data_width(data_width),
    .strb_width(strb_width),
    .resp_width(resp_width)
    ) proxy;
  // pragma tbx oneway proxy.notify_transaction                 

  // pragma uvmf custom interface_item_additional begin
  // pragma uvmf custom interface_item_additional end
  
  //******************************************************************                         
  task wait_for_reset();// pragma tbx xtf  
    @(posedge clock_i) ;                                                                    
    do_wait_for_reset();                                                                   
  endtask                                                                                   

  // ****************************************************************************              
  task do_wait_for_reset(); 
  // pragma uvmf custom reset_condition begin
    wait ( reset_i === 0 ) ;                                                              
    @(posedge clock_i) ;                                                                    
  // pragma uvmf custom reset_condition end                                                                
  endtask    

  //******************************************************************                         
 
  task wait_for_num_clocks(input int unsigned count); // pragma tbx xtf 
    @(posedge clock_i);  
                                                                   
    repeat (count-1) @(posedge clock_i);                                                    
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
      @(posedge clock_i);  
      do_monitor( axi_master_monitor_struct );
                                                                 
 
      proxy.notify_transaction( axi_master_monitor_struct );
 
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
    function void configure(axi_master_configuration_s axi_master_configuration_arg); // pragma tbx xtf  
    initiator_responder = axi_master_configuration_arg.initiator_responder;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction   


  // ****************************************************************************  
            
  task do_monitor(output axi_master_monitor_s axi_master_monitor_struct);
    //
    // Available struct members:
    //     //    axi_master_monitor_struct.awvalid
    //     //    axi_master_monitor_struct.awid
    //     //    axi_master_monitor_struct.awlen
    //     //    axi_master_monitor_struct.awsize
    //     //    axi_master_monitor_struct.awaddr
    //     //    axi_master_monitor_struct.awburst
    //     //    axi_master_monitor_struct.wvalid
    //     //    axi_master_monitor_struct.wready
    //     //    axi_master_monitor_struct.wid
    //     //    axi_master_monitor_struct.wsize
    //     //    axi_master_monitor_struct.wdata
    //     //    axi_master_monitor_struct.wstrb
    //     //    axi_master_monitor_struct.wlast
    //     //    axi_master_monitor_struct.arvalid
    //     //    axi_master_monitor_struct.arready
    //     //    axi_master_monitor_struct.arid
    //     //    axi_master_monitor_struct.arlen
    //     //    axi_master_monitor_struct.arsize
    //     //    axi_master_monitor_struct.arburst
    //     //
    // Reference code;
    //    How to wait for signal value
    //      while (control_signal === 1'b1) @(posedge clock_i);
    //    
    //    How to assign a struct member, named xyz, from a signal.   
    //    All available input signals listed.
    //      axi_master_monitor_struct.xyz = awvalid_i;  //     
    //      axi_master_monitor_struct.xyz = awid_i;  //    [id_width-1:0] 
    //      axi_master_monitor_struct.xyz = awlen_i;  //    [len_width-1:0] 
    //      axi_master_monitor_struct.xyz = awsize_i;  //    [size_width-1:0] 
    //      axi_master_monitor_struct.xyz = awaddr_i;  //    [addr_width-1:0] 
    //      axi_master_monitor_struct.xyz = awburst_i;  //    [burst_width-1:0] 
    //      axi_master_monitor_struct.xyz = wvalid_i;  //     
    //      axi_master_monitor_struct.xyz = wready_i;  //     
    //      axi_master_monitor_struct.xyz = wid_i;  //    [id_width-1:0] 
    //      axi_master_monitor_struct.xyz = wsize_i;  //    [size_width-1:0] 
    //      axi_master_monitor_struct.xyz = wdata_i;  //    [data_width-1:0] 
    //      axi_master_monitor_struct.xyz = wstrb_i;  //    [strb_width-1:0] 
    //      axi_master_monitor_struct.xyz = wlast_i;  //     
    //      axi_master_monitor_struct.xyz = arvalid_i;  //     
    //      axi_master_monitor_struct.xyz = arready_i;  //     
    //      axi_master_monitor_struct.xyz = arid_i;  //    [id_width-1:0] 
    //      axi_master_monitor_struct.xyz = arlen_i;  //    [len_width-1:0] 
    //      axi_master_monitor_struct.xyz = arsize_i;  //    [size_width-1:0] 
    //      axi_master_monitor_struct.xyz = arburst_i;  //    [burst_width-1:0] 
    // pragma uvmf custom do_monitor begin
    // UVMF_CHANGE_ME : Implement protocol monitoring.  The commented reference code 
    // below are examples of how to capture signal values and assign them to 
    // structure members.  All available input signals are listed.  The 'while' 
    // code example shows how to wait for a synchronous flow control signal.  This
    // task should return when a complete transfer has been observed.  Once this task is
    // exited with captured values, it is then called again to wait for and observe 
    // the next transfer. One clock cycle is consumed between calls to do_monitor.
    @(posedge clock_i);
    @(posedge clock_i);
    @(posedge clock_i);
    @(posedge clock_i);
    // pragma uvmf custom do_monitor end
  endtask         
  
 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

