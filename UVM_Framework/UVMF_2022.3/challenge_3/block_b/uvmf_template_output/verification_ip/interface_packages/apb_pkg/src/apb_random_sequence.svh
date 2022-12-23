//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This sequences randomizes the apb transaction and sends it 
// to the UVM driver.
//
// This sequence constructs and randomizes a apb_transaction.
// 
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class apb_random_sequence #(
      int APB_ADDR_WIDTH = 32,
      int APB_DATA_WIDTH = 32
      )
  extends apb_sequence_base #(
      .APB_ADDR_WIDTH(APB_ADDR_WIDTH),
      .APB_DATA_WIDTH(APB_DATA_WIDTH)
      );

  `uvm_object_param_utils( apb_random_sequence #(
                           APB_ADDR_WIDTH,
                           APB_DATA_WIDTH
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
      req=apb_transaction#(
                .APB_ADDR_WIDTH(APB_ADDR_WIDTH),
                .APB_DATA_WIDTH(APB_DATA_WIDTH)
                )::type_id::create("req");
      start_item(req);
      // Randomize the transaction
      if(!req.randomize()) `uvm_fatal("SEQ", "apb_random_sequence::body()-apb_transaction randomization failed")
      // Send the transaction to the apb_driver_bfm via the sequencer and apb_driver.
      finish_item(req);
      `uvm_info("SEQ", {"Response:",req.convert2string()},UVM_MEDIUM)

  endtask

endclass: apb_random_sequence

// pragma uvmf custom external begin
// pragma uvmf custom external end

