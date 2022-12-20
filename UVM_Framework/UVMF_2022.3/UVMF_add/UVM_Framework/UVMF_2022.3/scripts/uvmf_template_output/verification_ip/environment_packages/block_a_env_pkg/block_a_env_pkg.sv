//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// PACKAGE: This file defines all of the files contained in the
//    environment package that will run on the host simulator.
//
// CONTAINS:
//     - <block_a_configuration.svh>
//     - <block_a_environment.svh>
//     - <block_a_env_sequence_base.svh>
//     - <block_a_predictor.svh>
//     - <block_a_coverage.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package block_a_env_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import uvmf_base_pkg::*;
  import mem_pkg::*;
  import mem_pkg_hdl::*;
  import pkt_pkg::*;
  import pkt_pkg_hdl::*;
 
  `uvm_analysis_imp_decl(_control_plane_in_ae)
  `uvm_analysis_imp_decl(_secure_data_plane_in_ae)

  // pragma uvmf custom package_imports_additional begin
  // pragma uvmf custom package_imports_additional end

  // Parameters defined as HVL parameters

  `include "src/block_a_env_typedefs.svh"
  `include "src/block_a_env_configuration.svh"
  `include "src/block_a_predictor.svh"
  `include "src/block_a_coverage.svh"
  `include "src/block_a_environment.svh"
  `include "src/block_a_env_sequence_base.svh"

  // pragma uvmf custom package_item_additional begin
  // UVMF_CHANGE_ME : When adding new environment level sequences to the src directory
  //    be sure to add the sequence file here so that it will be
  //    compiled as part of the environment package.  Be sure to place
  //    the new sequence after any base sequence of the new sequence.
  // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

