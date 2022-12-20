//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// DESCRIPTION: This package includes all high level sequence classes used 
//     in the environment.  These include utility sequences and top
//     level sequences.
//
// CONTAINS:
//     -<block_c_sequence_base>
//     -<example_derived_test_sequence>
//
//----------------------------------------------------------------------
//
//----------------------------------------------------------------------
//

package block_c_sequences_pkg;
  import uvm_pkg::*;
  import uvmf_base_pkg::*;
  import mvc_pkg::*;
  import mgc_pcie_v2_0_pkg::*;
  import mgc_axi4_v1_0_pkg::*;
  import mgc_apb3_v1_0_pkg::*;
  import mem_pkg::*;
  import mem_pkg_hdl::*;
  import pkt_pkg::*;
  import pkt_pkg_hdl::*;
  import block_c_parameters_pkg::*;
  import block_c_env_pkg::*;
  import qvip_agents_params_pkg::*;
  `include "uvm_macros.svh"

  // pragma uvmf custom package_imports_additional begin
  // pragma uvmf custom package_imports_additional end

  `include "src/block_c_bench_sequence_base.svh"
  `include "src/register_test_sequence.svh"
  `include "src/example_derived_test_sequence.svh"

  // pragma uvmf custom package_item_additional begin
  // UVMF_CHANGE_ME : When adding new sequences to the src directory
  //    be sure to add the sequence file here so that it will be
  //    compiled as part of the sequence package.  Be sure to place
  //    the new sequence after any base sequences of the new sequence.
  // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

