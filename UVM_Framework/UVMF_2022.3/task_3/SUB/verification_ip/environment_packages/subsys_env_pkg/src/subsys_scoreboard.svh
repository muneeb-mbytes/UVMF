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
//   wb_s_ae receives transactions of type  wb_s_transaction  
//   sco_from_pred_ae receives transactions of type  wb_s_transaction  
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
  uvm_analysis_imp_wb_s_ae #(wb_s_transaction, subsys_scoreboard #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) wb_s_ae;
  uvm_analysis_imp_sco_from_pred_ae #(wb_s_transaction, subsys_scoreboard #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) sco_from_pred_ae;




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

    wb_s_ae = new("wb_s_ae", this);
    sco_from_pred_ae = new("sco_from_pred_ae", this);
  // pragma uvmf custom build_phase begin
  // pragma uvmf custom build_phase end
  endfunction

  // FUNCTION: write_wb_s_ae
  // Transactions received through wb_s_ae initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_wb_s_ae(wb_s_transaction t);
    // pragma uvmf custom wb_s_ae_scoreboard begin
    `uvm_info("PRED", "Transaction Received through wb_s_ae", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    //  UVMF_CHANGE_ME: Implement custom scoreboard here.  
    `uvm_info("UNIMPLEMENTED_CUSTOM_SCOREBOARD", "******************************************************************************************************",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_CUSTOM_SCOREBOARD", "UVMF_CHANGE_ME: The subsys_scoreboard::write_wb_s_ae function needs to be completed with custom scoreboard functionality",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_CUSTOM_SCOREBOARD", "******************************************************************************************************",UVM_NONE)
 
    // pragma uvmf custom wb_s_ae_scoreboard end
  endfunction

  // FUNCTION: write_sco_from_pred_ae
  // Transactions received through sco_from_pred_ae initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_sco_from_pred_ae(wb_s_transaction t);
    // pragma uvmf custom sco_from_pred_ae_scoreboard begin
    `uvm_info("PRED", "Transaction Received through sco_from_pred_ae", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    //  UVMF_CHANGE_ME: Implement custom scoreboard here.  
    `uvm_info("UNIMPLEMENTED_CUSTOM_SCOREBOARD", "******************************************************************************************************",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_CUSTOM_SCOREBOARD", "UVMF_CHANGE_ME: The subsys_scoreboard::write_sco_from_pred_ae function needs to be completed with custom scoreboard functionality",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_CUSTOM_SCOREBOARD", "******************************************************************************************************",UVM_NONE)
 
    // pragma uvmf custom sco_from_pred_ae_scoreboard end
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

