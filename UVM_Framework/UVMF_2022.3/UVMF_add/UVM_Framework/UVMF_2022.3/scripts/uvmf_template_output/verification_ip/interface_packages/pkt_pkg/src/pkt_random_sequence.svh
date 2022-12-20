//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This sequences randomizes the pkt transaction and sends it 
// to the UVM driver.
//
// This sequence constructs and randomizes a pkt_transaction.
// 
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class pkt_random_sequence #(
      int DATA_WIDTH = 240,
      int STATUS_WIDTH = 230
      )
  extends pkt_sequence_base #(
      .DATA_WIDTH(DATA_WIDTH),
      .STATUS_WIDTH(STATUS_WIDTH)
      );

  `uvm_object_param_utils( pkt_random_sequence #(
                           DATA_WIDTH,
                           STATUS_WIDTH
                           ))

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  //*****************************************************************
  function new(string name = "");
    super.new(name);
  endfunction: new

  // ****************************************************************************
  // TASK : body()
  // This task is automatically executed when this sequence is started using the 
  // start(sequencerHandle) task.
  //
  task body();
  
      // Construct the transaction
      req=pkt_transaction#(
                .DATA_WIDTH(DATA_WIDTH),
                .STATUS_WIDTH(STATUS_WIDTH)
                )::type_id::create("req");
      start_item(req);
      // Randomize the transaction
      if(!req.randomize()) `uvm_fatal("SEQ", "pkt_random_sequence::body()-pkt_transaction randomization failed")
      // Send the transaction to the pkt_driver_bfm via the sequencer and pkt_driver.
      finish_item(req);
      `uvm_info("SEQ", {"Response:",req.convert2string()},UVM_MEDIUM)

  endtask

endclass: pkt_random_sequence

// pragma uvmf custom external begin
// pragma uvmf custom external end

