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

class block_1_environment  extends uvmf_environment_base #(
    .CONFIG_T( block_1_env_configuration 
  ));
  `uvm_component_utils( block_1_environment )



  uvm_analysis_port #(apb_master_transaction) apb_ap;
  uvm_analysis_port #(axi_master_transaction) axi1_ap;
  uvm_analysis_port #(axi_master_transaction) axi2_ap;


  typedef apb_master_agent  apb_master_agent_t;
  apb_master_agent_t apb_master_agent;

  typedef axi_master_agent  axi_master1_agent_t;
  axi_master1_agent_t axi_master1_agent;

  typedef axi_master_agent  axi_master2_agent_t;
  axi_master2_agent_t axi_master2_agent;

  typedef spi_slave_agent  spi_slave_agent_t;
  spi_slave_agent_t spi_slave_agent;




  typedef block_1_predictor #(
                .CONFIG_T(CONFIG_T)
                ) block_1_pred_t;
  block_1_pred_t block_1_pred;
  typedef block_1_scoreboard #(
                .CONFIG_T(CONFIG_T)
                ) block_1_sb_t;
  block_1_sb_t block_1_sb;




  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(block_1_env_configuration)) block_1_vsqr_t;
  block_1_vsqr_t vsqr;

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
    apb_ap = new("apb_ap",this);
    axi1_ap = new("axi1_ap",this);
    axi2_ap = new("axi2_ap",this);
    apb_master_agent = apb_master_agent_t::type_id::create("apb_master_agent",this);
    apb_master_agent.set_config(configuration.apb_master_agent_config);
    axi_master1_agent = axi_master1_agent_t::type_id::create("axi_master1_agent",this);
    axi_master1_agent.set_config(configuration.axi_master1_agent_config);
    axi_master2_agent = axi_master2_agent_t::type_id::create("axi_master2_agent",this);
    axi_master2_agent.set_config(configuration.axi_master2_agent_config);
    spi_slave_agent = spi_slave_agent_t::type_id::create("spi_slave_agent",this);
    spi_slave_agent.set_config(configuration.spi_slave_agent_config);
    block_1_pred = block_1_pred_t::type_id::create("block_1_pred",this);
    block_1_pred.configuration = configuration;
    block_1_sb = block_1_sb_t::type_id::create("block_1_sb",this);
    block_1_sb.configuration = configuration;

    vsqr = block_1_vsqr_t::type_id::create("vsqr", this);
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
    apb_master_agent.monitored_ap.connect(block_1_pred.apb_master_agent_ae);
    axi_master1_agent.monitored_ap.connect(block_1_pred.axi_master1_agent_ae);
    axi_master2_agent.monitored_ap.connect(block_1_pred.axi_master2_agent_ae);
    block_1_pred.block_1_sb_ap.connect(block_1_sb.spi_slave_pred_sb_ae);
    spi_slave_agent.monitored_ap.connect(block_1_sb.spi_slave_agent_sb_ae);
    apb_master_agent.monitored_ap.connect(apb_ap);
    axi_master1_agent.monitored_ap.connect(axi1_ap);
    axi_master2_agent.monitored_ap.connect(axi2_ap);
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
     configuration.block_1_configuration_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

