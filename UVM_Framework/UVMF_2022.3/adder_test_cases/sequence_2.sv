`include "uvm_macros.svh"

class sequence_2_fixed extends add_bench_sequence_base;


  `uvm_object_utils(sequence_2_fixed)
  
  typedef add_in_reset_sequence add_in_reset_sequence_t;
  add_in_reset_sequence_t add_in_reset_s;

  function new(string name="sequence_2_fixed");
    super.new(name);
  endfunction

  virtual task body();
   add_in_reset_s = add_in_reset_sequence#() ::type_id::create("add_in_reset_s"); 
   add_in_fixed = add_in_fixed_sequence#() ::type_id::create("add_in_reset_s"); 

   add_in_reset_s.start(add_in_agent_sequencer);
   add_in_fixed.start(add_in_agent_sequencer);
  endtask

endclass
