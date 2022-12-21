//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This sequences randomizes the jtag_a transaction and sends it 
// to the UVM driver.
//
// This sequence constructs and randomizes a jtag_a_transaction.
// 
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class jtag_a_random_sequence 
  extends jtag_a_sequence_base ;

  `uvm_object_utils( jtag_a_random_sequence )

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
      req=jtag_a_transaction::type_id::create("req");
      start_item(req);
      // Randomize the transaction
      if(!req.randomize()) `uvm_fatal("SEQ", "jtag_a_random_sequence::body()-jtag_a_transaction randomization failed")
      // Send the transaction to the jtag_a_driver_bfm via the sequencer and jtag_a_driver.
      finish_item(req);
      `uvm_info("SEQ", {"Response:",req.convert2string()},UVM_MEDIUM)

  endtask

endclass: jtag_a_random_sequence

// pragma uvmf custom external begin
// pragma uvmf custom external end

