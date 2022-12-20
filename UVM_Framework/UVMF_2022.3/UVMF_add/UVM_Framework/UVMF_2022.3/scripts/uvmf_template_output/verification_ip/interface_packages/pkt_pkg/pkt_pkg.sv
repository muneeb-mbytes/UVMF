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
//    - <pkt_typedefs_hdl>
//    - <pkt_typedefs.svh>
//    - <pkt_transaction.svh>

//    - <pkt_configuration.svh>
//    - <pkt_driver.svh>
//    - <pkt_monitor.svh>

//    - <pkt_transaction_coverage.svh>
//    - <pkt_sequence_base.svh>
//    - <pkt_random_sequence.svh>

//    - <pkt_responder_sequence.svh>
//    - <pkt2reg_adapter.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package pkt_pkg;
  
   import uvm_pkg::*;
   import uvmf_base_pkg_hdl::*;
   import uvmf_base_pkg::*;
   import pkt_pkg_hdl::*;

   `include "uvm_macros.svh"

   // pragma uvmf custom package_imports_additional begin 
   // pragma uvmf custom package_imports_additional end
   `include "src/pkt_macros.svh"

   export pkt_pkg_hdl::*;
   
   import "DPI-C" context function void hello_world_from_interface (input int unsigned variable1  ,input int unsigned variable2  );
   import "DPI-C" context function void good_bye_world_from_interface (input int unsigned variable3  ,input int unsigned variable4  );
 

   // Parameters defined as HVL parameters

   `include "src/pkt_typedefs.svh"
   `include "src/pkt_transaction.svh"

   `include "src/pkt_configuration.svh"
   `include "src/pkt_driver.svh"
   `include "src/pkt_monitor.svh"

   `include "src/pkt_transaction_coverage.svh"
   `include "src/pkt_sequence_base.svh"
   `include "src/pkt_random_sequence.svh"

   `include "src/pkt_responder_sequence.svh"
   `include "src/pkt2reg_adapter.svh"

   `include "src/pkt_agent.svh"

   // pragma uvmf custom package_item_additional begin
   // UVMF_CHANGE_ME : When adding new interface sequences to the src directory
   //    be sure to add the sequence file here so that it will be
   //    compiled as part of the interface package.  Be sure to place
   //    the new sequence after any base sequences of the new sequence.
   // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

