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

class block_a_environment  extends uvmf_environment_base #(
    .CONFIG_T( block_a_env_configuration 
  ));
  `uvm_component_utils( block_a_environment )



  uvm_analysis_port #(mem_transaction) control_plane_in_ap;
  uvm_analysis_port #(mem_transaction) control_plane_out_ap;
  uvm_analysis_export #(pkt_transaction) external_pkt_ep;


  typedef mem_agent  control_plane_in_t;
  control_plane_in_t control_plane_in;

  typedef mem_agent  control_plane_out_t;
  control_plane_out_t control_plane_out;

  typedef pkt_agent  secure_data_plane_in_t;
  secure_data_plane_in_t secure_data_plane_in;

  typedef pkt_agent  secure_data_plane_out_t;
  secure_data_plane_out_t secure_data_plane_out;




  typedef block_a_predictor #(
                .CONFIG_T(CONFIG_T)
                ) block_a_pred_t;
  block_a_pred_t block_a_pred;
  typedef block_a_coverage #(
                .CONFIG_T(CONFIG_T)
                ) block_a_cov_t;
  block_a_cov_t block_a_cov;

  typedef uvmf_in_order_race_scoreboard #(.T(mem_transaction))  control_plane_sb_t;
  control_plane_sb_t control_plane_sb;
  typedef uvmf_in_order_race_scoreboard #(.T(pkt_transaction))  secure_data_plane_sb_t;
  secure_data_plane_sb_t secure_data_plane_sb;



  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(block_a_env_configuration)) block_a_vsqr_t;
  block_a_vsqr_t vsqr;

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
    control_plane_in_ap = new("control_plane_in_ap",this);
    control_plane_out_ap = new("control_plane_out_ap",this);
    external_pkt_ep = new("external_pkt_ep",this);
    control_plane_in = control_plane_in_t::type_id::create("control_plane_in",this);
    control_plane_in.set_config(configuration.control_plane_in_config);
    control_plane_out = control_plane_out_t::type_id::create("control_plane_out",this);
    control_plane_out.set_config(configuration.control_plane_out_config);
    secure_data_plane_in = secure_data_plane_in_t::type_id::create("secure_data_plane_in",this);
    secure_data_plane_in.set_config(configuration.secure_data_plane_in_config);
    secure_data_plane_out = secure_data_plane_out_t::type_id::create("secure_data_plane_out",this);
    secure_data_plane_out.set_config(configuration.secure_data_plane_out_config);
    block_a_pred = block_a_pred_t::type_id::create("block_a_pred",this);
    block_a_pred.configuration = configuration;
    block_a_cov = block_a_cov_t::type_id::create("block_a_cov",this);
    block_a_cov.configuration = configuration;
    control_plane_sb = control_plane_sb_t::type_id::create("control_plane_sb",this);
    secure_data_plane_sb = secure_data_plane_sb_t::type_id::create("secure_data_plane_sb",this);

    vsqr = block_a_vsqr_t::type_id::create("vsqr", this);
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
    control_plane_in.monitored_ap.connect(block_a_pred.control_plane_in_ae);
    secure_data_plane_in.monitored_ap.connect(block_a_pred.secure_data_plane_in_ae);
    block_a_pred.control_plane_sb_ap.connect(control_plane_sb.expected_analysis_export);
    block_a_pred.secure_data_plane_sb_ap.connect(secure_data_plane_sb.expected_analysis_export);
    control_plane_out.monitored_ap.connect(control_plane_sb.actual_analysis_export);
    secure_data_plane_out.monitored_ap.connect(secure_data_plane_sb.actual_analysis_export);
    control_plane_in.monitored_ap.connect(block_a_cov.control_plane_in_ae);
    secure_data_plane_in.monitored_ap.connect(block_a_cov.secure_data_plane_in_ae);
    control_plane_in.monitored_ap.connect(control_plane_in_ap);
    control_plane_out.monitored_ap.connect(control_plane_out_ap);
    external_pkt_ep.connect(block_a_pred.secure_data_plane_in_ae);
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
     configuration.block_a_configuration_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

