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
//    - <spi_slave_typedefs_hdl>
//    - <spi_slave_typedefs.svh>
//    - <spi_slave_transaction.svh>

//    - <spi_slave_configuration.svh>
//    - <spi_slave_driver.svh>
//    - <spi_slave_monitor.svh>

//    - <spi_slave_transaction_coverage.svh>
//    - <spi_slave_sequence_base.svh>
//    - <spi_slave_random_sequence.svh>

//    - <spi_slave_responder_sequence.svh>
//    - <spi_slave2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package spi_slave_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import spi_slave_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end

   export spi_slave_pkg_hdl::*;
   
 

   // Parameters defined as HVL parameters

   `include "src/spi_slave_typedefs.svh"
   `include "src/spi_slave_transaction.svh"

   `include "src/spi_slave_configuration.svh"
   `include "src/spi_slave_driver.svh"
   `include "src/spi_slave_monitor.svh"

   `include "src/spi_slave_transaction_coverage.svh"
   `include "src/spi_slave_sequence_base.svh"
   `include "src/spi_slave_random_sequence.svh"

   `include "src/spi_slave_responder_sequence.svh"
   `include "src/spi_slave2reg_adapter.svh"

   `include "src/spi_slave_agent.svh"

   // pragma uvmf custom package_item_additional begin
   // UVMF_CHANGE_ME : When adding new interface sequences to the src directory
   //    be sure to add the sequence file here so that it will be
   //    compiled as part of the interface package.  Be sure to place
   //    the new sequence after any base sequences of the new sequence.
   // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

