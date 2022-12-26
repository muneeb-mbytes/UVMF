//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
//    This interface performs the apb_master signal driving.  It is
//     accessed by the uvm apb_master driver through a virtual interface
//     handle in the apb_master configuration.  It drives the singals passed
//     in through the port connection named bus of type apb_master_if.
//
//     Input signals from the apb_master_if are assigned to an internal input
//     signal with a _i suffix.  The _i signal should be used for sampling.
//
//     The input signal connections are as follows:
//       bus.signal -> signal_i 
//
//     This bfm drives signals with a _o suffix.  These signals
//     are driven onto signals within apb_master_if based on INITIATOR/RESPONDER and/or
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
import apb_master_pkg_hdl::*;
import apb_master_pkg::*;

interface apb_master_driver_bfm #(
  int ADDR_WIDTH = 32,
  int DATA_WIDTH = 32,
  int NO_OF_SLAVES = 1
  )
  (apb_master_if bus);

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
      $psprintf("The BFM at '%m' has the following parameters: ADDR_WIDTH=%x DATA_WIDTH=%x NO_OF_SLAVES=%x ", ADDR_WIDTH,DATA_WIDTH,NO_OF_SLAVES),
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
  tri  pready_i;
  reg  pready_o = 'bz;
  tri  pslverr_i;
  reg  pslverr_o = 'bz;
  tri [DATA_WIDTH-1:0] prdata_i;
  reg [DATA_WIDTH-1:0] prdata_o = 'bz;

  // INITIATOR mode output signals
  tri [NO_OF_SLAVES-1:0] psel_i;
  reg [NO_OF_SLAVES-1:0] psel_o = 'bz;
  tri  penable_i;
  reg  penable_o = 'bz;
  tri  pwrite_i;
  reg  pwrite_o = 'bz;
  tri [ADDR_WIDTH-1:0] paddr_i;
  reg [ADDR_WIDTH-1:0] paddr_o = 'bz;
  tri [DATA_WIDTH-1:0] pstrb_i;
  reg [DATA_WIDTH-1:0] pstrb_o = 'bz;
  tri [ADDR_WIDTH-1:0] pwdata_i;
  reg [ADDR_WIDTH-1:0] pwdata_o = 'bz;

  // Bi-directional signals
  

  assign clk_i = bus.clk;
  assign rst_i = bus.rst;

  // These are signals marked as 'input' by the config file, but the signals will be
  // driven by this BFM if put into RESPONDER mode (flipping all signal directions around)
  assign pready_i = bus.pready;
  assign bus.pready = (initiator_responder == RESPONDER) ? pready_o : 'bz;
  assign pslverr_i = bus.pslverr;
  assign bus.pslverr = (initiator_responder == RESPONDER) ? pslverr_o : 'bz;
  assign prdata_i = bus.prdata;
  assign bus.prdata = (initiator_responder == RESPONDER) ? prdata_o : 'bz;


  // These are signals marked as 'output' by the config file, but the outputs will
  // not be driven by this BFM unless placed in INITIATOR mode.
  assign bus.psel = (initiator_responder == INITIATOR) ? psel_o : 'bz;
  assign psel_i = bus.psel;
  assign bus.penable = (initiator_responder == INITIATOR) ? penable_o : 'bz;
  assign penable_i = bus.penable;
  assign bus.pwrite = (initiator_responder == INITIATOR) ? pwrite_o : 'bz;
  assign pwrite_i = bus.pwrite;
  assign bus.paddr = (initiator_responder == INITIATOR) ? paddr_o : 'bz;
  assign paddr_i = bus.paddr;
  assign bus.pstrb = (initiator_responder == INITIATOR) ? pstrb_o : 'bz;
  assign pstrb_i = bus.pstrb;
  assign bus.pwdata = (initiator_responder == INITIATOR) ? pwdata_o : 'bz;
  assign pwdata_i = bus.pwdata;

  // Proxy handle to UVM driver
  apb_master_pkg::apb_master_driver #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH),
    .NO_OF_SLAVES(NO_OF_SLAVES)
    )  proxy;


  // ****************************************************************************
