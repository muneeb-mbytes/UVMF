class add_in_reset_sequence extends add_in_sequence_base;
  
  function new(string name = "add_reset_sequence");
    super.new(name);
  endfunction: new

  task body();
    req=add_in_transaction ::type_id::create("req");
    start_item(req);
    if(!req.randomize()) `uvm_fatal("SEQ", "add_in_reset_sequence::body()-add_transaction randomization failed")
     // req.reset=1;
     req.op = rst_op;
    finish_item(req);
    `uvm_info("SEQ", {"Response:",req.convert2string()},UVM_MEDIUM)

  endtask
endclass
