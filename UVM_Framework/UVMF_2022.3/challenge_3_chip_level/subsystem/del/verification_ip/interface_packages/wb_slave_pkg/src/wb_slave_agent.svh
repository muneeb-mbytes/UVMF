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
class wb_slave_agent #(
     bit ADDR_WIDTH = 32,
     bit DATA_WIDTH = 32
     ) extends uvmf_parameterized_agent #(
                    .CONFIG_T(wb_slave_configuration #(
                              .ADDR_WIDTH(ADDR_WIDTH),
                              .DATA_WIDTH(DATA_WIDTH)
                              )),
                    .DRIVER_T(wb_slave_driver #(
                              .ADDR_WIDTH(ADDR_WIDTH),
                              .DATA_WIDTH(DATA_WIDTH)
                              )),
                    .MONITOR_T(wb_slave_monitor #(
                               .ADDR_WIDTH(ADDR_WIDTH),
                               .DATA_WIDTH(DATA_WIDTH)
                               )),
                    .COVERAGE_T(wb_slave_transaction_coverage #(
                                .ADDR_WIDTH(ADDR_WIDTH),
                                .DATA_WIDTH(DATA_WIDTH)
                                )),
                    .TRANS_T(wb_slave_transaction #(
                             .ADDR_WIDTH(ADDR_WIDTH),
                             .DATA_WIDTH(DATA_WIDTH)
                             ))
                    );

  `uvm_component_param_utils( wb_slave_agent #(
                              ADDR_WIDTH,
                              DATA_WIDTH
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

