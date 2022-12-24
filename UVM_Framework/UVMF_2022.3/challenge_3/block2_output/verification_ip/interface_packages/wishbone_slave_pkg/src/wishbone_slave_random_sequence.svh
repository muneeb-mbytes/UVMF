//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This sequences randomizes the wishbone_slave transaction and sends it 
// to the UVM driver.
//
// This sequence constructs and randomizes a wishbone_slave_transaction.
// 
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class wishbone_slave_random_sequence 
  extends wishbone_slave_sequence_base ;

  `uvm_object_utils( wishbone_slave_random_sequence )

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
      req=wishbone_slave_transaction::type_id::create("req");
      start_item(req);
      // Randomize the transaction
      if(!req.randomize()) `uvm_fatal("SEQ", "wishbone_slave_random_sequence::body()-wishbone_slave_transaction randomization failed")
      // Send the transaction to the wishbone_slave_driver_bfm via the sequencer and wishbone_slave_driver.
      finish_item(req);
      `uvm_info("SEQ", {"Response:",req.convert2string()},UVM_MEDIUM)

  endtask

endclass: wishbone_slave_random_sequence

// pragma uvmf custom external begin
// pragma uvmf custom external end

