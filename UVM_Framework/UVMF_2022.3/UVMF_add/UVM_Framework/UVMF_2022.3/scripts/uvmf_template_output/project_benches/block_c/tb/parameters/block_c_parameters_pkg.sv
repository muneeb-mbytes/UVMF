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


package block_c_parameters_pkg;

  import uvmf_base_pkg_hdl::*;

  // pragma uvmf custom package_imports_additional begin 
  // pragma uvmf custom package_imports_additional end


  // These parameters are used to uniquely identify each interface.  The monitor_bfm and
  // driver_bfm are placed into and retrieved from the uvm_config_db using these string 
  // names as the field_name. The parameter is also used to enable transaction viewing 
  // from the command line for selected interfaces using the UVM command line processing.
  parameter string uvm_test_top_environment_qvip_env_pcie_ep  = "uvm_test_top.environment.qvip_env.pcie_ep"; /* [0] */
  parameter string uvm_test_top_environment_qvip_env_axi4_master_0  = "uvm_test_top.environment.qvip_env.axi4_master_0"; /* [1] */
  parameter string uvm_test_top_environment_qvip_env_axi4_master_1  = "uvm_test_top.environment.qvip_env.axi4_master_1"; /* [2] */
  parameter string uvm_test_top_environment_qvip_env_axi4_slave  = "uvm_test_top.environment.qvip_env.axi4_slave"; /* [3] */
  parameter string uvm_test_top_environment_qvip_env_apb3_config_master  = "uvm_test_top.environment.qvip_env.apb3_config_master"; /* [4] */
  parameter string mem_in_BFM  = "mem_in_BFM"; /* [5] */
  parameter string mem_out_BFM  = "mem_out_BFM"; /* [6] */
  parameter string pkt_out_BFM  = "pkt_out_BFM"; /* [7] */

  // pragma uvmf custom package_item_additional begin
  // pragma uvmf custom package_item_additional end

endpackage

// pragma uvmf custom external begin
// pragma uvmf custom external end

