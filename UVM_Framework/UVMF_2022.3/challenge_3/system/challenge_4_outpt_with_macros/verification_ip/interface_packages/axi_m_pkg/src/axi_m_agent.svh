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

`ifndef AXI_M_AGENT
`define AXI_M_AGENT

class axi_m_agent #(
     int AW_WIDTH = 32,
     int LEN = 8,
     int DATA_WIDTH = 32,
     int X = 16
     ) extends uvmf_parameterized_agent #(
                    .CONFIG_T(axi_m_configuration #(
                              .AW_WIDTH(AW_WIDTH),
                              .LEN(LEN),
                              .DATA_WIDTH(DATA_WIDTH),
                              .X(X)
                              )),
                    .DRIVER_T(axi_m_driver #(
                              .AW_WIDTH(AW_WIDTH),
                              .LEN(LEN),
                              .DATA_WIDTH(DATA_WIDTH),
                              .X(X)
                              )),
                    .MONITOR_T(axi_m_monitor #(
                               .AW_WIDTH(AW_WIDTH),
                               .LEN(LEN),
                               .DATA_WIDTH(DATA_WIDTH),
                               .X(X)
                               )),
                    .COVERAGE_T(axi_m_transaction_coverage #(
                                .AW_WIDTH(AW_WIDTH),
                                .LEN(LEN),
                                .DATA_WIDTH(DATA_WIDTH),
                                .X(X)
                                )),
                    .TRANS_T(axi_m_transaction #(
                             .AW_WIDTH(AW_WIDTH),
                             .LEN(LEN),
                             .DATA_WIDTH(DATA_WIDTH),
                             .X(X)
                             ))
                    );

  `uvm_component_param_utils( axi_m_agent #(
                              AW_WIDTH,
                              LEN,
                              DATA_WIDTH,
                              X
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
