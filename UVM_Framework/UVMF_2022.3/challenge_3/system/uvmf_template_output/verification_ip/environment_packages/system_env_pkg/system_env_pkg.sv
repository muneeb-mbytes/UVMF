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
//     - <system_configuration.svh>
//     - <system_environment.svh>
//     - <system_env_sequence_base.svh>
//     - <sys_predictor.svh>
//     - <sys_scoreboard.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package system_env_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import uvmf_base_pkg::*;
  import apb_m_pkg::*;
  import axi_m_pkg::*;
  import axi_s_pkg::*;
  import block_1_env_pkg::*;
  import block_2_env_pkg::*;
  import subsys_env_pkg::*;
  import block_3_env_pkg::*;
 
  `uvm_analysis_imp_decl(_sys_apb_ae)
  `uvm_analysis_imp_decl(_sys_axi_2_ae)
  `uvm_analysis_imp_decl(_sys_axi_1_ae)
  `uvm_analysis_imp_decl(_sys_axi_ae)
  `uvm_analysis_imp_decl(_sys_sco_from_pre_ae)

  // pragma uvmf custom package_imports_additional begin
  // pragma uvmf custom package_imports_additional end

  // Parameters defined as HVL parameters

  `include "src/system_env_typedefs.svh"
  `include "src/system_env_configuration.svh"
  `include "src/sys_predictor.svh"
  `include "src/sys_scoreboard.svh"
  `include "src/system_environment.svh"
  `include "src/system_env_sequence_base.svh"

  // pragma uvmf custom package_item_additional begin
  // UVMF_CHANGE_ME : When adding new environment level sequences to the src directory
  //    be sure to add the sequence file here so that it will be
  //    compiled as part of the environment package.  Be sure to place
  //    the new sequence after any base sequence of the new sequence.
  // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

