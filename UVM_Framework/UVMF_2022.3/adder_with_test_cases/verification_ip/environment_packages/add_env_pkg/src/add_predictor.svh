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
//   add_in_agent_ae receives transactions of type  add_in_transaction
//
//   This analysis component has the following analysis_ports that can broadcast 
//   the listed transaction type.
//
//  add_sb_ap broadcasts transactions of type add_out_transaction
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class add_predictor #(
  type CONFIG_T,
  type BASE_T = uvm_component
  ) extends BASE_T;

  // Factory registration of this class
  `uvm_component_param_utils( add_predictor #(
                              CONFIG_T,
                              BASE_T
                              ))


  // Instantiate a handle to the configuration of the environment in which this component resides
  CONFIG_T configuration;

  
  // Instantiate the analysis exports
  uvm_analysis_imp_add_in_agent_ae #(add_in_transaction, add_predictor #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) add_in_agent_ae;

  
  // Instantiate the analysis ports
  uvm_analysis_port #(add_out_transaction) add_sb_ap;


  // Transaction variable for predicted values to be sent out add_sb_ap
  // Once a transaction is sent through an analysis_port, another transaction should
  // be constructed for the next predicted transaction. 
  typedef add_out_transaction add_sb_ap_output_transaction_t;
  add_sb_ap_output_transaction_t add_sb_ap_output_transaction;
  // Code for sending output transaction out through add_sb_ap
  // add_sb_ap.write(add_sb_ap_output_transaction);

  // Define transaction handles for debug visibility 
  add_in_transaction add_in_agent_ae_debug;


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

    add_in_agent_ae = new("add_in_agent_ae", this);
    add_sb_ap =new("add_sb_ap", this );
  // pragma uvmf custom build_phase begin
  // pragma uvmf custom build_phase end
  endfunction

  // FUNCTION: write_add_in_agent_ae
  // Transactions received through add_in_agent_ae initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_add_in_agent_ae(add_in_transaction t);
    // pragma uvmf custom add_in_agent_ae_predictor begin
    add_in_agent_ae_debug = t;
    `uvm_info("PRED", "Transaction Received through add_in_agent_ae", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    // Construct one of each output transaction type.
    add_sb_ap_output_transaction = add_sb_ap_output_transaction_t::type_id::create("add_sb_ap_output_transaction");
    //  UVMF_CHANGE_ME: Implement predictor model here. 
    {add_sb_ap_output_transaction.cout,add_sb_ap_output_transaction.sum} = t.a + t.b;

    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "UVMF_CHANGE_ME: The add_predictor::write_add_in_agent_ae function needs to be completed with DUT prediction model",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
 
    // Code for sending output transaction out through add_sb_ap
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    add_sb_ap.write(add_sb_ap_output_transaction);
    // pragma uvmf custom add_in_agent_ae_predictor end
  endfunction


endclass 

// pragma uvmf custom external begin
// pragma uvmf custom external end

