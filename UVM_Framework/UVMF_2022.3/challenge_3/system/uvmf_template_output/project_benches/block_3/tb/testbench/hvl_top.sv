`ifndef BLOCK_3_TB_TESTBENCH_HVL_TOP_SV
`define BLOCK_3_TB_TESTBENCH_HVL_TOP_SV

//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//
//----------------------------------------------------------------------
//                                          
// DESCRIPTION: This module loads the test package and starts the UVM phases.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

module hvl_top;

import uvm_pkg::*;
import block_3_tests_pkg::*;

  // pragma uvmf custom module_item_additional begin
  // pragma uvmf custom module_item_additional end

  initial begin
    $timeformat(-9,3,"ns",5);
    run_test();
  end

endmodule

// pragma uvmf custom external begin
// pragma uvmf custom external end
`endif
