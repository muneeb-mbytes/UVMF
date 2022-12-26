//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
//    This interface performs the spi_s signal driving.  It is
//     accessed by the uvm spi_s driver through a virtual interface
//     handle in the spi_s configuration.  It drives the singals passed
//     in through the port connection named bus of type spi_s_if.
//
//     Input signals from the spi_s_if are assigned to an internal input
//     signal with a _i suffix.  The _i signal should be used for sampling.
//
//     The input signal connections are as follows:
//       bus.signal -> signal_i 
//
//     This bfm drives signals with a _o suffix.  These signals
//     are driven onto signals within spi_s_if based on INITIATOR/RESPONDER and/or
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
import spi_s_pkg_hdl::*;
`include "src/spi_s_macros.svh"

interface spi_s_driver_bfm 
  (spi_s_if bus);
  // The following pragma and additional ones in-lined further below are for running this BFM on Veloce
  // pragma attribute spi_s_driver_bfm partition_interface_xif

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

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase

  logic sck_i;
  logic rst_i;

  // Signal list (all signals are capable of being inputs and outputs for the sake
  // of supporting both INITIATOR and RESPONDER mode operation. Expectation is that 
  // directionality in the config file was from the point-of-view of the INITIATOR

  // INITIATOR mode input signals
  tri  sclk_i;
  reg  sclk_o = 'b0;
  tri  ss_i;
  reg  ss_o = 'b0;
  tri [7:0] mosi_i;
  reg [7:0] mosi_o = 'b0;

  // INITIATOR mode output signals
  tri [7:0] miso_i;
  reg [7:0] miso_o = 'b0;

  // Bi-directional signals
  

  assign sck_i = bus.sck;
  assign rst_i = bus.rst;

  // These are signals marked as 'input' by the config file, but the signals will be
  // driven by this BFM if put into RESPONDER mode (flipping all signal directions around)
  assign sclk_i = bus.sclk;
  assign bus.sclk = (initiator_responder == RESPONDER) ? sclk_o : 'bz;
  assign ss_i = bus.ss;
  assign bus.ss = (initiator_responder == RESPONDER) ? ss_o : 'bz;
  assign mosi_i = bus.mosi;
  assign bus.mosi = (initiator_responder == RESPONDER) ? mosi_o : 'bz;


  // These are signals marked as 'output' by the config file, but the outputs will
  // not be driven by this BFM unless placed in INITIATOR mode.
  assign bus.miso = (initiator_responder == INITIATOR) ? miso_o : 'bz;
  assign miso_i = bus.miso;

  // Proxy handle to UVM driver
  spi_s_pkg::spi_s_driver   proxy;
  // pragma tbx oneway proxy.my_function_name_in_uvm_driver                 

  // ****************************************************************************
  // **************************************************************************** 
  // Macros that define structs located in spi_s_macros.svh
  // ****************************************************************************
  // Struct for passing configuration data from spi_s_driver to this BFM
  // ****************************************************************************
  `spi_s_CONFIGURATION_STRUCT
  // ****************************************************************************
  // Structs for INITIATOR and RESPONDER data flow
  //*******************************************************************
  // Initiator macro used by spi_s_driver and spi_s_driver_bfm
  // to communicate initiator driven data to spi_s_driver_bfm.           
  `spi_s_INITIATOR_STRUCT
    spi_s_initiator_s initiator_struct;
  // Responder macro used by spi_s_driver and spi_s_driver_bfm
  // to communicate Responder driven data to spi_s_driver_bfm.
  `spi_s_RESPONDER_STRUCT
    spi_s_responder_s responder_struct;

  // ****************************************************************************
// pragma uvmf custom reset_condition_and_response begin
  // Always block used to return signals to reset value upon assertion of reset
  always @( posedge rst_i )
     begin
       // RESPONDER mode output signals
       sclk_o <= 'b0;
       ss_o <= 'b0;
       mosi_o <= 'b0;
       // INITIATOR mode output signals
       miso_o <= 'b0;
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

  function void configure(spi_s_configuration_s spi_s_configuration_arg); // pragma tbx xtf  
    initiator_responder = spi_s_configuration_arg.initiator_responder;
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
       input spi_s_initiator_s spi_s_initiator_struct, 
       // This argument is used to send data received from the responder
       // back to the sequence item.  The sequence item is returned to the sequence.
       output spi_s_responder_s spi_s_responder_struct 
       );// pragma tbx xtf  
       // 
       // Members within the spi_s_initiator_struct:
       //   bit ssel ;
       //   bit [7:0] mosi ;
       //   bit [7:0] miso ;
       // Members within the spi_s_responder_struct:
       //   bit ssel ;
       //   bit [7:0] mosi ;
       //   bit [7:0] miso ;
       initiator_struct = spi_s_initiator_struct;
       //
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge sck_i);
       //    
       //    How to assign a responder struct member, named xyz, from a signal.   
       //    All available initiator input and inout signals listed.
       //    Initiator input signals
       //      spi_s_responder_struct.xyz = sclk_i;  //     
       //      spi_s_responder_struct.xyz = ss_i;  //     
       //      spi_s_responder_struct.xyz = mosi_i;  //    [7:0] 
       //    Initiator inout signals
       //    How to assign a signal from an initiator struct member named xyz.   
       //    All available initiator output and inout signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       //    Initiator output signals
       //      miso_o <= spi_s_initiator_struct.xyz;  //    [7:0] 
       //    Initiator inout signals
    // Initiate a transfer using the data received.
    @(posedge sck_i);
    @(posedge sck_i);
    // Wait for the responder to complete the transfer then place the responder data into 
    // spi_s_responder_struct.
    @(posedge sck_i);
    @(posedge sck_i);
    responder_struct = spi_s_responder_struct;
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
       output spi_s_initiator_s spi_s_initiator_struct, 
       // This argument passes transaction variables used by a responder
       // to complete a protocol transfer.  The values come from a sequence item.       
       input spi_s_responder_s spi_s_responder_struct 
       );// pragma tbx xtf   
  // Variables within the spi_s_initiator_struct:
  //   bit ssel ;
  //   bit [7:0] mosi ;
  //   bit [7:0] miso ;
  // Variables within the spi_s_responder_struct:
  //   bit ssel ;
  //   bit [7:0] mosi ;
  //   bit [7:0] miso ;
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge sck_i);
       //    
       //    How to assign a responder struct member, named xyz, from a signal.   
       //    All available responder input and inout signals listed.
       //    Responder input signals
       //      spi_s_responder_struct.xyz = miso_i;  //    [7:0] 
       //    Responder inout signals
       //    How to assign a signal, named xyz, from an initiator struct member.   
       //    All available responder output and inout signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       //    Responder output signals
       //      sclk_o <= spi_s_initiator_struct.xyz;  //     
       //      ss_o <= spi_s_initiator_struct.xyz;  //     
       //      mosi_o <= spi_s_initiator_struct.xyz;  //    [7:0] 
       //    Responder inout signals
    
  @(posedge sck_i);
  if (!first_transfer) begin
    // Perform transfer response here.   
    // Reply using data recieved in the spi_s_responder_struct.
    @(posedge sck_i);
    // Reply using data recieved in the transaction handle.
    @(posedge sck_i);
  end
    // Wait for next transfer then gather info from intiator about the transfer.
    // Place the data into the spi_s_initiator_struct.
    @(posedge sck_i);
    @(posedge sck_i);
    first_transfer = 0;
  endtask
// pragma uvmf custom respond_and_wait_for_next_transfer end

 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end
`endif
