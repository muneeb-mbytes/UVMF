//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
//    This interface performs the wishbone_master signal driving.  It is
//     accessed by the uvm wishbone_master driver through a virtual interface
//     handle in the wishbone_master configuration.  It drives the singals passed
//     in through the port connection named bus of type wishbone_master_if.
//
//     Input signals from the wishbone_master_if are assigned to an internal input
//     signal with a _i suffix.  The _i signal should be used for sampling.
//
//     The input signal connections are as follows:
//       bus.signal -> signal_i 
//
//     This bfm drives signals with a _o suffix.  These signals
//     are driven onto signals within wishbone_master_if based on INITIATOR/RESPONDER and/or
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
import wishbone_master_pkg_hdl::*;
`include "src/wishbone_master_macros.svh"

interface wishbone_master_driver_bfm 
  (wishbone_master_if bus);
  // The following pragma and additional ones in-lined further below are for running this BFM on Veloce
  // pragma attribute wishbone_master_driver_bfm partition_interface_xif

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
  bit is_active ;
  int no_of_slaves ;
  bit has_coverage ;

  tri clock_i;
  tri reset_i;

  // Signal list (all signals are capable of being inputs and outputs for the sake
  // of supporting both INITIATOR and RESPONDER mode operation. Expectation is that 
  // directionality in the config file was from the point-of-view of the INITIATOR

  // INITIATOR mode input signals
  tri [31:0] ADR_O_i;
  reg [31:0] ADR_O_o = 1'b0;
  tri [31:0] DATA_O_i;
  reg [31:0] DATA_O_o = 1'b0;
  tri  WE_O_i;
  reg  WE_O_o = 1'b0;
  tri  SEL_O_i;
  reg  SEL_O_o = 1'b0;
  tri  STB_O_i;
  reg  STB_O_o = 1'b0;
  tri  CYC_O_i;
  reg  CYC_O_o = 1'b0;
  tri  TAGN_O_i;
  reg  TAGN_O_o = 1'b0;

  // INITIATOR mode output signals
  tri [31:0] DATA_I_i;
  reg [31:0] DATA_I_o = 1'b0;
  tri  ACK_I_i;
  reg  ACK_I_o = 1'b0;
  tri  TAGN_I_i;
  reg  TAGN_I_o = 1'b0;

  // Bi-directional signals
  

  assign clock_i = bus.clock;
  assign reset_i = bus.reset;

  // These are signals marked as 'input' by the config file, but the signals will be
  // driven by this BFM if put into RESPONDER mode (flipping all signal directions around)
  assign ADR_O_i = bus.ADR_O;
  assign bus.ADR_O = (initiator_responder == RESPONDER) ? ADR_O_o : 'bz;
  assign DATA_O_i = bus.DATA_O;
  assign bus.DATA_O = (initiator_responder == RESPONDER) ? DATA_O_o : 'bz;
  assign WE_O_i = bus.WE_O;
  assign bus.WE_O = (initiator_responder == RESPONDER) ? WE_O_o : 'bz;
  assign SEL_O_i = bus.SEL_O;
  assign bus.SEL_O = (initiator_responder == RESPONDER) ? SEL_O_o : 'bz;
  assign STB_O_i = bus.STB_O;
  assign bus.STB_O = (initiator_responder == RESPONDER) ? STB_O_o : 'bz;
  assign CYC_O_i = bus.CYC_O;
  assign bus.CYC_O = (initiator_responder == RESPONDER) ? CYC_O_o : 'bz;
  assign TAGN_O_i = bus.TAGN_O;
  assign bus.TAGN_O = (initiator_responder == RESPONDER) ? TAGN_O_o : 'bz;


  // These are signals marked as 'output' by the config file, but the outputs will
  // not be driven by this BFM unless placed in INITIATOR mode.
  assign bus.DATA_I = (initiator_responder == INITIATOR) ? DATA_I_o : 'bz;
  assign DATA_I_i = bus.DATA_I;
  assign bus.ACK_I = (initiator_responder == INITIATOR) ? ACK_I_o : 'bz;
  assign ACK_I_i = bus.ACK_I;
  assign bus.TAGN_I = (initiator_responder == INITIATOR) ? TAGN_I_o : 'bz;
  assign TAGN_I_i = bus.TAGN_I;

  // Proxy handle to UVM driver
  wishbone_master_pkg::wishbone_master_driver   proxy;
  // pragma tbx oneway proxy.my_function_name_in_uvm_driver                 

  // ****************************************************************************
  // **************************************************************************** 
  // Macros that define structs located in wishbone_master_macros.svh
  // ****************************************************************************
  // Struct for passing configuration data from wishbone_master_driver to this BFM
  // ****************************************************************************
  `wishbone_master_CONFIGURATION_STRUCT
  // ****************************************************************************
  // Structs for INITIATOR and RESPONDER data flow
  //*******************************************************************
  // Initiator macro used by wishbone_master_driver and wishbone_master_driver_bfm
  // to communicate initiator driven data to wishbone_master_driver_bfm.           
  `wishbone_master_INITIATOR_STRUCT
    wishbone_master_initiator_s initiator_struct;
  // Responder macro used by wishbone_master_driver and wishbone_master_driver_bfm
  // to communicate Responder driven data to wishbone_master_driver_bfm.
  `wishbone_master_RESPONDER_STRUCT
    wishbone_master_responder_s responder_struct;

  // ****************************************************************************
