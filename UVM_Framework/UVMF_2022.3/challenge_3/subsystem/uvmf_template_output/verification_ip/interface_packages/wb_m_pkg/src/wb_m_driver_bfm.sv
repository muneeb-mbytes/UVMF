//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
//    This interface performs the wb_m signal driving.  It is
//     accessed by the uvm wb_m driver through a virtual interface
//     handle in the wb_m configuration.  It drives the singals passed
//     in through the port connection named bus of type wb_m_if.
//
//     Input signals from the wb_m_if are assigned to an internal input
//     signal with a _i suffix.  The _i signal should be used for sampling.
//
//     The input signal connections are as follows:
//       bus.signal -> signal_i 
//
//     This bfm drives signals with a _o suffix.  These signals
//     are driven onto signals within wb_m_if based on INITIATOR/RESPONDER and/or
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
import wb_m_pkg_hdl::*;
`include "src/wb_m_macros.svh"

interface wb_m_driver_bfm #(
  int WB_ADDR_WIDTH = 32,
  int WB_DATA_WIDTH = 16
  )
  (wb_m_if bus);
  // The following pragma and additional ones in-lined further below are for running this BFM on Veloce
  // pragma attribute wb_m_driver_bfm partition_interface_xif

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

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase

  logic clock_i;
  logic reset_i;

  // Signal list (all signals are capable of being inputs and outputs for the sake
  // of supporting both INITIATOR and RESPONDER mode operation. Expectation is that 
  // directionality in the config file was from the point-of-view of the INITIATOR

  // INITIATOR mode input signals
  tri [WB_DATA_WIDTH-1:0] din_i;
  reg [WB_DATA_WIDTH-1:0] din_o = 'b0;
  tri [WB_DATA_WIDTH-1:0] TGD_I_i;
  reg [WB_DATA_WIDTH-1:0] TGD_I_o = 'bz;
  tri  err_i;
  reg  err_o = 'b0;

  // INITIATOR mode output signals
  tri [WB_DATA_WIDTH-1:0] dout_i;
  reg [WB_DATA_WIDTH-1:0] dout_o = 'b0;
  tri [WB_DATA_WIDTH-1:0] TGD_O_i;
  reg [WB_DATA_WIDTH-1:0] TGD_O_o = 'bz;
  tri  ack_i;
  reg  ack_o = 1'b0;
  tri [WB_ADDR_WIDTH-1:0] adr_i;
  reg [WB_ADDR_WIDTH-1:0] adr_o = 'b0;
  tri  cyc_i;
  reg  cyc_o = 0;
  tri  we_i;
  reg  we_o = 0;
  tri  stb_i;
  reg  stb_o = 0;
  tri [WB_DATA_WIDTH/8-1:0] sel_i;
  reg [WB_DATA_WIDTH/8-1:0] sel_o = 'b0;

  // Bi-directional signals
  

  assign clock_i = bus.clock;
  assign reset_i = bus.reset;

  // These are signals marked as 'input' by the config file, but the signals will be
  // driven by this BFM if put into RESPONDER mode (flipping all signal directions around)
  assign din_i = bus.din;
  assign bus.din = (initiator_responder == RESPONDER) ? din_o : 'bz;
  assign TGD_I_i = bus.TGD_I;
  assign bus.TGD_I = (initiator_responder == RESPONDER) ? TGD_I_o : 'bz;
  assign err_i = bus.err;
  assign bus.err = (initiator_responder == RESPONDER) ? err_o : 'bz;


  // These are signals marked as 'output' by the config file, but the outputs will
  // not be driven by this BFM unless placed in INITIATOR mode.
  assign bus.dout = (initiator_responder == INITIATOR) ? dout_o : 'bz;
  assign dout_i = bus.dout;
  assign bus.TGD_O = (initiator_responder == INITIATOR) ? TGD_O_o : 'bz;
  assign TGD_O_i = bus.TGD_O;
  assign bus.ack = (initiator_responder == INITIATOR) ? ack_o : 'bz;
  assign ack_i = bus.ack;
  assign bus.adr = (initiator_responder == INITIATOR) ? adr_o : 'bz;
  assign adr_i = bus.adr;
  assign bus.cyc = (initiator_responder == INITIATOR) ? cyc_o : 'bz;
  assign cyc_i = bus.cyc;
  assign bus.we = (initiator_responder == INITIATOR) ? we_o : 'bz;
  assign we_i = bus.we;
  assign bus.stb = (initiator_responder == INITIATOR) ? stb_o : 'bz;
  assign stb_i = bus.stb;
  assign bus.sel = (initiator_responder == INITIATOR) ? sel_o : 'bz;
  assign sel_i = bus.sel;

  // Proxy handle to UVM driver
  wb_m_pkg::wb_m_driver #(
    .WB_ADDR_WIDTH(WB_ADDR_WIDTH),
    .WB_DATA_WIDTH(WB_DATA_WIDTH)
    )  proxy;
  // pragma tbx oneway proxy.my_function_name_in_uvm_driver                 

  // ****************************************************************************
  // **************************************************************************** 
  // Macros that define structs located in wb_m_macros.svh
  // ****************************************************************************
  // Struct for passing configuration data from wb_m_driver to this BFM
  // ****************************************************************************
  `wb_m_CONFIGURATION_STRUCT
  // ****************************************************************************
  // Structs for INITIATOR and RESPONDER data flow
  //*******************************************************************
  // Initiator macro used by wb_m_driver and wb_m_driver_bfm
  // to communicate initiator driven data to wb_m_driver_bfm.           
  `wb_m_INITIATOR_STRUCT
    wb_m_initiator_s initiator_struct;
  // Responder macro used by wb_m_driver and wb_m_driver_bfm
  // to communicate Responder driven data to wb_m_driver_bfm.
  `wb_m_RESPONDER_STRUCT
    wb_m_responder_s responder_struct;

  // ****************************************************************************
