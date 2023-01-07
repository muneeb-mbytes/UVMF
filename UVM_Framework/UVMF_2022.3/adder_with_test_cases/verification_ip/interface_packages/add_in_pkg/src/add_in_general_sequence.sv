class add_in_general_sequence #(
      int add_width = 4
      )
  extends add_in_sequence_base #(
      .add_width(add_width)
      );

  `uvm_object_param_utils( add_in_general_sequence #(
                           add_width
                           ))

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  //*****************************************************************
  function new(string name = "add_in_general_sequence");
    super.new(name);
  endfunction: new

  // ****************************************************************************
  // TASK : body()
  // This task is automatically executed when this sequence is started using the 
  // start(sequencerHandle) task.
  //
  task body();
  
      req=add_in_transaction#(
                .add_width(add_width)
                )::type_id::create("req");
      start_item(req);
        req.a=5;
        req.b=10;
      finish_item(req);
      `uvm_info("SEQ", {"Response1:",req.convert2string()},UVM_MEDIUM)
      start_item(req);
        req.rst=0;
      finish_item(req);
      `uvm_info("SEQ", {"Response2:",req.convert2string()},UVM_MEDIUM)
      start_item(req);
      if(!req.generalize()) `uvm_fatal("SEQ", "add_in_general_sequence::body()-add_in_transaction generalization failed")
      finish_item(req);
      `uvm_info("SEQ", {"Response3:",req.convert2string()},UVM_MEDIUM)

  endtask

endclass: add_in_general_sequence

// pragma uvmf custom external begin
// pragma uvmf custom external end

