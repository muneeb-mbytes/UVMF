`ifndef __add_reset_SEQUENCE
`define __add_reset_SEQUENCE

`include "uvm_macros.svh"

class add_reset_sequence #(int add_width = 4) extends add_ben_bench_sequence_base;

  `uvm_object_utils(add_reset_sequence)

  typedef add_in_reset_sequence #(add_width) add_in_reset_sequence_t;
  add_in_reset_sequence_t add_in_reset_s;

  function new(string name = "add_reset_sequence");
    super.new(name);
  endfunction : new

  virtual task body();
  add_in_reset_s = add_in_reset_sequence#()::type_id::create("add_in_reset_seq");

    add_in_agent_config.wait_for_reset();
  //add_in_agent_config.wait_for_num_clocks(10);

  add_in_reset_s.start(add_in_agent_sequencer);

 //  add_in_agent_config.wait_for_num_clocks(50);

endtask
endclass : add_reset_sequence

`endif

