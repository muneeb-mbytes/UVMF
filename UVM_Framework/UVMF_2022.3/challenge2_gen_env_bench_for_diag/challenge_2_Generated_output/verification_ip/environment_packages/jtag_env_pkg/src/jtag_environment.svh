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

class jtag_environment  extends uvmf_environment_base #(
    .CONFIG_T( jtag_env_configuration 
  ));
  `uvm_component_utils( jtag_environment )



  uvm_analysis_port #(jtag_transaction) jtag_in_ap;
  uvm_analysis_port #(jtag_transaction) jtag_out_ap;


  typedef jtag_agent  jtag_in_t;
  jtag_in_t jtag_in;

  typedef jtag_agent  jtag_out_t;
  jtag_out_t jtag_out;




  typedef jtag_predictor #(
                .CONFIG_T(CONFIG_T)
                ) jtag_pred_t;
  jtag_pred_t jtag_pred;
  typedef jtag_coverage #(
                .CONFIG_T(CONFIG_T)
                ) jtag_cov_t;
  jtag_cov_t jtag_cov;

  typedef uvmf_in_order_race_scoreboard #(.T(jtag_transaction))  jtag_sb_t;
  jtag_sb_t jtag_sb;



  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(jtag_env_configuration)) jtag_vsqr_t;
  jtag_vsqr_t vsqr;

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
    jtag_in_ap = new("jtag_in_ap",this);
    jtag_out_ap = new("jtag_out_ap",this);
    jtag_in = jtag_in_t::type_id::create("jtag_in",this);
    jtag_in.set_config(configuration.jtag_in_config);
    jtag_out = jtag_out_t::type_id::create("jtag_out",this);
    jtag_out.set_config(configuration.jtag_out_config);
    jtag_pred = jtag_pred_t::type_id::create("jtag_pred",this);
    jtag_pred.configuration = configuration;
    jtag_cov = jtag_cov_t::type_id::create("jtag_cov",this);
    jtag_cov.configuration = configuration;
    jtag_sb = jtag_sb_t::type_id::create("jtag_sb",this);

    vsqr = jtag_vsqr_t::type_id::create("vsqr", this);
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
    jtag_in.monitored_ap.connect(jtag_pred.jtag_in_ae);
    jtag_pred.jtag_sb_ap.connect(jtag_sb.expected_analysis_export);
    jtag_out.monitored_ap.connect(jtag_sb.actual_analysis_export);
    jtag_in.monitored_ap.connect(jtag_cov.jtag_cov_ae);
    jtag_in.monitored_ap.connect(jtag_in_ap);
    jtag_out.monitored_ap.connect(jtag_out_ap);
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
     configuration.jtag_configuration_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

