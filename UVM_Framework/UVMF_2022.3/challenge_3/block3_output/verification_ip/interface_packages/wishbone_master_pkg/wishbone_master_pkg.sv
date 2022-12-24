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
//    - <wishbone_master_typedefs_hdl>
//    - <wishbone_master_typedefs.svh>
//    - <wishbone_master_transaction.svh>

//    - <wishbone_master_configuration.svh>
//    - <wishbone_master_driver.svh>
//    - <wishbone_master_monitor.svh>

//    - <wishbone_master_transaction_coverage.svh>
//    - <wishbone_master_sequence_base.svh>
//    - <wishbone_master_random_sequence.svh>

//    - <wishbone_master_responder_sequence.svh>
//    - <wishbone_master2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package wishbone_master_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import wishbone_master_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end
   `include "src/wishbone_master_macros.svh"

   export wishbone_master_pkg_hdl::*;
   
 

   // Parameters defined as HVL parameters

   `include "src/wishbone_master_typedefs.svh"
   `include "src/wishbone_master_transaction.svh"

   `include "src/wishbone_master_configuration.svh"
   `include "src/wishbone_master_driver.svh"
   `include "src/wishbone_master_monitor.svh"

   `include "src/wishbone_master_transaction_coverage.svh"
   `include "src/wishbone_master_sequence_base.svh"
   `include "src/wishbone_master_random_sequence.svh"

   `include "src/wishbone_master_responder_sequence.svh"
   `include "src/wishbone_master2reg_adapter.svh"

   `include "src/wishbone_master_agent.svh"

   // pragma uvmf custom package_item_additional begin
   // UVMF_CHANGE_ME : When adding new interface sequences to the src directory
   //    be sure to add the sequence file here so that it will be
   //    compiled as part of the interface package.  Be sure to place
   //    the new sequence after any base sequences of the new sequence.
   // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

