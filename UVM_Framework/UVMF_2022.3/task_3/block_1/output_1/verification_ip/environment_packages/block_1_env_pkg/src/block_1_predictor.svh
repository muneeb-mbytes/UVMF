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
//   axi_2_ae receives transactions of type  axi_m_transaction
//   apb_ae receives transactions of type  apb_transaction
//   axi_1_ae receives transactions of type  axi_m_transaction
//
//   This analysis component has the following analysis_ports that can broadcast 
//   the listed transaction type.
//
//  pre_to_sco_ap broadcasts transactions of type spi_s_transaction
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class block_1_predictor #(
  type CONFIG_T,
  type BASE_T = uvm_component
  ) extends BASE_T;

  // Factory registration of this class
  `uvm_component_param_utils( block_1_predictor #(
                              CONFIG_T,
                              BASE_T
                              ))


  // Instantiate a handle to the configuration of the environment in which this component resides
  CONFIG_T configuration;

  
  // Instantiate the analysis exports
  uvm_analysis_imp_axi_2_ae #(axi_m_transaction, block_1_predictor #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) axi_2_ae;
  uvm_analysis_imp_apb_ae #(apb_transaction, block_1_predictor #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) apb_ae;
  uvm_analysis_imp_axi_1_ae #(axi_m_transaction, block_1_predictor #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) axi_1_ae;

  
  // Instantiate the analysis ports
  uvm_analysis_port #(spi_s_transaction) pre_to_sco_ap;


  // Transaction variable for predicted values to be sent out pre_to_sco_ap
  // Once a transaction is sent through an analysis_port, another transaction should
  // be constructed for the next predicted transaction. 
  typedef spi_s_transaction pre_to_sco_ap_output_transaction_t;
  pre_to_sco_ap_output_transaction_t pre_to_sco_ap_output_transaction;
  // Code for sending output transaction out through pre_to_sco_ap
  // pre_to_sco_ap.write(pre_to_sco_ap_output_transaction);

  // Define transaction handles for debug visibility 
  axi_m_transaction axi_2_ae_debug;
  apb_transaction apb_ae_debug;
  axi_m_transaction axi_1_ae_debug;


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

    axi_2_ae = new("axi_2_ae", this);
    apb_ae = new("apb_ae", this);
    axi_1_ae = new("axi_1_ae", this);
    pre_to_sco_ap =new("pre_to_sco_ap", this );
  // pragma uvmf custom build_phase begin
  // pragma uvmf custom build_phase end
  endfunction

  // FUNCTION: write_axi_2_ae
  // Transactions received through axi_2_ae initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_axi_2_ae(axi_m_transaction t);
    // pragma uvmf custom axi_2_ae_predictor begin
    axi_2_ae_debug = t;
    `uvm_info("PRED", "Transaction Received through axi_2_ae", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    // Construct one of each output transaction type.
    pre_to_sco_ap_output_transaction = pre_to_sco_ap_output_transaction_t::type_id::create("pre_to_sco_ap_output_transaction");
    //  UVMF_CHANGE_ME: Implement predictor model here.  
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "UVMF_CHANGE_ME: The block_1_predictor::write_axi_2_ae function needs to be completed with DUT prediction model",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
 
    // Code for sending output transaction out through pre_to_sco_ap
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    pre_to_sco_ap.write(pre_to_sco_ap_output_transaction);
    // pragma uvmf custom axi_2_ae_predictor end
  endfunction

  // FUNCTION: write_apb_ae
  // Transactions received through apb_ae initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_apb_ae(apb_transaction t);
    // pragma uvmf custom apb_ae_predictor begin
    apb_ae_debug = t;
    `uvm_info("PRED", "Transaction Received through apb_ae", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    // Construct one of each output transaction type.
    pre_to_sco_ap_output_transaction = pre_to_sco_ap_output_transaction_t::type_id::create("pre_to_sco_ap_output_transaction");
    //  UVMF_CHANGE_ME: Implement predictor model here.  
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "UVMF_CHANGE_ME: The block_1_predictor::write_apb_ae function needs to be completed with DUT prediction model",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
 
    // Code for sending output transaction out through pre_to_sco_ap
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    pre_to_sco_ap.write(pre_to_sco_ap_output_transaction);
    // pragma uvmf custom apb_ae_predictor end
  endfunction

  // FUNCTION: write_axi_1_ae
  // Transactions received through axi_1_ae initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_axi_1_ae(axi_m_transaction t);
    // pragma uvmf custom axi_1_ae_predictor begin
    axi_1_ae_debug = t;
    `uvm_info("PRED", "Transaction Received through axi_1_ae", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    // Construct one of each output transaction type.
    pre_to_sco_ap_output_transaction = pre_to_sco_ap_output_transaction_t::type_id::create("pre_to_sco_ap_output_transaction");
    //  UVMF_CHANGE_ME: Implement predictor model here.  
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "UVMF_CHANGE_ME: The block_1_predictor::write_axi_1_ae function needs to be completed with DUT prediction model",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
 
    // Code for sending output transaction out through pre_to_sco_ap
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    pre_to_sco_ap.write(pre_to_sco_ap_output_transaction);
    // pragma uvmf custom axi_1_ae_predictor end
  endfunction


endclass 

// pragma uvmf custom external begin
// pragma uvmf custom external end

