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
//   mem_in_ae receives transactions of type  mem_transaction
//   axi4_master_1_ae receives transactions of type  mvc_sequence_item_base
//   axi4_master_0_ae receives transactions of type  mvc_sequence_item_base
//
//   This analysis component has the following analysis_ports that can broadcast 
//   the listed transaction type.
//
//  pkt_sb_ap broadcasts transactions of type pkt_transaction
//  apb3_config_master_ap broadcasts transactions of type mvc_sequence_item_base
//  axi4_slave_ap broadcasts transactions of type mvc_sequence_item_base
//  mem_sb_ap broadcasts transactions of type mem_transaction
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class block_c_predictor #(
  type CONFIG_T,
  type BASE_T = uvm_component
  ) extends BASE_T;

  // Factory registration of this class
  `uvm_component_param_utils( block_c_predictor #(
                              CONFIG_T,
                              BASE_T
                              ))


  // Instantiate a handle to the configuration of the environment in which this component resides
  CONFIG_T configuration;

  
  // Instantiate the analysis exports
  uvm_analysis_imp_mem_in_ae #(mem_transaction, block_c_predictor #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) mem_in_ae;
  uvm_analysis_imp_axi4_master_1_ae #(mvc_sequence_item_base, block_c_predictor #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) axi4_master_1_ae;
  uvm_analysis_imp_axi4_master_0_ae #(mvc_sequence_item_base, block_c_predictor #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) axi4_master_0_ae;

  
  // Instantiate the analysis ports
  uvm_analysis_port #(pkt_transaction) pkt_sb_ap;
  uvm_analysis_port #(mvc_sequence_item_base) apb3_config_master_ap;
  uvm_analysis_port #(mvc_sequence_item_base) axi4_slave_ap;
  uvm_analysis_port #(mem_transaction) mem_sb_ap;


  // Transaction variable for predicted values to be sent out pkt_sb_ap
  // Once a transaction is sent through an analysis_port, another transaction should
  // be constructed for the next predicted transaction. 
  typedef pkt_transaction pkt_sb_ap_output_transaction_t;
  pkt_sb_ap_output_transaction_t pkt_sb_ap_output_transaction;
  // Code for sending output transaction out through pkt_sb_ap
  // pkt_sb_ap.write(pkt_sb_ap_output_transaction);
  // Transaction variable for predicted values to be sent out apb3_config_master_ap
  // Once a transaction is sent through an analysis_port, another transaction should
  // be constructed for the next predicted transaction. 
  typedef mvc_sequence_item_base apb3_config_master_ap_output_transaction_t;
  apb3_config_master_ap_output_transaction_t apb3_config_master_ap_output_transaction;
  // Code for sending output transaction out through apb3_config_master_ap
  // apb3_config_master_ap.write(apb3_config_master_ap_output_transaction);
  // Transaction variable for predicted values to be sent out axi4_slave_ap
  // Once a transaction is sent through an analysis_port, another transaction should
  // be constructed for the next predicted transaction. 
  typedef mvc_sequence_item_base axi4_slave_ap_output_transaction_t;
  axi4_slave_ap_output_transaction_t axi4_slave_ap_output_transaction;
  // Code for sending output transaction out through axi4_slave_ap
  // axi4_slave_ap.write(axi4_slave_ap_output_transaction);
  // Transaction variable for predicted values to be sent out mem_sb_ap
  // Once a transaction is sent through an analysis_port, another transaction should
  // be constructed for the next predicted transaction. 
  typedef mem_transaction mem_sb_ap_output_transaction_t;
  mem_sb_ap_output_transaction_t mem_sb_ap_output_transaction;
  // Code for sending output transaction out through mem_sb_ap
  // mem_sb_ap.write(mem_sb_ap_output_transaction);

  // Define transaction handles for debug visibility 
  mem_transaction mem_in_ae_debug;
  mvc_sequence_item_base axi4_master_1_ae_debug;
  mvc_sequence_item_base axi4_master_0_ae_debug;


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

    mem_in_ae = new("mem_in_ae", this);
    axi4_master_1_ae = new("axi4_master_1_ae", this);
    axi4_master_0_ae = new("axi4_master_0_ae", this);
    pkt_sb_ap =new("pkt_sb_ap", this );
    apb3_config_master_ap =new("apb3_config_master_ap", this );
    axi4_slave_ap =new("axi4_slave_ap", this );
    mem_sb_ap =new("mem_sb_ap", this );
  // pragma uvmf custom build_phase begin
  // pragma uvmf custom build_phase end
  endfunction

  // FUNCTION: write_mem_in_ae
  // Transactions received through mem_in_ae initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_mem_in_ae(mem_transaction t);
    // pragma uvmf custom mem_in_ae_predictor begin
    mem_in_ae_debug = t;
    `uvm_info("PRED", "Transaction Received through mem_in_ae", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    // Construct one of each output transaction type.
    pkt_sb_ap_output_transaction = pkt_sb_ap_output_transaction_t::type_id::create("pkt_sb_ap_output_transaction");
    apb3_config_master_ap_output_transaction = apb3_config_master_ap_output_transaction_t::type_id::create("apb3_config_master_ap_output_transaction");
    axi4_slave_ap_output_transaction = axi4_slave_ap_output_transaction_t::type_id::create("axi4_slave_ap_output_transaction");
    mem_sb_ap_output_transaction = mem_sb_ap_output_transaction_t::type_id::create("mem_sb_ap_output_transaction");
    //  UVMF_CHANGE_ME: Implement predictor model here.  
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "UVMF_CHANGE_ME: The block_c_predictor::write_mem_in_ae function needs to be completed with DUT prediction model",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
 
    // Code for sending output transaction out through pkt_sb_ap
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    pkt_sb_ap.write(pkt_sb_ap_output_transaction);
    // Code for sending output transaction out through apb3_config_master_ap
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    apb3_config_master_ap.write(apb3_config_master_ap_output_transaction);
    // Code for sending output transaction out through axi4_slave_ap
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    axi4_slave_ap.write(axi4_slave_ap_output_transaction);
    // Code for sending output transaction out through mem_sb_ap
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    mem_sb_ap.write(mem_sb_ap_output_transaction);
    // pragma uvmf custom mem_in_ae_predictor end
  endfunction

  // FUNCTION: write_axi4_master_1_ae
  // Transactions received through axi4_master_1_ae initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_axi4_master_1_ae(mvc_sequence_item_base t);
    // pragma uvmf custom axi4_master_1_ae_predictor begin
    axi4_master_1_ae_debug = t;
    `uvm_info("PRED", "Transaction Received through axi4_master_1_ae", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    // Construct one of each output transaction type.
    pkt_sb_ap_output_transaction = pkt_sb_ap_output_transaction_t::type_id::create("pkt_sb_ap_output_transaction");
    apb3_config_master_ap_output_transaction = apb3_config_master_ap_output_transaction_t::type_id::create("apb3_config_master_ap_output_transaction");
    axi4_slave_ap_output_transaction = axi4_slave_ap_output_transaction_t::type_id::create("axi4_slave_ap_output_transaction");
    mem_sb_ap_output_transaction = mem_sb_ap_output_transaction_t::type_id::create("mem_sb_ap_output_transaction");
    //  UVMF_CHANGE_ME: Implement predictor model here.  
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "UVMF_CHANGE_ME: The block_c_predictor::write_axi4_master_1_ae function needs to be completed with DUT prediction model",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
 
    // Code for sending output transaction out through pkt_sb_ap
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    pkt_sb_ap.write(pkt_sb_ap_output_transaction);
    // Code for sending output transaction out through apb3_config_master_ap
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    apb3_config_master_ap.write(apb3_config_master_ap_output_transaction);
    // Code for sending output transaction out through axi4_slave_ap
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    axi4_slave_ap.write(axi4_slave_ap_output_transaction);
    // Code for sending output transaction out through mem_sb_ap
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    mem_sb_ap.write(mem_sb_ap_output_transaction);
    // pragma uvmf custom axi4_master_1_ae_predictor end
  endfunction

  // FUNCTION: write_axi4_master_0_ae
  // Transactions received through axi4_master_0_ae initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_axi4_master_0_ae(mvc_sequence_item_base t);
    // pragma uvmf custom axi4_master_0_ae_predictor begin
    axi4_master_0_ae_debug = t;
    `uvm_info("PRED", "Transaction Received through axi4_master_0_ae", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    // Construct one of each output transaction type.
    pkt_sb_ap_output_transaction = pkt_sb_ap_output_transaction_t::type_id::create("pkt_sb_ap_output_transaction");
    apb3_config_master_ap_output_transaction = apb3_config_master_ap_output_transaction_t::type_id::create("apb3_config_master_ap_output_transaction");
    axi4_slave_ap_output_transaction = axi4_slave_ap_output_transaction_t::type_id::create("axi4_slave_ap_output_transaction");
    mem_sb_ap_output_transaction = mem_sb_ap_output_transaction_t::type_id::create("mem_sb_ap_output_transaction");
    //  UVMF_CHANGE_ME: Implement predictor model here.  
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "UVMF_CHANGE_ME: The block_c_predictor::write_axi4_master_0_ae function needs to be completed with DUT prediction model",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
 
    // Code for sending output transaction out through pkt_sb_ap
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    pkt_sb_ap.write(pkt_sb_ap_output_transaction);
    // Code for sending output transaction out through apb3_config_master_ap
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    apb3_config_master_ap.write(apb3_config_master_ap_output_transaction);
    // Code for sending output transaction out through axi4_slave_ap
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    axi4_slave_ap.write(axi4_slave_ap_output_transaction);
    // Code for sending output transaction out through mem_sb_ap
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    mem_sb_ap.write(mem_sb_ap_output_transaction);
    // pragma uvmf custom axi4_master_0_ae_predictor end
  endfunction


endclass 

// pragma uvmf custom external begin
// pragma uvmf custom external end

