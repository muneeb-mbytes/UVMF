//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//                                          
// DESCRIPTION: THis is the configuration for the chip environment.
//  it contains configuration classes for each agent.  It also contains
//  environment level configuration variables.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class chip_env_configuration #(
             int CHIP_CP_IN_DATA_WIDTH = 20,
             int CHIP_CP_IN_ADDR_WIDTH = 10,
             int CHIP_CP_OUT_ADDR_WIDTH = 25,
             int CHIP_UDP_DATA_WIDTH = 40
             )
extends uvmf_environment_configuration_base;

  `uvm_object_param_utils( chip_env_configuration #(
                           CHIP_CP_IN_DATA_WIDTH,
                           CHIP_CP_IN_ADDR_WIDTH,
                           CHIP_CP_OUT_ADDR_WIDTH,
                           CHIP_UDP_DATA_WIDTH
                           ))


//Constraints for the configuration variables:

// Instantiate the register model
  chip_reg_model  chip_rm;

  covergroup chip_configuration_cg;
    // pragma uvmf custom covergroup begin
    option.auto_bin_max=1024;
    // pragma uvmf custom covergroup end
  endgroup

typedef block_a_env_configuration block_a_env_config_t;
rand block_a_env_config_t block_a_env_config;

typedef block_b_env_configuration#(
                .CP_IN_DATA_WIDTH(CHIP_CP_IN_DATA_WIDTH),
                .CP_OUT_ADDR_WIDTH(CHIP_CP_OUT_ADDR_WIDTH),
                .CP_IN_ADDR_WIDTH(CHIP_CP_IN_ADDR_WIDTH),
                .UDP_DATA_WIDTH(CHIP_UDP_DATA_WIDTH)
                ) block_b_env_config_t;
rand block_b_env_config_t block_b_env_config;



    string                block_a_env_interface_names[];
    uvmf_active_passive_t block_a_env_interface_activity[];
    string                block_b_env_interface_names[];
    uvmf_active_passive_t block_b_env_interface_activity[];


  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(chip_env_configuration#(
                      .CHIP_CP_IN_DATA_WIDTH(CHIP_CP_IN_DATA_WIDTH),
                      .CHIP_CP_IN_ADDR_WIDTH(CHIP_CP_IN_ADDR_WIDTH),
                      .CHIP_CP_OUT_ADDR_WIDTH(CHIP_CP_OUT_ADDR_WIDTH),
                      .CHIP_UDP_DATA_WIDTH(CHIP_UDP_DATA_WIDTH)
                      ))) chip_vsqr_t;
  chip_vsqr_t vsqr;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

// ****************************************************************************
// FUNCTION : new()
// This function is the standard SystemVerilog constructor.
// This function constructs the configuration object for each agent in the environment.
//
  function new( string name = "" );
    super.new( name );

   block_a_env_config = block_a_env_config_t::type_id::create("block_a_env_config");
   block_b_env_config = block_b_env_config_t::type_id::create("block_b_env_config");



    chip_configuration_cg=new;
    `uvm_warning("COVERAGE_MODEL_REVIEW", "A covergroup has been constructed which may need review because of either generation or re-generation with merging.  Please note that configuration variables added as a result of re-generation and merging are not automatically added to the covergroup.  Remove this warning after the covergroup has been reviewed.")

  // pragma uvmf custom new begin
  // pragma uvmf custom new end
  endfunction

// ****************************************************************************
// FUNCTION : set_vsqr()
// This function is used to assign the vsqr handle.
  virtual function void set_vsqr( chip_vsqr_t vsqr);
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
     

     "\n", block_a_env_config.convert2string,
     "\n", block_b_env_config.convert2string

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

  // Interface initialization for sub-environments
    block_a_env_interface_names    = new[4];
    block_a_env_interface_activity = new[4];

    block_a_env_interface_names     = interface_names[0:3];
    block_a_env_interface_activity  = interface_activity[0:3];
    block_b_env_interface_names    = new[4];
    block_b_env_interface_activity = new[4];

    block_b_env_interface_names     = interface_names[4:7];
    block_b_env_interface_activity  = interface_activity[4:7];



    // pragma uvmf custom reg_model_config_initialize begin
    // Register model creation and configuation
    if (register_model == null) begin
      chip_rm = chip_reg_model::type_id::create("chip_rm");
      chip_rm.build();
      chip_rm.lock_model();
      enable_reg_adaptation = 0;
      enable_reg_prediction = 0;
    end else begin
      $cast(chip_rm,register_model);
      enable_reg_prediction = 0;
    end
    // pragma uvmf custom reg_model_config_initialize end

     block_a_env_config.initialize( sim_level, {environment_path,".block_a_env"}, block_a_env_interface_names, null,   block_a_env_interface_activity);
     block_b_env_config.initialize( sim_level, {environment_path,".block_b_env"}, block_b_env_interface_names, chip_rm.block_b_env_rm,   block_b_env_interface_activity);



  // pragma uvmf custom initialize begin
  // pragma uvmf custom initialize end

  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