// pragma uvmf custom reset_condition_and_response begin
  // Always block used to return signals to reset value upon assertion of reset
  always @( negedge rst_i )
     begin
       // RESPONDER mode output signals
       pready_o <= 'bz;
       pslverr_o <= 'bz;
       prdata_o <= 'bz;
       // INITIATOR mode output signals
       psel_o <= 'bz;
       penable_o <= 'bz;
       pwrite_o <= 'bz;
       paddr_o <= 'bz;
       pstrb_o <= 'bz;
       pwdata_o <= 'bz;
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

  function void configure(apb_master_configuration 
                         #(
                         ADDR_WIDTH,
                         DATA_WIDTH,
                         NO_OF_SLAVES
                         )

                         apb_master_configuration_arg
                         );  
    initiator_responder = apb_master_configuration_arg.initiator_responder;
  // pragma uvmf custom configure begin
  // pragma uvmf custom configure end
  endfunction                                                                             

// pragma uvmf custom initiate_and_get_response begin
// ****************************************************************************
// UVMF_CHANGE_ME
// This task is used by an initator.  The task first initiates a transfer then
// waits for the responder to complete the transfer.
    task initiate_and_get_response( apb_master_transaction 
                                  #(
                                  ADDR_WIDTH,
                                  DATA_WIDTH,
                                  NO_OF_SLAVES
                                  )

                                  initiator_trans  
                                  );
       // 
       // Variables within the initiator_trans:
       //   bit [NO_OF_SLAVES-1:0] psel ;
       //   bit penable ;
       //   bit pwrite ;
       //   bit [ADDR_WIDTH-1:0] paddr ;
       //   bit [(DATA_WIDTH/8)-1:0] pstrb ;
       //   bit [DATA_WIDTH-1:0] pwdata ;
       //   bit pready ;
       //   bit [DATA_WIDTH-1:0] prdata ;
       //   bit pslverr ;
       //
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge clk_i);
       //    
       //    How to assign a initiator_trans variable, named xyz, from a signal.   
       //    All available initiator input and inout signals listed.
       //    Initiator input signals:
       //      initiator_trans.xyz = pready_i;  //     
       //      initiator_trans.xyz = pslverr_i;  //     
       //      initiator_trans.xyz = prdata_i;  //    [DATA_WIDTH-1:0] 
       //    Initiator inout signals:
       //    How to assign a signal, named xyz, from a initiator_trans varaiable.   
       //    All available initiator output and inout signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       //    Initiator output signals:
       //      psel_o <= initiator_trans.xyz;  //    [NO_OF_SLAVES-1:0] 
       //      penable_o <= initiator_trans.xyz;  //     
       //      pwrite_o <= initiator_trans.xyz;  //     
       //      paddr_o <= initiator_trans.xyz;  //    [ADDR_WIDTH-1:0] 
       //      pstrb_o <= initiator_trans.xyz;  //    [DATA_WIDTH-1:0] 
       //      pwdata_o <= initiator_trans.xyz;  //    [ADDR_WIDTH-1:0] 
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
  
  task respond_and_wait_for_next_transfer( apb_master_transaction 
                                         #(
                                         ADDR_WIDTH,
                                         DATA_WIDTH,
                                         NO_OF_SLAVES
                                         )

                                         responder_trans  
                                         );     
  // Variables within the responder_trans:
  //   bit [NO_OF_SLAVES-1:0] psel ;
  //   bit penable ;
  //   bit pwrite ;
  //   bit [ADDR_WIDTH-1:0] paddr ;
  //   bit [(DATA_WIDTH/8)-1:0] pstrb ;
  //   bit [DATA_WIDTH-1:0] pwdata ;
  //   bit pready ;
  //   bit [DATA_WIDTH-1:0] prdata ;
  //   bit pslverr ;
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge clk_i);
       //    
       //    How to assign a responder_trans member, named xyz, from a signal.   
       //    All available responder input and inout signals listed.
       //    Responder input signals
       //      responder_trans.xyz = psel_i;  //    [NO_OF_SLAVES-1:0] 
       //      responder_trans.xyz = penable_i;  //     
       //      responder_trans.xyz = pwrite_i;  //     
       //      responder_trans.xyz = paddr_i;  //    [ADDR_WIDTH-1:0] 
       //      responder_trans.xyz = pstrb_i;  //    [DATA_WIDTH-1:0] 
       //      responder_trans.xyz = pwdata_i;  //    [ADDR_WIDTH-1:0] 
       //    Responder inout signals
       //    How to assign a signal from a responder_trans member named xyz.   
       //    All available responder output and inout signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       ///   Responder output signals
       //      pready_o <= responder_trans.xyz;  //     
       //      pslverr_o <= responder_trans.xyz;  //     
       //      prdata_o <= responder_trans.xyz;  //    [DATA_WIDTH-1:0] 
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

