//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface performs the spi_m signal monitoring.
//      It is accessed by the uvm spi_m monitor through a virtual
//      interface handle in the spi_m configuration.  It monitors the
//      signals passed in through the port connection named bus of
//      type spi_m_if.
//
//     Input signals from the spi_m_if are assigned to an internal input
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
//                   blocks until an operation on the spi_m bus is complete.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
import uvmf_base_pkg_hdl::*;
import spi_m_pkg_hdl::*;
`include "src/spi_m_macros.svh"


interface spi_m_monitor_bfm 
  ( spi_m_if  bus );
  // The pragma below and additional ones in-lined further down are for running this BFM on Veloce
  // pragma attribute spi_m_monitor_bfm partition_interface_xif                                  

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
`spi_m_MONITOR_STRUCT
  spi_m_monitor_s spi_m_monitor_struct;

  // Structure used to pass configuration data from monitor class to monitor BFM.
 `spi_m_CONFIGURATION_STRUCT
 

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase

  logic sck_i;
  logic rst_i;
  tri  sclk_i;
  tri  ss_i;
  tri [7:0] mosi_i;
  tri [7:0] miso_i;
  assign sck_i = bus.sck;
  assign rst_i = bus.rst;
  assign sclk_i = bus.sclk;
  assign ss_i = bus.ss;
  assign mosi_i = bus.mosi;
  assign miso_i = bus.miso;

  // Proxy handle to UVM monitor
  spi_m_pkg::spi_m_monitor  proxy;
  // pragma tbx oneway proxy.notify_transaction                 

  // pragma uvmf custom interface_item_additional begin
  // pragma uvmf custom interface_item_additional end
  
  //******************************************************************                         
  task wait_for_reset();// pragma tbx xtf  
    @(posedge sck_i) ;                                                                    
    do_wait_for_reset();                                                                   
  endtask                                                                                   

  // ****************************************************************************              
  task do_wait_for_reset(); 
  // pragma uvmf custom reset_condition begin
    wait ( rst_i === 0 ) ;                                                              
    @(posedge sck_i) ;                                                                    
  // pragma uvmf custom reset_condition end                                                                
  endtask    

  //******************************************************************                         
 
  task wait_for_num_clocks(input int unsigned count); // pragma tbx xtf 
    @(posedge sck_i);  
                                                                   
    repeat (count-1) @(posedge sck_i);                                                    
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
      @(posedge sck_i);  
      do_monitor( spi_m_monitor_struct );
                                                                 
 
      proxy.notify_transaction( spi_m_monitor_struct );
 
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
    function void configure(spi_m_configuration_s spi_m_configuration_arg); // pragma tbx xtf  
    initiator_responder = spi_m_configuration_arg.initiator_responder;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction   


  // ****************************************************************************  
            
  task do_monitor(output spi_m_monitor_s spi_m_monitor_struct);
    //
    // Available struct members:
    //     //    spi_m_monitor_struct.ssel
    //     //    spi_m_monitor_struct.mosi
    //     //    spi_m_monitor_struct.miso
    //     //
    // Reference code;
    //    How to wait for signal value
    //      while (control_signal === 1'b1) @(posedge sck_i);
    //    
    //    How to assign a struct member, named xyz, from a signal.   
    //    All available input signals listed.
    //      spi_m_monitor_struct.xyz = sclk_i;  //     
    //      spi_m_monitor_struct.xyz = ss_i;  //     
    //      spi_m_monitor_struct.xyz = mosi_i;  //    [7:0] 
    //      spi_m_monitor_struct.xyz = miso_i;  //    [7:0] 
    // pragma uvmf custom do_monitor begin
    // UVMF_CHANGE_ME : Implement protocol monitoring.  The commented reference code 
    // below are examples of how to capture signal values and assign them to 
    // structure members.  All available input signals are listed.  The 'while' 
    // code example shows how to wait for a synchronous flow control signal.  This
    // task should return when a complete transfer has been observed.  Once this task is
    // exited with captured values, it is then called again to wait for and observe 
    // the next transfer. One clock cycle is consumed between calls to do_monitor.
    @(posedge sck_i);
    @(posedge sck_i);
    @(posedge sck_i);
    @(posedge sck_i);
    // pragma uvmf custom do_monitor end
  endtask         
  
 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

