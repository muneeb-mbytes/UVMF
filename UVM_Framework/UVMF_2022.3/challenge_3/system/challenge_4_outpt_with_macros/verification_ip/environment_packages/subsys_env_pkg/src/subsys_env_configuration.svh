//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//                                          
// DESCRIPTION: THis is the configuration for the subsys environment.
//  it contains configuration classes for each agent.  It also contains
//  environment level configuration variables.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
`ifndef SUBSYS_ENV_CONFIGURATION
`define SUBSYS_ENV_CONFIGURATION

class subsys_env_configuration 
extends uvmf_environment_configuration_base;

  `uvm_object_utils( subsys_env_configuration )

  bit has_scoreboard;

//Constraints for the configuration variables:


  covergroup subsys_configuration_cg;
    // pragma uvmf custom covergroup begin
    option.auto_bin_max=1024;
    coverpoint has_scoreboard;
    // pragma uvmf custom covergroup end
  endgroup

typedef block_1_env_configuration b1_config_t;
rand b1_config_t b1_config;

typedef block_2_env_configuration b2_config_t;
rand b2_config_t b2_config;



    string                b1_interface_names[];
    uvmf_active_passive_t b1_interface_activity[];
    string                b2_interface_names[];
    uvmf_active_passive_t b2_interface_activity[];


  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(subsys_env_configuration)) subsys_vsqr_t;
  subsys_vsqr_t vsqr;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

// ****************************************************************************
// FUNCTION : new()
// This function is the standard SystemVerilog constructor.
// This function constructs the configuration object for each agent in the environment.
//
  function new( string name = "" );
    super.new( name );

   b1_config = b1_config_t::type_id::create("b1_config");
   b2_config = b2_config_t::type_id::create("b2_config");



    subsys_configuration_cg=new;
    `uvm_warning("COVERAGE_MODEL_REVIEW", "A covergroup has been constructed which may need review because of either generation or re-generation with merging.  Please note that configuration variables added as a result of re-generation and merging are not automatically added to the covergroup.  Remove this warning after the covergroup has been reviewed.")

  // pragma uvmf custom new begin
  // pragma uvmf custom new end
  endfunction

// ****************************************************************************
// FUNCTION : set_vsqr()
// This function is used to assign the vsqr handle.
  virtual function void set_vsqr( subsys_vsqr_t vsqr);
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
     $sformatf("has_scoreboard:0x%x ",has_scoreboard),

     "\n", b1_config.convert2string,
     "\n", b2_config.convert2string

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
    b1_interface_names    = new[4];
    b1_interface_activity = new[4];

    b1_interface_names     = interface_names[0:3];
    b1_interface_activity  = interface_activity[0:3];
    b2_interface_names    = new[2];
    b2_interface_activity = new[2];

    b2_interface_names     = interface_names[4:5];
    b2_interface_activity  = interface_activity[4:5];




     b1_config.initialize( sim_level, {environment_path,".b1"}, b1_interface_names, null,   b1_interface_activity);
     b2_config.initialize( sim_level, {environment_path,".b2"}, b2_interface_names, null,   b2_interface_activity);



  // pragma uvmf custom initialize begin
  // pragma uvmf custom initialize end

  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end
`endif

