`ifndef __ADD_GENERAL_SEQUENCE
`define __ADD_GENERAL_SEQUENCE

`include "uvm_macros.svh"

class add_general_sequence #(int add_width = 4) extends add_ben_bench_sequence_base;

  `uvm_object_utils(add_general_sequence)

  function new(string name = "add_general_sequence");
    super.new(name);
  endfunction : new

  virtual task body();
  add_in_agent_general_seq = add_in_general_sequence#()::type_id::create("add_in_agent_general_seq");

  add_in_agent_config.wait_for_reset();
 // add_in_agent_config.wait_for_num_clocks(10);

  add_in_agent_general_seq.start(add_in_agent_sequencer);

 // add_in_agent_config.wait_for_num_clocks(50);

endtask

endclass : add_general_sequence

`endif

