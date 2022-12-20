//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//                                          
// DESCRIPTION: THis is the configuration for the block_b environment.
//  it contains configuration classes for each agent.  It also contains
//  environment level configuration variables.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class block_b_env_configuration #(
             int CP_IN_DATA_WIDTH = 120,
             int CP_IN_ADDR_WIDTH = 110,
             int CP_OUT_ADDR_WIDTH = 111,
             int UDP_DATA_WIDTH = 140
             )
extends uvmf_environment_configuration_base;

  `uvm_object_param_utils( block_b_env_configuration #(
                           CP_IN_DATA_WIDTH,
                           CP_IN_ADDR_WIDTH,
                           CP_OUT_ADDR_WIDTH,
                           UDP_DATA_WIDTH
                           ))

  bit block_b_cfgVar1;
  rand bit [3:0] block_b_cfgVar3;
  rand int block_b_cfgVar4;
  rand int block_b_cfgVar5;

//Constraints for the configuration variables:
  constraint element_range_c { block_b_cfgVar4>block_b_cfgVar5; }
  constraint non_negative_c { (block_b_cfgVar1==0) -> block_b_cfgVar4==0;}

// Instantiate the register model
  blkb_reg_block  block_b_rm;

  covergroup block_b_configuration_cg;
    // pragma uvmf custom covergroup begin
    option.auto_bin_max=1024;
    coverpoint block_b_cfgVar1;
    coverpoint block_b_cfgVar3;
    coverpoint block_b_cfgVar4;
    coverpoint block_b_cfgVar5;
    // pragma uvmf custom covergroup end
  endgroup


    typedef mem_configuration#(
                .ADDR_WIDTH(CP_IN_ADDR_WIDTH),
                .DATA_WIDTH(CP_IN_DATA_WIDTH)
                ) control_plane_in_config_t;
    rand control_plane_in_config_t control_plane_in_config;

    typedef mem_configuration#(
                .ADDR_WIDTH(CP_OUT_ADDR_WIDTH)
                ) control_plane_out_config_t;
    rand control_plane_out_config_t control_plane_out_config;

    typedef pkt_configuration#(
                .DATA_WIDTH(UDP_DATA_WIDTH)
                ) unsecure_data_plane_in_config_t;
    rand unsecure_data_plane_in_config_t unsecure_data_plane_in_config;

    typedef pkt_configuration unsecure_data_plane_out_config_t;
    rand unsecure_data_plane_out_config_t unsecure_data_plane_out_config;




  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(block_b_env_configuration#(
                      .CP_IN_DATA_WIDTH(CP_IN_DATA_WIDTH),
                      .CP_IN_ADDR_WIDTH(CP_IN_ADDR_WIDTH),
                      .CP_OUT_ADDR_WIDTH(CP_OUT_ADDR_WIDTH),
                      .UDP_DATA_WIDTH(UDP_DATA_WIDTH)
                      ))) block_b_vsqr_t;
  block_b_vsqr_t vsqr;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

// ****************************************************************************
// FUNCTION : new()
// This function is the standard SystemVerilog constructor.
// This function constructs the configuration object for each agent in the environment.
//
  function new( string name = "" );
    super.new( name );


    control_plane_in_config = control_plane_in_config_t::type_id::create("control_plane_in_config");
    control_plane_out_config = control_plane_out_config_t::type_id::create("control_plane_out_config");
    unsecure_data_plane_in_config = unsecure_data_plane_in_config_t::type_id::create("unsecure_data_plane_in_config");
    unsecure_data_plane_out_config = unsecure_data_plane_out_config_t::type_id::create("unsecure_data_plane_out_config");


    block_b_configuration_cg=new;
    `uvm_warning("COVERAGE_MODEL_REVIEW", "A covergroup has been constructed which may need review because of either generation or re-generation with merging.  Please note that configuration variables added as a result of re-generation and merging are not automatically added to the covergroup.  Remove this warning after the covergroup has been reviewed.")

  // pragma uvmf custom new begin
  // pragma uvmf custom new end
  endfunction

