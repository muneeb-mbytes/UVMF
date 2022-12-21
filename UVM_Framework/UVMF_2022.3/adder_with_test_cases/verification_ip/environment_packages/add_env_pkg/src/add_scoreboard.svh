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
//   add_out_pred_sb_ae receives transactions of type  add_out_transaction  
//   add_out_ag_sb_ae receives transactions of type  add_out_transaction  
//
//   This analysis component has the following analysis_ports that can broadcast 
//   the listed transaction type.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//


class add_scoreboard #(
  type CONFIG_T,
  type BASE_T = uvm_component
  ) extends BASE_T;

  // Factory registration of this class
  `uvm_component_param_utils( add_scoreboard #(
                              CONFIG_T,
                              BASE_T
                              ))


  // Instantiate a handle to the configuration of the environment in which this component resides
  CONFIG_T configuration;
  bit [3:0] sum_p,sum_a;                                                                            
  bit cout_p,cout_a;
  
  // Instantiate the analysis exports
  uvm_analysis_imp_add_out_pred_sb_ae #(add_out_transaction, add_scoreboard #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) add_out_pred_sb_ae;
  uvm_analysis_imp_add_out_ag_sb_ae #(add_out_transaction, add_scoreboard #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) add_out_ag_sb_ae;




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

    add_out_pred_sb_ae = new("add_out_pred_sb_ae", this);
    add_out_ag_sb_ae = new("add_out_ag_sb_ae", this);
  // pragma uvmf custom build_phase begin
  // pragma uvmf custom build_phase end
  endfunction

  // FUNCTION: write_add_out_pred_sb_ae
  // Transactions received through add_out_pred_sb_ae initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_add_out_pred_sb_ae(add_out_transaction t);
    // pragma uvmf custom add_out_pred_sb_ae_scoreboard begin
    `uvm_info("PRED", "Transaction Received through add_out_pred_sb_ae", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    //  UVMF_CHANGE_ME: Implement custom scoreboard here.  
    this.sum_p = t.sum;
    this.cout_p = t.cout;
    `uvm_info("UNIMPLEMENTED_CUSTOM_SCOREBOARD", "******************************************************************************************************",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_CUSTOM_SCOREBOARD", "UVMF_CHANGE_ME: The add_scoreboard::write_add_out_pred_sb_ae function needs to be completed with custom scoreboard functionality",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_CUSTOM_SCOREBOARD", "******************************************************************************************************",UVM_NONE)
 
    // pragma uvmf custom add_out_pred_sb_ae_scoreboard end
  endfunction

  // FUNCTION: write_add_out_ag_sb_ae
  // Transactions received through add_out_ag_sb_ae initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_add_out_ag_sb_ae(add_out_transaction t);
    // pragma uvmf custom add_out_ag_sb_ae_scoreboard begin
    `uvm_info("PRED", "Transaction Received through add_out_ag_sb_ae", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    //  UVMF_CHANGE_ME: Implement custom scoreboard here.  
    this.sum_a = t.sum;
    this.cout_a = t.cout;
    `uvm_info("UNIMPLEMENTED_CUSTOM_SCOREBOARD", "******************************************************************************************************",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_CUSTOM_SCOREBOARD", "UVMF_CHANGE_ME: The add_scoreboard::write_add_out_ag_sb_ae function needs to be completed with custom scoreboard functionality",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_CUSTOM_SCOREBOARD", "******************************************************************************************************",UVM_NONE)
 
    // pragma uvmf custom add_out_ag_sb_ae_scoreboard end
  endfunction
  virtual function void comparing();
  if(sum_p == sum_a && cout_p == cout_a) begin 
    `uvm_info("SCOREBOARD","compare success ",UVM_LOW)
  end
  else
  begin
    `uvm_error("SCOREBOARD","compare failed ")
  end
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
     comparing();
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

