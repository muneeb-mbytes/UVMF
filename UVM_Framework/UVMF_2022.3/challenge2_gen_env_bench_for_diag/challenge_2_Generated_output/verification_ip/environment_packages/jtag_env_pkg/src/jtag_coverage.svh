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
//   jtag_cov_ae receives transactions of type  jtag_transaction  
//
//   This analysis component has the following analysis_ports that can broadcast 
//   the listed transaction type.
//
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//


class jtag_coverage #(
  type CONFIG_T,
  type BASE_T = uvm_component
  ) extends BASE_T;

  // Factory registration of this class
  `uvm_component_param_utils( jtag_coverage #(
                              CONFIG_T,
                              BASE_T
                              ))

  // Instantiate a handle to the configuration of the environment in which this component resides
  CONFIG_T configuration;

  
  // Instantiate the analysis exports
  uvm_analysis_imp_jtag_cov_ae #(jtag_transaction, jtag_coverage #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) jtag_cov_ae;




  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

// ****************************************************************************
  // UVMF_CHANGE_ME : Add coverage bins, crosses, exclusions, etc. according to coverage needs.
  covergroup jtag_coverage_cg;
    // pragma uvmf custom covergroup begin
    option.auto_bin_max=1024;
    option.per_instance=1;
    // pragma uvmf custom covergroup end
  endgroup


// ****************************************************************************
  // FUNCTION: new
  function new(string name, uvm_component parent);
     super.new(name,parent);
    jtag_coverage_cg=new;
    `uvm_warning("COVERAGE_MODEL_REVIEW", "A covergroup has been constructed which may need review because of either generation or re-generation with merging.  Remove this warning after the covergroup has been reviewed.")
  // pragma uvmf custom new begin
  // pragma uvmf custom new end
  endfunction

// ****************************************************************************
  // FUNCTION: build_phase
  virtual function void build_phase (uvm_phase phase);

    jtag_coverage_cg.set_inst_name($sformatf("jtag_coverage_cg_%s",get_full_name()));

    jtag_cov_ae = new("jtag_cov_ae", this);
  // pragma uvmf custom build_phase begin
  // pragma uvmf custom build_phase end
  endfunction

  // ****************************************************************************
  // FUNCTION: write_jtag_cov_ae
  // Transactions received through jtag_cov_ae initiate the execution of this function.
  // This function collects functional coverage on variables within the received transaction
  virtual function void write_jtag_cov_ae(jtag_transaction t);
    // pragma uvmf custom jtag_cov_ae_coverage begin
    `uvm_info("COV", "Transaction Received through jtag_cov_ae", UVM_MEDIUM)
    `uvm_info("COV", {"            Data: ",t.convert2string()}, UVM_FULL)

    //  UVMF_CHANGE_ME: Add functional coverage to this component to implement coverage model.  
    `uvm_info("UNIMPLEMENTED_COVERAGE_MODEL", "******************************************************************************************************",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_COVERAGE_MODEL", "UVMF_CHANGE_ME: This component needs to be completed with coverage model",UVM_NONE)
    `uvm_info("UNIMPLEMENTED_COVERAGE_MODEL", "******************************************************************************************************",UVM_NONE)
    // pragma uvmf custom jtag_cov_ae_coverage end
  endfunction

endclass 

// pragma uvmf custom external begin
// pragma uvmf custom external end

