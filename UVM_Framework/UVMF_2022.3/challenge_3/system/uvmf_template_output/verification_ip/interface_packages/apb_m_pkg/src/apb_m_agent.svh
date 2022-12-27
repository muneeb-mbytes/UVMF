`ifndef APB_M_AGENT
`define APB_M_AGENT  
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
class apb_m_agent #(
     int APB_ADDR_WIDTH = 32,
     int APB_DATA_WIDTH = 32,
     int STRB_LEN = APB_ADDR_WIDTH/8
     ) extends uvmf_parameterized_agent #(
                    .CONFIG_T(apb_m_configuration #(
                              .APB_ADDR_WIDTH(APB_ADDR_WIDTH),
                              .APB_DATA_WIDTH(APB_DATA_WIDTH),
                              .STRB_LEN(STRB_LEN)
                              )),
                    .DRIVER_T(apb_m_driver #(
                              .APB_ADDR_WIDTH(APB_ADDR_WIDTH),
                              .APB_DATA_WIDTH(APB_DATA_WIDTH),
                              .STRB_LEN(STRB_LEN)
                              )),
                    .MONITOR_T(apb_m_monitor #(
                               .APB_ADDR_WIDTH(APB_ADDR_WIDTH),
                               .APB_DATA_WIDTH(APB_DATA_WIDTH),
                               .STRB_LEN(STRB_LEN)
                               )),
                    .COVERAGE_T(apb_m_transaction_coverage #(
                                .APB_ADDR_WIDTH(APB_ADDR_WIDTH),
                                .APB_DATA_WIDTH(APB_DATA_WIDTH),
                                .STRB_LEN(STRB_LEN)
                                )),
                    .TRANS_T(apb_m_transaction #(
                             .APB_ADDR_WIDTH(APB_ADDR_WIDTH),
                             .APB_DATA_WIDTH(APB_DATA_WIDTH),
                             .STRB_LEN(STRB_LEN)
                             ))
                    );

  `uvm_component_param_utils( apb_m_agent #(
                              APB_ADDR_WIDTH,
                              APB_DATA_WIDTH,
                              STRB_LEN
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
