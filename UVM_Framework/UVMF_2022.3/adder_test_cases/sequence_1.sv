`include "uvm_macros.svh"

class sequence_1_reset extends add_bench_sequence_base;


  `uvm_object_utils(sequence_1_reset)
  
  typedef add_in_reset_sequence add_in_reset_sequence_t;
  add_in_reset_sequence_t add_in_reset_s;

  function new(string name="sequence_1_reset");
    super.new(name);
  endfunction

  virtual task body();
   add_in_reset_s = add_in_reset_sequence#() ::type_id::create("add_in_reset_s"); 

   add_in_reset_s.start(add_in_agent_sequencer);
  endtask

endclass
