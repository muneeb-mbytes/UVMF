//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This file contains the class used as the base class for all sequences
// for this interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class pkt_sequence_base #(
      int DATA_WIDTH = 240,
      int STATUS_WIDTH = 230
      )   extends uvmf_sequence_base #(
                             .REQ(pkt_transaction  #(
                                 .DATA_WIDTH(DATA_WIDTH),
                                 .STATUS_WIDTH(STATUS_WIDTH)
                                 )),
                             .RSP(pkt_transaction  #(
                                 .DATA_WIDTH(DATA_WIDTH),
                                 .STATUS_WIDTH(STATUS_WIDTH)
                                 )));

  `uvm_object_param_utils( pkt_sequence_base #(
                           DATA_WIDTH,
                           STATUS_WIDTH
                           ))

  // variables
  typedef pkt_transaction #(
                     .DATA_WIDTH(DATA_WIDTH),
                     .STATUS_WIDTH(STATUS_WIDTH)
                     ) pkt_transaction_req_t;
  pkt_transaction_req_t req;
  typedef pkt_transaction #(
                     .DATA_WIDTH(DATA_WIDTH),
                     .STATUS_WIDTH(STATUS_WIDTH)
                     ) pkt_transaction_rsp_t;
  pkt_transaction_rsp_t rsp;

  // Event for identifying when a response was received from the sequencer
  event new_rsp;

  // System Verilog variables for C functions 
  int unsigned variable1 ;
  int unsigned variable2 ;
  int unsigned variable3 ;
  int unsigned variable4 ;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // ****************************************************************************
  // TASK : get_responses()
  // This task recursively gets sequence item responses from the sequencer.
  //
  virtual task get_responses();
    fork
      begin
        // Block until new rsp available
        get_response(rsp);
        // New rsp received.  Indicate to sequence using event.
        ->new_rsp;
        // Display the received response transaction
        `uvm_info("SEQ", {"New response transaction:",rsp.convert2string()}, UVM_MEDIUM)
      end
    join_none
  endtask

  // ****************************************************************************
  // TASK : pre_body()
  // This task is called automatically when start is called with call_pre_post set to 1 (default).
  // By calling get_responses() within pre_body() any derived sequences are automatically 
  // processing response transactions. Only un-comment this call to get_responses() if you
  // have configured the interface driver to utilize the response transaction path by setting
  // the configuration variable "return_transaction_response" to 1. Otherwise it is possible
  // to impact runtime performance and memory utilization.
  //
  virtual task pre_body();
    // pragma uvmf custom pre_body begin
//    get_responses();
    // Example use of C functions using DPI-C
    // Calling C function hello_world_from_interface
    hello_world_from_interface
            (
            variable1,
            variable2
            );
    // Calling C function good_bye_world_from_interface
    good_bye_world_from_interface
            (
            variable3,
            variable4
            );
     // pragma uvmf custom pre_body end
  endtask

  // ****************************************************************************
  // TASK : body()
  // This task is called automatically when start is called.  This sequence sends
  // a req sequence item to the sequencer identified as an argument in the call
  // to start.
  //
  virtual task body();
    // pragma uvmf custom body begin
  	start_item(req);
  	finish_item(req);
    // pragma uvmf custom body end
  endtask

  // ****************************************************************************
  // FUNCTION : new()
  // This function is the standard SystemVerilog constructor.
  //
  function new( string name ="");
    super.new( name );
    // pragma uvmf custom new begin
    req = pkt_transaction_req_t::type_id::create("req");
    rsp = pkt_transaction_rsp_t::type_id::create("rsp");
    // pragma uvmf custom new end
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

