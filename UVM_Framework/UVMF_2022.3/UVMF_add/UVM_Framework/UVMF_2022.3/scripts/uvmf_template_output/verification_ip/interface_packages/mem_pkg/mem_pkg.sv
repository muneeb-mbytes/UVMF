//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// PACKAGE: This file defines all of the files contained in the
//    interface package that will run on the host simulator.
//
// CONTAINS:
//    - <mem_typedefs_hdl>
//    - <mem_typedefs.svh>
//    - <mem_transaction.svh>

//    - <mem_configuration.svh>
//    - <mem_driver.svh>
//    - <mem_monitor.svh>

//    - <mem_transaction_coverage.svh>
//    - <mem_sequence_base.svh>
//    - <mem_random_sequence.svh>

//    - <mem_responder_sequence.svh>
//    - <mem2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package mem_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import mem_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end
   `include "src/mem_macros.svh"

   export mem_pkg_hdl::*;
   
 

   // Parameters defined as HVL parameters
   parameter integer MEM_HVL_PKG_PARAMETER1 = 21;
   parameter integer MEM_HVL_PKG_PARAMETER2 = 22;

   `include "src/mem_typedefs.svh"
   `include "src/mem_transaction.svh"

   `include "src/mem_configuration.svh"
   `include "src/mem_driver.svh"
   `include "src/mem_monitor.svh"

   `include "src/mem_transaction_coverage.svh"
   `include "src/mem_sequence_base.svh"
   `include "src/mem_random_sequence.svh"

   `include "src/mem_responder_sequence.svh"
   `include "src/mem2reg_adapter.svh"

   `include "src/mem_agent.svh"

   // pragma uvmf custom package_item_additional begin
   // UVMF_CHANGE_ME : When adding new interface sequences to the src directory
   //    be sure to add the sequence file here so that it will be
   //    compiled as part of the interface package.  Be sure to place
   //    the new sequence after any base sequences of the new sequence.
   // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

