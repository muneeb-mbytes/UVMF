`ifndef __ADD_FIXED_SEQUENCE
`define __ADD_FIXED_SEQUENCE

`include "uvm_macros.svh"

class add_fixed_sequence #(int add_width = 4) extends add_ben_bench_sequence_base;

  `uvm_object_utils(add_fixed_sequence)

  function new(string name = "add_fixed_sequence");
    super.new(name);
  endfunction : new

  virtual task body();
  add_in_agent_fixed_seq = add_in_fixed_sequence#()::type_id::create("add_in_agent_fixed_seq");

  add_in_agent_config.wait_for_reset();
 // add_in_agent_config.wait_for_num_clocks(10);

  add_in_agent_fixed_seq.start(add_in_agent_sequencer);

 // add_in_agent_config.wait_for_num_clocks(50);

endtask

endclass : add_fixed_sequence

`endif
