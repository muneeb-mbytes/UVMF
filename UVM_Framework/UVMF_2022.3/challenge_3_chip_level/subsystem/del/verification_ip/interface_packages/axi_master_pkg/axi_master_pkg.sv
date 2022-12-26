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
//    - <axi_master_typedefs_hdl>
//    - <axi_master_typedefs.svh>
//    - <axi_master_transaction.svh>

//    - <axi_master_configuration.svh>
//    - <axi_master_driver.svh>
//    - <axi_master_monitor.svh>

//    - <axi_master_transaction_coverage.svh>
//    - <axi_master_sequence_base.svh>
//    - <axi_master_random_sequence.svh>

//    - <axi_master_responder_sequence.svh>
//    - <axi_master2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package axi_master_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import axi_master_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end

   export axi_master_pkg_hdl::*;
   
 

   // Parameters defined as HVL parameters

   `include "src/axi_master_typedefs.svh"
   `include "src/axi_master_transaction.svh"

   `include "src/axi_master_configuration.svh"
   `include "src/axi_master_driver.svh"
   `include "src/axi_master_monitor.svh"

   `include "src/axi_master_transaction_coverage.svh"
   `include "src/axi_master_sequence_base.svh"
   `include "src/axi_master_random_sequence.svh"

   `include "src/axi_master_responder_sequence.svh"
   `include "src/axi_master2reg_adapter.svh"

   `include "src/axi_master_agent.svh"

   // pragma uvmf custom package_item_additional begin
   // UVMF_CHANGE_ME : When adding new interface sequences to the src directory
   //    be sure to add the sequence file here so that it will be
   //    compiled as part of the interface package.  Be sure to place
   //    the new sequence after any base sequences of the new sequence.
   // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

