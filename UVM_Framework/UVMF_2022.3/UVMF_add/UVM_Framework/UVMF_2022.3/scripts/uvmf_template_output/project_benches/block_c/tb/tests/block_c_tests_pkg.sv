//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// DESCRIPTION: This package contains all tests currently written for
//     the simulation project.  Once compiled, any test can be selected
//     from the vsim command line using +UVM_TESTNAME=yourTestNameHere
//
// CONTAINS:
//     -<test_top>
//     -<example_derived_test>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

package block_c_tests_pkg;

   import uvm_pkg::*;
   import uvmf_base_pkg::*;
   import block_c_parameters_pkg::*;
   import block_c_env_pkg::*;
   import block_c_sequences_pkg::*;
   import mem_pkg::*;
   import mem_pkg_hdl::*;
   import pkt_pkg::*;
   import pkt_pkg_hdl::*;
   import qvip_agents_pkg::*;
   import QUESTA_MVC::*;
   import qvip_utils_pkg::*;
   import mvc_pkg::*;
   import mgc_pcie_v2_0_pkg::*;
   import mgc_axi4_v1_0_pkg::*;
   import mgc_apb3_v1_0_pkg::*;


   `include "uvm_macros.svh"

  // pragma uvmf custom package_imports_additional begin 
  // pragma uvmf custom package_imports_additional end

   `include "src/test_top.svh"
   `include "src/register_test.svh"
   `include "src/example_derived_test.svh"

  // pragma uvmf custom package_item_additional begin
  // UVMF_CHANGE_ME : When adding new tests to the src directory
  //    be sure to add the test file here so that it will be
  //    compiled as part of the test package.  Be sure to place
  //    the new test after any base tests of the new test.
  // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

