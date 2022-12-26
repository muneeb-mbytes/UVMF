//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// DESCRIPTION: This package contains test level parameters
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
`ifndef SUBSYS_PARAMETERS_PKG_BENCH
`define SUBSYS_PARAMETERS_PKG_BENCH

package subsys_parameters_pkg;

  import uvmf_base_pkg_hdl::*;

  // pragma uvmf custom package_imports_additional begin 
  // pragma uvmf custom package_imports_additional end


  // These parameters are used to uniquely identify each interface.  The monitor_bfm and
  // driver_bfm are placed into and retrieved from the uvm_config_db using these string 
  // names as the field_name. The parameter is also used to enable transaction viewing 
  // from the command line for selected interfaces using the UVM command line processing.
  parameter string b1_apb_master_BFM  = "b1_apb_master_BFM"; /* [0] */
  parameter string b1_axi_master1_BFM  = "b1_axi_master1_BFM"; /* [1] */
  parameter string b1_axi_master2_BFM  = "b1_axi_master2_BFM"; /* [2] */
  parameter string b1_spi_slave_BFM  = "b1_spi_slave_BFM"; /* [3] */
  parameter string b2_spi_master_BFM  = "b2_spi_master_BFM"; /* [4] */
  parameter string b2_wb_slave_BFM  = "b2_wb_slave_BFM"; /* [5] */

  // pragma uvmf custom package_item_additional begin
  // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end
`endif
