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
//     - <add_configuration.svh>
//     - <add_environment.svh>
//     - <add_env_sequence_base.svh>
//     - <add_predictor.svh>
//     - <add_scoreboard.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package add_env_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import uvmf_base_pkg::*;
  import add_in_pkg::*;
  import add_in_pkg_hdl::*;
  import add_out_pkg::*;
  import add_out_pkg_hdl::*;
 
  `uvm_analysis_imp_decl(_add_in_agent_ae)
  `uvm_analysis_imp_decl(_add_out_pred_sb_ae)
  `uvm_analysis_imp_decl(_add_out_ag_sb_ae)

  // pragma uvmf custom package_imports_additional begin
  // pragma uvmf custom package_imports_additional end

  // Parameters defined as HVL parameters

  `include "src/add_env_typedefs.svh"
  `include "src/add_env_configuration.svh"
  `include "src/add_predictor.svh"
  `include "src/add_scoreboard.svh"
  `include "src/add_environment.svh"
  `include "src/add_env_sequence_base.svh"

  // pragma uvmf custom package_item_additional begin
  // UVMF_CHANGE_ME : When adding new environment level sequences to the src directory
  //    be sure to add the sequence file here so that it will be
  //    compiled as part of the environment package.  Be sure to place
  //    the new sequence after any base sequence of the new sequence.
  // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

