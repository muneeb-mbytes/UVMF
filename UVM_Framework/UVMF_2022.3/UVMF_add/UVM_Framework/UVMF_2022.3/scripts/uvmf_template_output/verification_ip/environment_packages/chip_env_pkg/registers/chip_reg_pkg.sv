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

package chip_reg_pkg;

   import uvm_pkg::*;
   import blkb_reg_pkg::*;
// pragma uvmf custom additional_imports begin
// pragma uvmf custom additional_imports end

   `include "uvm_macros.svh"

   /* DEFINE REGISTER CLASSES */
// pragma uvmf custom define_register_classes begin
// pragma uvmf custom define_register_classes end

// pragma uvmf custom define_block_map_coverage_class begin
// pragma uvmf custom define_block_map_coverage_class end

   //--------------------------------------------------------------------
   // Class: chip_reg_model
   // 
   //--------------------------------------------------------------------
   class chip_reg_model extends uvm_reg_block;
      `uvm_object_utils(chip_reg_model)
// pragma uvmf custom instantiate_registers_within_block begin
// pragma uvmf custom instantiate_registers_within_block end

      blkb_reg_block block_b_env_rm;

      // Function: new
      // 
      function new(string name = "");
         super.new(name, build_coverage(UVM_CVR_ALL));
      endfunction

      // Function: build
      // 
      virtual function void build();

// pragma uvmf custom construct_configure_build_registers_within_block begin
// pragma uvmf custom construct_configure_build_registers_within_block end

         block_b_env_rm = new("block_b_env_rm");
         block_b_env_rm.build();
         add_block(block_b_env_rm);
 
      endfunction


   endclass

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

