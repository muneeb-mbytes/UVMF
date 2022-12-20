//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
//    This interface performs the mem signal driving.  It is
//     accessed by the uvm mem driver through a virtual interface
//     handle in the mem configuration.  It drives the singals passed
//     in through the port connection named bus of type mem_if.
//
//     Input signals from the mem_if are assigned to an internal input
//     signal with a _i suffix.  The _i signal should be used for sampling.
//
//     The input signal connections are as follows:
//       bus.signal -> signal_i 
//
//     This bfm drives signals with a _o suffix.  These signals
//     are driven onto signals within mem_if based on INITIATOR/RESPONDER and/or
//     ARBITRATION/GRANT status.  
//
//     The output signal connections are as follows:
//        signal_o -> bus.signal
//
//                                                                                           
//      Interface functions and tasks used by UVM components:
//
//             configure:
//                   This function gets configuration attributes from the
//                   UVM driver to set any required BFM configuration
//                   variables such as 'initiator_responder'.                                       
//                                                                                           
//             initiate_and_get_response:
//                   This task is used to perform signaling activity for initiating
//                   a protocol transfer.  The task initiates the transfer, using
//                   input data from the initiator struct.  Then the task captures
//                   response data, placing the data into the response struct.
//                   The response struct is returned to the driver class.
//
//             respond_and_wait_for_next_transfer:
//                   This task is used to complete a current transfer as a responder
//                   and then wait for the initiator to start the next transfer.
//                   The task uses data in the responder struct to drive protocol
//                   signals to complete the transfer.  The task then waits for 
//                   the next transfer.  Once the next transfer begins, data from
//                   the initiator is placed into the initiator struct and sent
//                   to the responder sequence for processing to determine 
//                   what data to respond with.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
import uvmf_base_pkg_hdl::*;
import mem_pkg_hdl::*;
`include "src/mem_macros.svh"

interface mem_driver_bfm #(
  int DATA_WIDTH = 220,
  int ADDR_WIDTH = 210
  )
  (mem_if bus);
  // The following pragma and additional ones in-lined further below are for running this BFM on Veloce
  // pragma attribute mem_driver_bfm partition_interface_xif

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
      $psprintf("The BFM at '%m' has the following parameters: DATA_WIDTH=%x ADDR_WIDTH=%x ", DATA_WIDTH,ADDR_WIDTH),
      UVM_DEBUG)
end
`endif

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase
  bit [3:0] transfer_gap ;
  bit [3:0] speed_grade ;

  tri clock_i;
  tri reset_i;

  // Signal list (all signals are capable of being inputs and outputs for the sake
  // of supporting both INITIATOR and RESPONDER mode operation. Expectation is that 
  // directionality in the config file was from the point-of-view of the INITIATOR

  // INITIATOR mode input signals
  tri  rdy_i;
  reg  rdy_o = 1'b0;
  tri [DATA_WIDTH-1:0] rdata_i;
  reg [DATA_WIDTH-1:0] rdata_o = 'bz;

  // INITIATOR mode output signals
  tri  cs_i;
  reg  cs_o = 1'b0;
  tri  rwn_i;
  reg  rwn_o = 1'b1;
  tri [ADDR_WIDTH-1:0] addr_i;
  reg [ADDR_WIDTH-1:0] addr_o = 'bz;
  tri [DATA_WIDTH-1:0] wdata_i;
  reg [DATA_WIDTH-1:0] wdata_o = 'bz;

  // Bi-directional signals
  

  assign clock_i = bus.clock;
  assign reset_i = bus.reset;

  // These are signals marked as 'input' by the config file, but the signals will be
  // driven by this BFM if put into RESPONDER mode (flipping all signal directions around)
  assign rdy_i = bus.rdy;
  assign bus.rdy = (initiator_responder == RESPONDER) ? rdy_o : 'bz;
  assign rdata_i = bus.rdata;
  assign bus.rdata = (initiator_responder == RESPONDER) ? rdata_o : 'bz;


  // These are signals marked as 'output' by the config file, but the outputs will
  // not be driven by this BFM unless placed in INITIATOR mode.
  assign bus.cs = (initiator_responder == INITIATOR) ? cs_o : 'bz;
  assign cs_i = bus.cs;
  assign bus.rwn = (initiator_responder == INITIATOR) ? rwn_o : 'bz;
  assign rwn_i = bus.rwn;
  assign bus.addr = (initiator_responder == INITIATOR) ? addr_o : 'bz;
  assign addr_i = bus.addr;
  assign bus.wdata = (initiator_responder == INITIATOR) ? wdata_o : 'bz;
  assign wdata_i = bus.wdata;

  // Proxy handle to UVM driver
  mem_pkg::mem_driver #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH)
    )  proxy;
  // pragma tbx oneway proxy.my_function_name_in_uvm_driver                 

  // ****************************************************************************
  // **************************************************************************** 
  // Macros that define structs located in mem_macros.svh
  // ****************************************************************************
  // Struct for passing configuration data from mem_driver to this BFM
  // ****************************************************************************
  `mem_CONFIGURATION_STRUCT
  // ****************************************************************************
  // Structs for INITIATOR and RESPONDER data flow
  //*******************************************************************
  // Initiator macro used by mem_driver and mem_driver_bfm
  // to communicate initiator driven data to mem_driver_bfm.           
  `mem_INITIATOR_STRUCT
    mem_initiator_s initiator_struct;
  // Responder macro used by mem_driver and mem_driver_bfm
  // to communicate Responder driven data to mem_driver_bfm.
  `mem_RESPONDER_STRUCT
    mem_responder_s responder_struct;

  // ****************************************************************************
// pragma uvmf custom reset_condition_and_response begin
  // Always block used to return signals to reset value upon assertion of reset
  always @( posedge reset_i )
     begin
       // RESPONDER mode output signals
       rdy_o <= 1'b0;
       rdata_o <= 'bz;
       // INITIATOR mode output signals
       cs_o <= 1'b0;
       rwn_o <= 1'b1;
       addr_o <= 'bz;
       wdata_o <= 'bz;
       // Bi-directional signals
 
     end    
// pragma uvmf custom reset_condition_and_response end

  // pragma uvmf custom interface_item_additional begin
  // pragma uvmf custom interface_item_additional end

  //******************************************************************
  // The configure() function is used to pass agent configuration
  // variables to the driver BFM.  It is called by the driver within
  // the agent at the beginning of the simulation.  It may be called 
  // during the simulation if agent configuration variables are updated
  // and the driver BFM needs to be aware of the new configuration 
  // variables.
  //

  function void configure(mem_configuration_s mem_configuration_arg); // pragma tbx xtf  
    initiator_responder = mem_configuration_arg.initiator_responder;
    transfer_gap = mem_configuration_arg.transfer_gap;
    speed_grade = mem_configuration_arg.speed_grade;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction                                                                             

// pragma uvmf custom initiate_and_get_response begin
// ****************************************************************************
// UVMF_CHANGE_ME
// This task is used by an initator.  The task first initiates a transfer then
// waits for the responder to complete the transfer.
    task initiate_and_get_response( 
       // This argument passes transaction variables used by an initiator
       // to perform the initial part of a protocol transfer.  The values
       // come from a sequence item created in a sequence.
       input mem_initiator_s mem_initiator_struct, 
       // This argument is used to send data received from the responder
       // back to the sequence item.  The sequence item is returned to the sequence.
       output mem_responder_s mem_responder_struct 
       );// pragma tbx xtf  
       // 
       // Members within the mem_initiator_struct:
       //   bit [DATA_WIDTH-1:0] read_data ;
       //   bit [DATA_WIDTH-1:0] write_data ;
       //   bit [ADDR_WIDTH-1:0] address ;
       //   bit [3:0] byte_enable ;
       //   int chksum ;
       // Members within the mem_responder_struct:
       //   bit [DATA_WIDTH-1:0] read_data ;
       //   bit [DATA_WIDTH-1:0] write_data ;
       //   bit [ADDR_WIDTH-1:0] address ;
       //   bit [3:0] byte_enable ;
       //   int chksum ;
       initiator_struct = mem_initiator_struct;
       //
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge clock_i);
       //    
       //    How to assign a responder struct member, named xyz, from a signal.   
       //    All available initiator input and inout signals listed.
       //    Initiator input signals
       //      mem_responder_struct.xyz = rdy_i;  //     
       //      mem_responder_struct.xyz = rdata_i;  //    [DATA_WIDTH-1:0] 
       //    Initiator inout signals
       //    How to assign a signal from an initiator struct member named xyz.   
       //    All available initiator output and inout signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       //    Initiator output signals
       //      cs_o <= mem_initiator_struct.xyz;  //     
       //      rwn_o <= mem_initiator_struct.xyz;  //     
       //      addr_o <= mem_initiator_struct.xyz;  //    [ADDR_WIDTH-1:0] 
       //      wdata_o <= mem_initiator_struct.xyz;  //    [DATA_WIDTH-1:0] 
       //    Initiator inout signals
    // Initiate a transfer using the data received.
    @(posedge clock_i);
    @(posedge clock_i);
    // Wait for the responder to complete the transfer then place the responder data into 
    // mem_responder_struct.
    @(posedge clock_i);
    @(posedge clock_i);
    responder_struct = mem_responder_struct;
  endtask        
// pragma uvmf custom initiate_and_get_response end

// pragma uvmf custom respond_and_wait_for_next_transfer begin
// ****************************************************************************
// The first_transfer variable is used to prevent completing a transfer in the 
// first call to this task.  For the first call to this task, there is not
// current transfer to complete.
bit first_transfer=1;

// UVMF_CHANGE_ME
// This task is used by a responder.  The task first completes the current 
// transfer in progress then waits for the initiator to start the next transfer.
  task respond_and_wait_for_next_transfer( 
       // This argument is used to send data received from the initiator
       // back to the sequence item.  The sequence determines how to respond.
       output mem_initiator_s mem_initiator_struct, 
       // This argument passes transaction variables used by a responder
       // to complete a protocol transfer.  The values come from a sequence item.       
       input mem_responder_s mem_responder_struct 
       );// pragma tbx xtf   
  // Variables within the mem_initiator_struct:
  //   bit [DATA_WIDTH-1:0] read_data ;
  //   bit [DATA_WIDTH-1:0] write_data ;
  //   bit [ADDR_WIDTH-1:0] address ;
  //   bit [3:0] byte_enable ;
  //   int chksum ;
  // Variables within the mem_responder_struct:
  //   bit [DATA_WIDTH-1:0] read_data ;
  //   bit [DATA_WIDTH-1:0] write_data ;
  //   bit [ADDR_WIDTH-1:0] address ;
  //   bit [3:0] byte_enable ;
  //   int chksum ;
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge clock_i);
       //    
       //    How to assign a responder struct member, named xyz, from a signal.   
       //    All available responder input and inout signals listed.
       //    Responder input signals
       //      mem_responder_struct.xyz = cs_i;  //     
       //      mem_responder_struct.xyz = rwn_i;  //     
       //      mem_responder_struct.xyz = addr_i;  //    [ADDR_WIDTH-1:0] 
       //      mem_responder_struct.xyz = wdata_i;  //    [DATA_WIDTH-1:0] 
       //    Responder inout signals
       //    How to assign a signal, named xyz, from an initiator struct member.   
       //    All available responder output and inout signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       //    Responder output signals
       //      rdy_o <= mem_initiator_struct.xyz;  //     
       //      rdata_o <= mem_initiator_struct.xyz;  //    [DATA_WIDTH-1:0] 
       //    Responder inout signals
    
  @(posedge clock_i);
  if (!first_transfer) begin
    // Perform transfer response here.   
    // Reply using data recieved in the mem_responder_struct.
    @(posedge clock_i);
    // Reply using data recieved in the transaction handle.
    @(posedge clock_i);
  end
    // Wait for next transfer then gather info from intiator about the transfer.
    // Place the data into the mem_initiator_struct.
    @(posedge clock_i);
    @(posedge clock_i);
    first_transfer = 0;
  endtask
// pragma uvmf custom respond_and_wait_for_next_transfer end

 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

