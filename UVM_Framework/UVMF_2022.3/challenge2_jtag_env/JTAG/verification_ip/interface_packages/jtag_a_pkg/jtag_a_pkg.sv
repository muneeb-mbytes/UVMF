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
//    - <jtag_a_typedefs_hdl>
//    - <jtag_a_typedefs.svh>
//    - <jtag_a_transaction.svh>

//    - <jtag_a_configuration.svh>
//    - <jtag_a_driver.svh>
//    - <jtag_a_monitor.svh>

//    - <jtag_a_transaction_coverage.svh>
//    - <jtag_a_sequence_base.svh>
//    - <jtag_a_random_sequence.svh>

//    - <jtag_a_responder_sequence.svh>
//    - <jtag_a2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package jtag_a_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import jtag_a_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end
   `include "src/jtag_a_macros.svh"

   export jtag_a_pkg_hdl::*;
   
 

   // Parameters defined as HVL parameters

   `include "src/jtag_a_typedefs.svh"
   `include "src/jtag_a_transaction.svh"

   `include "src/jtag_a_configuration.svh"
   `include "src/jtag_a_driver.svh"
   `include "src/jtag_a_monitor.svh"

   `include "src/jtag_a_transaction_coverage.svh"
   `include "src/jtag_a_sequence_base.svh"
   `include "src/jtag_a_random_sequence.svh"

   `include "src/jtag_a_responder_sequence.svh"
   `include "src/jtag_a2reg_adapter.svh"

   `include "src/jtag_a_agent.svh"

   // pragma uvmf custom package_item_additional begin
   // UVMF_CHANGE_ME : When adding new interface sequences to the src directory
   //    be sure to add the sequence file here so that it will be
   //    compiled as part of the interface package.  Be sure to place
   //    the new sequence after any base sequences of the new sequence.
   // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

