//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// PACKAGE: This file defines all of the files contained in the
//    interface package that needs to be compiled and synthesized
//    for running on Veloce.
//
// CONTAINS:
//    - <mem_typedefs_hdl>
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
package mem_pkg_hdl;
  
  import uvmf_base_pkg_hdl::*;

  // pragma uvmf custom package_imports_additional begin 
  // pragma uvmf custom package_imports_additional end

  // Parameters defined as HDL parameters
  parameter byte MEM_HDL_PKG_PARAMETER1 = 27;
  parameter byte MEM_HDL_PKG_PARAMETER2 = 28;

  `include "src/mem_typedefs_hdl.svh"
  `include "src/mem_macros.svh"

  // pragma uvmf custom package_item_additional begin
  // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

