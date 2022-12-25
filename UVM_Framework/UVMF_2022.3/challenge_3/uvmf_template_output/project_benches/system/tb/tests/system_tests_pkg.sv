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

package system_tests_pkg;

   import uvm_pkg::*;
   import uvmf_base_pkg::*;
   import system_parameters_pkg::*;
   import system_env_pkg::*;
   import system_sequences_pkg::*;
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
   import wb_m_pkg::*;
   import wb_m_pkg_hdl::*;
   import axi_s_pkg::*;
   import axi_s_pkg_hdl::*;


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

