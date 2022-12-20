//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// DESCRIPTION: 
//         This component is used to collect functional coverage at the environment level.
//   Coverage collection components typically do not have analysis ports for broadcasting
//   transactions.  They typically only receive transactions and sample functional coverage
//   on the transaction variables.
// 
//   This analysis component has the following analysis_exports that receive the 
//   listed transaction type.
//   
//   control_plane_in_ae receives transactions of type  mem_transaction  
//   secure_data_plane_in_ae receives transactions of type  pkt_transaction  
//
//   This analysis component has the following analysis_ports that can broadcast 
//   the listed transaction type.
//
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//


class block_a_coverage #(
  type CONFIG_T,
  type BASE_T = uvm_component
  ) extends BASE_T;

  // Factory registration of this class
  `uvm_component_param_utils( block_a_coverage #(
                              CONFIG_T,
                              BASE_T
                              ))

  // Instantiate a handle to the configuration of the environment in which this component resides
  CONFIG_T configuration;

  
  // Instantiate the analysis exports
  uvm_analysis_imp_control_plane_in_ae #(mem_transaction, block_a_coverage #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) control_plane_in_ae;
  uvm_analysis_imp_secure_data_plane_in_ae #(pkt_transaction, block_a_coverage #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) secure_data_plane_in_ae;




  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

// ****************************************************************************
  // UVMF_CHANGE_ME : Add coverage bins, crosses, exclusions, etc. according to coverage needs.
  covergroup block_a_coverage_cg;
    // pragma uvmf custom covergroup begin
    option.auto_bin_max=1024;
    option.per_instance=1;
    // pragma uvmf custom covergroup end
  endgroup


// ****************************************************************************
  // FUNCTION: new
  function new(string name, uvm_component parent);
     super.new(name,parent);
    block_a_coverage_cg=new;
    `uvm_warning("COVERAGE_MODEL_REVIEW", "A covergroup has been constructed which may need review because of either generation or re-generation with merging.  Remove this warning after the covergroup has been reviewed.")
  // pragma uvmf custom new begin
  // pragma uvmf custom new end
  endfunction

// ****************************************************************************
  // FUNCTION: build_phase
  virtual function void build_phase (uvm_phase phase);

    block_a_coverage_cg.set_inst_name($sformatf("block_a_coverage_cg_%s",get_full_name()));

    control_plane_in_ae = new("control_plane_in_ae", this);
    secure_data_plane_in_ae = new("secure_data_plane_in_ae", this);
  // pragma uvmf custom build_phase begin
  // pragma uvmf custom build_phase end
  endfunction

  // ****************************************************************************
  // FUNCTION: write_control_plane_in_ae
  // Transactions received through control_plane_in_ae initiate the execution of this function.
  // This function collects functional coverage on variables within the received transaction
  virtual function void write_control_plane_in_ae(mem_transaction t);
    // pragma uvmf custom control_plane_in_ae_coverage begin
    `uvm_info("COV", "Transaction Received through control_plane_in_ae", UVM_MEDIUM)
    `uvm_info("COV", {"            Data: ",t.convert2string()}, UVM_FULL)

    //  UVMF_CHANGE_ME: Add functional coverage to this component to implement coverage model.  
    `uvm_info("UNIMPLEMENTED_COVERAGE_MODEL", "******************************************************************************************************",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_COVERAGE_MODEL", "UVMF_CHANGE_ME: This component needs to be completed with coverage model",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_COVERAGE_MODEL", "******************************************************************************************************",UVM_NONE)
    // pragma uvmf custom control_plane_in_ae_coverage end
  endfunction
  // ****************************************************************************
  // FUNCTION: write_secure_data_plane_in_ae
  // Transactions received through secure_data_plane_in_ae initiate the execution of this function.
  // This function collects functional coverage on variables within the received transaction
  virtual function void write_secure_data_plane_in_ae(pkt_transaction t);
    // pragma uvmf custom secure_data_plane_in_ae_coverage begin
    `uvm_info("COV", "Transaction Received through secure_data_plane_in_ae", UVM_MEDIUM)
    `uvm_info("COV", {"            Data: ",t.convert2string()}, UVM_FULL)

    //  UVMF_CHANGE_ME: Add functional coverage to this component to implement coverage model.  
    `uvm_info("UNIMPLEMENTED_COVERAGE_MODEL", "******************************************************************************************************",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_COVERAGE_MODEL", "UVMF_CHANGE_ME: This component needs to be completed with coverage model",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_COVERAGE_MODEL", "******************************************************************************************************",UVM_NONE)
    // pragma uvmf custom secure_data_plane_in_ae_coverage end
  endfunction

endclass 

// pragma uvmf custom external begin
// pragma uvmf custom external end

