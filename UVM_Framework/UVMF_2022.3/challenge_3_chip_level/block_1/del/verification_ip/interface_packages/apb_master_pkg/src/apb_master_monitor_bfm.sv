//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface performs the apb_master signal monitoring.
//      It is accessed by the uvm apb_master monitor through a virtual
//      interface handle in the apb_master configuration.  It monitors the
//      signals passed in through the port connection named bus of
//      type apb_master_if.
//
//     Input signals from the apb_master_if are assigned to an internal input
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
//                   blocks until an operation on the apb_master bus is complete.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
import uvmf_base_pkg_hdl::*;
import apb_master_pkg_hdl::*;
`include "src/apb_master_macros.svh"


interface apb_master_monitor_bfm #(
  int ADDRESS_WIDTH = 32,
  int DATA_WIDTH = 32,
  int NO_OF_SLAVES = 1
  )
  ( apb_master_if  bus );
  // The pragma below and additional ones in-lined further down are for running this BFM on Veloce
  // pragma attribute apb_master_monitor_bfm partition_interface_xif                                  

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
      $psprintf("The BFM at '%m' has the following parameters: ADDRESS_WIDTH=%x DATA_WIDTH=%x NO_OF_SLAVES=%x ", ADDRESS_WIDTH,DATA_WIDTH,NO_OF_SLAVES),
      UVM_DEBUG)
end
`endif


  // Structure used to pass transaction data from monitor BFM to monitor class in agent.
`apb_master_MONITOR_STRUCT
  apb_master_monitor_s apb_master_monitor_struct;

  // Structure used to pass configuration data from monitor class to monitor BFM.
 `apb_master_CONFIGURATION_STRUCT
 

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase

  tri clk_i;
  tri rst_i;
  tri [NO_OF_SLAVES-1:0] psel_i;
  tri  penable_i;
  tri  pwrite_i;
  tri [ADDRESS_WIDTH-1:0] paddr_i;
  tri [DATA_WIDTH-1:0] pstrb_i;
  tri [ADDRESS_WIDTH-1:0] pwdata_i;
  tri  pready_i;
  tri  pslverr_i;
  tri [DATA_WIDTH-1:0] prdata_i;
  assign clk_i = bus.clk;
  assign rst_i = bus.rst;
  assign psel_i = bus.psel;
  assign penable_i = bus.penable;
  assign pwrite_i = bus.pwrite;
  assign paddr_i = bus.paddr;
  assign pstrb_i = bus.pstrb;
  assign pwdata_i = bus.pwdata;
  assign pready_i = bus.pready;
  assign pslverr_i = bus.pslverr;
  assign prdata_i = bus.prdata;

  // Proxy handle to UVM monitor
  apb_master_pkg::apb_master_monitor #(
    .ADDRESS_WIDTH(ADDRESS_WIDTH),
    .DATA_WIDTH(DATA_WIDTH),
    .NO_OF_SLAVES(NO_OF_SLAVES)
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
      do_monitor( apb_master_monitor_struct );
                                                                 
 
      proxy.notify_transaction( apb_master_monitor_struct );
 
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
    function void configure(apb_master_configuration_s apb_master_configuration_arg); // pragma tbx xtf  
    initiator_responder = apb_master_configuration_arg.initiator_responder;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction   


  // ****************************************************************************  
            
  task do_monitor(output apb_master_monitor_s apb_master_monitor_struct);
    //
    // Available struct members:
    //     //    apb_master_monitor_struct.psel
    //     //    apb_master_monitor_struct.penable
    //     //    apb_master_monitor_struct.pwrite
    //     //    apb_master_monitor_struct.paddr
    //     //    apb_master_monitor_struct.pstrb
    //     //    apb_master_monitor_struct.pwdata
    //     //    apb_master_monitor_struct.pready
    //     //    apb_master_monitor_struct.prdata
    //     //    apb_master_monitor_struct.pslverr
    //     //
    // Reference code;
    //    How to wait for signal value
    //      while (control_signal === 1'b1) @(posedge clk_i);
    //    
    //    How to assign a struct member, named xyz, from a signal.   
    //    All available input signals listed.
    //      apb_master_monitor_struct.xyz = psel_i;  //    [NO_OF_SLAVES-1:0] 
    //      apb_master_monitor_struct.xyz = penable_i;  //     
    //      apb_master_monitor_struct.xyz = pwrite_i;  //     
    //      apb_master_monitor_struct.xyz = paddr_i;  //    [ADDRESS_WIDTH-1:0] 
    //      apb_master_monitor_struct.xyz = pstrb_i;  //    [DATA_WIDTH-1:0] 
    //      apb_master_monitor_struct.xyz = pwdata_i;  //    [ADDRESS_WIDTH-1:0] 
    //      apb_master_monitor_struct.xyz = pready_i;  //     
    //      apb_master_monitor_struct.xyz = pslverr_i;  //     
    //      apb_master_monitor_struct.xyz = prdata_i;  //    [DATA_WIDTH-1:0] 
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

