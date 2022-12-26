//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This interface performs the wb_slave signal monitoring.
//      It is accessed by the uvm wb_slave monitor through a virtual
//      interface handle in the wb_slave configuration.  It monitors the
//      signals passed in through the port connection named bus of
//      type wb_slave_if.
//
//     Input signals from the wb_slave_if are assigned to an internal input
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
//                   blocks until an operation on the wb_slave bus is complete.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
import uvmf_base_pkg_hdl::*;
import wb_slave_pkg_hdl::*;
import wb_slave_pkg::*;


interface wb_slave_monitor_bfm #(
  bit ADDR_WIDTH = 32,
  bit DATA_WIDTH = 32
  )
  ( wb_slave_if  bus );

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
      $psprintf("The BFM at '%m' has the following parameters: ADDR_WIDTH=%x DATA_WIDTH=%x ", ADDR_WIDTH,DATA_WIDTH),
      UVM_DEBUG)
end
`endif


 wb_slave_transaction #(
                      ADDR_WIDTH,
                      DATA_WIDTH
                      )
 
                      monitored_trans;
 

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase
  bit has_coverage ;
  bit is_active ;

  tri clk_i;
  tri rst_i;
  tri [ADDR_WIDTH-1:0] adr_i_i;
  tri [DATA_WIDTH-1:0] dat_i_i;
  tri [DATA_WIDTH-1:0] dat_o_i;
  tri  we_i_i;
  tri [7:0] sel_i_i;
  tri [7:0] stb_i_i;
  tri  ack_o_i;
  tri  cyc_i_i;
  assign clk_i = bus.clk;
  assign rst_i = bus.rst;
  assign adr_i_i = bus.adr_i;
  assign dat_i_i = bus.dat_i;
  assign dat_o_i = bus.dat_o;
  assign we_i_i = bus.we_i;
  assign sel_i_i = bus.sel_i;
  assign stb_i_i = bus.stb_i;
  assign ack_o_i = bus.ack_o;
  assign cyc_i_i = bus.cyc_i;

  // Proxy handle to UVM monitor
  wb_slave_pkg::wb_slave_monitor #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH)
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
    function void configure(wb_slave_configuration 
                         #(
                         ADDR_WIDTH,
                         DATA_WIDTH
                         )
 
                         wb_slave_configuration_arg
                         );  
    initiator_responder = wb_slave_configuration_arg.initiator_responder;
    has_coverage = wb_slave_configuration_arg.has_coverage;
    is_active = wb_slave_configuration_arg.is_active;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction   


  // ****************************************************************************  
  task do_monitor();
    //
    // Available struct members:
    //     //    monitored_trans.adr_i
    //     //    monitored_trans.dat_o
    //     //    monitored_trans.dat_i
    //     //    monitored_trans.we_i
    //     //    monitored_trans.sel_i
    //     //    monitored_trans.stb_i
    //     //    monitored_trans.ack_o
    //     //    monitored_trans.cyc_i
    //     //
    // Reference code;
    //    How to wait for signal value
    //      while (control_signal === 1'b1) @(posedge clk_i);
    //    
    //    How to assign a transaction variable, named xyz, from a signal.   
    //    All available input signals listed.
    //      monitored_trans.xyz = adr_i_i;  //    [ADDR_WIDTH-1:0] 
    //      monitored_trans.xyz = dat_i_i;  //    [DATA_WIDTH-1:0] 
    //      monitored_trans.xyz = dat_o_i;  //    [DATA_WIDTH-1:0] 
    //      monitored_trans.xyz = we_i_i;  //     
    //      monitored_trans.xyz = sel_i_i;  //    [7:0] 
    //      monitored_trans.xyz = stb_i_i;  //    [7:0] 
    //      monitored_trans.xyz = ack_o_i;  //     
    //      monitored_trans.xyz = cyc_i_i;  //     
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

