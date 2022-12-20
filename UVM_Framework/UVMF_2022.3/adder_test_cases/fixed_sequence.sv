class add_in_fixed extends add_in_sequence_base;
  
  function new(string name = "add_in_fixed");
    super.new(name);
  endfunction: new

  task body();
    req=add_in_transaction ::type_id::create("req");
    start_item(req);
    if(!req.randomize()) `uvm_fatal("SEQ", "add_in_fixed randomization failed")
     req.a=5;
     req.b=6;
    finish_item(req);
    `uvm_info("SEQ", {"Response:",req.convert2string()},UVM_MEDIUM)

  endtask
endclass
