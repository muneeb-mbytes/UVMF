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
//    - <apb_typedefs_hdl>
//    - <apb_typedefs.svh>
//    - <apb_transaction.svh>

//    - <apb_configuration.svh>
//    - <apb_driver.svh>
//    - <apb_monitor.svh>

//    - <apb_transaction_coverage.svh>
//    - <apb_sequence_base.svh>
//    - <apb_random_sequence.svh>

//    - <apb_responder_sequence.svh>
//    - <apb2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package apb_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import apb_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end
   `include "src/apb_macros.svh"

   export apb_pkg_hdl::*;
   
 

   // Parameters defined as HVL parameters

   `include "src/apb_typedefs.svh"
   `include "src/apb_transaction.svh"

   `include "src/apb_configuration.svh"
   `include "src/apb_driver.svh" 

   `include "src/apb_monitor.svh"

   `include "src/apb_transaction_coverage.svh"
   `include "src/apb_sequence_base.svh"
   `include "src/apb_random_sequence.svh"

   `include "src/apb_responder_sequence.svh"
   `include "src/apb2reg_adapter.svh"

   `include "src/apb_agent.svh"

   // pragma uvmf custom package_item_additional begin
   // UVMF_CHANGE_ME : When adding new interface sequences to the src directory
   //    be sure to add the sequence file here so that it will be
   //    compiled as part of the interface package.  Be sure to place
   //    the new sequence after any base sequences of the new sequence.
   // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

