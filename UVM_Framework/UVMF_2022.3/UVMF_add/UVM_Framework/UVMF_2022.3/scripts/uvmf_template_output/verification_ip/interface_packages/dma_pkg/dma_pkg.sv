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
//    - <dma_typedefs_hdl>
//    - <dma_typedefs.svh>
//    - <dma_transaction.svh>

//    - <dma_configuration.svh>
//    - <dma_driver.svh>
//    - <dma_monitor.svh>

//    - <dma_transaction_coverage.svh>
//    - <dma_sequence_base.svh>
//    - <dma_random_sequence.svh>

//    - <dma_responder_sequence.svh>
//    - <dma2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package dma_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import dma_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end
   `include "src/dma_macros.svh"

   export dma_pkg_hdl::*;
   
 

   // Parameters defined as HVL parameters

   `include "src/dma_typedefs.svh"
   `include "src/dma_transaction.svh"

   `include "src/dma_configuration.svh"
   `include "src/dma_driver.svh"
   `include "src/dma_monitor.svh"

   `include "src/dma_transaction_coverage.svh"
   `include "src/dma_sequence_base.svh"
   `include "src/dma_random_sequence.svh"

   `include "src/dma_responder_sequence.svh"
   `include "src/dma2reg_adapter.svh"

   `include "src/dma_agent.svh"

   // pragma uvmf custom package_item_additional begin
   // UVMF_CHANGE_ME : When adding new interface sequences to the src directory
   //    be sure to add the sequence file here so that it will be
   //    compiled as part of the interface package.  Be sure to place
   //    the new sequence after any base sequences of the new sequence.
   // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

