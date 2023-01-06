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
class add_out_agent #(
     int add_width = 4
     ) extends uvmf_parameterized_agent #(
                    .CONFIG_T(add_out_configuration #(
                              .add_width(add_width)
                              )),
                    .DRIVER_T(add_out_driver #(
                              .add_width(add_width)
                              )),
                    .MONITOR_T(add_out_monitor #(
                               .add_width(add_width)
                               )),
                    .COVERAGE_T(add_out_transaction_coverage #(
                                .add_width(add_width)
                                )),
                    .TRANS_T(add_out_transaction #(
                             .add_width(add_width)
                             ))
                    );

  `uvm_component_param_utils( add_out_agent #(
                              add_width
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

