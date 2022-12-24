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


interface axi_master_monitor_bfm 
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
      $psprintf("The BFM at '%m' has the following parameters: ", ),
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
  int no_of_slaves ;
  bit has_coverage ;

  tri clock_i;
  tri reset_i;
  tri  pclk_i;
  tri  preset_n_i;
  tri [31:0] AWADDER_i;
  tri  AWBURST_i;
  tri [3:0] AWCACHE_i;
  tri [3:0] AWID_i;
  tri [3:0] AWLENGTH_i;
  tri [1:0] AWLOCK_i;
  tri [2:0] AWPROT_i;
  tri  AWREADDY_i;
  tri [2:0] AWSIZE_i;
  tri  AWVALID_i;
  tri [31:0] WDATA_i;
  tri [3:0] WSTRB_i;
  tri [16:0] WUSER_i;
  tri [3:0] BID_i;
  tri [1:0] BRESP_i;
  tri [7:0] BUSER_i;
  tri  BVALID_i;
  tri [3:0] ARID_i;
  tri [31:0] ARADDR_i;
  tri [7:0] ARLEN_i;
  tri [2:0] ARSIZE_i;
  tri [1:0] ARBURST_i;
  tri [3:0] ARCACHE_i;
  tri [2:0] ARPROT_i;
  tri [3:0] ARQOS_i;
  tri [3:0] ARREGION_i;
  tri [3:0] ARUSER_i;
  tri  ARLOCK_i;
  tri [3:0] RID_i;
  tri [31:0] RDATA_i;
  tri [3:0] RRESP_i;
  tri [63:0] RUSER_i;
  tri [1:0] RLAST_i;
  tri  RVALID_i;
  assign clock_i = bus.clock;
  assign reset_i = bus.reset;
  assign pclk_i = bus.pclk;
  assign preset_n_i = bus.preset_n;
  assign AWADDER_i = bus.AWADDER;
  assign AWBURST_i = bus.AWBURST;
  assign AWCACHE_i = bus.AWCACHE;
  assign AWID_i = bus.AWID;
  assign AWLENGTH_i = bus.AWLENGTH;
  assign AWLOCK_i = bus.AWLOCK;
  assign AWPROT_i = bus.AWPROT;
  assign AWREADDY_i = bus.AWREADDY;
  assign AWSIZE_i = bus.AWSIZE;
  assign AWVALID_i = bus.AWVALID;
  assign WDATA_i = bus.WDATA;
  assign WSTRB_i = bus.WSTRB;
  assign WUSER_i = bus.WUSER;
  assign BID_i = bus.BID;
  assign BRESP_i = bus.BRESP;
  assign BUSER_i = bus.BUSER;
  assign BVALID_i = bus.BVALID;
  assign ARID_i = bus.ARID;
  assign ARADDR_i = bus.ARADDR;
  assign ARLEN_i = bus.ARLEN;
  assign ARSIZE_i = bus.ARSIZE;
  assign ARBURST_i = bus.ARBURST;
  assign ARCACHE_i = bus.ARCACHE;
  assign ARPROT_i = bus.ARPROT;
  assign ARQOS_i = bus.ARQOS;
  assign ARREGION_i = bus.ARREGION;
  assign ARUSER_i = bus.ARUSER;
  assign ARLOCK_i = bus.ARLOCK;
  assign RID_i = bus.RID;
  assign RDATA_i = bus.RDATA;
  assign RRESP_i = bus.RRESP;
  assign RUSER_i = bus.RUSER;
  assign RLAST_i = bus.RLAST;
  assign RVALID_i = bus.RVALID;

  // Proxy handle to UVM monitor
  axi_master_pkg::axi_master_monitor  proxy;
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
    no_of_slaves = axi_master_configuration_arg.no_of_slaves;
    has_coverage = axi_master_configuration_arg.has_coverage;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction   


  // ****************************************************************************  
            
  task do_monitor(output axi_master_monitor_s axi_master_monitor_struct);
    //
    // Available struct members:
    //     //    axi_master_monitor_struct.AWID
    //     //    axi_master_monitor_struct.AWADDR
    //     //    axi_master_monitor_struct.AWLEN
    //     //    axi_master_monitor_struct.AWSIZE
    //     //    axi_master_monitor_struct.AWBURST
    //     //    axi_master_monitor_struct.AWLOCK
    //     //    axi_master_monitor_struct.AWCACHE
    //     //    axi_master_monitor_struct.AWQOS
    //     //    axi_master_monitor_struct.AWREGION
    //     //    axi_master_monitor_struct.AWUSER
    //     //    axi_master_monitor_struct.AWPROT
    //     //    axi_master_monitor_struct.AWVALID
    //     //    axi_master_monitor_struct.AWREADY
    //     //    axi_master_monitor_struct.WDATA
    //     //    axi_master_monitor_struct.WSTRB
    //     //    axi_master_monitor_struct.WUSER
    //     //    axi_master_monitor_struct.WLAST
    //     //    axi_master_monitor_struct.BID
    //     //    axi_master_monitor_struct.BRESP
    //     //    axi_master_monitor_struct.BUSER
    //     //    axi_master_monitor_struct.BVALID
    //     //    axi_master_monitor_struct.ARID
    //     //    axi_master_monitor_struct.ARADDR
    //     //    axi_master_monitor_struct.ARLEN
    //     //    axi_master_monitor_struct.ARSIZE
    //     //    axi_master_monitor_struct.ARBURST
    //     //    axi_master_monitor_struct.ARCACHE
    //     //    axi_master_monitor_struct.ARPROT
    //     //    axi_master_monitor_struct.ARQOS
    //     //    axi_master_monitor_struct.ARREGION
    //     //    axi_master_monitor_struct.ARUSER
    //     //    axi_master_monitor_struct.ARLOCK
    //     //    axi_master_monitor_struct.RID
    //     //    axi_master_monitor_struct.RDATA
    //     //    axi_master_monitor_struct.RRESP
    //     //    axi_master_monitor_struct.RUSER
    //     //    axi_master_monitor_struct.RLAST
    //     //    axi_master_monitor_struct.RVALID
    //     //
    // Reference code;
    //    How to wait for signal value
    //      while (control_signal === 1'b1) @(posedge clock_i);
    //    
    //    How to assign a struct member, named xyz, from a signal.   
    //    All available input signals listed.
    //      axi_master_monitor_struct.xyz = pclk_i;  //     
    //      axi_master_monitor_struct.xyz = preset_n_i;  //     
    //      axi_master_monitor_struct.xyz = AWADDER_i;  //    [31:0] 
    //      axi_master_monitor_struct.xyz = AWBURST_i;  //     
    //      axi_master_monitor_struct.xyz = AWCACHE_i;  //    [3:0] 
    //      axi_master_monitor_struct.xyz = AWID_i;  //    [3:0] 
    //      axi_master_monitor_struct.xyz = AWLENGTH_i;  //    [3:0] 
    //      axi_master_monitor_struct.xyz = AWLOCK_i;  //    [1:0] 
    //      axi_master_monitor_struct.xyz = AWPROT_i;  //    [2:0] 
    //      axi_master_monitor_struct.xyz = AWREADDY_i;  //     
    //      axi_master_monitor_struct.xyz = AWSIZE_i;  //    [2:0] 
    //      axi_master_monitor_struct.xyz = AWVALID_i;  //     
    //      axi_master_monitor_struct.xyz = WDATA_i;  //    [31:0] 
    //      axi_master_monitor_struct.xyz = WSTRB_i;  //    [3:0] 
    //      axi_master_monitor_struct.xyz = WUSER_i;  //    [16:0] 
    //      axi_master_monitor_struct.xyz = BID_i;  //    [3:0] 
    //      axi_master_monitor_struct.xyz = BRESP_i;  //    [1:0] 
    //      axi_master_monitor_struct.xyz = BUSER_i;  //    [7:0] 
    //      axi_master_monitor_struct.xyz = BVALID_i;  //     
    //      axi_master_monitor_struct.xyz = ARID_i;  //    [3:0] 
    //      axi_master_monitor_struct.xyz = ARADDR_i;  //    [31:0] 
    //      axi_master_monitor_struct.xyz = ARLEN_i;  //    [7:0] 
    //      axi_master_monitor_struct.xyz = ARSIZE_i;  //    [2:0] 
    //      axi_master_monitor_struct.xyz = ARBURST_i;  //    [1:0] 
    //      axi_master_monitor_struct.xyz = ARCACHE_i;  //    [3:0] 
    //      axi_master_monitor_struct.xyz = ARPROT_i;  //    [2:0] 
    //      axi_master_monitor_struct.xyz = ARQOS_i;  //    [3:0] 
    //      axi_master_monitor_struct.xyz = ARREGION_i;  //    [3:0] 
    //      axi_master_monitor_struct.xyz = ARUSER_i;  //    [3:0] 
    //      axi_master_monitor_struct.xyz = ARLOCK_i;  //     
    //      axi_master_monitor_struct.xyz = RID_i;  //    [3:0] 
    //      axi_master_monitor_struct.xyz = RDATA_i;  //    [31:0] 
    //      axi_master_monitor_struct.xyz = RRESP_i;  //    [3:0] 
    //      axi_master_monitor_struct.xyz = RUSER_i;  //    [63:0] 
    //      axi_master_monitor_struct.xyz = RLAST_i;  //    [1:0] 
    //      axi_master_monitor_struct.xyz = RVALID_i;  //     
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

