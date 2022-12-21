`include "uvm_macros.svh"

class add_random_sequence extends add_bench_sequence_base;

  `uvm_object_utils(add_random_sequence) 

  function new(string name = "add_random_sequence");
    super.new(name);
  endfunction : new

  virtual task body();
  add_random_seq = add_random_sequence#()::type_id::create("add_agent_random_seq");
  
  add_agent_config.wait_for_reset();
  add_agent_config.wait_for_num_clocks(10);

  repeat (10) add_agent_random_seq.start(add_agent_sequencer);

  add_agent_config.wait_for_num_clocks(10);    

endtask

endclass : ALU_random_sequence
