//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This sequences randomizes the axi_master transaction and sends it 
// to the UVM driver.
//
// This sequence constructs and randomizes a axi_master_transaction.
// 
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class axi_master_random_sequence #(
      int id_width = 4,
      int len_width = 4,
      int size_width = 3,
      int addr_width = 32,
      int burst_width = 2,
      int data_width = 32,
      int strb_width = 4,
      int resp_width = 2
      )
  extends axi_master_sequence_base #(
      .id_width(id_width),
      .len_width(len_width),
      .size_width(size_width),
      .addr_width(addr_width),
      .burst_width(burst_width),
      .data_width(data_width),
      .strb_width(strb_width),
      .resp_width(resp_width)
      );

  `uvm_object_param_utils( axi_master_random_sequence #(
                           id_width,
                           len_width,
                           size_width,
                           addr_width,
                           burst_width,
                           data_width,
                           strb_width,
                           resp_width
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
      req=axi_master_transaction#(
                .id_width(id_width),
                .len_width(len_width),
                .size_width(size_width),
                .addr_width(addr_width),
                .burst_width(burst_width),
                .data_width(data_width),
                .strb_width(strb_width),
                .resp_width(resp_width)
                )::type_id::create("req");
      start_item(req);
      // Randomize the transaction
      if(!req.randomize()) `uvm_fatal("SEQ", "axi_master_random_sequence::body()-axi_master_transaction randomization failed")
      // Send the transaction to the axi_master_driver_bfm via the sequencer and axi_master_driver.
      finish_item(req);
      `uvm_info("SEQ", {"Response:",req.convert2string()},UVM_MEDIUM)

  endtask

endclass: axi_master_random_sequence

// pragma uvmf custom external begin
// pragma uvmf custom external end

