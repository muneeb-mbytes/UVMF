//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This sequences randomizes the mem transaction and sends it 
// to the UVM driver.
//
// This sequence constructs and randomizes a mem_transaction.
// 
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class mem_random_sequence #(
      int DATA_WIDTH = 220,
      int ADDR_WIDTH = 210
      )
  extends mem_sequence_base #(
      .DATA_WIDTH(DATA_WIDTH),
      .ADDR_WIDTH(ADDR_WIDTH)
      );

  `uvm_object_param_utils( mem_random_sequence #(
                           DATA_WIDTH,
                           ADDR_WIDTH
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
      req=mem_transaction#(
                .DATA_WIDTH(DATA_WIDTH),
                .ADDR_WIDTH(ADDR_WIDTH)
                )::type_id::create("req");
      start_item(req);
      // Randomize the transaction
      if(!req.randomize()) `uvm_fatal("SEQ", "mem_random_sequence::body()-mem_transaction randomization failed")
      // Send the transaction to the mem_driver_bfm via the sequencer and mem_driver.
      finish_item(req);
      `uvm_info("SEQ", {"Response:",req.convert2string()},UVM_MEDIUM)

  endtask

endclass: mem_random_sequence

// pragma uvmf custom external begin
// pragma uvmf custom external end

