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
class dma_agent #(
     int DATA_WIDTH = 16,
     int ADDR_WIDTH = 8
     ) extends uvmf_parameterized_agent #(
                    .CONFIG_T(dma_configuration #(
                              .DATA_WIDTH(DATA_WIDTH),
                              .ADDR_WIDTH(ADDR_WIDTH)
                              )),
                    .DRIVER_T(dma_driver #(
                              .DATA_WIDTH(DATA_WIDTH),
                              .ADDR_WIDTH(ADDR_WIDTH)
                              )),
                    .MONITOR_T(dma_monitor #(
                               .DATA_WIDTH(DATA_WIDTH),
                               .ADDR_WIDTH(ADDR_WIDTH)
                               )),
                    .COVERAGE_T(dma_transaction_coverage #(
                                .DATA_WIDTH(DATA_WIDTH),
                                .ADDR_WIDTH(ADDR_WIDTH)
                                )),
                    .TRANS_T(dma_transaction #(
                             .DATA_WIDTH(DATA_WIDTH),
                             .ADDR_WIDTH(ADDR_WIDTH)
                             ))
                    );

  `uvm_component_param_utils( dma_agent #(
                              DATA_WIDTH,
                              ADDR_WIDTH
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

