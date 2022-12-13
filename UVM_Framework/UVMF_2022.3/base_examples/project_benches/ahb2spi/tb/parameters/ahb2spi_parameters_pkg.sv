//----------------------------------------------------------------------
// Created with uvmf_gen version 2019.4_1
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


package ahb2spi_parameters_pkg;

  import uvmf_base_pkg_hdl::*;

  // pragma uvmf custom package_imports_additional begin 
  // pragma uvmf custom package_imports_additional end

  parameter int WB_DATA_WIDTH = 16;
  parameter int WB_ADDR_WIDTH = 32;

  // These parameters are used to uniquely identify each interface.  The monitor_bfm and
  // driver_bfm are placed into and retrieved from the uvm_config_db using these string 
  // names as the field_name. The parameter is also used to enable transaction viewing 
  // from the command line for selected interfaces using the UVM command line processing.
  parameter string ahb2wb_wb_BFM  = "ahb2wb_wb_BFM"; /* [0] */
  parameter string ahb2wb_ahb_BFM  = "ahb2wb_ahb_BFM"; /* [1] */
  parameter string wb2spi_wb_BFM  = "wb2spi_wb_BFM"; /* [2] */
  parameter string wb2spi_spi_BFM  = "wb2spi_spi_BFM"; /* [3] */

  // pragma uvmf custom package_item_additional begin
  // pragma uvmf custom package_item_additional end

endpackage