// ****************************************************************************
// FUNCTION : set_vsqr()
// This function is used to assign the vsqr handle.
  virtual function void set_vsqr( block_b_vsqr_t vsqr);
     this.vsqr = vsqr;
  endfunction : set_vsqr

// ****************************************************************************
// FUNCTION: post_randomize()
// This function is automatically called after the randomize() function 
// is executed.
//
  function void post_randomize();
    super.post_randomize();
    // pragma uvmf custom post_randomize begin
    // pragma uvmf custom post_randomize end
  endfunction
  
// ****************************************************************************
// FUNCTION: convert2string()
// This function converts all variables in this class to a single string for
// logfile reporting. This function concatenates the convert2string result for
// each agent configuration in this configuration class.
//
  virtual function string convert2string();
    // pragma uvmf custom convert2string begin
    return {
     $sformatf("block_b_cfgVar1:0x%x block_b_cfgVar3:0x%x block_b_cfgVar4:0x%x block_b_cfgVar5:0x%x ",block_b_cfgVar1,block_b_cfgVar3,block_b_cfgVar4,block_b_cfgVar5),
     "\n", control_plane_in_config.convert2string,
     "\n", control_plane_out_config.convert2string,
     "\n", unsecure_data_plane_in_config.convert2string,
     "\n", unsecure_data_plane_out_config.convert2string


       };
    // pragma uvmf custom convert2string end
  endfunction
// ****************************************************************************
// FUNCTION: initialize();
// This function configures each interface agents configuration class.  The 
// sim level determines the active/passive state of the agent.  The environment_path
// identifies the hierarchy down to and including the instantiation name of the
// environment for this configuration class.  Each instance of the environment 
// has its own configuration class.  The string interface names are used by 
// the agent configurations to identify the virtual interface handle to pull from
// the uvm_config_db.  
//
  function void initialize(uvmf_sim_level_t sim_level, 
                                      string environment_path,
                                      string interface_names[],
                                      uvm_reg_block register_model = null,
                                      uvmf_active_passive_t interface_activity[] = {}
                                     );

    super.initialize(sim_level, environment_path, interface_names, register_model, interface_activity);



  // Interface initialization for local agents
     control_plane_in_config.initialize( interface_activity[0], {environment_path,".control_plane_in"}, interface_names[0]);
     control_plane_in_config.initiator_responder = INITIATOR;
     // control_plane_in_config.has_coverage = 1;
     control_plane_out_config.initialize( interface_activity[1], {environment_path,".control_plane_out"}, interface_names[1]);
     control_plane_out_config.initiator_responder = INITIATOR;
     // control_plane_out_config.has_coverage = 1;
     unsecure_data_plane_in_config.initialize( interface_activity[2], {environment_path,".unsecure_data_plane_in"}, interface_names[2]);
     unsecure_data_plane_in_config.initiator_responder = INITIATOR;
     // unsecure_data_plane_in_config.has_coverage = 1;
     unsecure_data_plane_out_config.initialize( interface_activity[3], {environment_path,".unsecure_data_plane_out"}, interface_names[3]);
     unsecure_data_plane_out_config.initiator_responder = INITIATOR;
     // unsecure_data_plane_out_config.has_coverage = 1;

    // pragma uvmf custom reg_model_config_initialize begin
    // Register model creation and configuation
    if (register_model == null) begin
      block_b_rm = blkb_reg_block::type_id::create("block_b_rm");
      block_b_rm.build();
      block_b_rm.lock_model();
      enable_reg_adaptation = 1;
      enable_reg_prediction = 1;
    end else begin
      $cast(block_b_rm,register_model);
      enable_reg_prediction = 1;
    end
    // pragma uvmf custom reg_model_config_initialize end




  // pragma uvmf custom initialize begin
  // pragma uvmf custom initialize end

  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

