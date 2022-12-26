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
class apb_master_agent #(
     int ADDRESS_WIDTH = 32,
     int DATA_WIDTH = 32,
     int NO_OF_SLAVES = 1
     ) extends uvmf_parameterized_agent #(
                    .CONFIG_T(apb_master_configuration #(
                              .ADDRESS_WIDTH(ADDRESS_WIDTH),
                              .DATA_WIDTH(DATA_WIDTH),
                              .NO_OF_SLAVES(NO_OF_SLAVES)
                              )),
                    .DRIVER_T(apb_master_driver #(
                              .ADDRESS_WIDTH(ADDRESS_WIDTH),
                              .DATA_WIDTH(DATA_WIDTH),
                              .NO_OF_SLAVES(NO_OF_SLAVES)
                              )),
                    .MONITOR_T(apb_master_monitor #(
                               .ADDRESS_WIDTH(ADDRESS_WIDTH),
                               .DATA_WIDTH(DATA_WIDTH),
                               .NO_OF_SLAVES(NO_OF_SLAVES)
                               )),
                    .COVERAGE_T(apb_master_transaction_coverage #(
                                .ADDRESS_WIDTH(ADDRESS_WIDTH),
                                .DATA_WIDTH(DATA_WIDTH),
                                .NO_OF_SLAVES(NO_OF_SLAVES)
                                )),
                    .TRANS_T(apb_master_transaction #(
                             .ADDRESS_WIDTH(ADDRESS_WIDTH),
                             .DATA_WIDTH(DATA_WIDTH),
                             .NO_OF_SLAVES(NO_OF_SLAVES)
                             ))
                    );

  `uvm_component_param_utils( apb_master_agent #(
                              ADDRESS_WIDTH,
                              DATA_WIDTH,
                              NO_OF_SLAVES
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

