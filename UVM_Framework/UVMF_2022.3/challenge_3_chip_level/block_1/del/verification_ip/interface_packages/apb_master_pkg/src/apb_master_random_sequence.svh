//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This sequences randomizes the apb_master transaction and sends it 
// to the UVM driver.
//
// This sequence constructs and randomizes a apb_master_transaction.
// 
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class apb_master_random_sequence #(
      int ADDRESS_WIDTH = 32,
      int DATA_WIDTH = 32,
      int NO_OF_SLAVES = 1
      )
  extends apb_master_sequence_base #(
      .ADDRESS_WIDTH(ADDRESS_WIDTH),
      .DATA_WIDTH(DATA_WIDTH),
      .NO_OF_SLAVES(NO_OF_SLAVES)
      );

  `uvm_object_param_utils( apb_master_random_sequence #(
                           ADDRESS_WIDTH,
                           DATA_WIDTH,
                           NO_OF_SLAVES
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
      req=apb_master_transaction#(
                .ADDRESS_WIDTH(ADDRESS_WIDTH),
                .DATA_WIDTH(DATA_WIDTH),
                .NO_OF_SLAVES(NO_OF_SLAVES)
                )::type_id::create("req");
      start_item(req);
      // Randomize the transaction
      if(!req.randomize()) `uvm_fatal("SEQ", "apb_master_random_sequence::body()-apb_master_transaction randomization failed")
      // Send the transaction to the apb_master_driver_bfm via the sequencer and apb_master_driver.
      finish_item(req);
      `uvm_info("SEQ", {"Response:",req.convert2string()},UVM_MEDIUM)

  endtask

endclass: apb_master_random_sequence

// pragma uvmf custom external begin
// pragma uvmf custom external end

