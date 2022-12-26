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
import apb_master_pkg::*;


interface apb_master_monitor_bfm #(
  int ADDR_WIDTH = 32,
  int DATA_WIDTH = 32,
  int NO_OF_SLAVES = 1
  )
  ( apb_master_if  bus );

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
      $psprintf("The BFM at '%m' has the following parameters: ADDR_WIDTH=%x DATA_WIDTH=%x NO_OF_SLAVES=%x ", ADDR_WIDTH,DATA_WIDTH,NO_OF_SLAVES),
      UVM_DEBUG)
end
`endif


 apb_master_transaction #(
                      ADDR_WIDTH,
                      DATA_WIDTH,
                      NO_OF_SLAVES
                      )
 
                      monitored_trans;
 

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase

  tri clk_i;
  tri rst_i;
  tri [NO_OF_SLAVES-1:0] psel_i;
  tri  penable_i;
  tri  pwrite_i;
  tri [ADDR_WIDTH-1:0] paddr_i;
  tri [DATA_WIDTH-1:0] pstrb_i;
  tri [ADDR_WIDTH-1:0] pwdata_i;
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
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH),
    .NO_OF_SLAVES(NO_OF_SLAVES)
    ) proxy;

  // pragma uvmf custom interface_item_additional begin
  // pragma uvmf custom interface_item_additional end
  
  //******************************************************************                         
  task wait_for_reset(); 
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
 
  task wait_for_num_clocks(input int unsigned count); 
    @(posedge clk_i);  
                                                                   
    repeat (count-1) @(posedge clk_i);                                                    
  endtask      

  //******************************************************************                         
  event go;                                                                                 
  function void start_monitoring();  
    -> go;
  endfunction                                                                               
  
  // ****************************************************************************              
  initial begin                                                                             
    @go;                                                                                   
    forever begin                                                                        
      @(posedge clk_i);  
      monitored_trans = new("monitored_trans");
      do_monitor( );
                                                                 
 
      proxy.notify_transaction( monitored_trans ); 
 
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
    function void configure(apb_master_configuration 
                         #(
                         ADDR_WIDTH,
                         DATA_WIDTH,
                         NO_OF_SLAVES
                         )
 
                         apb_master_configuration_arg
                         );  
    initiator_responder = apb_master_configuration_arg.initiator_responder;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction   


  // ****************************************************************************  
  task do_monitor();
    //
    // Available struct members:
    //     //    monitored_trans.psel
    //     //    monitored_trans.penable
    //     //    monitored_trans.pwrite
    //     //    monitored_trans.paddr
    //     //    monitored_trans.pstrb
    //     //    monitored_trans.pwdata
    //     //    monitored_trans.pready
    //     //    monitored_trans.prdata
    //     //    monitored_trans.pslverr
    //     //
    // Reference code;
    //    How to wait for signal value
    //      while (control_signal === 1'b1) @(posedge clk_i);
    //    
    //    How to assign a transaction variable, named xyz, from a signal.   
    //    All available input signals listed.
    //      monitored_trans.xyz = psel_i;  //    [NO_OF_SLAVES-1:0] 
    //      monitored_trans.xyz = penable_i;  //     
    //      monitored_trans.xyz = pwrite_i;  //     
    //      monitored_trans.xyz = paddr_i;  //    [ADDR_WIDTH-1:0] 
    //      monitored_trans.xyz = pstrb_i;  //    [DATA_WIDTH-1:0] 
    //      monitored_trans.xyz = pwdata_i;  //    [ADDR_WIDTH-1:0] 
    //      monitored_trans.xyz = pready_i;  //     
    //      monitored_trans.xyz = pslverr_i;  //     
    //      monitored_trans.xyz = prdata_i;  //    [DATA_WIDTH-1:0] 
    // pragma uvmf custom do_monitor begin
    // UVMF_CHANGE_ME : Implement protocol monitoring.  The commented reference code 
    // below are examples of how to capture signal values and assign them to 
    // structure members.  All available input signals are listed.  The 'while' 
    // code example shows how to wait for a synchronous flow control signal.  This
    // task should return when a complete transfer has been observed.  Once this task is
    // exited with captured values, it is then called again to wait for and observe 
    // the next transfer. One clock cycle is consumed between calls to do_monitor.
    monitored_trans.start_time = $time;
    @(posedge clk_i);
    @(posedge clk_i);
    @(posedge clk_i);
    @(posedge clk_i);
    monitored_trans.end_time = $time;
    // pragma uvmf custom do_monitor end
  endtask         
  
 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

