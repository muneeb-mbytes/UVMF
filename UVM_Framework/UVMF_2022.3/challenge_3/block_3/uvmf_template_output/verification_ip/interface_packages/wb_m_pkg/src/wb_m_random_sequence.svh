//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This sequences randomizes the wb_m transaction and sends it 
// to the UVM driver.
//
// This sequence constructs and randomizes a wb_m_transaction.
// 
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class wb_m_random_sequence #(
      int WB_ADDR_WIDTH = 32,
      int WB_DATA_WIDTH = 16
      )
  extends wb_m_sequence_base #(
      .WB_ADDR_WIDTH(WB_ADDR_WIDTH),
      .WB_DATA_WIDTH(WB_DATA_WIDTH)
      );

  `uvm_object_param_utils( wb_m_random_sequence #(
                           WB_ADDR_WIDTH,
                           WB_DATA_WIDTH
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
      req=wb_m_transaction#(
                .WB_ADDR_WIDTH(WB_ADDR_WIDTH),
                .WB_DATA_WIDTH(WB_DATA_WIDTH)
                )::type_id::create("req");
      start_item(req);
      // Randomize the transaction
      if(!req.randomize()) `uvm_fatal("SEQ", "wb_m_random_sequence::body()-wb_m_transaction randomization failed")
      // Send the transaction to the wb_m_driver_bfm via the sequencer and wb_m_driver.
      finish_item(req);
      `uvm_info("SEQ", {"Response:",req.convert2string()},UVM_MEDIUM)

  endtask

endclass: wb_m_random_sequence

// pragma uvmf custom external begin
// pragma uvmf custom external end
