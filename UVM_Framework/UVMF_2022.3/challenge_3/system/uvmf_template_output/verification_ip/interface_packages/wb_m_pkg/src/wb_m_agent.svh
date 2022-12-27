`ifndef WB_M_INCLUDED_
`define WB_M_INCLUDED_

//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// DESCRIPTION: Protocol specific agent class definition
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class wb_m_agent #(
     int WB_ADDR_WIDTH = 32,
     int WB_DATA_WIDTH = 16
     ) extends uvmf_parameterized_agent #(
                    .CONFIG_T(wb_m_configuration #(
                              .WB_ADDR_WIDTH(WB_ADDR_WIDTH),
                              .WB_DATA_WIDTH(WB_DATA_WIDTH)
                              )),
                    .DRIVER_T(wb_m_driver #(
                              .WB_ADDR_WIDTH(WB_ADDR_WIDTH),
                              .WB_DATA_WIDTH(WB_DATA_WIDTH)
                              )),
                    .MONITOR_T(wb_m_monitor #(
                               .WB_ADDR_WIDTH(WB_ADDR_WIDTH),
                               .WB_DATA_WIDTH(WB_DATA_WIDTH)
                               )),
                    .COVERAGE_T(wb_m_transaction_coverage #(
                                .WB_ADDR_WIDTH(WB_ADDR_WIDTH),
                                .WB_DATA_WIDTH(WB_DATA_WIDTH)
                                )),
                    .TRANS_T(wb_m_transaction #(
                             .WB_ADDR_WIDTH(WB_ADDR_WIDTH),
                             .WB_DATA_WIDTH(WB_DATA_WIDTH)
                             ))
                    );

  `uvm_component_param_utils( wb_m_agent #(
                              WB_ADDR_WIDTH,
                              WB_DATA_WIDTH
                              ))

// pragma uvmf custom class_item_additional begin
// pragma uvmf custom class_item_additional end

// ****************************************************************************
// FUNCTION : new()
// This function is the standard SystemVerilog constructor.
//
  function new( string name = "", uvm_component parent = null );
    super.new( name, parent );
  endfunction

// ****************************************************************************
  // FUNCTION: build_phase
  virtual function void build_phase(uvm_phase phase);
// pragma uvmf custom build_phase_pre_super begin
// pragma uvmf custom build_phase_pre_super end
    super.build_phase(phase);
    if (configuration.active_passive == ACTIVE) begin
      // Place sequencer handle into configuration object
      // so that it may be retrieved from configuration 
      // rather than using uvm_config_db
      configuration.sequencer = this.sequencer;
    end
  endfunction
  
endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end
`endif
