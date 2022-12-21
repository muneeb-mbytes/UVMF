`ifndef __ADD_RANDOM_SEQUENCE
`define __ADD_RANDOM_SEQUENCE

`include "uvm_macros.svh"

class add_random_sequence #(int add_width = 4) extends add_ben_bench_sequence_base;

  `uvm_object_utils(add_random_sequence)

  function new(string name = "add_random_sequence");
    super.new(name);
  endfunction : new

  virtual task body();
  add_in_agent_random_seq = add_in_random_sequence#()::type_id::create("add_in_agent_random_seq");

  add_in_agent_config.wait_for_reset();
 // add_in_agent_config.wait_for_num_clocks(10);

  add_in_agent_random_seq.start(add_in_agent_sequencer);

 // add_in_agent_config.wait_for_num_clocks(50);

endtask

endclass : add_random_sequence

`endif

