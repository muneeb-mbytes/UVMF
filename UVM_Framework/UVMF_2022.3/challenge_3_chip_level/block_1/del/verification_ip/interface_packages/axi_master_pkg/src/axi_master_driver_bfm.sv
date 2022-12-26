//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
//    This interface performs the axi_master signal driving.  It is
//     accessed by the uvm axi_master driver through a virtual interface
//     handle in the axi_master configuration.  It drives the singals passed
//     in through the port connection named bus of type axi_master_if.
//
//     Input signals from the axi_master_if are assigned to an internal input
//     signal with a _i suffix.  The _i signal should be used for sampling.
//
//     The input signal connections are as follows:
//       bus.signal -> signal_i 
//
//     This bfm drives signals with a _o suffix.  These signals
//     are driven onto signals within axi_master_if based on INITIATOR/RESPONDER and/or
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
import axi_master_pkg_hdl::*;
`include "src/axi_master_macros.svh"

interface axi_master_driver_bfm #(
  int id_width = 4,
  int len_width = 4,
  int size_width = 3,
  int addr_width = 32,
  int burst_width = 2,
  int data_width = 32,
  int strb_width = 4,
  int resp_width = 2
  )
  (axi_master_if bus);
  // The following pragma and additional ones in-lined further below are for running this BFM on Veloce
  // pragma attribute axi_master_driver_bfm partition_interface_xif

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
      $psprintf("The BFM at '%m' has the following parameters: id_width=%x len_width=%x size_width=%x addr_width=%x burst_width=%x data_width=%x strb_width=%x resp_width=%x ", id_width,len_width,size_width,addr_width,burst_width,data_width,strb_width,resp_width),
      UVM_DEBUG)
end
`endif

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase

  tri clock_i;
  tri reset_i;

  // Signal list (all signals are capable of being inputs and outputs for the sake
  // of supporting both INITIATOR and RESPONDER mode operation. Expectation is that 
  // directionality in the config file was from the point-of-view of the INITIATOR

  // INITIATOR mode input signals
  tri  wready_i;
  reg  wready_o = 'bz;
  tri  arready_i;
  reg  arready_o = 'bz;

  // INITIATOR mode output signals
  tri  awvalid_i;
  reg  awvalid_o = 'bz;
  tri [id_width-1:0] awid_i;
  reg [id_width-1:0] awid_o = 'bz;
  tri [len_width-1:0] awlen_i;
  reg [len_width-1:0] awlen_o = 'bz;
  tri [size_width-1:0] awsize_i;
  reg [size_width-1:0] awsize_o = 'bz;
  tri [addr_width-1:0] awaddr_i;
  reg [addr_width-1:0] awaddr_o = 'bz;
  tri [burst_width-1:0] awburst_i;
  reg [burst_width-1:0] awburst_o = 'bz;
  tri  wvalid_i;
  reg  wvalid_o = 'bz;
  tri [id_width-1:0] wid_i;
  reg [id_width-1:0] wid_o = 'bz;
  tri [size_width-1:0] wsize_i;
  reg [size_width-1:0] wsize_o = 'bz;
  tri [data_width-1:0] wdata_i;
  reg [data_width-1:0] wdata_o = 'bz;
  tri [strb_width-1:0] wstrb_i;
  reg [strb_width-1:0] wstrb_o = 'bz;
  tri  wlast_i;
  reg  wlast_o = 'bz;
  tri  arvalid_i;
  reg  arvalid_o = 'bz;
  tri [id_width-1:0] arid_i;
  reg [id_width-1:0] arid_o = 'bz;
  tri [len_width-1:0] arlen_i;
  reg [len_width-1:0] arlen_o = 'bz;
  tri [size_width-1:0] arsize_i;
  reg [size_width-1:0] arsize_o = 'bz;
  tri [burst_width-1:0] arburst_i;
  reg [burst_width-1:0] arburst_o = 'bz;

  // Bi-directional signals
  

  assign clock_i = bus.clock;
  assign reset_i = bus.reset;

  // These are signals marked as 'input' by the config file, but the signals will be
  // driven by this BFM if put into RESPONDER mode (flipping all signal directions around)
  assign wready_i = bus.wready;
  assign bus.wready = (initiator_responder == RESPONDER) ? wready_o : 'bz;
  assign arready_i = bus.arready;
  assign bus.arready = (initiator_responder == RESPONDER) ? arready_o : 'bz;


  // These are signals marked as 'output' by the config file, but the outputs will
  // not be driven by this BFM unless placed in INITIATOR mode.
  assign bus.awvalid = (initiator_responder == INITIATOR) ? awvalid_o : 'bz;
  assign awvalid_i = bus.awvalid;
  assign bus.awid = (initiator_responder == INITIATOR) ? awid_o : 'bz;
  assign awid_i = bus.awid;
  assign bus.awlen = (initiator_responder == INITIATOR) ? awlen_o : 'bz;
  assign awlen_i = bus.awlen;
  assign bus.awsize = (initiator_responder == INITIATOR) ? awsize_o : 'bz;
  assign awsize_i = bus.awsize;
  assign bus.awaddr = (initiator_responder == INITIATOR) ? awaddr_o : 'bz;
  assign awaddr_i = bus.awaddr;
  assign bus.awburst = (initiator_responder == INITIATOR) ? awburst_o : 'bz;
  assign awburst_i = bus.awburst;
  assign bus.wvalid = (initiator_responder == INITIATOR) ? wvalid_o : 'bz;
  assign wvalid_i = bus.wvalid;
  assign bus.wid = (initiator_responder == INITIATOR) ? wid_o : 'bz;
  assign wid_i = bus.wid;
  assign bus.wsize = (initiator_responder == INITIATOR) ? wsize_o : 'bz;
  assign wsize_i = bus.wsize;
  assign bus.wdata = (initiator_responder == INITIATOR) ? wdata_o : 'bz;
  assign wdata_i = bus.wdata;
  assign bus.wstrb = (initiator_responder == INITIATOR) ? wstrb_o : 'bz;
  assign wstrb_i = bus.wstrb;
  assign bus.wlast = (initiator_responder == INITIATOR) ? wlast_o : 'bz;
  assign wlast_i = bus.wlast;
  assign bus.arvalid = (initiator_responder == INITIATOR) ? arvalid_o : 'bz;
  assign arvalid_i = bus.arvalid;
  assign bus.arid = (initiator_responder == INITIATOR) ? arid_o : 'bz;
  assign arid_i = bus.arid;
  assign bus.arlen = (initiator_responder == INITIATOR) ? arlen_o : 'bz;
  assign arlen_i = bus.arlen;
  assign bus.arsize = (initiator_responder == INITIATOR) ? arsize_o : 'bz;
  assign arsize_i = bus.arsize;
  assign bus.arburst = (initiator_responder == INITIATOR) ? arburst_o : 'bz;
  assign arburst_i = bus.arburst;

  // Proxy handle to UVM driver
  axi_master_pkg::axi_master_driver #(
    .id_width(id_width),
    .len_width(len_width),
    .size_width(size_width),
    .addr_width(addr_width),
    .burst_width(burst_width),
    .data_width(data_width),
    .strb_width(strb_width),
    .resp_width(resp_width)
    )  proxy;
  // pragma tbx oneway proxy.my_function_name_in_uvm_driver                 

  // ****************************************************************************
  // **************************************************************************** 
  // Macros that define structs located in axi_master_macros.svh
  // ****************************************************************************
  // Struct for passing configuration data from axi_master_driver to this BFM
  // ****************************************************************************
  `axi_master_CONFIGURATION_STRUCT
  // ****************************************************************************
  // Structs for INITIATOR and RESPONDER data flow
  //*******************************************************************
  // Initiator macro used by axi_master_driver and axi_master_driver_bfm
  // to communicate initiator driven data to axi_master_driver_bfm.           
  `axi_master_INITIATOR_STRUCT
    axi_master_initiator_s initiator_struct;
  // Responder macro used by axi_master_driver and axi_master_driver_bfm
  // to communicate Responder driven data to axi_master_driver_bfm.
  `axi_master_RESPONDER_STRUCT
    axi_master_responder_s responder_struct;

  // ****************************************************************************
// pragma uvmf custom reset_condition_and_response begin
  // Always block used to return signals to reset value upon assertion of reset
  always @( posedge reset_i )
     begin
       // RESPONDER mode output signals
       wready_o <= 'bz;
       arready_o <= 'bz;
       // INITIATOR mode output signals
       awvalid_o <= 'bz;
       awid_o <= 'bz;
       awlen_o <= 'bz;
       awsize_o <= 'bz;
       awaddr_o <= 'bz;
       awburst_o <= 'bz;
       wvalid_o <= 'bz;
       wid_o <= 'bz;
       wsize_o <= 'bz;
       wdata_o <= 'bz;
       wstrb_o <= 'bz;
       wlast_o <= 'bz;
       arvalid_o <= 'bz;
       arid_o <= 'bz;
       arlen_o <= 'bz;
       arsize_o <= 'bz;
       arburst_o <= 'bz;
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

  function void configure(axi_master_configuration_s axi_master_configuration_arg); // pragma tbx xtf  
    initiator_responder = axi_master_configuration_arg.initiator_responder;
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
       input axi_master_initiator_s axi_master_initiator_struct, 
       // This argument is used to send data received from the responder
       // back to the sequence item.  The sequence item is returned to the sequence.
       output axi_master_responder_s axi_master_responder_struct 
       );// pragma tbx xtf  
       // 
       // Members within the axi_master_initiator_struct:
       //   bit awvalid ;
       //   int awid ;
       //   int awlen ;
       //   int awsize ;
       //   int awaddr ;
       //   int awburst ;
       //   bit wvalid ;
       //   bit wready ;
       //   int wid ;
       //   int wsize ;
       //   int wdata ;
       //   int wstrb ;
       //   bit wlast ;
       //   bit arvalid ;
       //   bit arready ;
       //   int arid ;
       //   int arlen ;
       //   int arsize ;
       //   int arburst ;
       // Members within the axi_master_responder_struct:
       //   bit awvalid ;
       //   int awid ;
       //   int awlen ;
       //   int awsize ;
       //   int awaddr ;
       //   int awburst ;
       //   bit wvalid ;
       //   bit wready ;
       //   int wid ;
       //   int wsize ;
       //   int wdata ;
       //   int wstrb ;
       //   bit wlast ;
       //   bit arvalid ;
       //   bit arready ;
       //   int arid ;
       //   int arlen ;
       //   int arsize ;
       //   int arburst ;
       initiator_struct = axi_master_initiator_struct;
       //
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge clock_i);
       //    
       //    How to assign a responder struct member, named xyz, from a signal.   
       //    All available initiator input and inout signals listed.
       //    Initiator input signals
       //      axi_master_responder_struct.xyz = wready_i;  //     
       //      axi_master_responder_struct.xyz = arready_i;  //     
       //    Initiator inout signals
       //    How to assign a signal from an initiator struct member named xyz.   
       //    All available initiator output and inout signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       //    Initiator output signals
       //      awvalid_o <= axi_master_initiator_struct.xyz;  //     
       //      awid_o <= axi_master_initiator_struct.xyz;  //    [id_width-1:0] 
       //      awlen_o <= axi_master_initiator_struct.xyz;  //    [len_width-1:0] 
       //      awsize_o <= axi_master_initiator_struct.xyz;  //    [size_width-1:0] 
       //      awaddr_o <= axi_master_initiator_struct.xyz;  //    [addr_width-1:0] 
       //      awburst_o <= axi_master_initiator_struct.xyz;  //    [burst_width-1:0] 
       //      wvalid_o <= axi_master_initiator_struct.xyz;  //     
       //      wid_o <= axi_master_initiator_struct.xyz;  //    [id_width-1:0] 
       //      wsize_o <= axi_master_initiator_struct.xyz;  //    [size_width-1:0] 
       //      wdata_o <= axi_master_initiator_struct.xyz;  //    [data_width-1:0] 
       //      wstrb_o <= axi_master_initiator_struct.xyz;  //    [strb_width-1:0] 
       //      wlast_o <= axi_master_initiator_struct.xyz;  //     
       //      arvalid_o <= axi_master_initiator_struct.xyz;  //     
       //      arid_o <= axi_master_initiator_struct.xyz;  //    [id_width-1:0] 
       //      arlen_o <= axi_master_initiator_struct.xyz;  //    [len_width-1:0] 
       //      arsize_o <= axi_master_initiator_struct.xyz;  //    [size_width-1:0] 
       //      arburst_o <= axi_master_initiator_struct.xyz;  //    [burst_width-1:0] 
       //    Initiator inout signals
    // Initiate a transfer using the data received.
    @(posedge clock_i);
    @(posedge clock_i);
    // Wait for the responder to complete the transfer then place the responder data into 
    // axi_master_responder_struct.
    @(posedge clock_i);
    @(posedge clock_i);
    responder_struct = axi_master_responder_struct;
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
       output axi_master_initiator_s axi_master_initiator_struct, 
       // This argument passes transaction variables used by a responder
       // to complete a protocol transfer.  The values come from a sequence item.       
       input axi_master_responder_s axi_master_responder_struct 
       );// pragma tbx xtf   
  // Variables within the axi_master_initiator_struct:
  //   bit awvalid ;
  //   int awid ;
  //   int awlen ;
  //   int awsize ;
  //   int awaddr ;
  //   int awburst ;
  //   bit wvalid ;
  //   bit wready ;
  //   int wid ;
  //   int wsize ;
  //   int wdata ;
  //   int wstrb ;
  //   bit wlast ;
  //   bit arvalid ;
  //   bit arready ;
  //   int arid ;
  //   int arlen ;
  //   int arsize ;
  //   int arburst ;
  // Variables within the axi_master_responder_struct:
  //   bit awvalid ;
  //   int awid ;
  //   int awlen ;
  //   int awsize ;
  //   int awaddr ;
  //   int awburst ;
  //   bit wvalid ;
  //   bit wready ;
  //   int wid ;
  //   int wsize ;
  //   int wdata ;
  //   int wstrb ;
  //   bit wlast ;
  //   bit arvalid ;
  //   bit arready ;
  //   int arid ;
  //   int arlen ;
  //   int arsize ;
  //   int arburst ;
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge clock_i);
       //    
       //    How to assign a responder struct member, named xyz, from a signal.   
       //    All available responder input and inout signals listed.
       //    Responder input signals
       //      axi_master_responder_struct.xyz = awvalid_i;  //     
       //      axi_master_responder_struct.xyz = awid_i;  //    [id_width-1:0] 
       //      axi_master_responder_struct.xyz = awlen_i;  //    [len_width-1:0] 
       //      axi_master_responder_struct.xyz = awsize_i;  //    [size_width-1:0] 
       //      axi_master_responder_struct.xyz = awaddr_i;  //    [addr_width-1:0] 
       //      axi_master_responder_struct.xyz = awburst_i;  //    [burst_width-1:0] 
       //      axi_master_responder_struct.xyz = wvalid_i;  //     
       //      axi_master_responder_struct.xyz = wid_i;  //    [id_width-1:0] 
       //      axi_master_responder_struct.xyz = wsize_i;  //    [size_width-1:0] 
       //      axi_master_responder_struct.xyz = wdata_i;  //    [data_width-1:0] 
       //      axi_master_responder_struct.xyz = wstrb_i;  //    [strb_width-1:0] 
       //      axi_master_responder_struct.xyz = wlast_i;  //     
       //      axi_master_responder_struct.xyz = arvalid_i;  //     
       //      axi_master_responder_struct.xyz = arid_i;  //    [id_width-1:0] 
       //      axi_master_responder_struct.xyz = arlen_i;  //    [len_width-1:0] 
       //      axi_master_responder_struct.xyz = arsize_i;  //    [size_width-1:0] 
       //      axi_master_responder_struct.xyz = arburst_i;  //    [burst_width-1:0] 
       //    Responder inout signals
       //    How to assign a signal, named xyz, from an initiator struct member.   
       //    All available responder output and inout signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       //    Responder output signals
       //      wready_o <= axi_master_initiator_struct.xyz;  //     
       //      arready_o <= axi_master_initiator_struct.xyz;  //     
       //    Responder inout signals
    
  @(posedge clock_i);
  if (!first_transfer) begin
    // Perform transfer response here.   
    // Reply using data recieved in the axi_master_responder_struct.
    @(posedge clock_i);
    // Reply using data recieved in the transaction handle.
    @(posedge clock_i);
  end
    // Wait for next transfer then gather info from intiator about the transfer.
    // Place the data into the axi_master_initiator_struct.
    @(posedge clock_i);
    @(posedge clock_i);
    first_transfer = 0;
  endtask
// pragma uvmf custom respond_and_wait_for_next_transfer end

 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

