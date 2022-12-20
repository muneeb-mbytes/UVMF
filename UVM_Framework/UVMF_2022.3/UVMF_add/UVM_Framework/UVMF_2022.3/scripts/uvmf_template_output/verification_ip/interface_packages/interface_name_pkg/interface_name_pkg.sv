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
//    - <interface_name_typedefs_hdl>
//    - <interface_name_typedefs.svh>
//    - <interface_name_transaction.svh>

//    - <interface_name_configuration.svh>
//    - <interface_name_driver.svh>
//    - <interface_name_monitor.svh>

//    - <interface_name_transaction_coverage.svh>
//    - <interface_name_sequence_base.svh>
//    - <interface_name_random_sequence.svh>

//    - <interface_name_responder_sequence.svh>
//    - <interface_name2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package interface_name_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import interface_name_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end
   `include "src/interface_name_macros.svh"

   export interface_name_pkg_hdl::*;
   
 

   // Parameters defined as HVL parameters

   `include "src/interface_name_typedefs.svh"
   `include "src/interface_name_transaction.svh"

   `include "src/interface_name_configuration.svh"
   `include "src/interface_name_driver.svh"
   `include "src/interface_name_monitor.svh"

   `include "src/interface_name_transaction_coverage.svh"
   `include "src/interface_name_sequence_base.svh"
   `include "src/interface_name_random_sequence.svh"

   `include "src/interface_name_responder_sequence.svh"
   `include "src/interface_name2reg_adapter.svh"

   `include "src/interface_name_agent.svh"

   // pragma uvmf custom package_item_additional begin
   // UVMF_CHANGE_ME : When adding new interface sequences to the src directory
   //    be sure to add the sequence file here so that it will be
   //    compiled as part of the interface package.  Be sure to place
   //    the new sequence after any base sequences of the new sequence.
   // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

