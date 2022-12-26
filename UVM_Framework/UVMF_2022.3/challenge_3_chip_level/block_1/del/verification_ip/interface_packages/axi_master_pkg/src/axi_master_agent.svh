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
     int id_width = 4,
     int len_width = 4,
     int size_width = 3,
     int addr_width = 32,
     int burst_width = 2,
     int data_width = 32,
     int strb_width = 4,
     int resp_width = 2
     ) extends uvmf_parameterized_agent #(
                    .CONFIG_T(axi_master_configuration #(
                              .id_width(id_width),
                              .len_width(len_width),
                              .size_width(size_width),
                              .addr_width(addr_width),
                              .burst_width(burst_width),
                              .data_width(data_width),
                              .strb_width(strb_width),
                              .resp_width(resp_width)
                              )),
                    .DRIVER_T(axi_master_driver #(
                              .id_width(id_width),
                              .len_width(len_width),
                              .size_width(size_width),
                              .addr_width(addr_width),
                              .burst_width(burst_width),
                              .data_width(data_width),
                              .strb_width(strb_width),
                              .resp_width(resp_width)
                              )),
                    .MONITOR_T(axi_master_monitor #(
                               .id_width(id_width),
                               .len_width(len_width),
                               .size_width(size_width),
                               .addr_width(addr_width),
                               .burst_width(burst_width),
                               .data_width(data_width),
                               .strb_width(strb_width),
                               .resp_width(resp_width)
                               )),
                    .COVERAGE_T(axi_master_transaction_coverage #(
                                .id_width(id_width),
                                .len_width(len_width),
                                .size_width(size_width),
                                .addr_width(addr_width),
                                .burst_width(burst_width),
                                .data_width(data_width),
                                .strb_width(strb_width),
                                .resp_width(resp_width)
                                )),
                    .TRANS_T(axi_master_transaction #(
                             .id_width(id_width),
                             .len_width(len_width),
                             .size_width(size_width),
                             .addr_width(addr_width),
                             .burst_width(burst_width),
                             .data_width(data_width),
                             .strb_width(strb_width),
                             .resp_width(resp_width)
                             ))
                    );

  `uvm_component_param_utils( axi_master_agent #(
                              id_width,
                              len_width,
                              size_width,
                              addr_width,
                              burst_width,
                              data_width,
                              strb_width,
                              resp_width
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

