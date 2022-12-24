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
//     - <subsys_configuration.svh>
//     - <subsys_environment.svh>
//     - <subsys_env_sequence_base.svh>
//     - <subsys_predictor.svh>
//     - <subsys_scoreboard.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package subsys_env_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import uvmf_base_pkg::*;
  import block_1_env_pkg::*;
  import block_2_env_pkg::*;
 
  `uvm_analysis_imp_decl(_subsys_apb_ae)
  `uvm_analysis_imp_decl(_subsys_axi_1_ae)
  `uvm_analysis_imp_decl(_subsys_axi_2_ae)
  `uvm_analysis_imp_decl(_subsys_sco_from_pre_ae)
  `uvm_analysis_imp_decl(_subsys_wb_ae)

  // pragma uvmf custom package_imports_additional begin
  // pragma uvmf custom package_imports_additional end

  // Parameters defined as HVL parameters

  `include "src/subsys_env_typedefs.svh"
  `include "src/subsys_env_configuration.svh"
  `include "src/subsys_predictor.svh"
  `include "src/subsys_scoreboard.svh"
  `include "src/subsys_environment.svh"
  `include "src/subsys_env_sequence_base.svh"

  // pragma uvmf custom package_item_additional begin
  // UVMF_CHANGE_ME : When adding new environment level sequences to the src directory
  //    be sure to add the sequence file here so that it will be
  //    compiled as part of the environment package.  Be sure to place
  //    the new sequence after any base sequence of the new sequence.
  // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

