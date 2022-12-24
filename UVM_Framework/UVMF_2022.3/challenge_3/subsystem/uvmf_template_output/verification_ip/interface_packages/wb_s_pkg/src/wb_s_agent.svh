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
class wb_s_agent #(
     int WB_ADDR_width = 32,
     int WB_DATA_width = 16
     ) extends uvmf_parameterized_agent #(
                    .CONFIG_T(wb_s_configuration #(
                              .WB_ADDR_width(WB_ADDR_width),
                              .WB_DATA_width(WB_DATA_width)
                              )),
                    .DRIVER_T(wb_s_driver #(
                              .WB_ADDR_width(WB_ADDR_width),
                              .WB_DATA_width(WB_DATA_width)
                              )),
                    .MONITOR_T(wb_s_monitor #(
                               .WB_ADDR_width(WB_ADDR_width),
                               .WB_DATA_width(WB_DATA_width)
                               )),
                    .COVERAGE_T(wb_s_transaction_coverage #(
                                .WB_ADDR_width(WB_ADDR_width),
                                .WB_DATA_width(WB_DATA_width)
                                )),
                    .TRANS_T(wb_s_transaction #(
                             .WB_ADDR_width(WB_ADDR_width),
                             .WB_DATA_width(WB_DATA_width)
                             ))
                    );

  `uvm_component_param_utils( wb_s_agent #(
                              WB_ADDR_width,
                              WB_DATA_width
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

