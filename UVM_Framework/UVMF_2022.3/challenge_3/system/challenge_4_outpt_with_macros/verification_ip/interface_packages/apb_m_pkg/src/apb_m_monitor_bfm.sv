//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface performs the apb_m signal monitoring.
//      It is accessed by the uvm apb_m monitor through a virtual
//      interface handle in the apb_m configuration.  It monitors the
//      signals passed in through the port connection named bus of
//      type apb_m_if.
//
//     Input signals from the apb_m_if are assigned to an internal input
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
//                   blocks until an operation on the apb_m bus is complete.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
`ifndef APB_M_MONITOR_BFM
`define APB_M_MONITOR_BFM
import uvmf_base_pkg_hdl::*;
import apb_m_pkg_hdl::*;
`include "src/apb_m_macros.svh"


interface apb_m_monitor_bfm #(
  int APB_ADDR_WIDTH = 32,
  int APB_DATA_WIDTH = 32,
  int STRB_LEN = APB_ADDR_WIDTH/8
  )
  ( apb_m_if  bus );
  // The pragma below and additional ones in-lined further down are for running this BFM on Veloce
  // pragma attribute apb_m_monitor_bfm partition_interface_xif                                  

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
      $psprintf("The BFM at '%m' has the following parameters: APB_ADDR_WIDTH=%x APB_DATA_WIDTH=%x STRB_LEN=%x ", APB_ADDR_WIDTH,APB_DATA_WIDTH,STRB_LEN),
      UVM_DEBUG)
end
`endif


  // Structure used to pass transaction data from monitor BFM to monitor class in agent.
`apb_m_MONITOR_STRUCT
  apb_m_monitor_s apb_m_monitor_struct;

  // Structure used to pass configuration data from monitor class to monitor BFM.
 `apb_m_CONFIGURATION_STRUCT
 

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase

  logic pclk_i;
  logic presetn_i;
  tri [15:0] psel_i;
  tri  penable_i;
  tri [APB_ADDR_WIDTH-1:0] paddr_i;
  tri [APB_DATA_WIDTH-1:0] pwdata_i;
  tri  pwrite_i;
  tri [STRB_LEN-1:0] pstrb_i;
  tri [2:0] pprot_i;
  tri [APB_DATA_WIDTH-1:0] prdata_i;
  tri  pready_i;
  tri  pslverr_i;
  assign pclk_i = bus.pclk;
  assign presetn_i = bus.presetn;
  assign psel_i = bus.psel;
  assign penable_i = bus.penable;
  assign paddr_i = bus.paddr;
  assign pwdata_i = bus.pwdata;
  assign pwrite_i = bus.pwrite;
  assign pstrb_i = bus.pstrb;
  assign pprot_i = bus.pprot;
  assign prdata_i = bus.prdata;
  assign pready_i = bus.pready;
  assign pslverr_i = bus.pslverr;

  // Proxy handle to UVM monitor
  apb_m_pkg::apb_m_monitor #(
    .APB_ADDR_WIDTH(APB_ADDR_WIDTH),
    .APB_DATA_WIDTH(APB_DATA_WIDTH),
    .STRB_LEN(STRB_LEN)
    ) proxy;
  // pragma tbx oneway proxy.notify_transaction                 

  // pragma uvmf custom interface_item_additional begin
  // pragma uvmf custom interface_item_additional end
  
  //******************************************************************                         
  task wait_for_reset();// pragma tbx xtf  
    @(posedge pclk_i) ;                                                                    
    do_wait_for_reset();                                                                   
  endtask                                                                                   

  // ****************************************************************************              
  task do_wait_for_reset(); 
  // pragma uvmf custom reset_condition begin
    wait ( presetn_i === 1 ) ;                                                              
    @(posedge pclk_i) ;                                                                    
  // pragma uvmf custom reset_condition end                                                                
  endtask    

  //******************************************************************                         
 
  task wait_for_num_clocks(input int unsigned count); // pragma tbx xtf 
    @(posedge pclk_i);  
                                                                   
    repeat (count-1) @(posedge pclk_i);                                                    
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
      @(posedge pclk_i);  
      do_monitor( apb_m_monitor_struct );
                                                                 
 
      proxy.notify_transaction( apb_m_monitor_struct );
 
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
    function void configure(apb_m_configuration_s apb_m_configuration_arg); // pragma tbx xtf  
    initiator_responder = apb_m_configuration_arg.initiator_responder;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction   


  // ****************************************************************************  
            
  task do_monitor(output apb_m_monitor_s apb_m_monitor_struct);
    //
    // Available struct members:
    //     //    apb_m_monitor_struct.psel
    //     //    apb_m_monitor_struct.penable
    //     //    apb_m_monitor_struct.paddr
    //     //    apb_m_monitor_struct.pwdata
    //     //    apb_m_monitor_struct.pwrite
    //     //    apb_m_monitor_struct.pstrb
    //     //    apb_m_monitor_struct.pprot
    //     //    apb_m_monitor_struct.prdata
    //     //    apb_m_monitor_struct.pready
    //     //    apb_m_monitor_struct.pslverr
    //     //
    // Reference code;
    //    How to wait for signal value
    //      while (control_signal === 1'b1) @(posedge pclk_i);
    //    
    //    How to assign a struct member, named xyz, from a signal.   
    //    All available input signals listed.
    //      apb_m_monitor_struct.xyz = psel_i;  //    [15:0] 
    //      apb_m_monitor_struct.xyz = penable_i;  //     
    //      apb_m_monitor_struct.xyz = paddr_i;  //    [APB_ADDR_WIDTH-1:0] 
    //      apb_m_monitor_struct.xyz = pwdata_i;  //    [APB_DATA_WIDTH-1:0] 
    //      apb_m_monitor_struct.xyz = pwrite_i;  //     
    //      apb_m_monitor_struct.xyz = pstrb_i;  //    [STRB_LEN-1:0] 
    //      apb_m_monitor_struct.xyz = pprot_i;  //    [2:0] 
    //      apb_m_monitor_struct.xyz = prdata_i;  //    [APB_DATA_WIDTH-1:0] 
    //      apb_m_monitor_struct.xyz = pready_i;  //     
    //      apb_m_monitor_struct.xyz = pslverr_i;  //     
    // pragma uvmf custom do_monitor begin
    // UVMF_CHANGE_ME : Implement protocol monitoring.  The commented reference code 
    // below are examples of how to capture signal values and assign them to 
    // structure members.  All available input signals are listed.  The 'while' 
    // code example shows how to wait for a synchronous flow control signal.  This
    // task should return when a complete transfer has been observed.  Once this task is
    // exited with captured values, it is then called again to wait for and observe 
    // the next transfer. One clock cycle is consumed between calls to do_monitor.
    @(posedge pclk_i);
    @(posedge pclk_i);
    @(posedge pclk_i);
    @(posedge pclk_i);
    // pragma uvmf custom do_monitor end
  endtask         
  
 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end
`endif
