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
import axi_master_pkg::*;

interface axi_master_driver_bfm #(
  int ADDR_WIDTH = 32,
  int DATA_WIDTH = 32,
  int RESP_WIDTH = 2,
  int ID_WIDTH = 4,
  int STRB_WIDTH = 4,
  int LEN_WIDTH = 8,
  int SIZE_WIDTH = 3,
  int BURST_WIDTH = 2
  )
  (axi_master_if bus);

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
      $psprintf("The BFM at '%m' has the following parameters: ADDR_WIDTH=%x DATA_WIDTH=%x RESP_WIDTH=%x ID_WIDTH=%x STRB_WIDTH=%x LEN_WIDTH=%x SIZE_WIDTH=%x BURST_WIDTH=%x ", ADDR_WIDTH,DATA_WIDTH,RESP_WIDTH,ID_WIDTH,STRB_WIDTH,LEN_WIDTH,SIZE_WIDTH,BURST_WIDTH),
      UVM_DEBUG)
end
`endif

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase

  tri clk_i;
  tri rst_i;

  // Signal list (all signals are capable of being inputs and outputs for the sake
  // of supporting both INITIATOR and RESPONDER mode operation. Expectation is that 
  // directionality in the config file was from the point-of-view of the INITIATOR

  // INITIATOR mode input signals
  tri  awready_i;
  reg  awready_o = 'bz;
  tri  wready_i;
  reg  wready_o = 'bz;
  tri  bvalid_i;
  reg  bvalid_o = 'bz;
  tri [ID_WIDTH-1:0] bid_i;
  reg [ID_WIDTH-1:0] bid_o = 'bz;
  tri [RESP_WIDTH-1:0] bresp_i;
  reg [RESP_WIDTH-1:0] bresp_o = 'bz;
  tri  arready_i;
  reg  arready_o = 'bz;
  tri  rvalid_i;
  reg  rvalid_o = 'bz;
  tri [ID_WIDTH-1:0] rid_i;
  reg [ID_WIDTH-1:0] rid_o = 'bz;
  tri [DATA_WIDTH-1:0] rdata_i;
  reg [DATA_WIDTH-1:0] rdata_o = 'bz;
  tri  rlast_i;
  reg  rlast_o = 'bz;

  // INITIATOR mode output signals
  tri  awvalid_i;
  reg  awvalid_o = 'bz;
  tri [ID_WIDTH-1:0] awid_i;
  reg [ID_WIDTH-1:0] awid_o = 'bz;
  tri [LEN_WIDTH-1:0] awlen_i;
  reg [LEN_WIDTH-1:0] awlen_o = 'bz;
  tri [SIZE_WIDTH-1:0] awsize_i;
  reg [SIZE_WIDTH-1:0] awsize_o = 'bz;
  tri [ADDR_WIDTH-1:0] awaddr_i;
  reg [ADDR_WIDTH-1:0] awaddr_o = 'bz;
  tri [BURST_WIDTH-1:0] awburst_i;
  reg [BURST_WIDTH-1:0] awburst_o = 'bz;
  tri  wvalid_i;
  reg  wvalid_o = 'bz;
  tri [ID_WIDTH-1:0] wid_i;
  reg [ID_WIDTH-1:0] wid_o = 'bz;
  tri [DATA_WIDTH-1:0] wdata_i;
  reg [DATA_WIDTH-1:0] wdata_o = 'bz;
  tri [STRB_WIDTH-1:0] wstrb_i;
  reg [STRB_WIDTH-1:0] wstrb_o = 'bz;
  tri  wlast_i;
  reg  wlast_o = 'bz;
  tri  bready_i;
  reg  bready_o = 'bz;
  tri  arvalid_i;
  reg  arvalid_o = 'bz;
  tri [ID_WIDTH-1:0] arid_i;
  reg [ID_WIDTH-1:0] arid_o = 'bz;
  tri [LEN_WIDTH-1:0] arlen_i;
  reg [LEN_WIDTH-1:0] arlen_o = 'bz;
  tri [SIZE_WIDTH-1:0] arsize_i;
  reg [SIZE_WIDTH-1:0] arsize_o = 'bz;
  tri [ADDR_WIDTH-1:0] araddr_i;
  reg [ADDR_WIDTH-1:0] araddr_o = 'bz;
  tri [BURST_WIDTH-1:0] arburst_i;
  reg [BURST_WIDTH-1:0] arburst_o = 'bz;
  tri  rready_i;
  reg  rready_o = 'bz;
  tri [RESP_WIDTH-1:0] rresp_i;
  reg [RESP_WIDTH-1:0] rresp_o = 'bz;

  // Bi-directional signals
  

  assign clk_i = bus.clk;
  assign rst_i = bus.rst;

  // These are signals marked as 'input' by the config file, but the signals will be
  // driven by this BFM if put into RESPONDER mode (flipping all signal directions around)
  assign awready_i = bus.awready;
  assign bus.awready = (initiator_responder == RESPONDER) ? awready_o : 'bz;
  assign wready_i = bus.wready;
  assign bus.wready = (initiator_responder == RESPONDER) ? wready_o : 'bz;
  assign bvalid_i = bus.bvalid;
  assign bus.bvalid = (initiator_responder == RESPONDER) ? bvalid_o : 'bz;
  assign bid_i = bus.bid;
  assign bus.bid = (initiator_responder == RESPONDER) ? bid_o : 'bz;
  assign bresp_i = bus.bresp;
  assign bus.bresp = (initiator_responder == RESPONDER) ? bresp_o : 'bz;
  assign arready_i = bus.arready;
  assign bus.arready = (initiator_responder == RESPONDER) ? arready_o : 'bz;
  assign rvalid_i = bus.rvalid;
  assign bus.rvalid = (initiator_responder == RESPONDER) ? rvalid_o : 'bz;
  assign rid_i = bus.rid;
  assign bus.rid = (initiator_responder == RESPONDER) ? rid_o : 'bz;
  assign rdata_i = bus.rdata;
  assign bus.rdata = (initiator_responder == RESPONDER) ? rdata_o : 'bz;
  assign rlast_i = bus.rlast;
  assign bus.rlast = (initiator_responder == RESPONDER) ? rlast_o : 'bz;


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
  assign bus.wdata = (initiator_responder == INITIATOR) ? wdata_o : 'bz;
  assign wdata_i = bus.wdata;
  assign bus.wstrb = (initiator_responder == INITIATOR) ? wstrb_o : 'bz;
  assign wstrb_i = bus.wstrb;
  assign bus.wlast = (initiator_responder == INITIATOR) ? wlast_o : 'bz;
  assign wlast_i = bus.wlast;
  assign bus.bready = (initiator_responder == INITIATOR) ? bready_o : 'bz;
  assign bready_i = bus.bready;
  assign bus.arvalid = (initiator_responder == INITIATOR) ? arvalid_o : 'bz;
  assign arvalid_i = bus.arvalid;
  assign bus.arid = (initiator_responder == INITIATOR) ? arid_o : 'bz;
  assign arid_i = bus.arid;
  assign bus.arlen = (initiator_responder == INITIATOR) ? arlen_o : 'bz;
  assign arlen_i = bus.arlen;
  assign bus.arsize = (initiator_responder == INITIATOR) ? arsize_o : 'bz;
  assign arsize_i = bus.arsize;
  assign bus.araddr = (initiator_responder == INITIATOR) ? araddr_o : 'bz;
  assign araddr_i = bus.araddr;
  assign bus.arburst = (initiator_responder == INITIATOR) ? arburst_o : 'bz;
  assign arburst_i = bus.arburst;
  assign bus.rready = (initiator_responder == INITIATOR) ? rready_o : 'bz;
  assign rready_i = bus.rready;
  assign bus.rresp = (initiator_responder == INITIATOR) ? rresp_o : 'bz;
  assign rresp_i = bus.rresp;

  // Proxy handle to UVM driver
  axi_master_pkg::axi_master_driver #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH),
    .RESP_WIDTH(RESP_WIDTH),
    .ID_WIDTH(ID_WIDTH),
    .STRB_WIDTH(STRB_WIDTH),
    .LEN_WIDTH(LEN_WIDTH),
    .SIZE_WIDTH(SIZE_WIDTH),
    .BURST_WIDTH(BURST_WIDTH)
    )  proxy;


  // ****************************************************************************
// pragma uvmf custom reset_condition_and_response begin
  // Always block used to return signals to reset value upon assertion of reset
  always @( negedge rst_i )
     begin
       // RESPONDER mode output signals
       awready_o <= 'bz;
       wready_o <= 'bz;
       bvalid_o <= 'bz;
       bid_o <= 'bz;
       bresp_o <= 'bz;
       arready_o <= 'bz;
       rvalid_o <= 'bz;
       rid_o <= 'bz;
       rdata_o <= 'bz;
       rlast_o <= 'bz;
       // INITIATOR mode output signals
       awvalid_o <= 'bz;
       awid_o <= 'bz;
       awlen_o <= 'bz;
       awsize_o <= 'bz;
       awaddr_o <= 'bz;
       awburst_o <= 'bz;
       wvalid_o <= 'bz;
       wid_o <= 'bz;
       wdata_o <= 'bz;
       wstrb_o <= 'bz;
       wlast_o <= 'bz;
       bready_o <= 'bz;
       arvalid_o <= 'bz;
       arid_o <= 'bz;
       arlen_o <= 'bz;
       arsize_o <= 'bz;
       araddr_o <= 'bz;
       arburst_o <= 'bz;
       rready_o <= 'bz;
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

  function void configure(axi_master_configuration 
                         #(
                         ADDR_WIDTH,
                         DATA_WIDTH,
                         RESP_WIDTH,
                         ID_WIDTH,
                         STRB_WIDTH,
                         LEN_WIDTH,
                         SIZE_WIDTH,
                         BURST_WIDTH
                         )

                         axi_master_configuration_arg
                         );  
    initiator_responder = axi_master_configuration_arg.initiator_responder;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction                                                                             

// pragma uvmf custom initiate_and_get_response begin
// ****************************************************************************
// UVMF_CHANGE_ME
// This task is used by an initator.  The task first initiates a transfer then
// waits for the responder to complete the transfer.
    task initiate_and_get_response( axi_master_transaction 
                                  #(
                                  ADDR_WIDTH,
                                  DATA_WIDTH,
                                  RESP_WIDTH,
                                  ID_WIDTH,
                                  STRB_WIDTH,
                                  LEN_WIDTH,
                                  SIZE_WIDTH,
                                  BURST_WIDTH
                                  )

                                  initiator_trans  
                                  );
       // 
       // Variables within the initiator_trans:
       //   bit awvalid ;
       //   bit awready ;
       //   bit [ID_WIDTH-1:0] awid ;
       //   bit [LEN_WIDTH-1:0] awlen ;
       //   bit [SIZE_WIDTH-1:0] awsize ;
       //   bit [ADDR_WIDTH-1:0] awaddr ;
       //   bit [BURST_WIDTH-1:0] awburst ;
       //   bit wvalid ;
       //   bit wready ;
       //   bit [ID_WIDTH-1:0] wid ;
       //   bit [DATA_WIDTH-1:0] wdata ;
       //   bit [STRB_WIDTH-1:0] wstrb ;
       //   bit wlast ;
       //   bit bready ;
       //   bit bvalid ;
       //   bit [ID_WIDTH-1:0] bid ;
       //   bit [RESP_WIDTH-1:0] bresp ;
       //   bit arvalid ;
       //   bit arready ;
       //   bit [ID_WIDTH-1:0] arid ;
       //   bit [LEN_WIDTH-1:0] arlen ;
       //   bit [SIZE_WIDTH-1:0] arsize ;
       //   bit [ADDR_WIDTH-1:0] araddr ;
       //   bit [BURST_WIDTH-1:0] arburst ;
       //   bit rvalid ;
       //   bit rready ;
       //   bit [ID_WIDTH-1:0] rid ;
       //   bit [DATA_WIDTH-1:0] rdata ;
       //   bit rlast ;
       //   bit [RESP_WIDTH-1:0] rresp ;
       //
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge clk_i);
       //    
       //    How to assign a initiator_trans variable, named xyz, from a signal.   
       //    All available initiator input and inout signals listed.
       //    Initiator input signals:
       //      initiator_trans.xyz = awready_i;  //     
       //      initiator_trans.xyz = wready_i;  //     
       //      initiator_trans.xyz = bvalid_i;  //     
       //      initiator_trans.xyz = bid_i;  //    [ID_WIDTH-1:0] 
       //      initiator_trans.xyz = bresp_i;  //    [RESP_WIDTH-1:0] 
       //      initiator_trans.xyz = arready_i;  //     
       //      initiator_trans.xyz = rvalid_i;  //     
       //      initiator_trans.xyz = rid_i;  //    [ID_WIDTH-1:0] 
       //      initiator_trans.xyz = rdata_i;  //    [DATA_WIDTH-1:0] 
       //      initiator_trans.xyz = rlast_i;  //     
       //    Initiator inout signals:
       //    How to assign a signal, named xyz, from a initiator_trans varaiable.   
       //    All available initiator output and inout signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       //    Initiator output signals:
       //      awvalid_o <= initiator_trans.xyz;  //     
       //      awid_o <= initiator_trans.xyz;  //    [ID_WIDTH-1:0] 
       //      awlen_o <= initiator_trans.xyz;  //    [LEN_WIDTH-1:0] 
       //      awsize_o <= initiator_trans.xyz;  //    [SIZE_WIDTH-1:0] 
       //      awaddr_o <= initiator_trans.xyz;  //    [ADDR_WIDTH-1:0] 
       //      awburst_o <= initiator_trans.xyz;  //    [BURST_WIDTH-1:0] 
       //      wvalid_o <= initiator_trans.xyz;  //     
       //      wid_o <= initiator_trans.xyz;  //    [ID_WIDTH-1:0] 
       //      wdata_o <= initiator_trans.xyz;  //    [DATA_WIDTH-1:0] 
       //      wstrb_o <= initiator_trans.xyz;  //    [STRB_WIDTH-1:0] 
       //      wlast_o <= initiator_trans.xyz;  //     
       //      bready_o <= initiator_trans.xyz;  //     
       //      arvalid_o <= initiator_trans.xyz;  //     
       //      arid_o <= initiator_trans.xyz;  //    [ID_WIDTH-1:0] 
       //      arlen_o <= initiator_trans.xyz;  //    [LEN_WIDTH-1:0] 
       //      arsize_o <= initiator_trans.xyz;  //    [SIZE_WIDTH-1:0] 
       //      araddr_o <= initiator_trans.xyz;  //    [ADDR_WIDTH-1:0] 
       //      arburst_o <= initiator_trans.xyz;  //    [BURST_WIDTH-1:0] 
       //      rready_o <= initiator_trans.xyz;  //     
       //      rresp_o <= initiator_trans.xyz;  //    [RESP_WIDTH-1:0] 
       //    Initiator inout signals:
    // Initiate a transfer using the data received.
    @(posedge clk_i);
    @(posedge clk_i);
    // Wait for the responder to complete the transfer then place the responder data into 
    // initiator_trans.
    @(posedge clk_i);
    @(posedge clk_i);
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
  
  task respond_and_wait_for_next_transfer( axi_master_transaction 
                                         #(
                                         ADDR_WIDTH,
                                         DATA_WIDTH,
                                         RESP_WIDTH,
                                         ID_WIDTH,
                                         STRB_WIDTH,
                                         LEN_WIDTH,
                                         SIZE_WIDTH,
                                         BURST_WIDTH
                                         )

                                         responder_trans  
                                         );     
  // Variables within the responder_trans:
  //   bit awvalid ;
  //   bit awready ;
  //   bit [ID_WIDTH-1:0] awid ;
  //   bit [LEN_WIDTH-1:0] awlen ;
  //   bit [SIZE_WIDTH-1:0] awsize ;
  //   bit [ADDR_WIDTH-1:0] awaddr ;
  //   bit [BURST_WIDTH-1:0] awburst ;
  //   bit wvalid ;
  //   bit wready ;
  //   bit [ID_WIDTH-1:0] wid ;
  //   bit [DATA_WIDTH-1:0] wdata ;
  //   bit [STRB_WIDTH-1:0] wstrb ;
  //   bit wlast ;
  //   bit bready ;
  //   bit bvalid ;
  //   bit [ID_WIDTH-1:0] bid ;
  //   bit [RESP_WIDTH-1:0] bresp ;
  //   bit arvalid ;
  //   bit arready ;
  //   bit [ID_WIDTH-1:0] arid ;
  //   bit [LEN_WIDTH-1:0] arlen ;
  //   bit [SIZE_WIDTH-1:0] arsize ;
  //   bit [ADDR_WIDTH-1:0] araddr ;
  //   bit [BURST_WIDTH-1:0] arburst ;
  //   bit rvalid ;
  //   bit rready ;
  //   bit [ID_WIDTH-1:0] rid ;
  //   bit [DATA_WIDTH-1:0] rdata ;
  //   bit rlast ;
  //   bit [RESP_WIDTH-1:0] rresp ;
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge clk_i);
       //    
       //    How to assign a responder_trans member, named xyz, from a signal.   
       //    All available responder input and inout signals listed.
       //    Responder input signals
       //      responder_trans.xyz = awvalid_i;  //     
       //      responder_trans.xyz = awid_i;  //    [ID_WIDTH-1:0] 
       //      responder_trans.xyz = awlen_i;  //    [LEN_WIDTH-1:0] 
       //      responder_trans.xyz = awsize_i;  //    [SIZE_WIDTH-1:0] 
       //      responder_trans.xyz = awaddr_i;  //    [ADDR_WIDTH-1:0] 
       //      responder_trans.xyz = awburst_i;  //    [BURST_WIDTH-1:0] 
       //      responder_trans.xyz = wvalid_i;  //     
       //      responder_trans.xyz = wid_i;  //    [ID_WIDTH-1:0] 
       //      responder_trans.xyz = wdata_i;  //    [DATA_WIDTH-1:0] 
       //      responder_trans.xyz = wstrb_i;  //    [STRB_WIDTH-1:0] 
       //      responder_trans.xyz = wlast_i;  //     
       //      responder_trans.xyz = bready_i;  //     
       //      responder_trans.xyz = arvalid_i;  //     
       //      responder_trans.xyz = arid_i;  //    [ID_WIDTH-1:0] 
       //      responder_trans.xyz = arlen_i;  //    [LEN_WIDTH-1:0] 
       //      responder_trans.xyz = arsize_i;  //    [SIZE_WIDTH-1:0] 
       //      responder_trans.xyz = araddr_i;  //    [ADDR_WIDTH-1:0] 
       //      responder_trans.xyz = arburst_i;  //    [BURST_WIDTH-1:0] 
       //      responder_trans.xyz = rready_i;  //     
       //      responder_trans.xyz = rresp_i;  //    [RESP_WIDTH-1:0] 
       //    Responder inout signals
       //    How to assign a signal from a responder_trans member named xyz.   
       //    All available responder output and inout signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       ///   Responder output signals
       //      awready_o <= responder_trans.xyz;  //     
       //      wready_o <= responder_trans.xyz;  //     
       //      bvalid_o <= responder_trans.xyz;  //     
       //      bid_o <= responder_trans.xyz;  //    [ID_WIDTH-1:0] 
       //      bresp_o <= responder_trans.xyz;  //    [RESP_WIDTH-1:0] 
       //      arready_o <= responder_trans.xyz;  //     
       //      rvalid_o <= responder_trans.xyz;  //     
       //      rid_o <= responder_trans.xyz;  //    [ID_WIDTH-1:0] 
       //      rdata_o <= responder_trans.xyz;  //    [DATA_WIDTH-1:0] 
       //      rlast_o <= responder_trans.xyz;  //     
       //    Responder inout signals
    

  @(posedge clk_i);
  if (!first_transfer) begin
    // Perform transfer response here.   
    // Reply using data recieved in the responder_trans.
    @(posedge clk_i);
    // Reply using data recieved in the transaction handle.
    @(posedge clk_i);
  end
    // Wait for next transfer then gather info from intiator about the transfer.
    // Place the data into the responder_trans handle.
    @(posedge clk_i);
    @(posedge clk_i);
    first_transfer = 0;
  endtask
// pragma uvmf custom respond_and_wait_for_next_transfer end

 
endinterface

// pragma uvmf custom external begin
// pragma uvmf custom external end

