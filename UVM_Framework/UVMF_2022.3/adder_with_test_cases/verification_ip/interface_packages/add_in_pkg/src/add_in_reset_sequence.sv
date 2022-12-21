class add_in_reset_sequence #(int add_width = 4) extends add_in_sequence_base #(.add_width(add_width));

  `uvm_object_param_utils( add_in_reset_sequence #(add_width))

  function new(string name = "add_in_reset_sequence");
    super.new(name);
  endfunction: new

  task body();
      begin
        req=add_in_transaction#(.add_width(add_width))::type_id::create("req");
        start_item(req);
        if(!req.randomize()) `uvm_fatal("SEQ", "add_in_reset_sequence::body()-add_in_transaction randomization failed")
          req.rst=0;
        finish_item(req);
        `uvm_info("SEQ", {"Response:",req.convert2string()},UVM_MEDIUM)
        end

   endtask

endclass: add_in_reset_sequence

