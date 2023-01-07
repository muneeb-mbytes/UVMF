//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//                                          
// DESCRIPTION: This environment contains all agents, predictors and
// scoreboards required for the block level design.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class add_environment  extends uvmf_environment_base #(
    .CONFIG_T( add_env_configuration 
  ));
  `uvm_component_utils( add_environment )





  typedef add_in_agent  add_in_agent_t;
  add_in_agent_t add_in_agent;

  typedef add_out_agent  add_out_agent_t;
  add_out_agent_t add_out_agent;




  typedef add_predictor #(
                .CONFIG_T(CONFIG_T)
                ) add_pred_t;
  add_pred_t add_pred;
  typedef add_scoreboard #(
                .CONFIG_T(CONFIG_T)
                ) add_sb_t;
  add_sb_t add_sb;




  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(add_env_configuration)) add_vsqr_t;
  add_vsqr_t vsqr;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
 
// ****************************************************************************
// FUNCTION : new()
// This function is the standard SystemVerilog constructor.
//
  function new( string name = "", uvm_component parent = null );
    super.new( name, parent );
  endfunction

// ****************************************************************************
// FUNCTION: build_phase()
// This function builds all components within this environment.
//
  virtual function void build_phase(uvm_phase phase);
// pragma uvmf custom build_phase_pre_super begin
// pragma uvmf custom build_phase_pre_super end
    super.build_phase(phase);
    add_in_agent = add_in_agent_t::type_id::create("add_in_agent",this);
    add_in_agent.set_config(configuration.add_in_agent_config);
    add_out_agent = add_out_agent_t::type_id::create("add_out_agent",this);
    add_out_agent.set_config(configuration.add_out_agent_config);
    add_pred = add_pred_t::type_id::create("add_pred",this);
    add_pred.configuration = configuration;
    add_sb = add_sb_t::type_id::create("add_sb",this);
    add_sb.configuration = configuration;

    vsqr = add_vsqr_t::type_id::create("vsqr", this);
    vsqr.set_config(configuration);
    configuration.set_vsqr(vsqr);

    // pragma uvmf custom build_phase begin
    // pragma uvmf custom build_phase end
  endfunction

// ****************************************************************************
// FUNCTION: connect_phase()
// This function makes all connections within this environment.  Connections
// typically inclue agent to predictor, predictor to scoreboard and scoreboard
// to agent.
//
  virtual function void connect_phase(uvm_phase phase);
// pragma uvmf custom connect_phase_pre_super begin
// pragma uvmf custom connect_phase_pre_super end
    super.connect_phase(phase);
    add_in_agent.monitored_ap.connect(add_pred.add_in_agent_ae);
    add_pred.add_sb_ap.connect(add_sb.add_out_pred_sb_ae);
    add_out_agent.monitored_ap.connect(add_sb.add_out_ag_sb_ae);
    // pragma uvmf custom reg_model_connect_phase begin
    // pragma uvmf custom reg_model_connect_phase end
  endfunction

// ****************************************************************************
// FUNCTION: end_of_simulation_phase()
// This function is executed just prior to executing run_phase.  This function
// was added to the environment to sample environment configuration settings
// just before the simulation exits time 0.  The configuration structure is 
// randomized in the build phase before the environment structure is constructed.
// Configuration variables can be customized after randomization in the build_phase
// of the extended test.
// If a sequence modifies values in the configuration structure then the sequence is
// responsible for sampling the covergroup in the configuration if required.
//
  virtual function void start_of_simulation_phase(uvm_phase phase);
     configuration.add_configuration_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

