//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
//    This interface performs the axi_slave signal driving.  It is
//     accessed by the uvm axi_slave driver through a virtual interface
//     handle in the axi_slave configuration.  It drives the singals passed
//     in through the port connection named bus of type axi_slave_if.
//
//     Input signals from the axi_slave_if are assigned to an internal input
//     signal with a _i suffix.  The _i signal should be used for sampling.
//
//     The input signal connections are as follows:
//       bus.signal -> signal_i 
//
//     This bfm drives signals with a _o suffix.  These signals
//     are driven onto signals within axi_slave_if based on INITIATOR/RESPONDER and/or
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
import axi_slave_pkg_hdl::*;
`include "src/axi_slave_macros.svh"

interface axi_slave_driver_bfm 
  (axi_slave_if bus);
  // The following pragma and additional ones in-lined further below are for running this BFM on Veloce
  // pragma attribute axi_slave_driver_bfm partition_interface_xif

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
  tri  AWREADY_i;
  reg  AWREADY_o = 1'b0;
  tri [2:0] AWSIZE_i;
  reg [2:0] AWSIZE_o = 1'b0;
  tri [3:0] BID_i;
  reg [3:0] BID_o = 1'b0;
  tri [-1:0] BUSER_i;
  reg [-1:0] BUSER_o = 1'b0;

  // INITIATOR mode output signals
  tri  pclk_i;
  reg  pclk_o = 1'b0;
  tri  preset_n_i;
  reg  preset_n_o = 1'b0;
  tri [31:0] AWADDER_i;
  reg [31:0] AWADDER_o = 1'b0;
  tri  AWBURST_i;
  reg  AWBURST_o = 1'b0;
  tri [3:0] AWCACHE_i;
  reg [3:0] AWCACHE_o = 1'b0;
  tri [3:0] AWID_i;
  reg [3:0] AWID_o = 1'b0;
  tri [3:0] AWLENGTH_i;
  reg [3:0] AWLENGTH_o = 1'b0;
  tri [1:0] AWLOCK_i;
  reg [1:0] AWLOCK_o = 1'b0;
  tri [2:0] AWPROT_i;
  reg [2:0] AWPROT_o = 1'b0;
  tri  AWVALID_i;
  reg  AWVALID_o = 1'b0;
  tri [31:0] WDATA_i;
  reg [31:0] WDATA_o = 1'b0;
  tri [3:0] WSTRB_i;
  reg [3:0] WSTRB_o = 1'b0;
  tri [16:0] WUSER_i;
  reg [16:0] WUSER_o = 1'b0;
  tri [1:0] BRESP_i;
  reg [1:0] BRESP_o = 1'b0;
  tri [-1:0] BVALID_i;
  reg [-1:0] BVALID_o = 1'b0;
  tri [3:0] ARID_i;
  reg [3:0] ARID_o = 1'b0;
  tri [31:0] ARADDR_i;
  reg [31:0] ARADDR_o = 1'b0;
  tri [7:0] ARLEN_i;
  reg [7:0] ARLEN_o = 1'b0;
  tri [2:0] ARSIZE_i;
  reg [2:0] ARSIZE_o = 1'b0;
  tri [1:0] ARBURST_i;
  reg [1:0] ARBURST_o = 1'b0;
  tri [3:0] ARCACHE_i;
  reg [3:0] ARCACHE_o = 1'b0;
  tri [2:0] ARPROT_i;
  reg [2:0] ARPROT_o = 1'b0;
  tri [3:0] ARQOS_i;
  reg [3:0] ARQOS_o = 1'b0;
  tri [3:0] ARREGION_i;
  reg [3:0] ARREGION_o = 1'b0;
  tri [3:0] ARUSER_i;
  reg [3:0] ARUSER_o = 1'b0;
  tri  ARLOCK_i;
  reg  ARLOCK_o = 1'b0;
  tri [3:0] RID_i;
  reg [3:0] RID_o = 1'b0;
  tri [3:0] RDATA_i;
  reg [3:0] RDATA_o = 1'b0;
  tri [3:0] RRESP_i;
  reg [3:0] RRESP_o = 1'b0;
  tri [63:0] RUSER_i;
  reg [63:0] RUSER_o = 1'b0;
  tri [1:0] RLAST_i;
  reg [1:0] RLAST_o = 1'b0;
  tri  RVALID_i;
  reg  RVALID_o = 1'b0;

  // Bi-directional signals
  

  assign clock_i = bus.clock;
  assign reset_i = bus.reset;

  // These are signals marked as 'input' by the config file, but the signals will be
  // driven by this BFM if put into RESPONDER mode (flipping all signal directions around)
  assign AWREADY_i = bus.AWREADY;
  assign bus.AWREADY = (initiator_responder == RESPONDER) ? AWREADY_o : 'bz;
  assign AWSIZE_i = bus.AWSIZE;
  assign bus.AWSIZE = (initiator_responder == RESPONDER) ? AWSIZE_o : 'bz;
  assign BID_i = bus.BID;
  assign bus.BID = (initiator_responder == RESPONDER) ? BID_o : 'bz;
  assign BUSER_i = bus.BUSER;
  assign bus.BUSER = (initiator_responder == RESPONDER) ? BUSER_o : 'bz;


  // These are signals marked as 'output' by the config file, but the outputs will
  // not be driven by this BFM unless placed in INITIATOR mode.
  assign bus.pclk = (initiator_responder == INITIATOR) ? pclk_o : 'bz;
  assign pclk_i = bus.pclk;
  assign bus.preset_n = (initiator_responder == INITIATOR) ? preset_n_o : 'bz;
  assign preset_n_i = bus.preset_n;
  assign bus.AWADDER = (initiator_responder == INITIATOR) ? AWADDER_o : 'bz;
  assign AWADDER_i = bus.AWADDER;
  assign bus.AWBURST = (initiator_responder == INITIATOR) ? AWBURST_o : 'bz;
  assign AWBURST_i = bus.AWBURST;
  assign bus.AWCACHE = (initiator_responder == INITIATOR) ? AWCACHE_o : 'bz;
  assign AWCACHE_i = bus.AWCACHE;
  assign bus.AWID = (initiator_responder == INITIATOR) ? AWID_o : 'bz;
  assign AWID_i = bus.AWID;
  assign bus.AWLENGTH = (initiator_responder == INITIATOR) ? AWLENGTH_o : 'bz;
  assign AWLENGTH_i = bus.AWLENGTH;
  assign bus.AWLOCK = (initiator_responder == INITIATOR) ? AWLOCK_o : 'bz;
  assign AWLOCK_i = bus.AWLOCK;
  assign bus.AWPROT = (initiator_responder == INITIATOR) ? AWPROT_o : 'bz;
  assign AWPROT_i = bus.AWPROT;
  assign bus.AWVALID = (initiator_responder == INITIATOR) ? AWVALID_o : 'bz;
  assign AWVALID_i = bus.AWVALID;
  assign bus.WDATA = (initiator_responder == INITIATOR) ? WDATA_o : 'bz;
  assign WDATA_i = bus.WDATA;
  assign bus.WSTRB = (initiator_responder == INITIATOR) ? WSTRB_o : 'bz;
  assign WSTRB_i = bus.WSTRB;
  assign bus.WUSER = (initiator_responder == INITIATOR) ? WUSER_o : 'bz;
  assign WUSER_i = bus.WUSER;
  assign bus.BRESP = (initiator_responder == INITIATOR) ? BRESP_o : 'bz;
  assign BRESP_i = bus.BRESP;
  assign bus.BVALID = (initiator_responder == INITIATOR) ? BVALID_o : 'bz;
  assign BVALID_i = bus.BVALID;
  assign bus.ARID = (initiator_responder == INITIATOR) ? ARID_o : 'bz;
  assign ARID_i = bus.ARID;
  assign bus.ARADDR = (initiator_responder == INITIATOR) ? ARADDR_o : 'bz;
  assign ARADDR_i = bus.ARADDR;
  assign bus.ARLEN = (initiator_responder == INITIATOR) ? ARLEN_o : 'bz;
  assign ARLEN_i = bus.ARLEN;
  assign bus.ARSIZE = (initiator_responder == INITIATOR) ? ARSIZE_o : 'bz;
  assign ARSIZE_i = bus.ARSIZE;
  assign bus.ARBURST = (initiator_responder == INITIATOR) ? ARBURST_o : 'bz;
  assign ARBURST_i = bus.ARBURST;
  assign bus.ARCACHE = (initiator_responder == INITIATOR) ? ARCACHE_o : 'bz;
  assign ARCACHE_i = bus.ARCACHE;
  assign bus.ARPROT = (initiator_responder == INITIATOR) ? ARPROT_o : 'bz;
  assign ARPROT_i = bus.ARPROT;
  assign bus.ARQOS = (initiator_responder == INITIATOR) ? ARQOS_o : 'bz;
  assign ARQOS_i = bus.ARQOS;
  assign bus.ARREGION = (initiator_responder == INITIATOR) ? ARREGION_o : 'bz;
  assign ARREGION_i = bus.ARREGION;
  assign bus.ARUSER = (initiator_responder == INITIATOR) ? ARUSER_o : 'bz;
  assign ARUSER_i = bus.ARUSER;
  assign bus.ARLOCK = (initiator_responder == INITIATOR) ? ARLOCK_o : 'bz;
  assign ARLOCK_i = bus.ARLOCK;
  assign bus.RID = (initiator_responder == INITIATOR) ? RID_o : 'bz;
  assign RID_i = bus.RID;
  assign bus.RDATA = (initiator_responder == INITIATOR) ? RDATA_o : 'bz;
  assign RDATA_i = bus.RDATA;
  assign bus.RRESP = (initiator_responder == INITIATOR) ? RRESP_o : 'bz;
  assign RRESP_i = bus.RRESP;
  assign bus.RUSER = (initiator_responder == INITIATOR) ? RUSER_o : 'bz;
  assign RUSER_i = bus.RUSER;
  assign bus.RLAST = (initiator_responder == INITIATOR) ? RLAST_o : 'bz;
  assign RLAST_i = bus.RLAST;
  assign bus.RVALID = (initiator_responder == INITIATOR) ? RVALID_o : 'bz;
  assign RVALID_i = bus.RVALID;

  // Proxy handle to UVM driver
  axi_slave_pkg::axi_slave_driver   proxy;
  // pragma tbx oneway proxy.my_function_name_in_uvm_driver                 

  // ****************************************************************************
  // **************************************************************************** 
  // Macros that define structs located in axi_slave_macros.svh
  // ****************************************************************************
  // Struct for passing configuration data from axi_slave_driver to this BFM
  // ****************************************************************************
  `axi_slave_CONFIGURATION_STRUCT
  // ****************************************************************************
  // Structs for INITIATOR and RESPONDER data flow
  //*******************************************************************
  // Initiator macro used by axi_slave_driver and axi_slave_driver_bfm
  // to communicate initiator driven data to axi_slave_driver_bfm.           
  `axi_slave_INITIATOR_STRUCT
    axi_slave_initiator_s initiator_struct;
  // Responder macro used by axi_slave_driver and axi_slave_driver_bfm
  // to communicate Responder driven data to axi_slave_driver_bfm.
  `axi_slave_RESPONDER_STRUCT
    axi_slave_responder_s responder_struct;

  // ****************************************************************************
