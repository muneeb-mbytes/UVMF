
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
//    - <spi_s_typedefs_hdl>
//    - <spi_s_typedefs.svh>
//    - <spi_s_transaction.svh>

//    - <spi_s_configuration.svh>
//    - <spi_s_driver.svh>
//    - <spi_s_monitor.svh>

//    - <spi_s_transaction_coverage.svh>
//    - <spi_s_sequence_base.svh>
//    - <spi_s_random_sequence.svh>

//    - <spi_s_responder_sequence.svh>
//    - <spi_s2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
`ifndef SPI_S_INCLUDED_
`define SPI_S_INCLUDED_
package spi_s_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import spi_s_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end
   `include "src/spi_s_macros.svh"

   export spi_s_pkg_hdl::*;
   
 

   // Parameters defined as HVL parameters

   `include "src/spi_s_typedefs.svh"
   `include "src/spi_s_transaction.svh"

   `include "src/spi_s_configuration.svh"
   `include "src/spi_s_driver.svh"
   `include "src/spi_s_monitor.svh"

   `include "src/spi_s_transaction_coverage.svh"
   `include "src/spi_s_sequence_base.svh"
   `include "src/spi_s_random_sequence.svh"

   `include "src/spi_s_responder_sequence.svh"
   `include "src/spi_s2reg_adapter.svh"

   `include "src/spi_s_agent.svh"

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
