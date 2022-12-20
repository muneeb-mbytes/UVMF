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

typedef block_b_env_configuration #(
        .CP_IN_DATA_WIDTH(TEST_CP_IN_DATA_WIDTH),
        .CP_OUT_ADDR_WIDTH(TEST_CP_OUT_ADDR_WIDTH),
        .CP_IN_ADDR_WIDTH(TEST_CP_IN_ADDR_WIDTH),
        .UDP_DATA_WIDTH(TEST_UDP_DATA_WIDTH)
        )block_b_env_configuration_t;
typedef block_b_environment #(
        .CP_IN_DATA_WIDTH(TEST_CP_IN_DATA_WIDTH),
        .CP_OUT_ADDR_WIDTH(TEST_CP_OUT_ADDR_WIDTH),
        .CP_IN_ADDR_WIDTH(TEST_CP_IN_ADDR_WIDTH),
        .UDP_DATA_WIDTH(TEST_UDP_DATA_WIDTH)
        )block_b_environment_t;

class test_top extends uvmf_test_base #(.CONFIG_T(block_b_env_configuration_t), 
                                        .ENV_T(block_b_environment_t), 
                                        .TOP_LEVEL_SEQ_T(block_b_bench_sequence_base));

  `uvm_component_utils( test_top );



  string interface_names[] = {
    control_plane_in_BFM /* control_plane_in     [0] */ , 
    control_plane_out_BFM /* control_plane_out     [1] */ , 
    unsecure_data_plane_in_BFM /* unsecure_data_plane_in     [2] */ , 
    unsecure_data_plane_out_BFM /* unsecure_data_plane_out     [3] */ 
};

uvmf_active_passive_t interface_activities[] = { 
    ACTIVE /* control_plane_in     [0] */ , 
    ACTIVE /* control_plane_out     [1] */ , 
    ACTIVE /* unsecure_data_plane_in     [2] */ , 
    ACTIVE /* unsecure_data_plane_out     [3] */   };

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

