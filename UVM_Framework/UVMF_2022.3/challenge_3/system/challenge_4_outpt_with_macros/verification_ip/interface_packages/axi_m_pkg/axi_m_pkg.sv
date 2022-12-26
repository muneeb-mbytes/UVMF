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
//    - <axi_m_typedefs_hdl>
//    - <axi_m_typedefs.svh>
//    - <axi_m_transaction.svh>

//    - <axi_m_configuration.svh>
//    - <axi_m_driver.svh>
//    - <axi_m_monitor.svh>

//    - <axi_m_transaction_coverage.svh>
//    - <axi_m_sequence_base.svh>
//    - <axi_m_random_sequence.svh>

//    - <axi_m_responder_sequence.svh>
//    - <axi_m2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
`ifndef AXI_M_PKG
`define AXI_M_PKG
package axi_m_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import axi_m_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end
   `include "src/axi_m_macros.svh"

   export axi_m_pkg_hdl::*;
   
 

   // Parameters defined as HVL parameters

   `include "src/axi_m_typedefs.svh"
   `include "src/axi_m_transaction.svh"

   `include "src/axi_m_configuration.svh"
   `include "src/axi_m_driver.svh"
   `include "src/axi_m_monitor.svh"

   `include "src/axi_m_transaction_coverage.svh"
   `include "src/axi_m_sequence_base.svh"
   `include "src/axi_m_random_sequence.svh"

   `include "src/axi_m_responder_sequence.svh"
   `include "src/axi_m2reg_adapter.svh"

   `include "src/axi_m_agent.svh"

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
