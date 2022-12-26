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
//     -<subsys_sequence_base>
//     -<example_derived_test_sequence>
//
//----------------------------------------------------------------------
//
//----------------------------------------------------------------------
//
`ifndef SUBSYS_SEQUENCES_PKG_BENCH
`define SUBSYS_SEQUENCES_PKG_BENCH
package subsys_sequences_pkg;
  import uvm_pkg::*;
  import uvmf_base_pkg::*;
  import apb_m_pkg::*;
  import apb_m_pkg_hdl::*;
  import axi_m_pkg::*;
  import axi_m_pkg_hdl::*;
  import spi_s_pkg::*;
  import spi_s_pkg_hdl::*;
  import spi_m_pkg::*;
  import spi_m_pkg_hdl::*;
  import wb_s_pkg::*;
  import wb_s_pkg_hdl::*;
  import subsys_parameters_pkg::*;
  import subsys_env_pkg::*;
  `include "uvm_macros.svh"

  // pragma uvmf custom package_imports_additional begin
  // pragma uvmf custom package_imports_additional end

  `include "src/subsys_bench_sequence_base.svh"
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
`endif
