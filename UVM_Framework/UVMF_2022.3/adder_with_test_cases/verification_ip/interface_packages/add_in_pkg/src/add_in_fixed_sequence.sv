//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This sequences fixedizes the add_in transaction and sends it 
// to the UVM driver.
//
// This sequence constructs and fixedizes a add_in_transaction.
// 
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class add_in_fixed_sequence #(
      int add_width = 4
      )
  extends add_in_sequence_base #(
      .add_width(add_width)
      );

  `uvm_object_param_utils( add_in_fixed_sequence #(
                           add_width
                           ))

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  //*****************************************************************
  function new(string name = "add_in_fixed_sequence");
    super.new(name);
  endfunction: new

  // ****************************************************************************
  // TASK : body()
  // This task is automatically executed when this sequence is started using the 
  // start(sequencerHandle) task.
  //
  task body();
  
      // Construct the transaction
      req=add_in_transaction#(
                .add_width(add_width)
                )::type_id::create("req");
      start_item(req);
      req.a=4;
      req.b=7;
      finish_item(req);
      `uvm_info("SEQ", {"Response:",req.convert2string()},UVM_MEDIUM)

  endtask

endclass: add_in_fixed_sequence

// pragma uvmf custom external begin
// pragma uvmf custom external end

