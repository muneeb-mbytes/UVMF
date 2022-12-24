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
//    - <wb_s_typedefs_hdl>
//    - <wb_s_typedefs.svh>
//    - <wb_s_transaction.svh>

//    - <wb_s_configuration.svh>
//    - <wb_s_driver.svh>
//    - <wb_s_monitor.svh>

//    - <wb_s_transaction_coverage.svh>
//    - <wb_s_sequence_base.svh>
//    - <wb_s_random_sequence.svh>

//    - <wb_s_responder_sequence.svh>
//    - <wb_s2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package wb_s_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import wb_s_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end
   `include "src/wb_s_macros.svh"

   export wb_s_pkg_hdl::*;
   
 

   // Parameters defined as HVL parameters

   `include "src/wb_s_typedefs.svh"
   `include "src/wb_s_transaction.svh"

   `include "src/wb_s_configuration.svh"
   `include "src/wb_s_driver.svh"
   `include "src/wb_s_monitor.svh"

   `include "src/wb_s_transaction_coverage.svh"
   `include "src/wb_s_sequence_base.svh"
   `include "src/wb_s_random_sequence.svh"

   `include "src/wb_s_responder_sequence.svh"
   `include "src/wb_s2reg_adapter.svh"

   `include "src/wb_s_agent.svh"

   // pragma uvmf custom package_item_additional begin
   // UVMF_CHANGE_ME : When adding new interface sequences to the src directory
   //    be sure to add the sequence file here so that it will be
   //    compiled as part of the interface package.  Be sure to place
   //    the new sequence after any base sequences of the new sequence.
   // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

