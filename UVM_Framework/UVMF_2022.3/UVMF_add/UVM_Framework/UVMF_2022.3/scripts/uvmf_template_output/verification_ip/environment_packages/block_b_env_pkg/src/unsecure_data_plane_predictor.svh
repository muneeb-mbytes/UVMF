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
//   control_plane_in_ae receives transactions of type  control_plane_in_ae_t
//   unsecure_data_plane_in_ae receives transactions of type  unsecure_data_plane_in_ae_t
//
//   This analysis component has the following analysis_ports that can broadcast 
//   the listed transaction type.
//
//  unsecure_data_plane_sb_ap broadcasts transactions of type unsecure_data_plane_sb_ap_t
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class unsecure_data_plane_predictor #(
  type CONFIG_T,
  type BASE_T = uvm_component,
  type control_plane_in_ae_t,
  type unsecure_data_plane_in_ae_t,
  type unsecure_data_plane_sb_ap_t
  ) extends BASE_T;

  // Factory registration of this class
  `uvm_component_param_utils( unsecure_data_plane_predictor #(
                              CONFIG_T,
                              BASE_T,
                              control_plane_in_ae_t,
                              unsecure_data_plane_in_ae_t,
                              unsecure_data_plane_sb_ap_t
                              ))

  // System Verilog variables for C function  hello_world_from_environment (unsigned int variable1, unsigned int variable2) 
  int unsigned  variable1 ;
  int unsigned  variable2 ;
  // System Verilog variables for C function  good_bye_world_from_environment (unsigned int variable3, unsigned int variable4) 
  int unsigned  variable3 ;
  int unsigned  variable4 ;

  // Instantiate a handle to the configuration of the environment in which this component resides
  CONFIG_T configuration;

  
  // Instantiate the analysis exports
  uvm_analysis_imp_control_plane_in_ae #(control_plane_in_ae_t, unsecure_data_plane_predictor #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T),
                              .control_plane_in_ae_t(control_plane_in_ae_t),
                              .unsecure_data_plane_in_ae_t(unsecure_data_plane_in_ae_t),
                              .unsecure_data_plane_sb_ap_t(unsecure_data_plane_sb_ap_t)
                              )) control_plane_in_ae;
  uvm_analysis_imp_unsecure_data_plane_in_ae #(unsecure_data_plane_in_ae_t, unsecure_data_plane_predictor #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T),
                              .control_plane_in_ae_t(control_plane_in_ae_t),
                              .unsecure_data_plane_in_ae_t(unsecure_data_plane_in_ae_t),
                              .unsecure_data_plane_sb_ap_t(unsecure_data_plane_sb_ap_t)
                              )) unsecure_data_plane_in_ae;

  
  // Instantiate the analysis ports
  uvm_analysis_port #(unsecure_data_plane_sb_ap_t) unsecure_data_plane_sb_ap;


  // Transaction variable for predicted values to be sent out unsecure_data_plane_sb_ap
  // Once a transaction is sent through an analysis_port, another transaction should
  // be constructed for the next predicted transaction. 
  typedef unsecure_data_plane_sb_ap_t unsecure_data_plane_sb_ap_output_transaction_t;
  unsecure_data_plane_sb_ap_output_transaction_t unsecure_data_plane_sb_ap_output_transaction;
  // Code for sending output transaction out through unsecure_data_plane_sb_ap
  // unsecure_data_plane_sb_ap.write(unsecure_data_plane_sb_ap_output_transaction);

  // Define transaction handles for debug visibility 
  control_plane_in_ae_t control_plane_in_ae_debug;
  unsecure_data_plane_in_ae_t unsecure_data_plane_in_ae_debug;


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

    control_plane_in_ae = new("control_plane_in_ae", this);
    unsecure_data_plane_in_ae = new("unsecure_data_plane_in_ae", this);
    unsecure_data_plane_sb_ap =new("unsecure_data_plane_sb_ap", this );
  // pragma uvmf custom build_phase begin
  // pragma uvmf custom build_phase end
  endfunction

  // FUNCTION: write_control_plane_in_ae
  // Transactions received through control_plane_in_ae initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_control_plane_in_ae(control_plane_in_ae_t t);
    // pragma uvmf custom control_plane_in_ae_predictor begin
    control_plane_in_ae_debug = t;
    `uvm_info("PRED", "Transaction Received through control_plane_in_ae", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    // Construct one of each output transaction type.
    unsecure_data_plane_sb_ap_output_transaction = unsecure_data_plane_sb_ap_output_transaction_t::type_id::create("unsecure_data_plane_sb_ap_output_transaction");
    //  UVMF_CHANGE_ME: Implement predictor model here.  
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "UVMF_CHANGE_ME: The unsecure_data_plane_predictor::write_control_plane_in_ae function needs to be completed with DUT prediction model",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
    // Calling C functions
    hello_world_from_environment(variable1,variable2);
    // Calling C functions
    good_bye_world_from_environment(variable3,variable4);
 
    // Code for sending output transaction out through unsecure_data_plane_sb_ap
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    unsecure_data_plane_sb_ap.write(unsecure_data_plane_sb_ap_output_transaction);
    // pragma uvmf custom control_plane_in_ae_predictor end
  endfunction

  // FUNCTION: write_unsecure_data_plane_in_ae
  // Transactions received through unsecure_data_plane_in_ae initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_unsecure_data_plane_in_ae(unsecure_data_plane_in_ae_t t);
    // pragma uvmf custom unsecure_data_plane_in_ae_predictor begin
    unsecure_data_plane_in_ae_debug = t;
    `uvm_info("PRED", "Transaction Received through unsecure_data_plane_in_ae", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    // Construct one of each output transaction type.
    unsecure_data_plane_sb_ap_output_transaction = unsecure_data_plane_sb_ap_output_transaction_t::type_id::create("unsecure_data_plane_sb_ap_output_transaction");
    //  UVMF_CHANGE_ME: Implement predictor model here.  
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "UVMF_CHANGE_ME: The unsecure_data_plane_predictor::write_unsecure_data_plane_in_ae function needs to be completed with DUT prediction model",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
    // Calling C functions
    hello_world_from_environment(variable1,variable2);
    // Calling C functions
    good_bye_world_from_environment(variable3,variable4);
 
    // Code for sending output transaction out through unsecure_data_plane_sb_ap
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    unsecure_data_plane_sb_ap.write(unsecure_data_plane_sb_ap_output_transaction);
    // pragma uvmf custom unsecure_data_plane_in_ae_predictor end
  endfunction


endclass 

// pragma uvmf custom external begin
// pragma uvmf custom external end

