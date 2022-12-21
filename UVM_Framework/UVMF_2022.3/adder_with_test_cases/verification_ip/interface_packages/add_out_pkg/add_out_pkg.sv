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
//    - <add_out_typedefs_hdl>
//    - <add_out_typedefs.svh>
//    - <add_out_transaction.svh>

//    - <add_out_configuration.svh>
//    - <add_out_driver.svh>
//    - <add_out_monitor.svh>

//    - <add_out_transaction_coverage.svh>
//    - <add_out_sequence_base.svh>
//    - <add_out_random_sequence.svh>

//    - <add_out_responder_sequence.svh>
//    - <add_out2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package add_out_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import add_out_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end

   export add_out_pkg_hdl::*;
   
 

   // Parameters defined as HVL parameters

   `include "src/add_out_typedefs.svh"
   `include "src/add_out_transaction.svh"

   `include "src/add_out_configuration.svh"
   `include "src/add_out_driver.svh"
   `include "src/add_out_monitor.svh"

   `include "src/add_out_transaction_coverage.svh"
   `include "src/add_out_sequence_base.svh"
   `include "src/add_out_random_sequence.svh"

   `include "src/add_out_responder_sequence.svh"
   `include "src/add_out2reg_adapter.svh"

   `include "src/add_out_agent.svh"

   // pragma uvmf custom package_item_additional begin
   // UVMF_CHANGE_ME : When adding new interface sequences to the src directory
   //    be sure to add the sequence file here so that it will be
   //    compiled as part of the interface package.  Be sure to place
   //    the new sequence after any base sequences of the new sequence.
   // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

