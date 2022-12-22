class custom_driver_conflict extends uvm_custom_driver_conflict#(transaction);

  `uvm_component_utils(custom_driver_conflict)

  function new(input string name="custom_driver_conflict",uvm_component parent = null);
       super.new(name,parent);
     endfunction

     virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
      endfunction

endclass :custom_driver_conflict 
