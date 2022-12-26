//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This sequences randomizes the wb_slave transaction and sends it 
// to the UVM driver.
//
// This sequence constructs and randomizes a wb_slave_transaction.
// 
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class wb_slave_random_sequence #(
      bit ADDR_WIDTH = 32,
      bit DATA_WIDTH = 32
      )
  extends wb_slave_sequence_base #(
      .ADDR_WIDTH(ADDR_WIDTH),
      .DATA_WIDTH(DATA_WIDTH)
      );

  `uvm_object_param_utils( wb_slave_random_sequence #(
                           ADDR_WIDTH,
                           DATA_WIDTH
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
      req=wb_slave_transaction#(
                .ADDR_WIDTH(ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
                )::type_id::create("req");
      start_item(req);
      // Randomize the transaction
      if(!req.randomize()) `uvm_fatal("SEQ", "wb_slave_random_sequence::body()-wb_slave_transaction randomization failed")
      // Send the transaction to the wb_slave_driver_bfm via the sequencer and wb_slave_driver.
      finish_item(req);
      `uvm_info("SEQ", {"Response:",req.convert2string()},UVM_MEDIUM)

  endtask

endclass: wb_slave_random_sequence

// pragma uvmf custom external begin
// pragma uvmf custom external end

