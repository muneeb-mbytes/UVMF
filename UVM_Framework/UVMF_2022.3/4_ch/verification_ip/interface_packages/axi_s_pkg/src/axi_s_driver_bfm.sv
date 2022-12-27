`ifndef AXI_S_DRIVER_BFM
`define AXI_S_DRIVER_BFM
//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
//    This interface performs the axi_s signal driving.  It is
//     accessed by the uvm axi_s driver through a virtual interface
//     handle in the axi_s configuration.  It drives the singals passed
//     in through the port connection named bus of type axi_s_if.
//
//     Input signals from the axi_s_if are assigned to an internal input
//     signal with a _i suffix.  The _i signal should be used for sampling.
//
//     The input signal connections are as follows:
//       bus.signal -> signal_i 
//
//     This bfm drives signals with a _o suffix.  These signals
//     are driven onto signals within axi_s_if based on INITIATOR/RESPONDER and/or
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
import axi_s_pkg_hdl::*;
`include "src/axi_s_macros.svh"

interface axi_s_driver_bfm #(
  int AW_WIDTH = 32,
  int LEN = 8,
  int DATA_WIDTH = 32,
  int X = 16
  )
  (axi_s_if bus);
  // The following pragma and additional ones in-lined further below are for running this BFM on Veloce
  // pragma attribute axi_s_driver_bfm partition_interface_xif

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
      $psprintf("The BFM at '%m' has the following parameters: AW_WIDTH=%x LEN=%x DATA_WIDTH=%x X=%x ", AW_WIDTH,LEN,DATA_WIDTH,X),
      UVM_DEBUG)
end
`endif

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase

  logic axi_clk_i;
  logic rst_i;

  // Signal list (all signals are capable of being inputs and outputs for the sake
  // of supporting both INITIATOR and RESPONDER mode operation. Expectation is that 
  // directionality in the config file was from the point-of-view of the INITIATOR

  // INITIATOR mode input signals
  tri  awvalid_i;
  reg  awvalid_o = 'bz;
  tri [AW_WIDTH-1:0] awaddr_i;
  reg [AW_WIDTH-1:0] awaddr_o = 'bz;
  tri [2:0] awsize_i;
  reg [2:0] awsize_o = 'bz;
  tri [1:0] awburst_i;
  reg [1:0] awburst_o = 'bz;
  tri [3:0] awcache_i;
  reg [3:0] awcache_o = 'bz;
  tri [2:0] awprot_i;
  reg [2:0] awprot_o = 'bz;
  tri [X-1:0] awid_i;
  reg [X-1:0] awid_o = 'bz;
  tri [LEN-1:0] awlen_i;
  reg [LEN-1:0] awlen_o = 'bz;
  tri  awlock_i;
  reg  awlock_o = 'bz;
  tri [3:0] awqos_i;
  reg [3:0] awqos_o = 'bz;
  tri [3:0] awregion_i;
  reg [3:0] awregion_o = 'bz;
  tri [X-1:0] awuser_i;
  reg [X-1:0] awuser_o = 'bz;
  tri  wvalid_i;
  reg  wvalid_o = 'bz;
  tri  wlast_i;
  reg  wlast_o = 'bz;
  tri [DATA_WIDTH-1:0] wdata_i;
  reg [DATA_WIDTH-1:0] wdata_o = 'bz;
  tri [DATA_WIDTH/8-1:0] wstrb_i;
  reg [DATA_WIDTH/8-1:0] wstrb_o = 'bz;
  tri [X-1:0] wid_i;
  reg [X-1:0] wid_o = 'bz;
  tri [X-1:0] wuser_i;
  reg [X-1:0] wuser_o = 'bz;
  tri [1:0] bresp_i;
  reg [1:0] bresp_o = 'bz;
  tri  arvalid_i;
  reg  arvalid_o = 'bz;
  tri [AW_WIDTH-1:0] araddr_i;
  reg [AW_WIDTH-1:0] araddr_o = 'bz;
  tri [2:0] arsize_i;
  reg [2:0] arsize_o = 'bz;
  tri [1:0] arburst_i;
  reg [1:0] arburst_o = 'bz;
  tri [3:0] arcache_i;
  reg [3:0] arcache_o = 'bz;
  tri [2:0] arprot_i;
  reg [2:0] arprot_o = 'bz;
  tri [X-1:0] arid_i;
  reg [X-1:0] arid_o = 'bz;
  tri [LEN-1:0] arlen_i;
  reg [LEN-1:0] arlen_o = 'bz;
  tri  arlock_i;
  reg  arlock_o = 'bz;
  tri [3:0] arqos_i;
  reg [3:0] arqos_o = 'bz;
  tri [3:0] aregion_i;
  reg [3:0] aregion_o = 'bz;
  tri [X-1:0] aruser_i;
  reg [X-1:0] aruser_o = 'bz;
  tri  rready_i;
  reg  rready_o = 'bz;

  // INITIATOR mode output signals
  tri  awready_i;
  reg  awready_o = 'bz;
  tri  wready_i;
  reg  wready_o = 'bz;
  tri  bwvalid_i;
  reg  bwvalid_o = 'bz;
  tri  bwready_i;
  reg  bwready_o = 'bz;
  tri [X-1:0] bid_i;
  reg [X-1:0] bid_o = 'bz;
  tri [X-1:0] buser_i;
  reg [X-1:0] buser_o = 'bz;
  tri  aready_i;
  reg  aready_o = 'bz;
  tri  rvalid_i;
  reg  rvalid_o = 'bz;
  tri  rlast_i;
  reg  rlast_o = 'bz;
  tri [DATA_WIDTH-1:0] rdata_i;
  reg [DATA_WIDTH-1:0] rdata_o = 'bz;
  tri [X-1:0] rid_i;
  reg [X-1:0] rid_o = 'bz;
  tri [X-1:0] ruser_i;
  reg [X-1:0] ruser_o = 'bz;
  tri [1:0] rresp_i;
  reg [1:0] rresp_o = 'bz;

  // Bi-directional signals
  

  assign axi_clk_i = bus.axi_clk;
  assign rst_i = bus.rst;

  // These are signals marked as 'input' by the config file, but the signals will be
  // driven by this BFM if put into RESPONDER mode (flipping all signal directions around)
  assign awvalid_i = bus.awvalid;
  assign bus.awvalid = (initiator_responder == RESPONDER) ? awvalid_o : 'bz;
  assign awaddr_i = bus.awaddr;
  assign bus.awaddr = (initiator_responder == RESPONDER) ? awaddr_o : 'bz;
  assign awsize_i = bus.awsize;
  assign bus.awsize = (initiator_responder == RESPONDER) ? awsize_o : 'bz;
  assign awburst_i = bus.awburst;
  assign bus.awburst = (initiator_responder == RESPONDER) ? awburst_o : 'bz;
  assign awcache_i = bus.awcache;
  assign bus.awcache = (initiator_responder == RESPONDER) ? awcache_o : 'bz;
  assign awprot_i = bus.awprot;
  assign bus.awprot = (initiator_responder == RESPONDER) ? awprot_o : 'bz;
  assign awid_i = bus.awid;
  assign bus.awid = (initiator_responder == RESPONDER) ? awid_o : 'bz;
  assign awlen_i = bus.awlen;
  assign bus.awlen = (initiator_responder == RESPONDER) ? awlen_o : 'bz;
  assign awlock_i = bus.awlock;
  assign bus.awlock = (initiator_responder == RESPONDER) ? awlock_o : 'bz;
  assign awqos_i = bus.awqos;
  assign bus.awqos = (initiator_responder == RESPONDER) ? awqos_o : 'bz;
  assign awregion_i = bus.awregion;
  assign bus.awregion = (initiator_responder == RESPONDER) ? awregion_o : 'bz;
  assign awuser_i = bus.awuser;
  assign bus.awuser = (initiator_responder == RESPONDER) ? awuser_o : 'bz;
  assign wvalid_i = bus.wvalid;
  assign bus.wvalid = (initiator_responder == RESPONDER) ? wvalid_o : 'bz;
  assign wlast_i = bus.wlast;
  assign bus.wlast = (initiator_responder == RESPONDER) ? wlast_o : 'bz;
  assign wdata_i = bus.wdata;
  assign bus.wdata = (initiator_responder == RESPONDER) ? wdata_o : 'bz;
  assign wstrb_i = bus.wstrb;
  assign bus.wstrb = (initiator_responder == RESPONDER) ? wstrb_o : 'bz;
  assign wid_i = bus.wid;
  assign bus.wid = (initiator_responder == RESPONDER) ? wid_o : 'bz;
  assign wuser_i = bus.wuser;
  assign bus.wuser = (initiator_responder == RESPONDER) ? wuser_o : 'bz;
  assign bresp_i = bus.bresp;
  assign bus.bresp = (initiator_responder == RESPONDER) ? bresp_o : 'bz;
  assign arvalid_i = bus.arvalid;
  assign bus.arvalid = (initiator_responder == RESPONDER) ? arvalid_o : 'bz;
  assign araddr_i = bus.araddr;
  assign bus.araddr = (initiator_responder == RESPONDER) ? araddr_o : 'bz;
  assign arsize_i = bus.arsize;
  assign bus.arsize = (initiator_responder == RESPONDER) ? arsize_o : 'bz;
  assign arburst_i = bus.arburst;
  assign bus.arburst = (initiator_responder == RESPONDER) ? arburst_o : 'bz;
  assign arcache_i = bus.arcache;
  assign bus.arcache = (initiator_responder == RESPONDER) ? arcache_o : 'bz;
  assign arprot_i = bus.arprot;
  assign bus.arprot = (initiator_responder == RESPONDER) ? arprot_o : 'bz;
  assign arid_i = bus.arid;
  assign bus.arid = (initiator_responder == RESPONDER) ? arid_o : 'bz;
  assign arlen_i = bus.arlen;
  assign bus.arlen = (initiator_responder == RESPONDER) ? arlen_o : 'bz;
  assign arlock_i = bus.arlock;
  assign bus.arlock = (initiator_responder == RESPONDER) ? arlock_o : 'bz;
  assign arqos_i = bus.arqos;
  assign bus.arqos = (initiator_responder == RESPONDER) ? arqos_o : 'bz;
  assign aregion_i = bus.aregion;
  assign bus.aregion = (initiator_responder == RESPONDER) ? aregion_o : 'bz;
  assign aruser_i = bus.aruser;
  assign bus.aruser = (initiator_responder == RESPONDER) ? aruser_o : 'bz;
  assign rready_i = bus.rready;
  assign bus.rready = (initiator_responder == RESPONDER) ? rready_o : 'bz;


  // These are signals marked as 'output' by the config file, but the outputs will
  // not be driven by this BFM unless placed in INITIATOR mode.
  assign bus.awready = (initiator_responder == INITIATOR) ? awready_o : 'bz;
  assign awready_i = bus.awready;
  assign bus.wready = (initiator_responder == INITIATOR) ? wready_o : 'bz;
  assign wready_i = bus.wready;
  assign bus.bwvalid = (initiator_responder == INITIATOR) ? bwvalid_o : 'bz;
  assign bwvalid_i = bus.bwvalid;
  assign bus.bwready = (initiator_responder == INITIATOR) ? bwready_o : 'bz;
  assign bwready_i = bus.bwready;
  assign bus.bid = (initiator_responder == INITIATOR) ? bid_o : 'bz;
  assign bid_i = bus.bid;
  assign bus.buser = (initiator_responder == INITIATOR) ? buser_o : 'bz;
  assign buser_i = bus.buser;
  assign bus.aready = (initiator_responder == INITIATOR) ? aready_o : 'bz;
  assign aready_i = bus.aready;
  assign bus.rvalid = (initiator_responder == INITIATOR) ? rvalid_o : 'bz;
  assign rvalid_i = bus.rvalid;
  assign bus.rlast = (initiator_responder == INITIATOR) ? rlast_o : 'bz;
  assign rlast_i = bus.rlast;
  assign bus.rdata = (initiator_responder == INITIATOR) ? rdata_o : 'bz;
  assign rdata_i = bus.rdata;
  assign bus.rid = (initiator_responder == INITIATOR) ? rid_o : 'bz;
  assign rid_i = bus.rid;
  assign bus.ruser = (initiator_responder == INITIATOR) ? ruser_o : 'bz;
  assign ruser_i = bus.ruser;
  assign bus.rresp = (initiator_responder == INITIATOR) ? rresp_o : 'bz;
  assign rresp_i = bus.rresp;

  // Proxy handle to UVM driver
  axi_s_pkg::axi_s_driver #(
    .AW_WIDTH(AW_WIDTH),
    .LEN(LEN),
    .DATA_WIDTH(DATA_WIDTH),
    .X(X)
    )  proxy;
  // pragma tbx oneway proxy.my_function_name_in_uvm_driver                 

  // ****************************************************************************
  // **************************************************************************** 
  // Macros that define structs located in axi_s_macros.svh
  // ****************************************************************************
  // Struct for passing configuration data from axi_s_driver to this BFM
  // ****************************************************************************
  `axi_s_CONFIGURATION_STRUCT
  // ****************************************************************************
  // Structs for INITIATOR and RESPONDER data flow
  //*******************************************************************
  // Initiator macro used by axi_s_driver and axi_s_driver_bfm
  // to communicate initiator driven data to axi_s_driver_bfm.           
  `axi_s_INITIATOR_STRUCT
    axi_s_initiator_s initiator_struct;
  // Responder macro used by axi_s_driver and axi_s_driver_bfm
  // to communicate Responder driven data to axi_s_driver_bfm.
  `axi_s_RESPONDER_STRUCT
    axi_s_responder_s responder_struct;

  // ****************************************************************************
// pragma uvmf custom reset_condition_and_response begin
  // Always block used to return signals to reset value upon assertion of reset
  always @( negedge rst_i )
     begin
       // RESPONDER mode output signals
       awvalid_o <= 'bz;
       awaddr_o <= 'bz;
       awsize_o <= 'bz;
       awburst_o <= 'bz;
       awcache_o <= 'bz;
       awprot_o <= 'bz;
       awid_o <= 'bz;
       awlen_o <= 'bz;
       awlock_o <= 'bz;
       awqos_o <= 'bz;
       awregion_o <= 'bz;
       awuser_o <= 'bz;
       wvalid_o <= 'bz;
       wlast_o <= 'bz;
       wdata_o <= 'bz;
       wstrb_o <= 'bz;
       wid_o <= 'bz;
       wuser_o <= 'bz;
       bresp_o <= 'bz;
       arvalid_o <= 'bz;
       araddr_o <= 'bz;
       arsize_o <= 'bz;
       arburst_o <= 'bz;
       arcache_o <= 'bz;
       arprot_o <= 'bz;
       arid_o <= 'bz;
       arlen_o <= 'bz;
       arlock_o <= 'bz;
       arqos_o <= 'bz;
       aregion_o <= 'bz;
       aruser_o <= 'bz;
       rready_o <= 'bz;
       // INITIATOR mode output signals
       awready_o <= 'bz;
       wready_o <= 'bz;
       bwvalid_o <= 'bz;
       bwready_o <= 'bz;
       bid_o <= 'bz;
       buser_o <= 'bz;
       aready_o <= 'bz;
       rvalid_o <= 'bz;
       rlast_o <= 'bz;
       rdata_o <= 'bz;
       rid_o <= 'bz;
       ruser_o <= 'bz;
       rresp_o <= 'bz;
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

  function void configure(axi_s_configuration_s axi_s_configuration_arg); // pragma tbx xtf  
    initiator_responder = axi_s_configuration_arg.initiator_responder;
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
       input axi_s_initiator_s axi_s_initiator_struct, 
       // This argument is used to send data received from the responder
       // back to the sequence item.  The sequence item is returned to the sequence.
       output axi_s_responder_s axi_s_responder_struct 
       );// pragma tbx xtf  
       // 
       // Members within the axi_s_initiator_struct:
       //   bit awvalid ;
       //   bit awready ;
       //   bit [AW_WIDTH-1:0] awaddr ;
       //   bit awsize ;
       //   bit awburst ;
       //   bit awcache ;
       //   bit awprot ;
       //   bit [X-1:0] awid ;
       //   bit [LEN-1:0] awlen ;
       //   bit awlock ;
       //   bit awqos ;
       //   bit awregion ;
       //   bit [X-1:0] awuser ;
       //   bit wvalid ;
       //   bit wready ;
       //   bit wlast ;
       //   bit [DATA_WIDTH-1:0] wdata ;
       //   bit [DATA_WIDTH/8-1:0] wstrb ;
       //   bit [X-1:0] wid ;
       //   bit [X-1:0] wuser ;
       //   bit bwvalid ;
       //   bit bwready ;
       //   bit bresp ;
       //   bit [X-1:0] bid ;
       //   bit [X-1:0] buser ;
       //   bit arvalid ;
       //   bit aready ;
       //   bit [AW_WIDTH-1:0] araddr ;
       //   bit arsize ;
       //   bit arburst ;
       //   bit arcache ;
       //   bit arprot ;
       //   bit [X-1:0] arid ;
       //   bit [LEN-1:0] arlen ;
       //   bit arlock ;
       //   bit arqos ;
       //   bit aregion ;
       //   bit [X-1:0] aruser ;
       //   bit rvalid ;
       //   bit rready ;
       //   bit rlast ;
       //   bit [DATA_WIDTH-1:0] rdata ;
       //   bit [X-1:0] rid ;
       //   bit [X-1:0] ruser ;
       //   bit rresp ;
       // Members within the axi_s_responder_struct:
       //   bit awvalid ;
       //   bit awready ;
       //   bit [AW_WIDTH-1:0] awaddr ;
       //   bit awsize ;
       //   bit awburst ;
       //   bit awcache ;
       //   bit awprot ;
       //   bit [X-1:0] awid ;
       //   bit [LEN-1:0] awlen ;
       //   bit awlock ;
       //   bit awqos ;
       //   bit awregion ;
       //   bit [X-1:0] awuser ;
       //   bit wvalid ;
       //   bit wready ;
       //   bit wlast ;
       //   bit [DATA_WIDTH-1:0] wdata ;
       //   bit [DATA_WIDTH/8-1:0] wstrb ;
       //   bit [X-1:0] wid ;
       //   bit [X-1:0] wuser ;
       //   bit bwvalid ;
       //   bit bwready ;
       //   bit bresp ;
       //   bit [X-1:0] bid ;
       //   bit [X-1:0] buser ;
       //   bit arvalid ;
       //   bit aready ;
       //   bit [AW_WIDTH-1:0] araddr ;
       //   bit arsize ;
       //   bit arburst ;
       //   bit arcache ;
       //   bit arprot ;
       //   bit [X-1:0] arid ;
       //   bit [LEN-1:0] arlen ;
       //   bit arlock ;
       //   bit arqos ;
       //   bit aregion ;
       //   bit [X-1:0] aruser ;
       //   bit rvalid ;
       //   bit rready ;
       //   bit rlast ;
       //   bit [DATA_WIDTH-1:0] rdata ;
       //   bit [X-1:0] rid ;
       //   bit [X-1:0] ruser ;
       //   bit rresp ;
       initiator_struct = axi_s_initiator_struct;
       //
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge axi_clk_i);
       //    
       //    How to assign a responder struct member, named xyz, from a signal.   
       //    All available initiator input and inout signals listed.
       //    Initiator input signals
       //      axi_s_responder_struct.xyz = awvalid_i;  //     
       //      axi_s_responder_struct.xyz = awaddr_i;  //    [AW_WIDTH-1:0] 
       //      axi_s_responder_struct.xyz = awsize_i;  //    [2:0] 
       //      axi_s_responder_struct.xyz = awburst_i;  //    [1:0] 
       //      axi_s_responder_struct.xyz = awcache_i;  //    [3:0] 
       //      axi_s_responder_struct.xyz = awprot_i;  //    [2:0] 
       //      axi_s_responder_struct.xyz = awid_i;  //    [X-1:0] 
       //      axi_s_responder_struct.xyz = awlen_i;  //    [LEN-1:0] 
       //      axi_s_responder_struct.xyz = awlock_i;  //     
       //      axi_s_responder_struct.xyz = awqos_i;  //    [3:0] 
       //      axi_s_responder_struct.xyz = awregion_i;  //    [3:0] 
       //      axi_s_responder_struct.xyz = awuser_i;  //    [X-1:0] 
       //      axi_s_responder_struct.xyz = wvalid_i;  //     
       //      axi_s_responder_struct.xyz = wlast_i;  //     
       //      axi_s_responder_struct.xyz = wdata_i;  //    [DATA_WIDTH-1:0] 
       //      axi_s_responder_struct.xyz = wstrb_i;  //    [DATA_WIDTH/8-1:0] 
       //      axi_s_responder_struct.xyz = wid_i;  //    [X-1:0] 
       //      axi_s_responder_struct.xyz = wuser_i;  //    [X-1:0] 
       //      axi_s_responder_struct.xyz = bresp_i;  //    [1:0] 
       //      axi_s_responder_struct.xyz = arvalid_i;  //     
       //      axi_s_responder_struct.xyz = araddr_i;  //    [AW_WIDTH-1:0] 
       //      axi_s_responder_struct.xyz = arsize_i;  //    [2:0] 
       //      axi_s_responder_struct.xyz = arburst_i;  //    [1:0] 
       //      axi_s_responder_struct.xyz = arcache_i;  //    [3:0] 
       //      axi_s_responder_struct.xyz = arprot_i;  //    [2:0] 
       //      axi_s_responder_struct.xyz = arid_i;  //    [X-1:0] 
       //      axi_s_responder_struct.xyz = arlen_i;  //    [LEN-1:0] 
       //      axi_s_responder_struct.xyz = arlock_i;  //     
       //      axi_s_responder_struct.xyz = arqos_i;  //    [3:0] 
       //      axi_s_responder_struct.xyz = aregion_i;  //    [3:0] 
       //      axi_s_responder_struct.xyz = aruser_i;  //    [X-1:0] 
       //      axi_s_responder_struct.xyz = rready_i;  //     
       //    Initiator inout signals
       //    How to assign a signal from an initiator struct member named xyz.   
       //    All available initiator output and inout signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       //    Initiator output signals
       //      awready_o <= axi_s_initiator_struct.xyz;  //     
       //      wready_o <= axi_s_initiator_struct.xyz;  //     
       //      bwvalid_o <= axi_s_initiator_struct.xyz;  //     
       //      bwready_o <= axi_s_initiator_struct.xyz;  //     
       //      bid_o <= axi_s_initiator_struct.xyz;  //    [X-1:0] 
       //      buser_o <= axi_s_initiator_struct.xyz;  //    [X-1:0] 
       //      aready_o <= axi_s_initiator_struct.xyz;  //     
       //      rvalid_o <= axi_s_initiator_struct.xyz;  //     
       //      rlast_o <= axi_s_initiator_struct.xyz;  //     
       //      rdata_o <= axi_s_initiator_struct.xyz;  //    [DATA_WIDTH-1:0] 
       //      rid_o <= axi_s_initiator_struct.xyz;  //    [X-1:0] 
       //      ruser_o <= axi_s_initiator_struct.xyz;  //    [X-1:0] 
       //      rresp_o <= axi_s_initiator_struct.xyz;  //    [1:0] 
       //    Initiator inout signals
    // Initiate a transfer using the data received.
    @(posedge axi_clk_i);
    @(posedge axi_clk_i);
    // Wait for the responder to complete the transfer then place the responder data into 
    // axi_s_responder_struct.
    @(posedge axi_clk_i);
    @(posedge axi_clk_i);
    responder_struct = axi_s_responder_struct;
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
       output axi_s_initiator_s axi_s_initiator_struct, 
       // This argument passes transaction variables used by a responder
       // to complete a protocol transfer.  The values come from a sequence item.       
       input axi_s_responder_s axi_s_responder_struct 
       );// pragma tbx xtf   
  // Variables within the axi_s_initiator_struct:
  //   bit awvalid ;
  //   bit awready ;
  //   bit [AW_WIDTH-1:0] awaddr ;
  //   bit awsize ;
  //   bit awburst ;
  //   bit awcache ;
  //   bit awprot ;
  //   bit [X-1:0] awid ;
  //   bit [LEN-1:0] awlen ;
  //   bit awlock ;
  //   bit awqos ;
  //   bit awregion ;
  //   bit [X-1:0] awuser ;
  //   bit wvalid ;
  //   bit wready ;
  //   bit wlast ;
  //   bit [DATA_WIDTH-1:0] wdata ;
  //   bit [DATA_WIDTH/8-1:0] wstrb ;
  //   bit [X-1:0] wid ;
  //   bit [X-1:0] wuser ;
  //   bit bwvalid ;
  //   bit bwready ;
  //   bit bresp ;
  //   bit [X-1:0] bid ;
  //   bit [X-1:0] buser ;
  //   bit arvalid ;
  //   bit aready ;
  //   bit [AW_WIDTH-1:0] araddr ;
  //   bit arsize ;
  //   bit arburst ;
  //   bit arcache ;
  //   bit arprot ;
  //   bit [X-1:0] arid ;
  //   bit [LEN-1:0] arlen ;
  //   bit arlock ;
  //   bit arqos ;
  //   bit aregion ;
  //   bit [X-1:0] aruser ;
  //   bit rvalid ;
  //   bit rready ;
  //   bit rlast ;
  //   bit [DATA_WIDTH-1:0] rdata ;
  //   bit [X-1:0] rid ;
  //   bit [X-1:0] ruser ;
  //   bit rresp ;
  // Variables within the axi_s_responder_struct:
  //   bit awvalid ;
  //   bit awready ;
  //   bit [AW_WIDTH-1:0] awaddr ;
  //   bit awsize ;
  //   bit awburst ;
  //   bit awcache ;
  //   bit awprot ;
  //   bit [X-1:0] awid ;
  //   bit [LEN-1:0] awlen ;
  //   bit awlock ;
  //   bit awqos ;
  //   bit awregion ;
  //   bit [X-1:0] awuser ;
  //   bit wvalid ;
  //   bit wready ;
  //   bit wlast ;
  //   bit [DATA_WIDTH-1:0] wdata ;
  //   bit [DATA_WIDTH/8-1:0] wstrb ;
  //   bit [X-1:0] wid ;
  //   bit [X-1:0] wuser ;
  //   bit bwvalid ;
  //   bit bwready ;
  //   bit bresp ;
  //   bit [X-1:0] bid ;
  //   bit [X-1:0] buser ;
  //   bit arvalid ;
  //   bit aready ;
  //   bit [AW_WIDTH-1:0] araddr ;
  //   bit arsize ;
  //   bit arburst ;
  //   bit arcache ;
  //   bit arprot ;
  //   bit [X-1:0] arid ;
  //   bit [LEN-1:0] arlen ;
  //   bit arlock ;
  //   bit arqos ;
  //   bit aregion ;
  //   bit [X-1:0] aruser ;
  //   bit rvalid ;
  //   bit rready ;
  //   bit rlast ;
  //   bit [DATA_WIDTH-1:0] rdata ;
  //   bit [X-1:0] rid ;
  //   bit [X-1:0] ruser ;
  //   bit rresp ;
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge axi_clk_i);
       //    
       //    How to assign a responder struct member, named xyz, from a signal.   
       //    All available responder input and inout signals listed.
       //    Responder input signals
       //      axi_s_responder_struct.xyz = awready_i;  //     
       //      axi_s_responder_struct.xyz = wready_i;  //     
       //      axi_s_responder_struct.xyz = bwvalid_i;  //     
       //      axi_s_responder_struct.xyz = bwready_i;  //     
       //      axi_s_responder_struct.xyz = bid_i;  //    [X-1:0] 
       //      axi_s_responder_struct.xyz = buser_i;  //    [X-1:0] 
       //      axi_s_responder_struct.xyz = aready_i;  //     
       //      axi_s_responder_struct.xyz = rvalid_i;  //     
       //      axi_s_responder_struct.xyz = rlast_i;  //     
       //      axi_s_responder_struct.xyz = rdata_i;  //    [DATA_WIDTH-1:0] 
       //      axi_s_responder_struct.xyz = rid_i;  //    [X-1:0] 
       //      axi_s_responder_struct.xyz = ruser_i;  //    [X-1:0] 
       //      axi_s_responder_struct.xyz = rresp_i;  //    [1:0] 
       //    Responder inout signals
       //    How to assign a signal, named xyz, from an initiator struct member.   
       //    All available responder output and inout signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       //    Responder output signals
       //      awvalid_o <= axi_s_initiator_struct.xyz;  //     
       //      awaddr_o <= axi_s_initiator_struct.xyz;  //    [AW_WIDTH-1:0] 
       //      awsize_o <= axi_s_initiator_struct.xyz;  //    [2:0] 
       //      awburst_o <= axi_s_initiator_struct.xyz;  //    [1:0] 
       //      awcache_o <= axi_s_initiator_struct.xyz;  //    [3:0] 
       //      awprot_o <= axi_s_initiator_struct.xyz;  //    [2:0] 
       //      awid_o <= axi_s_initiator_struct.xyz;  //    [X-1:0] 
       //      awlen_o <= axi_s_initiator_struct.xyz;  //    [LEN-1:0] 
       //      awlock_o <= axi_s_initiator_struct.xyz;  //     
       //      awqos_o <= axi_s_initiator_struct.xyz;  //    [3:0] 
       //      awregion_o <= axi_s_initiator_struct.xyz;  //    [3:0] 
       //      awuser_o <= axi_s_initiator_struct.xyz;  //    [X-1:0] 
       //      wvalid_o <= axi_s_initiator_struct.xyz;  //     
       //      wlast_o <= axi_s_initiator_struct.xyz;  //     
       //      wdata_o <= axi_s_initiator_struct.xyz;  //    [DATA_WIDTH-1:0] 
       //      wstrb_o <= axi_s_initiator_struct.xyz;  //    [DATA_WIDTH/8-1:0] 
       //      wid_o <= axi_s_initiator_struct.xyz;  //    [X-1:0] 
       //      wuser_o <= axi_s_initiator_struct.xyz;  //    [X-1:0] 
       //      bresp_o <= axi_s_initiator_struct.xyz;  //    [1:0] 
       //      arvalid_o <= axi_s_initiator_struct.xyz;  //     
       //      araddr_o <= axi_s_initiator_struct.xyz;  //    [AW_WIDTH-1:0] 
       //      arsize_o <= axi_s_initiator_struct.xyz;  //    [2:0] 
       //      arburst_o <= axi_s_initiator_struct.xyz;  //    [1:0] 
       //      arcache_o <= axi_s_initiator_struct.xyz;  //    [3:0] 
       //      arprot_o <= axi_s_initiator_struct.xyz;  //    [2:0] 
       //      arid_o <= axi_s_initiator_struct.xyz;  //    [X-1:0] 
       //      arlen_o <= axi_s_initiator_struct.xyz;  //    [LEN-1:0] 
       //      arlock_o <= axi_s_initiator_struct.xyz;  //     
       //      arqos_o <= axi_s_initiator_struct.xyz;  //    [3:0] 
       //      aregion_o <= axi_s_initiator_struct.xyz;  //    [3:0] 
       //      aruser_o <= axi_s_initiator_struct.xyz;  //    [X-1:0] 
       //      rready_o <= axi_s_initiator_struct.xyz;  //     
       //    Responder inout signals
    
  @(posedge axi_clk_i);
  if (!first_transfer) begin
    // Perform transfer response here.   
    // Reply using data recieved in the axi_s_responder_struct.
    @(posedge axi_clk_i);
    // Reply using data recieved in the transaction handle.
    @(posedge axi_clk_i);
  end
    // Wait for next transfer then gather info from intiator about the transfer.
    // Place the data into the axi_s_initiator_struct.
    @(posedge axi_clk_i);
    @(posedge axi_clk_i);
    first_transfer = 0;
  endtask
// pragma uvmf custom respond_and_wait_for_next_transfer end

 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end
`endif
