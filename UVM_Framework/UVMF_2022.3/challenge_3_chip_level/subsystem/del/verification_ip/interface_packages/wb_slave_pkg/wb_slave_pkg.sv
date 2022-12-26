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
//    - <wb_slave_typedefs_hdl>
//    - <wb_slave_typedefs.svh>
//    - <wb_slave_transaction.svh>

//    - <wb_slave_configuration.svh>
//    - <wb_slave_driver.svh>
//    - <wb_slave_monitor.svh>

//    - <wb_slave_transaction_coverage.svh>
//    - <wb_slave_sequence_base.svh>
//    - <wb_slave_random_sequence.svh>

//    - <wb_slave_responder_sequence.svh>
//    - <wb_slave2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package wb_slave_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import wb_slave_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end

   export wb_slave_pkg_hdl::*;
   
 

   // Parameters defined as HVL parameters

   `include "src/wb_slave_typedefs.svh"
   `include "src/wb_slave_transaction.svh"

   `include "src/wb_slave_configuration.svh"
   `include "src/wb_slave_driver.svh"
   `include "src/wb_slave_monitor.svh"

   `include "src/wb_slave_transaction_coverage.svh"
   `include "src/wb_slave_sequence_base.svh"
   `include "src/wb_slave_random_sequence.svh"

   `include "src/wb_slave_responder_sequence.svh"
   `include "src/wb_slave2reg_adapter.svh"

   `include "src/wb_slave_agent.svh"

   // pragma uvmf custom package_item_additional begin
   // UVMF_CHANGE_ME : When adding new interface sequences to the src directory
   //    be sure to add the sequence file here so that it will be
   //    compiled as part of the interface package.  Be sure to place
   //    the new sequence after any base sequences of the new sequence.
   // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

