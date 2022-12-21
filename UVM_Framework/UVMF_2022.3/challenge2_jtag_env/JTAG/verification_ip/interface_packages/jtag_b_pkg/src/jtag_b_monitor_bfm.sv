//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface performs the jtag_b signal monitoring.
//      It is accessed by the uvm jtag_b monitor through a virtual
//      interface handle in the jtag_b configuration.  It monitors the
//      signals passed in through the port connection named bus of
//      type jtag_b_if.
//
//     Input signals from the jtag_b_if are assigned to an internal input
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
//                   blocks until an operation on the jtag_b bus is complete.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
import uvmf_base_pkg_hdl::*;
import jtag_b_pkg_hdl::*;
`include "src/jtag_b_macros.svh"


interface jtag_b_monitor_bfm 
  ( jtag_b_if  bus );
  // The pragma below and additional ones in-lined further down are for running this BFM on Veloce
  // pragma attribute jtag_b_monitor_bfm partition_interface_xif                                  

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
`jtag_b_MONITOR_STRUCT
  jtag_b_monitor_s jtag_b_monitor_struct;

  // Structure used to pass configuration data from monitor class to monitor BFM.
 `jtag_b_CONFIGURATION_STRUCT
 

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase
  bit is_active ;
  int no_of_slaves ;
  bit has_coverage ;

  tri clock_i;
  tri reset_i;
  tri  tck_i;
  tri  tms_i;
  tri  tdi_i;
  tri  tdo_i;
  assign clock_i = bus.clock;
  assign reset_i = bus.reset;
  assign tck_i = bus.tck;
  assign tms_i = bus.tms;
  assign tdi_i = bus.tdi;
  assign tdo_i = bus.tdo;

  // Proxy handle to UVM monitor
  jtag_b_pkg::jtag_b_monitor  proxy;
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
      do_monitor( jtag_b_monitor_struct );
                                                                 
 
      proxy.notify_transaction( jtag_b_monitor_struct );
 
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
    function void configure(jtag_b_configuration_s jtag_b_configuration_arg); // pragma tbx xtf  
    initiator_responder = jtag_b_configuration_arg.initiator_responder;
    is_active = jtag_b_configuration_arg.is_active;
    no_of_slaves = jtag_b_configuration_arg.no_of_slaves;
    has_coverage = jtag_b_configuration_arg.has_coverage;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction   


  // ****************************************************************************  
            
  task do_monitor(output jtag_b_monitor_s jtag_b_monitor_struct);
    //
    // Available struct members:
    //     //    jtag_b_monitor_struct.tck
    //     //    jtag_b_monitor_struct.tms
    //     //    jtag_b_monitor_struct.tdi
    //     //    jtag_b_monitor_struct.tdo
    //     //
    // Reference code;
    //    How to wait for signal value
    //      while (control_signal === 1'b1) @(posedge clock_i);
    //    
    //    How to assign a struct member, named xyz, from a signal.   
    //    All available input signals listed.
    //      jtag_b_monitor_struct.xyz = tck_i;  //     
    //      jtag_b_monitor_struct.xyz = tms_i;  //     
    //      jtag_b_monitor_struct.xyz = tdi_i;  //     
    //      jtag_b_monitor_struct.xyz = tdo_i;  //     
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

