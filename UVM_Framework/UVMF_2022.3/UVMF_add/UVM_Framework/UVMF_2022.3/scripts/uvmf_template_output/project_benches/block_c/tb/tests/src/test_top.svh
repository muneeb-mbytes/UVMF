//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
// Description: This top level UVM test is the base class for all
//     future tests created for this project.
//
//     This test class contains:
//          Configuration:  The top level configuration for the project.
//          Environment:    The top level environment for the project.
//          Top_level_sequence:  The top level sequence for the project.
//                                        
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

typedef block_c_env_configuration block_c_env_configuration_t;
typedef block_c_environment block_c_environment_t;

class test_top extends uvmf_test_base #(.CONFIG_T(block_c_env_configuration_t), 
                                        .ENV_T(block_c_environment_t), 
                                        .TOP_LEVEL_SEQ_T(block_c_bench_sequence_base));

  `uvm_component_utils( test_top );

// This message handler can be used to redirect QVIP Memeory Model messages through
// the UVM messaging mecahanism.  How to enable and use it is described in 
//      $UVMF_HOME/common/utility_packages/qvip_utils_pkg/src/qvip_report_catcher.svh
qvip_memory_message_handler message_handler;


  string interface_names[] = {
    uvm_test_top_environment_qvip_env_pcie_ep /* pcie_ep     [0] */ , 
    uvm_test_top_environment_qvip_env_axi4_master_0 /* axi4_master_0     [1] */ , 
    uvm_test_top_environment_qvip_env_axi4_master_1 /* axi4_master_1     [2] */ , 
    uvm_test_top_environment_qvip_env_axi4_slave /* axi4_slave     [3] */ , 
    uvm_test_top_environment_qvip_env_apb3_config_master /* apb3_config_master     [4] */ , 
    mem_in_BFM /* mem_in     [5] */ , 
    mem_out_BFM /* mem_out     [6] */ , 
    pkt_out_BFM /* pkt_out     [7] */ 
};

uvmf_active_passive_t interface_activities[] = { 
    ACTIVE /* pcie_ep     [0] */ , 
    ACTIVE /* axi4_master_0     [1] */ , 
    ACTIVE /* axi4_master_1     [2] */ , 
    ACTIVE /* axi4_slave     [3] */ , 
    ACTIVE /* apb3_config_master     [4] */ , 
    ACTIVE /* mem_in     [5] */ , 
    ACTIVE /* mem_out     [6] */ , 
    ACTIVE /* pkt_out     [7] */   };

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // ****************************************************************************
  // FUNCTION: new()
  // This is the standard systemVerilog constructor.  All components are 
  // constructed in the build_phase to allow factory overriding.
  //
  function new( string name = "", uvm_component parent = null );
     super.new( name ,parent );
  endfunction



  // ****************************************************************************
  // FUNCTION: build_phase()
  // The construction of the configuration and environment classes is done in
  // the build_phase of uvmf_test_base.  Once the configuraton and environment
  // classes are built then the initialize call is made to perform the
  // following: 
  //     Monitor and driver BFM virtual interface handle passing into agents
  //     Set the active/passive state for each agent
  // Once this build_phase completes, the build_phase of the environment is
  // executed which builds the agents.
  //
  virtual function void build_phase(uvm_phase phase);
// pragma uvmf custom build_phase_pre_super begin
// pragma uvmf custom build_phase_pre_super end
    super.build_phase(phase);
    // pragma uvmf custom configuration_settings_post_randomize begin
    // pragma uvmf custom configuration_settings_post_randomize end
    configuration.initialize(NA, "uvm_test_top.environment", interface_names, null, interface_activities);
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

