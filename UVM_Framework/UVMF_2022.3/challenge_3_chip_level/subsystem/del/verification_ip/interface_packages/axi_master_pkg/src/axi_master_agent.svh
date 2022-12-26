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
class axi_master_agent #(
     int ADDR_WIDTH = 32,
     int DATA_WIDTH = 32,
     int RESP_WIDTH = 2,
     int ID_WIDTH = 4,
     int STRB_WIDTH = 4,
     int LEN_WIDTH = 8,
     int SIZE_WIDTH = 3,
     int BURST_WIDTH = 2
     ) extends uvmf_parameterized_agent #(
                    .CONFIG_T(axi_master_configuration #(
                              .ADDR_WIDTH(ADDR_WIDTH),
                              .DATA_WIDTH(DATA_WIDTH),
                              .RESP_WIDTH(RESP_WIDTH),
                              .ID_WIDTH(ID_WIDTH),
                              .STRB_WIDTH(STRB_WIDTH),
                              .LEN_WIDTH(LEN_WIDTH),
                              .SIZE_WIDTH(SIZE_WIDTH),
                              .BURST_WIDTH(BURST_WIDTH)
                              )),
                    .DRIVER_T(axi_master_driver #(
                              .ADDR_WIDTH(ADDR_WIDTH),
                              .DATA_WIDTH(DATA_WIDTH),
                              .RESP_WIDTH(RESP_WIDTH),
                              .ID_WIDTH(ID_WIDTH),
                              .STRB_WIDTH(STRB_WIDTH),
                              .LEN_WIDTH(LEN_WIDTH),
                              .SIZE_WIDTH(SIZE_WIDTH),
                              .BURST_WIDTH(BURST_WIDTH)
                              )),
                    .MONITOR_T(axi_master_monitor #(
                               .ADDR_WIDTH(ADDR_WIDTH),
                               .DATA_WIDTH(DATA_WIDTH),
                               .RESP_WIDTH(RESP_WIDTH),
                               .ID_WIDTH(ID_WIDTH),
                               .STRB_WIDTH(STRB_WIDTH),
                               .LEN_WIDTH(LEN_WIDTH),
                               .SIZE_WIDTH(SIZE_WIDTH),
                               .BURST_WIDTH(BURST_WIDTH)
                               )),
                    .COVERAGE_T(axi_master_transaction_coverage #(
                                .ADDR_WIDTH(ADDR_WIDTH),
                                .DATA_WIDTH(DATA_WIDTH),
                                .RESP_WIDTH(RESP_WIDTH),
                                .ID_WIDTH(ID_WIDTH),
                                .STRB_WIDTH(STRB_WIDTH),
                                .LEN_WIDTH(LEN_WIDTH),
                                .SIZE_WIDTH(SIZE_WIDTH),
                                .BURST_WIDTH(BURST_WIDTH)
                                )),
                    .TRANS_T(axi_master_transaction #(
                             .ADDR_WIDTH(ADDR_WIDTH),
                             .DATA_WIDTH(DATA_WIDTH),
                             .RESP_WIDTH(RESP_WIDTH),
                             .ID_WIDTH(ID_WIDTH),
                             .STRB_WIDTH(STRB_WIDTH),
                             .LEN_WIDTH(LEN_WIDTH),
                             .SIZE_WIDTH(SIZE_WIDTH),
                             .BURST_WIDTH(BURST_WIDTH)
                             ))
                    );

  `uvm_component_param_utils( axi_master_agent #(
                              ADDR_WIDTH,
                              DATA_WIDTH,
                              RESP_WIDTH,
                              ID_WIDTH,
                              STRB_WIDTH,
                              LEN_WIDTH,
                              SIZE_WIDTH,
                              BURST_WIDTH
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

