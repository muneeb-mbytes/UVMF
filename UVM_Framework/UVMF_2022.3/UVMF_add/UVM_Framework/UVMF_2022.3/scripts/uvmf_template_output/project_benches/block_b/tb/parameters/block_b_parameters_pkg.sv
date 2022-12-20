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


package block_b_parameters_pkg;

  import uvmf_base_pkg_hdl::*;

  // pragma uvmf custom package_imports_additional begin 
  // pragma uvmf custom package_imports_additional end

  parameter int TEST_CP_IN_DATA_WIDTH = 20;
  parameter int TEST_CP_IN_ADDR_WIDTH = 10;
  parameter int TEST_CP_OUT_ADDR_WIDTH = 21;
  parameter int TEST_UDP_DATA_WIDTH = 40;

  // These parameters are used to uniquely identify each interface.  The monitor_bfm and
  // driver_bfm are placed into and retrieved from the uvm_config_db using these string 
  // names as the field_name. The parameter is also used to enable transaction viewing 
  // from the command line for selected interfaces using the UVM command line processing.
  parameter string control_plane_in_BFM  = "control_plane_in_BFM"; /* [0] */
  parameter string control_plane_out_BFM  = "control_plane_out_BFM"; /* [1] */
  parameter string unsecure_data_plane_in_BFM  = "unsecure_data_plane_in_BFM"; /* [2] */
  parameter string unsecure_data_plane_out_BFM  = "unsecure_data_plane_out_BFM"; /* [3] */

  // pragma uvmf custom package_item_additional begin
  // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

