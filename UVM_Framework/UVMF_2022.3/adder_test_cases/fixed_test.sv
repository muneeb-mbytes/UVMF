`include "uvm_macros.svh"

class add_fixed_test extends test_top;

  `uvm_component_utils(add_fixed_test) 

  function new(string name = "add_fixed_test", uvm_component parent = null );
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase );
    add_bench_sequence_base::type_id::set_type_override(add_fixed_sequence::get_type());
    super.build_phase(phase);
  endfunction : build_phase

endclass : add_fixed_test
