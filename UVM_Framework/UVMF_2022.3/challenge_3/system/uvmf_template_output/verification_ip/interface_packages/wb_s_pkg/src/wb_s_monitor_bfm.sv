`ifndef WB_S_MONITOR_BFM
`define WB_S_MONITOR_BFM
//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface performs the wb_s signal monitoring.
//      It is accessed by the uvm wb_s monitor through a virtual
//      interface handle in the wb_s configuration.  It monitors the
//      signals passed in through the port connection named bus of
//      type wb_s_if.
//
//     Input signals from the wb_s_if are assigned to an internal input
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
//                   blocks until an operation on the wb_s bus is complete.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
import uvmf_base_pkg_hdl::*;
import wb_s_pkg_hdl::*;
`include "src/wb_s_macros.svh"


interface wb_s_monitor_bfm #(
  int WB_ADDR_WIDTH = 32,
  int WB_DATA_WIDTH = 16
  )
  ( wb_s_if  bus );
  // The pragma below and additional ones in-lined further down are for running this BFM on Veloce
  // pragma attribute wb_s_monitor_bfm partition_interface_xif                                  

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
      $psprintf("The BFM at '%m' has the following parameters: WB_ADDR_WIDTH=%x WB_DATA_WIDTH=%x ", WB_ADDR_WIDTH,WB_DATA_WIDTH),
      UVM_DEBUG)
end
`endif


  // Structure used to pass transaction data from monitor BFM to monitor class in agent.
`wb_s_MONITOR_STRUCT
  wb_s_monitor_s wb_s_monitor_struct;

  // Structure used to pass configuration data from monitor class to monitor BFM.
 `wb_s_CONFIGURATION_STRUCT
 

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase

  logic clock_i;
  logic reset_i;
  tri [WB_DATA_WIDTH-1:0] din_i;
  tri [WB_DATA_WIDTH-1:0] dout_i;
  tri [WB_DATA_WIDTH-1:0] TGD_I_i;
  tri [WB_DATA_WIDTH-1:0] TGD_O_i;
  tri  ack_i;
  tri [WB_ADDR_WIDTH-1:0] adr_i;
  tri  cyc_i;
  tri  err_i;
  tri  we_i;
  tri  stb_i;
  tri [WB_DATA_WIDTH/8-1:0] sel_i;
  assign clock_i = bus.clock;
  assign reset_i = bus.reset;
  assign din_i = bus.din;
  assign dout_i = bus.dout;
  assign TGD_I_i = bus.TGD_I;
  assign TGD_O_i = bus.TGD_O;
  assign ack_i = bus.ack;
  assign adr_i = bus.adr;
  assign cyc_i = bus.cyc;
  assign err_i = bus.err;
  assign we_i = bus.we;
  assign stb_i = bus.stb;
  assign sel_i = bus.sel;

  // Proxy handle to UVM monitor
  wb_s_pkg::wb_s_monitor #(
    .WB_ADDR_WIDTH(WB_ADDR_WIDTH),
    .WB_DATA_WIDTH(WB_DATA_WIDTH)
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
      do_monitor( wb_s_monitor_struct );
                                                                 
 
      proxy.notify_transaction( wb_s_monitor_struct );
 
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
    function void configure(wb_s_configuration_s wb_s_configuration_arg); // pragma tbx xtf  
    initiator_responder = wb_s_configuration_arg.initiator_responder;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction   


  // ****************************************************************************  
            
  task do_monitor(output wb_s_monitor_s wb_s_monitor_struct);
    //
    // Available struct members:
    //     //    wb_s_monitor_struct.data
    //     //
    // Reference code;
    //    How to wait for signal value
    //      while (control_signal === 1'b1) @(posedge clock_i);
    //    
    //    How to assign a struct member, named xyz, from a signal.   
    //    All available input signals listed.
    //      wb_s_monitor_struct.xyz = din_i;  //    [WB_DATA_WIDTH-1:0] 
    //      wb_s_monitor_struct.xyz = dout_i;  //    [WB_DATA_WIDTH-1:0] 
    //      wb_s_monitor_struct.xyz = TGD_I_i;  //    [WB_DATA_WIDTH-1:0] 
    //      wb_s_monitor_struct.xyz = TGD_O_i;  //    [WB_DATA_WIDTH-1:0] 
    //      wb_s_monitor_struct.xyz = ack_i;  //     
    //      wb_s_monitor_struct.xyz = adr_i;  //    [WB_ADDR_WIDTH-1:0] 
    //      wb_s_monitor_struct.xyz = cyc_i;  //     
    //      wb_s_monitor_struct.xyz = err_i;  //     
    //      wb_s_monitor_struct.xyz = we_i;  //     
    //      wb_s_monitor_struct.xyz = stb_i;  //     
    //      wb_s_monitor_struct.xyz = sel_i;  //    [WB_DATA_WIDTH/8-1:0] 
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
`endif
