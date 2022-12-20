//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//                                          
// DESCRIPTION: THis is the configuration for the block_c environment.
//  it contains configuration classes for each agent.  It also contains
//  environment level configuration variables.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class block_c_env_configuration 
extends uvmf_environment_configuration_base;

  `uvm_object_utils( block_c_env_configuration )


//Constraints for the configuration variables:


  covergroup block_c_configuration_cg;
    // pragma uvmf custom covergroup begin
    option.auto_bin_max=1024;
    // pragma uvmf custom covergroup end
  endgroup


    typedef mem_configuration mem_in_config_t;
    rand mem_in_config_t mem_in_config;

    typedef mem_configuration mem_out_config_t;
    rand mem_out_config_t mem_out_config;

    typedef pkt_configuration pkt_out_config_t;
    rand pkt_out_config_t pkt_out_config;



    qvip_agents_env_configuration     qvip_env_config;
    string                                   qvip_env_interface_names[];
    uvmf_active_passive_t                    qvip_env_interface_activity[];

  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(block_c_env_configuration)) block_c_vsqr_t;
  block_c_vsqr_t vsqr;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

// ****************************************************************************
// FUNCTION : new()
// This function is the standard SystemVerilog constructor.
// This function constructs the configuration object for each agent in the environment.
//
  function new( string name = "" );
    super.new( name );


    mem_in_config = mem_in_config_t::type_id::create("mem_in_config");
    mem_out_config = mem_out_config_t::type_id::create("mem_out_config");
    pkt_out_config = pkt_out_config_t::type_id::create("pkt_out_config");

    qvip_env_config = qvip_agents_env_configuration::type_id::create("qvip_env_config");

    block_c_configuration_cg=new;
    `uvm_warning("COVERAGE_MODEL_REVIEW", "A covergroup has been constructed which may need review because of either generation or re-generation with merging.  Please note that configuration variables added as a result of re-generation and merging are not automatically added to the covergroup.  Remove this warning after the covergroup has been reviewed.")

  // pragma uvmf custom new begin
  // pragma uvmf custom new end
  endfunction

// ****************************************************************************
// FUNCTION : set_vsqr()
// This function is used to assign the vsqr handle.
  virtual function void set_vsqr( block_c_vsqr_t vsqr);
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
     
     "\n", mem_in_config.convert2string,
     "\n", mem_out_config.convert2string,
     "\n", pkt_out_config.convert2string,

     "\n", qvip_env_config.convert2string
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


  // Interface initialization for QVIP sub-environments
    qvip_env_interface_names    = new[5];
    qvip_env_interface_activity = new[5];

    qvip_env_interface_names     = interface_names[0:4];
    qvip_env_interface_activity  = interface_activity[0:4];


  // Interface initialization for local agents
     mem_in_config.initialize( interface_activity[5], {environment_path,".mem_in"}, interface_names[5]);
     mem_in_config.initiator_responder = INITIATOR;
     // mem_in_config.has_coverage = 1;
     mem_out_config.initialize( interface_activity[6], {environment_path,".mem_out"}, interface_names[6]);
     mem_out_config.initiator_responder = INITIATOR;
     // mem_out_config.has_coverage = 1;
     pkt_out_config.initialize( interface_activity[7], {environment_path,".pkt_out"}, interface_names[7]);
     pkt_out_config.initiator_responder = INITIATOR;
     // pkt_out_config.has_coverage = 1;



     qvip_env_config.initialize( sim_level, {environment_path,".qvip_env"}, qvip_env_interface_names, null,   qvip_env_interface_activity);


  // pragma uvmf custom initialize begin
  // pragma uvmf custom initialize end

  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

