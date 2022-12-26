//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
//    This interface performs the wb_slave signal driving.  It is
//     accessed by the uvm wb_slave driver through a virtual interface
//     handle in the wb_slave configuration.  It drives the singals passed
//     in through the port connection named bus of type wb_slave_if.
//
//     Input signals from the wb_slave_if are assigned to an internal input
//     signal with a _i suffix.  The _i signal should be used for sampling.
//
//     The input signal connections are as follows:
//       bus.signal -> signal_i 
//
//     This bfm drives signals with a _o suffix.  These signals
//     are driven onto signals within wb_slave_if based on INITIATOR/RESPONDER and/or
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
import wb_slave_pkg_hdl::*;
import wb_slave_pkg::*;

interface wb_slave_driver_bfm #(
  bit ADDR_WIDTH = 32,
  bit DATA_WIDTH = 32
  )
  (wb_slave_if bus);

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

  // Config value to determine if this is an initiator or a responder 
  uvmf_initiator_responder_t initiator_responder;
  // Custom configuration variables.  
  // These are set using the configure function which is called during the UVM connect_phase
  bit has_coverage ;
  bit is_active ;

  tri clk_i;
  tri rst_i;

  // Signal list (all signals are capable of being inputs and outputs for the sake
  // of supporting both INITIATOR and RESPONDER mode operation. Expectation is that 
  // directionality in the config file was from the point-of-view of the INITIATOR

  // INITIATOR mode input signals
  tri [ADDR_WIDTH-1:0] adr_i_i;
  reg [ADDR_WIDTH-1:0] adr_i_o = 'bz;
  tri [DATA_WIDTH-1:0] dat_i_i;
  reg [DATA_WIDTH-1:0] dat_i_o = 'bz;
  tri  we_i_i;
  reg  we_i_o = 'bz;
  tri [7:0] sel_i_i;
  reg [7:0] sel_i_o = 'bz;
  tri [7:0] stb_i_i;
  reg [7:0] stb_i_o = 'bz;
  tri  cyc_i_i;
  reg  cyc_i_o = 'bz;

  // INITIATOR mode output signals
  tri [DATA_WIDTH-1:0] dat_o_i;
  reg [DATA_WIDTH-1:0] dat_o_o = 'bz;
  tri  ack_o_i;
  reg  ack_o_o = 'bz;

  // Bi-directional signals
  

  assign clk_i = bus.clk;
  assign rst_i = bus.rst;

  // These are signals marked as 'input' by the config file, but the signals will be
  // driven by this BFM if put into RESPONDER mode (flipping all signal directions around)
  assign adr_i_i = bus.adr_i;
  assign bus.adr_i = (initiator_responder == RESPONDER) ? adr_i_o : 'bz;
  assign dat_i_i = bus.dat_i;
  assign bus.dat_i = (initiator_responder == RESPONDER) ? dat_i_o : 'bz;
  assign we_i_i = bus.we_i;
  assign bus.we_i = (initiator_responder == RESPONDER) ? we_i_o : 'bz;
  assign sel_i_i = bus.sel_i;
  assign bus.sel_i = (initiator_responder == RESPONDER) ? sel_i_o : 'bz;
  assign stb_i_i = bus.stb_i;
  assign bus.stb_i = (initiator_responder == RESPONDER) ? stb_i_o : 'bz;
  assign cyc_i_i = bus.cyc_i;
  assign bus.cyc_i = (initiator_responder == RESPONDER) ? cyc_i_o : 'bz;


  // These are signals marked as 'output' by the config file, but the outputs will
  // not be driven by this BFM unless placed in INITIATOR mode.
  assign bus.dat_o = (initiator_responder == INITIATOR) ? dat_o_o : 'bz;
  assign dat_o_i = bus.dat_o;
  assign bus.ack_o = (initiator_responder == INITIATOR) ? ack_o_o : 'bz;
  assign ack_o_i = bus.ack_o;

  // Proxy handle to UVM driver
  wb_slave_pkg::wb_slave_driver #(
    .ADDR_WIDTH(ADDR_WIDTH),
    .DATA_WIDTH(DATA_WIDTH)
    )  proxy;


  // ****************************************************************************
