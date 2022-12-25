//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This sequences randomizes the apb_m transaction and sends it 
// to the UVM driver.
//
// This sequence constructs and randomizes a apb_m_transaction.
// 
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class apb_m_random_sequence #(
      int APB_ADDR_WIDTH = 32,
      int APB_DATA_WIDTH = 32,
      int STRB_LEN = APB_ADDR_WIDTH/8
      )
  extends apb_m_sequence_base #(
      .APB_ADDR_WIDTH(APB_ADDR_WIDTH),
      .APB_DATA_WIDTH(APB_DATA_WIDTH),
      .STRB_LEN(STRB_LEN)
      );

  `uvm_object_param_utils( apb_m_random_sequence #(
                           APB_ADDR_WIDTH,
                           APB_DATA_WIDTH,
                           STRB_LEN
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
      req=apb_m_transaction#(
                .APB_ADDR_WIDTH(APB_ADDR_WIDTH),
                .APB_DATA_WIDTH(APB_DATA_WIDTH),
                .STRB_LEN(STRB_LEN)
                )::type_id::create("req");
      start_item(req);
      // Randomize the transaction
      if(!req.randomize()) `uvm_fatal("SEQ", "apb_m_random_sequence::body()-apb_m_transaction randomization failed")
      // Send the transaction to the apb_m_driver_bfm via the sequencer and apb_m_driver.
      finish_item(req);
      `uvm_info("SEQ", {"Response:",req.convert2string()},UVM_MEDIUM)

  endtask

endclass: apb_m_random_sequence

// pragma uvmf custom external begin
// pragma uvmf custom external end

