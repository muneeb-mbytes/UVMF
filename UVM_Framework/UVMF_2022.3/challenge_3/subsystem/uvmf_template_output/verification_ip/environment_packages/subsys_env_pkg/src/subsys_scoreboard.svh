//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// DESCRIPTION: This analysis component contains analysis_exports for receiving
//   data and analysis_ports for sending data.
// 
//   This analysis component has the following analysis_exports that receive the 
//   listed transaction type.
//   
//   subsys_sco_from_pre_ae receives transactions of type  wb_s  
//   subsys_wb_ae receives transactions of type  wb_s  
//
//   This analysis component has the following analysis_ports that can broadcast 
//   the listed transaction type.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//


class subsys_scoreboard #(
  type CONFIG_T,
  type BASE_T = uvm_component
  ) extends BASE_T;

  // Factory registration of this class
  `uvm_component_param_utils( subsys_scoreboard #(
                              CONFIG_T,
                              BASE_T
                              ))


  // Instantiate a handle to the configuration of the environment in which this component resides
  CONFIG_T configuration;

  
  // Instantiate the analysis exports
  uvm_analysis_imp_subsys_sco_from_pre_ae #(wb_s, subsys_scoreboard #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) subsys_sco_from_pre_ae;
  uvm_analysis_imp_subsys_wb_ae #(wb_s, subsys_scoreboard #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) subsys_wb_ae;




  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // FUNCTION: new
  function new(string name, uvm_component parent);
     super.new(name,parent);
  // pragma uvmf custom new begin
  // pragma uvmf custom new end
  endfunction

  // FUNCTION: build_phase
  virtual function void build_phase (uvm_phase phase);

    subsys_sco_from_pre_ae = new("subsys_sco_from_pre_ae", this);
    subsys_wb_ae = new("subsys_wb_ae", this);
  // pragma uvmf custom build_phase begin
  // pragma uvmf custom build_phase end
  endfunction

  // FUNCTION: write_subsys_sco_from_pre_ae
  // Transactions received through subsys_sco_from_pre_ae initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_subsys_sco_from_pre_ae(wb_s t);
    // pragma uvmf custom subsys_sco_from_pre_ae_scoreboard begin
    `uvm_info("PRED", "Transaction Received through subsys_sco_from_pre_ae", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    //  UVMF_CHANGE_ME: Implement custom scoreboard here.  
    `uvm_info("UNIMPLEMENTED_CUSTOM_SCOREBOARD", "******************************************************************************************************",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_CUSTOM_SCOREBOARD", "UVMF_CHANGE_ME: The subsys_scoreboard::write_subsys_sco_from_pre_ae function needs to be completed with custom scoreboard functionality",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_CUSTOM_SCOREBOARD", "******************************************************************************************************",UVM_NONE)
 
    // pragma uvmf custom subsys_sco_from_pre_ae_scoreboard end
  endfunction

  // FUNCTION: write_subsys_wb_ae
  // Transactions received through subsys_wb_ae initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_subsys_wb_ae(wb_s t);
    // pragma uvmf custom subsys_wb_ae_scoreboard begin
    `uvm_info("PRED", "Transaction Received through subsys_wb_ae", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    //  UVMF_CHANGE_ME: Implement custom scoreboard here.  
    `uvm_info("UNIMPLEMENTED_CUSTOM_SCOREBOARD", "******************************************************************************************************",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_CUSTOM_SCOREBOARD", "UVMF_CHANGE_ME: The subsys_scoreboard::write_subsys_wb_ae function needs to be completed with custom scoreboard functionality",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_CUSTOM_SCOREBOARD", "******************************************************************************************************",UVM_NONE)
 
    // pragma uvmf custom subsys_wb_ae_scoreboard end
  endfunction



  // FUNCTION: extract_phase
  virtual function void extract_phase(uvm_phase phase);
// pragma uvmf custom extract_phase begin
     super.extract_phase(phase);
// pragma uvmf custom extract_phase end
  endfunction

  // FUNCTION: check_phase
  virtual function void check_phase(uvm_phase phase);
// pragma uvmf custom check_phase begin
     super.check_phase(phase);
// pragma uvmf custom check_phase end
  endfunction

  // FUNCTION: report_phase
  virtual function void report_phase(uvm_phase phase);
// pragma uvmf custom report_phase begin
     super.report_phase(phase);
// pragma uvmf custom report_phase end
  endfunction

endclass 

// pragma uvmf custom external begin
// pragma uvmf custom external end