// pragma uvmf custom reset_condition_and_response begin
  // Always block used to return signals to reset value upon assertion of reset
  always @( posedge reset_i )
     begin
       // RESPONDER mode output signals
       AWREADY_o <= 1'b0;
       AWSIZE_o <= 1'b0;
       BID_o <= 1'b0;
       BUSER_o <= 1'b0;
       // INITIATOR mode output signals
       pclk_o <= 1'b0;
       preset_n_o <= 1'b0;
       AWADDER_o <= 1'b0;
       AWBURST_o <= 1'b0;
       AWCACHE_o <= 1'b0;
       AWID_o <= 1'b0;
       AWLENGTH_o <= 1'b0;
       AWLOCK_o <= 1'b0;
       AWPROT_o <= 1'b0;
       AWVALID_o <= 1'b0;
       WDATA_o <= 1'b0;
       WSTRB_o <= 1'b0;
       WUSER_o <= 1'b0;
       BRESP_o <= 1'b0;
       BVALID_o <= 1'b0;
       ARID_o <= 1'b0;
       ARADDR_o <= 1'b0;
       ARLEN_o <= 1'b0;
       ARSIZE_o <= 1'b0;
       ARBURST_o <= 1'b0;
       ARCACHE_o <= 1'b0;
       ARPROT_o <= 1'b0;
       ARQOS_o <= 1'b0;
       ARREGION_o <= 1'b0;
       ARUSER_o <= 1'b0;
       ARLOCK_o <= 1'b0;
       RID_o <= 1'b0;
       RDATA_o <= 1'b0;
       RRESP_o <= 1'b0;
       RUSER_o <= 1'b0;
       RLAST_o <= 1'b0;
       RVALID_o <= 1'b0;
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

  function void configure(axi_slave_configuration_s axi_slave_configuration_arg); // pragma tbx xtf  
    initiator_responder = axi_slave_configuration_arg.initiator_responder;
    is_active = axi_slave_configuration_arg.is_active;
    no_of_slaves = axi_slave_configuration_arg.no_of_slaves;
    has_coverage = axi_slave_configuration_arg.has_coverage;
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
       input axi_slave_initiator_s axi_slave_initiator_struct, 
       // This argument is used to send data received from the responder
       // back to the sequence item.  The sequence item is returned to the sequence.
       output axi_slave_responder_s axi_slave_responder_struct 
       );// pragma tbx xtf  
       // 
       // Members within the axi_slave_initiator_struct:
       //   bit AWID ;
       //   bit AWADDR ;
       //   bit AWLEN ;
       //   bit AWSIZE ;
       //   bit AWBURST ;
       //   bit AWLOCK ;
       //   bit AWCACHE ;
       //   bit AWQOS ;
       //   bit AWREGION ;
       //   bit AWUSER ;
       //   bit AWPROT ;
       //   bit AWVALID ;
       //   bit AWREADY ;
       //   bit WDATA ;
       //   bit WSTRB ;
       //   bit WUSER ;
       //   bit WLAST ;
       //   bit BID ;
       //   bit BRESP ;
       //   bit BUSER ;
       //   bit BVALID ;
       //   bit ARID ;
       //   bit ARADDR ;
       //   bit ARLEN ;
       //   bit ARSIZE ;
       //   bit ARBURST ;
       //   bit ARCACHE ;
       //   bit ARPROT ;
       //   bit ARQOS ;
       //   bit ARREGION ;
       //   bit ARUSER ;
       //   bit ARLOCK ;
       //   bit RID ;
       //   bit RDATA ;
       //   bit RRESP ;
       //   bit RUSER ;
       //   bit RLAST ;
       //   bit RVALID ;
       // Members within the axi_slave_responder_struct:
       //   bit AWID ;
       //   bit AWADDR ;
       //   bit AWLEN ;
       //   bit AWSIZE ;
       //   bit AWBURST ;
       //   bit AWLOCK ;
       //   bit AWCACHE ;
       //   bit AWQOS ;
       //   bit AWREGION ;
       //   bit AWUSER ;
       //   bit AWPROT ;
       //   bit AWVALID ;
       //   bit AWREADY ;
       //   bit WDATA ;
       //   bit WSTRB ;
       //   bit WUSER ;
       //   bit WLAST ;
       //   bit BID ;
       //   bit BRESP ;
       //   bit BUSER ;
       //   bit BVALID ;
       //   bit ARID ;
       //   bit ARADDR ;
       //   bit ARLEN ;
       //   bit ARSIZE ;
       //   bit ARBURST ;
       //   bit ARCACHE ;
       //   bit ARPROT ;
       //   bit ARQOS ;
       //   bit ARREGION ;
       //   bit ARUSER ;
       //   bit ARLOCK ;
       //   bit RID ;
       //   bit RDATA ;
       //   bit RRESP ;
       //   bit RUSER ;
       //   bit RLAST ;
       //   bit RVALID ;
       initiator_struct = axi_slave_initiator_struct;
       //
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge clock_i);
       //    
       //    How to assign a responder struct member, named xyz, from a signal.   
       //    All available initiator input and inout signals listed.
       //    Initiator input signals
       //      axi_slave_responder_struct.xyz = AWREADY_i;  //     
       //      axi_slave_responder_struct.xyz = AWSIZE_i;  //    [2:0] 
       //      axi_slave_responder_struct.xyz = BID_i;  //    [3:0] 
       //      axi_slave_responder_struct.xyz = BUSER_i;  //    [-1:0] 
       //    Initiator inout signals
       //    How to assign a signal from an initiator struct member named xyz.   
       //    All available initiator output and inout signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       //    Initiator output signals
       //      pclk_o <= axi_slave_initiator_struct.xyz;  //     
       //      preset_n_o <= axi_slave_initiator_struct.xyz;  //     
       //      AWADDER_o <= axi_slave_initiator_struct.xyz;  //    [31:0] 
       //      AWBURST_o <= axi_slave_initiator_struct.xyz;  //     
       //      AWCACHE_o <= axi_slave_initiator_struct.xyz;  //    [3:0] 
       //      AWID_o <= axi_slave_initiator_struct.xyz;  //    [3:0] 
       //      AWLENGTH_o <= axi_slave_initiator_struct.xyz;  //    [3:0] 
       //      AWLOCK_o <= axi_slave_initiator_struct.xyz;  //    [1:0] 
       //      AWPROT_o <= axi_slave_initiator_struct.xyz;  //    [2:0] 
       //      AWVALID_o <= axi_slave_initiator_struct.xyz;  //     
       //      WDATA_o <= axi_slave_initiator_struct.xyz;  //    [31:0] 
       //      WSTRB_o <= axi_slave_initiator_struct.xyz;  //    [3:0] 
       //      WUSER_o <= axi_slave_initiator_struct.xyz;  //    [16:0] 
       //      BRESP_o <= axi_slave_initiator_struct.xyz;  //    [1:0] 
       //      BVALID_o <= axi_slave_initiator_struct.xyz;  //    [-1:0] 
       //      ARID_o <= axi_slave_initiator_struct.xyz;  //    [3:0] 
       //      ARADDR_o <= axi_slave_initiator_struct.xyz;  //    [31:0] 
       //      ARLEN_o <= axi_slave_initiator_struct.xyz;  //    [7:0] 
       //      ARSIZE_o <= axi_slave_initiator_struct.xyz;  //    [2:0] 
       //      ARBURST_o <= axi_slave_initiator_struct.xyz;  //    [1:0] 
       //      ARCACHE_o <= axi_slave_initiator_struct.xyz;  //    [3:0] 
       //      ARPROT_o <= axi_slave_initiator_struct.xyz;  //    [2:0] 
       //      ARQOS_o <= axi_slave_initiator_struct.xyz;  //    [3:0] 
       //      ARREGION_o <= axi_slave_initiator_struct.xyz;  //    [3:0] 
       //      ARUSER_o <= axi_slave_initiator_struct.xyz;  //    [3:0] 
       //      ARLOCK_o <= axi_slave_initiator_struct.xyz;  //     
       //      RID_o <= axi_slave_initiator_struct.xyz;  //    [3:0] 
       //      RDATA_o <= axi_slave_initiator_struct.xyz;  //    [3:0] 
       //      RRESP_o <= axi_slave_initiator_struct.xyz;  //    [3:0] 
       //      RUSER_o <= axi_slave_initiator_struct.xyz;  //    [63:0] 
       //      RLAST_o <= axi_slave_initiator_struct.xyz;  //    [1:0] 
       //      RVALID_o <= axi_slave_initiator_struct.xyz;  //     
       //    Initiator inout signals
    // Initiate a transfer using the data received.
    @(posedge clock_i);
    @(posedge clock_i);
    // Wait for the responder to complete the transfer then place the responder data into 
    // axi_slave_responder_struct.
    @(posedge clock_i);
    @(posedge clock_i);
    responder_struct = axi_slave_responder_struct;
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
       output axi_slave_initiator_s axi_slave_initiator_struct, 
       // This argument passes transaction variables used by a responder
       // to complete a protocol transfer.  The values come from a sequence item.       
       input axi_slave_responder_s axi_slave_responder_struct 
       );// pragma tbx xtf   
  // Variables within the axi_slave_initiator_struct:
  //   bit AWID ;
  //   bit AWADDR ;
  //   bit AWLEN ;
  //   bit AWSIZE ;
  //   bit AWBURST ;
  //   bit AWLOCK ;
  //   bit AWCACHE ;
  //   bit AWQOS ;
  //   bit AWREGION ;
  //   bit AWUSER ;
  //   bit AWPROT ;
  //   bit AWVALID ;
  //   bit AWREADY ;
  //   bit WDATA ;
  //   bit WSTRB ;
  //   bit WUSER ;
  //   bit WLAST ;
  //   bit BID ;
  //   bit BRESP ;
  //   bit BUSER ;
  //   bit BVALID ;
  //   bit ARID ;
  //   bit ARADDR ;
  //   bit ARLEN ;
  //   bit ARSIZE ;
  //   bit ARBURST ;
  //   bit ARCACHE ;
  //   bit ARPROT ;
  //   bit ARQOS ;
  //   bit ARREGION ;
  //   bit ARUSER ;
  //   bit ARLOCK ;
  //   bit RID ;
  //   bit RDATA ;
  //   bit RRESP ;
  //   bit RUSER ;
  //   bit RLAST ;
  //   bit RVALID ;
  // Variables within the axi_slave_responder_struct:
  //   bit AWID ;
  //   bit AWADDR ;
  //   bit AWLEN ;
  //   bit AWSIZE ;
  //   bit AWBURST ;
  //   bit AWLOCK ;
  //   bit AWCACHE ;
  //   bit AWQOS ;
  //   bit AWREGION ;
  //   bit AWUSER ;
  //   bit AWPROT ;
  //   bit AWVALID ;
  //   bit AWREADY ;
  //   bit WDATA ;
  //   bit WSTRB ;
  //   bit WUSER ;
  //   bit WLAST ;
  //   bit BID ;
  //   bit BRESP ;
  //   bit BUSER ;
  //   bit BVALID ;
  //   bit ARID ;
  //   bit ARADDR ;
  //   bit ARLEN ;
  //   bit ARSIZE ;
  //   bit ARBURST ;
  //   bit ARCACHE ;
  //   bit ARPROT ;
  //   bit ARQOS ;
  //   bit ARREGION ;
  //   bit ARUSER ;
  //   bit ARLOCK ;
  //   bit RID ;
  //   bit RDATA ;
  //   bit RRESP ;
  //   bit RUSER ;
  //   bit RLAST ;
  //   bit RVALID ;
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge clock_i);
       //    
       //    How to assign a responder struct member, named xyz, from a signal.   
       //    All available responder input and inout signals listed.
       //    Responder input signals
       //      axi_slave_responder_struct.xyz = pclk_i;  //     
       //      axi_slave_responder_struct.xyz = preset_n_i;  //     
       //      axi_slave_responder_struct.xyz = AWADDER_i;  //    [31:0] 
       //      axi_slave_responder_struct.xyz = AWBURST_i;  //     
       //      axi_slave_responder_struct.xyz = AWCACHE_i;  //    [3:0] 
       //      axi_slave_responder_struct.xyz = AWID_i;  //    [3:0] 
       //      axi_slave_responder_struct.xyz = AWLENGTH_i;  //    [3:0] 
       //      axi_slave_responder_struct.xyz = AWLOCK_i;  //    [1:0] 
       //      axi_slave_responder_struct.xyz = AWPROT_i;  //    [2:0] 
       //      axi_slave_responder_struct.xyz = AWVALID_i;  //     
       //      axi_slave_responder_struct.xyz = WDATA_i;  //    [31:0] 
       //      axi_slave_responder_struct.xyz = WSTRB_i;  //    [3:0] 
       //      axi_slave_responder_struct.xyz = WUSER_i;  //    [16:0] 
       //      axi_slave_responder_struct.xyz = BRESP_i;  //    [1:0] 
       //      axi_slave_responder_struct.xyz = BVALID_i;  //    [-1:0] 
       //      axi_slave_responder_struct.xyz = ARID_i;  //    [3:0] 
       //      axi_slave_responder_struct.xyz = ARADDR_i;  //    [31:0] 
       //      axi_slave_responder_struct.xyz = ARLEN_i;  //    [7:0] 
       //      axi_slave_responder_struct.xyz = ARSIZE_i;  //    [2:0] 
       //      axi_slave_responder_struct.xyz = ARBURST_i;  //    [1:0] 
       //      axi_slave_responder_struct.xyz = ARCACHE_i;  //    [3:0] 
       //      axi_slave_responder_struct.xyz = ARPROT_i;  //    [2:0] 
       //      axi_slave_responder_struct.xyz = ARQOS_i;  //    [3:0] 
       //      axi_slave_responder_struct.xyz = ARREGION_i;  //    [3:0] 
       //      axi_slave_responder_struct.xyz = ARUSER_i;  //    [3:0] 
       //      axi_slave_responder_struct.xyz = ARLOCK_i;  //     
       //      axi_slave_responder_struct.xyz = RID_i;  //    [3:0] 
       //      axi_slave_responder_struct.xyz = RDATA_i;  //    [3:0] 
       //      axi_slave_responder_struct.xyz = RRESP_i;  //    [3:0] 
       //      axi_slave_responder_struct.xyz = RUSER_i;  //    [63:0] 
       //      axi_slave_responder_struct.xyz = RLAST_i;  //    [1:0] 
       //      axi_slave_responder_struct.xyz = RVALID_i;  //     
       //    Responder inout signals
       //    How to assign a signal, named xyz, from an initiator struct member.   
       //    All available responder output and inout signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       //    Responder output signals
       //      AWREADY_o <= axi_slave_initiator_struct.xyz;  //     
       //      AWSIZE_o <= axi_slave_initiator_struct.xyz;  //    [2:0] 
       //      BID_o <= axi_slave_initiator_struct.xyz;  //    [3:0] 
       //      BUSER_o <= axi_slave_initiator_struct.xyz;  //    [-1:0] 
       //    Responder inout signals
    
  @(posedge clock_i);
  if (!first_transfer) begin
    // Perform transfer response here.   
    // Reply using data recieved in the axi_slave_responder_struct.
    @(posedge clock_i);
    // Reply using data recieved in the transaction handle.
    @(posedge clock_i);
  end
    // Wait for next transfer then gather info from intiator about the transfer.
    // Place the data into the axi_slave_initiator_struct.
    @(posedge clock_i);
    @(posedge clock_i);
    first_transfer = 0;
  endtask
// pragma uvmf custom respond_and_wait_for_next_transfer end

 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

