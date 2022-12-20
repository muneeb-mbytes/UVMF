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
//     - <block_c_configuration.svh>
//     - <block_c_environment.svh>
//     - <block_c_env_sequence_base.svh>
//     - <block_c_predictor.svh>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package block_c_env_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import uvmf_base_pkg::*;
  import mvc_pkg::*;
  import mgc_pcie_v2_0_pkg::*;
  import mgc_axi4_v1_0_pkg::*;
  import mgc_apb3_v1_0_pkg::*;
  import mem_pkg::*;
  import mem_pkg_hdl::*;
  import pkt_pkg::*;
  import pkt_pkg_hdl::*;
  import qvip_agents_pkg::*;
  import qvip_agents_params_pkg::*;
 
  `uvm_analysis_imp_decl(_mem_in_ae)
  `uvm_analysis_imp_decl(_axi4_master_1_ae)
  `uvm_analysis_imp_decl(_axi4_master_0_ae)

  // pragma uvmf custom package_imports_additional begin
  // pragma uvmf custom package_imports_additional end

  // Parameters defined as HVL parameters

  `include "src/block_c_env_typedefs.svh"
  `include "src/block_c_env_configuration.svh"
  `include "src/block_c_predictor.svh"
  `include "src/block_c_environment.svh"
  `include "src/block_c_env_sequence_base.svh"

  // pragma uvmf custom package_item_additional begin
  // UVMF_CHANGE_ME : When adding new environment level sequences to the src directory
  //    be sure to add the sequence file here so that it will be
  //    compiled as part of the environment package.  Be sure to place
  //    the new sequence after any base sequence of the new sequence.
  // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

