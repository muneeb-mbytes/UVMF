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
`ifndef BLOCK_2_ENVIRONMENT
`define BLOCK_2_ENVIRONMENT

class block_2_environment  extends uvmf_environment_base #(
    .CONFIG_T( block_2_env_configuration 
  ));
  `uvm_component_utils( block_2_environment )



  uvm_analysis_port #(spi_m_transaction) spi_master_ap;
  uvm_analysis_port #(wb_s_transaction) wb_slave_ap;


  typedef spi_m_agent  spi_master_t;
  spi_master_t spi_master;

  typedef wb_s_agent  wb_slave_t;
  wb_slave_t wb_slave;




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
    spi_master_ap = new("spi_master_ap",this);
    wb_slave_ap = new("wb_slave_ap",this);
    spi_master = spi_master_t::type_id::create("spi_master",this);
    spi_master.set_config(configuration.spi_master_config);
    wb_slave = wb_slave_t::type_id::create("wb_slave",this);
    wb_slave.set_config(configuration.wb_slave_config);
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
    spi_master.monitored_ap.connect(block_2_pred.spi_ae);
    wb_slave.monitored_ap.connect(block_2_sb.wb_ae);
    block_2_pred.pre_to_sco_ap.connect(block_2_sb.sco_from_pre_ae);
    spi_master.monitored_ap.connect(spi_master_ap);
    wb_slave.monitored_ap.connect(wb_slave_ap);
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

`endif
