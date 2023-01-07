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
//    - <spi_m_typedefs_hdl>
//    - <spi_m_typedefs.svh>
//    - <spi_m_transaction.svh>

//    - <spi_m_configuration.svh>
//    - <spi_m_driver.svh>
//    - <spi_m_monitor.svh>

//    - <spi_m_transaction_coverage.svh>
//    - <spi_m_sequence_base.svh>
//    - <spi_m_random_sequence.svh>

//    - <spi_m_responder_sequence.svh>
//    - <spi_m2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package spi_m_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import spi_m_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end
   `include "src/spi_m_macros.svh"

   export spi_m_pkg_hdl::*;
   
 

   // Parameters defined as HVL parameters

   `include "src/spi_m_typedefs.svh"
   `include "src/spi_m_transaction.svh"

   `include "src/spi_m_configuration.svh"
   `include "src/spi_m_driver.svh"
   `include "src/spi_m_monitor.svh"

   `include "src/spi_m_transaction_coverage.svh"
   `include "src/spi_m_sequence_base.svh"
   `include "src/spi_m_random_sequence.svh"

   `include "src/spi_m_responder_sequence.svh"
   `include "src/spi_m2reg_adapter.svh"

   `include "src/spi_m_agent.svh"

   // pragma uvmf custom package_item_additional begin
   // UVMF_CHANGE_ME : When adding new interface sequences to the src directory
   //    be sure to add the sequence file here so that it will be
   //    compiled as part of the interface package.  Be sure to place
   //    the new sequence after any base sequences of the new sequence.
   // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

