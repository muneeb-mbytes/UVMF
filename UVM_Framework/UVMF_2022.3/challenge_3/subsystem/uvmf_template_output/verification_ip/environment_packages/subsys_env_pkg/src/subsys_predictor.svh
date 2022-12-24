//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//
//----------------------------------------------------------------------
//
// DESCRIPTION: This analysis component contains analysis_exports for receiving
//   data and analysis_ports for sending data.
// 
//   This analysis component has the following analysis_exports that receive the 
//   listed transaction type.
//   
//   subsys_apb_ae receives transactions of type  apb_m
//   subsys_axi_1_ae receives transactions of type  apb_m
//   subsys_axi_2_ae receives transactions of type  apb_m
//
//   This analysis component has the following analysis_ports that can broadcast 
//   the listed transaction type.
//
//  subsys_pre_to_sco_ap broadcasts transactions of type wb_s
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class subsys_predictor #(
  type CONFIG_T,
  type BASE_T = uvm_component
  ) extends BASE_T;

  // Factory registration of this class
  `uvm_component_param_utils( subsys_predictor #(
                              CONFIG_T,
                              BASE_T
                              ))


  // Instantiate a handle to the configuration of the environment in which this component resides
  CONFIG_T configuration;

  
  // Instantiate the analysis exports
  uvm_analysis_imp_subsys_apb_ae #(apb_m, subsys_predictor #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) subsys_apb_ae;
  uvm_analysis_imp_subsys_axi_1_ae #(apb_m, subsys_predictor #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) subsys_axi_1_ae;
  uvm_analysis_imp_subsys_axi_2_ae #(apb_m, subsys_predictor #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) subsys_axi_2_ae;

  
  // Instantiate the analysis ports
  uvm_analysis_port #(wb_s) subsys_pre_to_sco_ap;


  // Transaction variable for predicted values to be sent out subsys_pre_to_sco_ap
  // Once a transaction is sent through an analysis_port, another transaction should
  // be constructed for the next predicted transaction. 
  typedef wb_s subsys_pre_to_sco_ap_output_transaction_t;
  subsys_pre_to_sco_ap_output_transaction_t subsys_pre_to_sco_ap_output_transaction;
  // Code for sending output transaction out through subsys_pre_to_sco_ap
  // subsys_pre_to_sco_ap.write(subsys_pre_to_sco_ap_output_transaction);

  // Define transaction handles for debug visibility 
  apb_m subsys_apb_ae_debug;
  apb_m subsys_axi_1_ae_debug;
  apb_m subsys_axi_2_ae_debug;


  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // FUNCTION: new
  function new(string name, uvm_component parent);
     super.new(name,parent);
    `uvm_warning("PREDICTOR_REVIEW", "This predictor has been created either through generation or re-generation with merging.  Remove this warning after the predictor has been reviewed.")
  // pragma uvmf custom new begin
  // pragma uvmf custom new end
  endfunction

  // FUNCTION: build_phase
  virtual function void build_phase (uvm_phase phase);

    subsys_apb_ae = new("subsys_apb_ae", this);
    subsys_axi_1_ae = new("subsys_axi_1_ae", this);
    subsys_axi_2_ae = new("subsys_axi_2_ae", this);
    subsys_pre_to_sco_ap =new("subsys_pre_to_sco_ap", this );
  // pragma uvmf custom build_phase begin
  // pragma uvmf custom build_phase end
  endfunction

  // FUNCTION: write_subsys_apb_ae
  // Transactions received through subsys_apb_ae initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_subsys_apb_ae(apb_m t);
    // pragma uvmf custom subsys_apb_ae_predictor begin
    subsys_apb_ae_debug = t;
    `uvm_info("PRED", "Transaction Received through subsys_apb_ae", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    // Construct one of each output transaction type.
    subsys_pre_to_sco_ap_output_transaction = subsys_pre_to_sco_ap_output_transaction_t::type_id::create("subsys_pre_to_sco_ap_output_transaction");
    //  UVMF_CHANGE_ME: Implement predictor model here.  
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "UVMF_CHANGE_ME: The subsys_predictor::write_subsys_apb_ae function needs to be completed with DUT prediction model",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
 
    // Code for sending output transaction out through subsys_pre_to_sco_ap
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    subsys_pre_to_sco_ap.write(subsys_pre_to_sco_ap_output_transaction);
    // pragma uvmf custom subsys_apb_ae_predictor end
  endfunction

  // FUNCTION: write_subsys_axi_1_ae
  // Transactions received through subsys_axi_1_ae initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_subsys_axi_1_ae(apb_m t);
    // pragma uvmf custom subsys_axi_1_ae_predictor begin
    subsys_axi_1_ae_debug = t;
    `uvm_info("PRED", "Transaction Received through subsys_axi_1_ae", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    // Construct one of each output transaction type.
    subsys_pre_to_sco_ap_output_transaction = subsys_pre_to_sco_ap_output_transaction_t::type_id::create("subsys_pre_to_sco_ap_output_transaction");
    //  UVMF_CHANGE_ME: Implement predictor model here.  
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "UVMF_CHANGE_ME: The subsys_predictor::write_subsys_axi_1_ae function needs to be completed with DUT prediction model",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
 
    // Code for sending output transaction out through subsys_pre_to_sco_ap
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    subsys_pre_to_sco_ap.write(subsys_pre_to_sco_ap_output_transaction);
    // pragma uvmf custom subsys_axi_1_ae_predictor end
  endfunction

  // FUNCTION: write_subsys_axi_2_ae
  // Transactions received through subsys_axi_2_ae initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_subsys_axi_2_ae(apb_m t);
    // pragma uvmf custom subsys_axi_2_ae_predictor begin
    subsys_axi_2_ae_debug = t;
    `uvm_info("PRED", "Transaction Received through subsys_axi_2_ae", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    // Construct one of each output transaction type.
    subsys_pre_to_sco_ap_output_transaction = subsys_pre_to_sco_ap_output_transaction_t::type_id::create("subsys_pre_to_sco_ap_output_transaction");
    //  UVMF_CHANGE_ME: Implement predictor model here.  
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "UVMF_CHANGE_ME: The subsys_predictor::write_subsys_axi_2_ae function needs to be completed with DUT prediction model",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
 
    // Code for sending output transaction out through subsys_pre_to_sco_ap
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    subsys_pre_to_sco_ap.write(subsys_pre_to_sco_ap_output_transaction);
    // pragma uvmf custom subsys_axi_2_ae_predictor end
  endfunction


endclass 

// pragma uvmf custom external begin
// pragma uvmf custom external end

