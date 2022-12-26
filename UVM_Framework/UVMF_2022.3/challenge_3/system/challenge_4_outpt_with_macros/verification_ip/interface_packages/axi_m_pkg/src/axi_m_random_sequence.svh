//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This sequences randomizes the axi_m transaction and sends it 
// to the UVM driver.
//
// This sequence constructs and randomizes a axi_m_transaction.
// 
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
`ifndef AXI_M_RANDOM_SEQUENCE
`define AXI_M_RANDOM_SEQUENCE
class axi_m_random_sequence #(
      int AW_WIDTH = 32,
      int LEN = 8,
      int DATA_WIDTH = 32,
      int X = 16
      )
  extends axi_m_sequence_base #(
      .AW_WIDTH(AW_WIDTH),
      .LEN(LEN),
      .DATA_WIDTH(DATA_WIDTH),
      .X(X)
      );

  `uvm_object_param_utils( axi_m_random_sequence #(
                           AW_WIDTH,
                           LEN,
                           DATA_WIDTH,
                           X
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
      req=axi_m_transaction#(
                .AW_WIDTH(AW_WIDTH),
                .LEN(LEN),
                .DATA_WIDTH(DATA_WIDTH),
                .X(X)
                )::type_id::create("req");
      start_item(req);
      // Randomize the transaction
      if(!req.randomize()) `uvm_fatal("SEQ", "axi_m_random_sequence::body()-axi_m_transaction randomization failed")
      // Send the transaction to the axi_m_driver_bfm via the sequencer and axi_m_driver.
      finish_item(req);
      `uvm_info("SEQ", {"Response:",req.convert2string()},UVM_MEDIUM)

  endtask

endclass: axi_m_random_sequence

// pragma uvmf custom external begin
// pragma uvmf custom external end
`endif
