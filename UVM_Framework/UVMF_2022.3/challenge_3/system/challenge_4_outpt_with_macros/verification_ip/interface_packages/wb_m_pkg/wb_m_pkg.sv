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
//    - <wb_m_typedefs_hdl>
//    - <wb_m_typedefs.svh>
//    - <wb_m_transaction.svh>

//    - <wb_m_configuration.svh>
//    - <wb_m_driver.svh>
//    - <wb_m_monitor.svh>

//    - <wb_m_transaction_coverage.svh>
//    - <wb_m_sequence_base.svh>
//    - <wb_m_random_sequence.svh>

//    - <wb_m_responder_sequence.svh>
//    - <wb_m2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
`ifndef WB_M_PKG
`define WB_M_PKG
package wb_m_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import wb_m_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end
   `include "src/wb_m_macros.svh"

   export wb_m_pkg_hdl::*;
   
 

   // Parameters defined as HVL parameters

   `include "src/wb_m_typedefs.svh"
   `include "src/wb_m_transaction.svh"

   `include "src/wb_m_configuration.svh"
   `include "src/wb_m_driver.svh"
   `include "src/wb_m_monitor.svh"

   `include "src/wb_m_transaction_coverage.svh"
   `include "src/wb_m_sequence_base.svh"
   `include "src/wb_m_random_sequence.svh"

   `include "src/wb_m_responder_sequence.svh"
   `include "src/wb_m2reg_adapter.svh"

   `include "src/wb_m_agent.svh"

   // pragma uvmf custom package_item_additional begin
   // UVMF_CHANGE_ME : When adding new interface sequences to the src directory
   //    be sure to add the sequence file here so that it will be
   //    compiled as part of the interface package.  Be sure to place
   //    the new sequence after any base sequences of the new sequence.
   // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end
`endif