// pragma uvmf custom reset_condition_and_response begin
  // Always block used to return signals to reset value upon assertion of reset
  always @( posedge reset_i )
     begin
       // RESPONDER mode output signals
       ADR_O_o <= 1'b0;
       DATA_O_o <= 1'b0;
       WE_O_o <= 1'b0;
       SEL_O_o <= 1'b0;
       STB_O_o <= 1'b0;
       CYC_O_o <= 1'b0;
       TAGN_O_o <= 1'b0;
       // INITIATOR mode output signals
       DATA_I_o <= 1'b0;
       ACK_I_o <= 1'b0;
       TAGN_I_o <= 1'b0;
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

  function void configure(wishbone_master_configuration_s wishbone_master_configuration_arg); // pragma tbx xtf  
    initiator_responder = wishbone_master_configuration_arg.initiator_responder;
    is_active = wishbone_master_configuration_arg.is_active;
    no_of_slaves = wishbone_master_configuration_arg.no_of_slaves;
    has_coverage = wishbone_master_configuration_arg.has_coverage;
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
       input wishbone_master_initiator_s wishbone_master_initiator_struct, 
       // This argument is used to send data received from the responder
       // back to the sequence item.  The sequence item is returned to the sequence.
       output wishbone_master_responder_s wishbone_master_responder_struct 
       );// pragma tbx xtf  
       // 
       // Members within the wishbone_master_initiator_struct:
       //   bit ADR_O ;
       //   bit DATA_I ;
       //   bit mosi ;
       //   bit miso ;
       // Members within the wishbone_master_responder_struct:
       //   bit ADR_O ;
       //   bit DATA_I ;
       //   bit mosi ;
       //   bit miso ;
       initiator_struct = wishbone_master_initiator_struct;
       //
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge clock_i);
       //    
       //    How to assign a responder struct member, named xyz, from a signal.   
       //    All available initiator input and inout signals listed.
       //    Initiator input signals
       //      wishbone_master_responder_struct.xyz = ADR_O_i;  //    [31:0] 
       //      wishbone_master_responder_struct.xyz = DATA_O_i;  //    [31:0] 
       //      wishbone_master_responder_struct.xyz = WE_O_i;  //     
       //      wishbone_master_responder_struct.xyz = SEL_O_i;  //     
       //      wishbone_master_responder_struct.xyz = STB_O_i;  //     
       //      wishbone_master_responder_struct.xyz = CYC_O_i;  //     
       //      wishbone_master_responder_struct.xyz = TAGN_O_i;  //     
       //    Initiator inout signals
       //    How to assign a signal from an initiator struct member named xyz.   
       //    All available initiator output and inout signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       //    Initiator output signals
       //      DATA_I_o <= wishbone_master_initiator_struct.xyz;  //    [31:0] 
       //      ACK_I_o <= wishbone_master_initiator_struct.xyz;  //     
       //      TAGN_I_o <= wishbone_master_initiator_struct.xyz;  //     
       //    Initiator inout signals
    // Initiate a transfer using the data received.
    @(posedge clock_i);
    @(posedge clock_i);
    // Wait for the responder to complete the transfer then place the responder data into 
    // wishbone_master_responder_struct.
    @(posedge clock_i);
    @(posedge clock_i);
    responder_struct = wishbone_master_responder_struct;
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
       output wishbone_master_initiator_s wishbone_master_initiator_struct, 
       // This argument passes transaction variables used by a responder
       // to complete a protocol transfer.  The values come from a sequence item.       
       input wishbone_master_responder_s wishbone_master_responder_struct 
       );// pragma tbx xtf   
  // Variables within the wishbone_master_initiator_struct:
  //   bit ADR_O ;
  //   bit DATA_I ;
  //   bit mosi ;
  //   bit miso ;
  // Variables within the wishbone_master_responder_struct:
  //   bit ADR_O ;
  //   bit DATA_I ;
  //   bit mosi ;
  //   bit miso ;
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge clock_i);
       //    
       //    How to assign a responder struct member, named xyz, from a signal.   
       //    All available responder input and inout signals listed.
       //    Responder input signals
       //      wishbone_master_responder_struct.xyz = DATA_I_i;  //    [31:0] 
       //      wishbone_master_responder_struct.xyz = ACK_I_i;  //     
       //      wishbone_master_responder_struct.xyz = TAGN_I_i;  //     
       //    Responder inout signals
       //    How to assign a signal, named xyz, from an initiator struct member.   
       //    All available responder output and inout signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       //    Responder output signals
       //      ADR_O_o <= wishbone_master_initiator_struct.xyz;  //    [31:0] 
       //      DATA_O_o <= wishbone_master_initiator_struct.xyz;  //    [31:0] 
       //      WE_O_o <= wishbone_master_initiator_struct.xyz;  //     
       //      SEL_O_o <= wishbone_master_initiator_struct.xyz;  //     
       //      STB_O_o <= wishbone_master_initiator_struct.xyz;  //     
       //      CYC_O_o <= wishbone_master_initiator_struct.xyz;  //     
       //      TAGN_O_o <= wishbone_master_initiator_struct.xyz;  //     
       //    Responder inout signals
    
  @(posedge clock_i);
  if (!first_transfer) begin
    // Perform transfer response here.   
    // Reply using data recieved in the wishbone_master_responder_struct.
    @(posedge clock_i);
    // Reply using data recieved in the transaction handle.
    @(posedge clock_i);
  end
    // Wait for next transfer then gather info from intiator about the transfer.
    // Place the data into the wishbone_master_initiator_struct.
    @(posedge clock_i);
    @(posedge clock_i);
    first_transfer = 0;
  endtask
// pragma uvmf custom respond_and_wait_for_next_transfer end

 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