// pragma uvmf custom reset_condition_and_response begin
  // Always block used to return signals to reset value upon assertion of reset
  always @( posedge reset_i )
     begin
       // RESPONDER mode output signals
       din_o <= 'b0;
       TGD_I_o <= 'bz;
       err_o <= 'b0;
       // INITIATOR mode output signals
       dout_o <= 'b0;
       TGD_O_o <= 'bz;
       ack_o <= 1'b0;
       adr_o <= 'b0;
       cyc_o <= 0;
       we_o <= 0;
       stb_o <= 0;
       sel_o <= 'b0;
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

  function void configure(wb_m_configuration_s wb_m_configuration_arg); // pragma tbx xtf  
    initiator_responder = wb_m_configuration_arg.initiator_responder;
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
       input wb_m_initiator_s wb_m_initiator_struct, 
       // This argument is used to send data received from the responder
       // back to the sequence item.  The sequence item is returned to the sequence.
       output wb_m_responder_s wb_m_responder_struct 
       );// pragma tbx xtf  
       // 
       // Members within the wb_m_initiator_struct:
       //   bit [WB_DATA_WIDTH-1:0] data ;
       //   bit [(WB_DATA_WIDTH/8)-1:0] byte_select ;
       //   bit WrENB ;
       //   bit selslv ;
       // Members within the wb_m_responder_struct:
       //   bit [WB_DATA_WIDTH-1:0] data ;
       //   bit [(WB_DATA_WIDTH/8)-1:0] byte_select ;
       //   bit WrENB ;
       //   bit selslv ;
       initiator_struct = wb_m_initiator_struct;
       //
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge clock_i);
       //    
       //    How to assign a responder struct member, named xyz, from a signal.   
       //    All available initiator input and inout signals listed.
       //    Initiator input signals
       //      wb_m_responder_struct.xyz = din_i;  //    [WB_DATA_WIDTH-1:0] 
       //      wb_m_responder_struct.xyz = TGD_I_i;  //    [WB_DATA_WIDTH-1:0] 
       //      wb_m_responder_struct.xyz = err_i;  //     
       //    Initiator inout signals
       //    How to assign a signal from an initiator struct member named xyz.   
       //    All available initiator output and inout signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       //    Initiator output signals
       //      dout_o <= wb_m_initiator_struct.xyz;  //    [WB_DATA_WIDTH-1:0] 
       //      TGD_O_o <= wb_m_initiator_struct.xyz;  //    [WB_DATA_WIDTH-1:0] 
       //      ack_o <= wb_m_initiator_struct.xyz;  //     
       //      adr_o <= wb_m_initiator_struct.xyz;  //    [WB_ADDR_WIDTH-1:0] 
       //      cyc_o <= wb_m_initiator_struct.xyz;  //     
       //      we_o <= wb_m_initiator_struct.xyz;  //     
       //      stb_o <= wb_m_initiator_struct.xyz;  //     
       //      sel_o <= wb_m_initiator_struct.xyz;  //    [WB_DATA_WIDTH/8-1:0] 
       //    Initiator inout signals
    // Initiate a transfer using the data received.
    @(posedge clock_i);
    @(posedge clock_i);
    // Wait for the responder to complete the transfer then place the responder data into 
    // wb_m_responder_struct.
    @(posedge clock_i);
    @(posedge clock_i);
    responder_struct = wb_m_responder_struct;
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
       output wb_m_initiator_s wb_m_initiator_struct, 
       // This argument passes transaction variables used by a responder
       // to complete a protocol transfer.  The values come from a sequence item.       
       input wb_m_responder_s wb_m_responder_struct 
       );// pragma tbx xtf   
  // Variables within the wb_m_initiator_struct:
  //   bit [WB_DATA_WIDTH-1:0] data ;
  //   bit [(WB_DATA_WIDTH/8)-1:0] byte_select ;
  //   bit WrENB ;
  //   bit selslv ;
  // Variables within the wb_m_responder_struct:
  //   bit [WB_DATA_WIDTH-1:0] data ;
  //   bit [(WB_DATA_WIDTH/8)-1:0] byte_select ;
  //   bit WrENB ;
  //   bit selslv ;
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge clock_i);
       //    
       //    How to assign a responder struct member, named xyz, from a signal.   
       //    All available responder input and inout signals listed.
       //    Responder input signals
       //      wb_m_responder_struct.xyz = dout_i;  //    [WB_DATA_WIDTH-1:0] 
       //      wb_m_responder_struct.xyz = TGD_O_i;  //    [WB_DATA_WIDTH-1:0] 
       //      wb_m_responder_struct.xyz = ack_i;  //     
       //      wb_m_responder_struct.xyz = adr_i;  //    [WB_ADDR_WIDTH-1:0] 
       //      wb_m_responder_struct.xyz = cyc_i;  //     
       //      wb_m_responder_struct.xyz = we_i;  //     
       //      wb_m_responder_struct.xyz = stb_i;  //     
       //      wb_m_responder_struct.xyz = sel_i;  //    [WB_DATA_WIDTH/8-1:0] 
       //    Responder inout signals
       //    How to assign a signal, named xyz, from an initiator struct member.   
       //    All available responder output and inout signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       //    Responder output signals
       //      din_o <= wb_m_initiator_struct.xyz;  //    [WB_DATA_WIDTH-1:0] 
       //      TGD_I_o <= wb_m_initiator_struct.xyz;  //    [WB_DATA_WIDTH-1:0] 
       //      err_o <= wb_m_initiator_struct.xyz;  //     
       //    Responder inout signals
    
  @(posedge clock_i);
  if (!first_transfer) begin
    // Perform transfer response here.   
    // Reply using data recieved in the wb_m_responder_struct.
    @(posedge clock_i);
    // Reply using data recieved in the transaction handle.
    @(posedge clock_i);
  end
    // Wait for next transfer then gather info from intiator about the transfer.
    // Place the data into the wb_m_initiator_struct.
    @(posedge clock_i);
    @(posedge clock_i);
    first_transfer = 0;
  endtask
// pragma uvmf custom respond_and_wait_for_next_transfer end

 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

