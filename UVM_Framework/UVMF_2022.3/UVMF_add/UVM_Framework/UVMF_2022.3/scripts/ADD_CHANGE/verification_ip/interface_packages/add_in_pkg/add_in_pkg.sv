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
//    - <add_in_typedefs_hdl>
//    - <add_in_typedefs.svh>
//    - <add_in_transaction.svh>

//    - <add_in_configuration.svh>
//    - <add_in_driver.svh>
//    - <add_in_monitor.svh>

//    - <add_in_transaction_coverage.svh>
//    - <add_in_sequence_base.svh>
//    - <add_in_random_sequence.svh>

//    - <add_in_responder_sequence.svh>
//    - <add_in2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package add_in_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import add_in_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end
   `include "src/add_in_macros.svh"

   export add_in_pkg_hdl::*;
   
 

   // Parameters defined as HVL parameters

   `include "src/add_in_typedefs.svh"
   `include "src/add_in_transaction.svh"

   `include "src/add_in_configuration.svh"
   `include "src/add_in_driver.svh"
   `include "src/add_in_monitor.svh"

   `include "src/add_in_transaction_coverage.svh"
   `include "src/add_in_sequence_base.svh"
   `include "src/add_in_random_sequence.svh"

   `include "src/add_in_responder_sequence.svh"
   `include "src/add_in2reg_adapter.svh"

   `include "src/add_in_agent.svh"

   // pragma uvmf custom package_item_additional begin
   // UVMF_CHANGE_ME : When adding new interface sequences to the src directory
   //    be sure to add the sequence file here so that it will be
   //    compiled as part of the interface package.  Be sure to place
   //    the new sequence after any base sequences of the new sequence.
   // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

