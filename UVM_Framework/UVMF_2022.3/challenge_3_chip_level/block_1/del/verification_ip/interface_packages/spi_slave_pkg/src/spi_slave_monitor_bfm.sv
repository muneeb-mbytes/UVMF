//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface performs the spi_slave signal monitoring.
//      It is accessed by the uvm spi_slave monitor through a virtual
//      interface handle in the spi_slave configuration.  It monitors the
//      signals passed in through the port connection named bus of
//      type spi_slave_if.
//
//     Input signals from the spi_slave_if are assigned to an internal input
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
//                   blocks until an operation on the spi_slave bus is complete.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
import uvmf_base_pkg_hdl::*;
import spi_slave_pkg_hdl::*;
`include "src/spi_slave_macros.svh"


interface spi_slave_monitor_bfm 
  ( spi_slave_if  bus );
  // The pragma below and additional ones in-lined further down are for running this BFM on Veloce
  // pragma attribute spi_slave_monitor_bfm partition_interface_xif                                  

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
`spi_slave_MONITOR_STRUCT
  spi_slave_monitor_s spi_slave_monitor_struct;

  // Structure used to pass configuration data from monitor class to monitor BFM.
 `spi_slave_CONFIGURATION_STRUCT
 

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase
  bit has_coverage ;
  bit is_active ;
  bit[3:0] no_of_slaves ;

  tri clock_i;
  tri reset_i;
  tri  sck_i;
  tri  mosi_i;
  tri  cs_i;
  tri  miso_i;
  assign clock_i = bus.clock;
  assign reset_i = bus.reset;
  assign sck_i = bus.sck;
  assign mosi_i = bus.mosi;
  assign cs_i = bus.cs;
  assign miso_i = bus.miso;

  // Proxy handle to UVM monitor
  spi_slave_pkg::spi_slave_monitor  proxy;
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
    wait ( reset_i === 1 ) ;                                                              
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
      do_monitor( spi_slave_monitor_struct );
                                                                 
 
      proxy.notify_transaction( spi_slave_monitor_struct );
 
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
    function void configure(spi_slave_configuration_s spi_slave_configuration_arg); // pragma tbx xtf  
    initiator_responder = spi_slave_configuration_arg.initiator_responder;
    has_coverage = spi_slave_configuration_arg.has_coverage;
    is_active = spi_slave_configuration_arg.is_active;
    no_of_slaves = spi_slave_configuration_arg.no_of_slaves;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction   


  // ****************************************************************************  
            
  task do_monitor(output spi_slave_monitor_s spi_slave_monitor_struct);
    //
    // Available struct members:
    //     //    spi_slave_monitor_struct.sck
    //     //    spi_slave_monitor_struct.mosi
    //     //    spi_slave_monitor_struct.miso
    //     //    spi_slave_monitor_struct.cs
    //     //
    // Reference code;
    //    How to wait for signal value
    //      while (control_signal === 1'b1) @(posedge clock_i);
    //    
    //    How to assign a struct member, named xyz, from a signal.   
    //    All available input signals listed.
    //      spi_slave_monitor_struct.xyz = sck_i;  //     
    //      spi_slave_monitor_struct.xyz = mosi_i;  //     
    //      spi_slave_monitor_struct.xyz = cs_i;  //     
    //      spi_slave_monitor_struct.xyz = miso_i;  //     
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