// pragma uvmf custom reset_condition_and_response begin
  // Always block used to return signals to reset value upon assertion of reset
  always @( negedge rst_i )
     begin
       // RESPONDER mode output signals
       adr_i_o <= 'bz;
       dat_i_o <= 'bz;
       we_i_o <= 'bz;
       sel_i_o <= 'bz;
       stb_i_o <= 'bz;
       cyc_i_o <= 'bz;
       // INITIATOR mode output signals
       dat_o_o <= 'bz;
       ack_o_o <= 'bz;
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

// pragma uvmf custom initiate_and_get_response begin
// ****************************************************************************
// UVMF_CHANGE_ME
// This task is used by an initator.  The task first initiates a transfer then
// waits for the responder to complete the transfer.
    task initiate_and_get_response( wb_slave_transaction 
                                  #(
                                  ADDR_WIDTH,
                                  DATA_WIDTH
                                  )

                                  initiator_trans  
                                  );
       // 
       // Variables within the initiator_trans:
       //   bit[ADDR_WIDTH-1:0] adr_i ;
       //   bit[DATA_WIDTH-1:0] dat_o ;
       //   bit[DATA_WIDTH-1:0] dat_i ;
       //   bit we_i ;
       //   bit[7:0] sel_i ;
       //   bit[(DATA_WIDTH/8)-1:0] stb_i ;
       //   bit ack_o ;
       //   bit cyc_i ;
       //
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge clk_i);
       //    
       //    How to assign a initiator_trans variable, named xyz, from a signal.   
       //    All available initiator input and inout signals listed.
       //    Initiator input signals:
       //      initiator_trans.xyz = adr_i_i;  //    [ADDR_WIDTH-1:0] 
       //      initiator_trans.xyz = dat_i_i;  //    [DATA_WIDTH-1:0] 
       //      initiator_trans.xyz = we_i_i;  //     
       //      initiator_trans.xyz = sel_i_i;  //    [7:0] 
       //      initiator_trans.xyz = stb_i_i;  //    [7:0] 
       //      initiator_trans.xyz = cyc_i_i;  //     
       //    Initiator inout signals:
       //    How to assign a signal, named xyz, from a initiator_trans varaiable.   
       //    All available initiator output and inout signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       //    Initiator output signals:
       //      dat_o_o <= initiator_trans.xyz;  //    [DATA_WIDTH-1:0] 
       //      ack_o_o <= initiator_trans.xyz;  //     
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
  
  task respond_and_wait_for_next_transfer( wb_slave_transaction 
                                         #(
                                         ADDR_WIDTH,
                                         DATA_WIDTH
                                         )

                                         responder_trans  
                                         );     
  // Variables within the responder_trans:
  //   bit[ADDR_WIDTH-1:0] adr_i ;
  //   bit[DATA_WIDTH-1:0] dat_o ;
  //   bit[DATA_WIDTH-1:0] dat_i ;
  //   bit we_i ;
  //   bit[7:0] sel_i ;
  //   bit[(DATA_WIDTH/8)-1:0] stb_i ;
  //   bit ack_o ;
  //   bit cyc_i ;
       // Reference code;
       //    How to wait for signal value
       //      while (control_signal == 1'b1) @(posedge clk_i);
       //    
       //    How to assign a responder_trans member, named xyz, from a signal.   
       //    All available responder input and inout signals listed.
       //    Responder input signals
       //      responder_trans.xyz = dat_o_i;  //    [DATA_WIDTH-1:0] 
       //      responder_trans.xyz = ack_o_i;  //     
       //    Responder inout signals
       //    How to assign a signal from a responder_trans member named xyz.   
       //    All available responder output and inout signals listed.
       //    Notice the _o.  Those are storage variables that allow for procedural assignment.
       ///   Responder output signals
       //      adr_i_o <= responder_trans.xyz;  //    [ADDR_WIDTH-1:0] 
       //      dat_i_o <= responder_trans.xyz;  //    [DATA_WIDTH-1:0] 
       //      we_i_o <= responder_trans.xyz;  //     
       //      sel_i_o <= responder_trans.xyz;  //    [7:0] 
       //      stb_i_o <= responder_trans.xyz;  //    [7:0] 
       //      cyc_i_o <= responder_trans.xyz;  //     
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

