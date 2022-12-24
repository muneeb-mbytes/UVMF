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

class block_2_environment  extends uvmf_environment_base #(
    .CONFIG_T( block_2_env_configuration 
  ));
  `uvm_component_utils( block_2_environment )



  uvm_analysis_port #(wishbone_slave_transaction) wishbone_ap;


  typedef spi_master_agent  spi_master_agent_t;
  spi_master_agent_t spi_master_agent;

  typedef wishbone_slave_agent  wishbone_slave_agent_t;
  wishbone_slave_agent_t wishbone_slave_agent;




  typedef block_2_predictor #(
                .CONFIG_T(CONFIG_T)
                ) block_2_pred_t;
  block_2_pred_t block_2_pred;
  typedef block_2_scoreboard #(
                .CONFIG_T(CONFIG_T)
                ) block_2_sb_t;
  block_2_sb_t block_2_sb;




  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(block_2_env_configuration)) block_2_vsqr_t;
  block_2_vsqr_t vsqr;

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
    wishbone_ap = new("wishbone_ap",this);
    spi_master_agent = spi_master_agent_t::type_id::create("spi_master_agent",this);
    spi_master_agent.set_config(configuration.spi_master_agent_config);
    wishbone_slave_agent = wishbone_slave_agent_t::type_id::create("wishbone_slave_agent",this);
    wishbone_slave_agent.set_config(configuration.wishbone_slave_agent_config);
    block_2_pred = block_2_pred_t::type_id::create("block_2_pred",this);
    block_2_pred.configuration = configuration;
    block_2_sb = block_2_sb_t::type_id::create("block_2_sb",this);
    block_2_sb.configuration = configuration;

    vsqr = block_2_vsqr_t::type_id::create("vsqr", this);
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
    spi_master_agent.monitored_ap.connect(block_2_pred.spi_master_agent_ae);
    block_2_pred.block_2_sb_ap.connect(block_2_sb.wishbone_slave_pred_sb_ae);
    wishbone_slave_agent.monitored_ap.connect(block_2_sb.wishbone_slave_agent_sb_ae);
    wishbone_slave_agent.monitored_ap.connect(wishbone_ap);
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
     configuration.block_2_configuration_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

