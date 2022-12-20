//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//
//----------------------------------------------------------------------
// Placeholder for complete register model.  This placeholder allows
//  compilation of generated environment without modification.
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

package blkb_reg_pkg;

   import uvm_pkg::*;
// pragma uvmf custom additional_imports begin
// pragma uvmf custom additional_imports end

   `include "uvm_macros.svh"

   /* DEFINE REGISTER CLASSES */
// pragma uvmf custom define_register_classes begin
   //--------------------------------------------------------------------
   // Class: block_b_example_reg0
   // 
   //--------------------------------------------------------------------
   class block_b_example_reg0 extends uvm_reg;
      `uvm_object_utils(block_b_example_reg0)

      rand uvm_reg_field example_field; 

      // Function: new
      // 
      function new(string name = "block_b_example_reg0");
         super.new(name, 8, UVM_NO_COVERAGE);
      endfunction


      // Function: build
      // 
      virtual function void build();
         example_field = uvm_reg_field::type_id::create("example_field");
         example_field.configure(this, 8, 0, "RW", 0, 8'h00, 1, 1, 1);
      endfunction
   endclass

   //--------------------------------------------------------------------
   // Class: block_b_example_reg1
   // 
   //--------------------------------------------------------------------
   class block_b_example_reg1 extends uvm_reg;
      `uvm_object_utils(block_b_example_reg1)

      rand uvm_reg_field example_field; 

      // Function: new
      // 
      function new(string name = "block_b_example_reg1");
         super.new(name, 8, UVM_NO_COVERAGE);
      endfunction


      // Function: build
      // 
      virtual function void build();
         example_field = uvm_reg_field::type_id::create("example_field");
         example_field.configure(this, 8, 0, "RW", 0, 8'h00, 1, 1, 1);
      endfunction
   endclass
// pragma uvmf custom define_register_classes end

// pragma uvmf custom define_block_map_coverage_class begin
   //--------------------------------------------------------------------
   // Class: block_b_bus_map_coverage
   // 
   // Coverage for the 'bus_map' in 'block_b_reg_model'
   //--------------------------------------------------------------------
   class block_b_bus_map_coverage extends uvm_object;
      `uvm_object_utils(block_b_bus_map_coverage)

      covergroup ra_cov(string name) with function sample(uvm_reg_addr_t addr, bit is_read);

         option.per_instance = 1;
         option.name = name; 

         ADDR: coverpoint addr {
            bins example_reg0 = {'h0};
            bins example_reg1 = {'h1};
         }

         RW: coverpoint is_read {
            bins RD = {1};
            bins WR = {0};
         }

         ACCESS: cross ADDR, RW;

      endgroup: ra_cov

      function new(string name = "block_b_bus_map_coverage");
         ra_cov = new(name);
      endfunction: new

      function void sample(uvm_reg_addr_t offset, bit is_read);
         ra_cov.sample(offset, is_read);
      endfunction: sample

   endclass: block_b_bus_map_coverage
// pragma uvmf custom define_block_map_coverage_class end

   //--------------------------------------------------------------------
   // Class: blkb_reg_block
   // 
   //--------------------------------------------------------------------
   class blkb_reg_block extends uvm_reg_block;
      `uvm_object_utils(blkb_reg_block)
// pragma uvmf custom instantiate_registers_within_block begin
      rand block_b_example_reg0 example_reg0;
      rand block_b_example_reg1 example_reg1;
// pragma uvmf custom instantiate_registers_within_block end

      uvm_reg_map bus_map; 
      block_b_bus_map_coverage bus_map_cg;

      // Function: new
      // 
      function new(string name = "");
         super.new(name, build_coverage(UVM_CVR_ALL));
      endfunction

      // Function: build
      // 
      virtual function void build();
      bus_map = create_map("bus_map", 0, 4, UVM_LITTLE_ENDIAN);
      if(has_coverage(UVM_CVR_ADDR_MAP)) begin
         bus_map_cg = block_b_bus_map_coverage::type_id::create("bus_map_cg");
         bus_map_cg.ra_cov.set_inst_name(this.get_full_name());
         void'(set_coverage(UVM_CVR_ADDR_MAP));
      end


// pragma uvmf custom construct_configure_build_registers_within_block begin
      example_reg0 = block_b_example_reg0::type_id::create("example_reg0");
      example_reg0.configure(this, null, "example_reg0");
      example_reg0.build();
      example_reg1 = block_b_example_reg1::type_id::create("example_reg1");
      example_reg1.configure(this, null, "example_reg1");
      example_reg1.build();
// pragma uvmf custom construct_configure_build_registers_within_block end
// pragma uvmf custom add_registers_to_block_map begin
      bus_map.add_reg(example_reg0, 'h0, "RW");
      bus_map.add_reg(example_reg1, 'h1, "RW");
// pragma uvmf custom add_registers_to_block_map end

 
      endfunction

      // Function: sample
      // 
      function void sample(uvm_reg_addr_t offset, bit is_read, uvm_reg_map  map);
         if(get_coverage(UVM_CVR_ADDR_MAP)) begin
            if(map.get_name() == "bus_map_cg") begin
               bus_map_cg.sample(offset, is_read);
            end
         end
      endfunction: sample

   endclass

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

