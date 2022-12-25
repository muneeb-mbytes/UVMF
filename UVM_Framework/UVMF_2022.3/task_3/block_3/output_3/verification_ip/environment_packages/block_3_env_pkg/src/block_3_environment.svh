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

class block_3_environment  extends uvmf_environment_base #(
    .CONFIG_T( block_3_env_configuration 
  ));
  `uvm_component_utils( block_3_environment )



  uvm_analysis_port #(wb_m_transaction) block_3_wb_ap;


  typedef wb_m_agent  wb_master_t;
  wb_master_t wb_master;

  typedef axi_s_agent  axi_slave_t;
  axi_slave_t axi_slave;




  typedef block_3_predictor #(
                .CONFIG_T(CONFIG_T)
                ) block_3_pred_t;
  block_3_pred_t block_3_pred;
  typedef block_3_scoreboard #(
                .CONFIG_T(CONFIG_T)
                ) block_3_sb_t;
  block_3_sb_t block_3_sb;




  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(block_3_env_configuration)) block_3_vsqr_t;
  block_3_vsqr_t vsqr;

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
    block_3_wb_ap = new("block_3_wb_ap",this);
    wb_master = wb_master_t::type_id::create("wb_master",this);
    wb_master.set_config(configuration.wb_master_config);
    axi_slave = axi_slave_t::type_id::create("axi_slave",this);
    axi_slave.set_config(configuration.axi_slave_config);
    block_3_pred = block_3_pred_t::type_id::create("block_3_pred",this);
    block_3_pred.configuration = configuration;
    block_3_sb = block_3_sb_t::type_id::create("block_3_sb",this);
    block_3_sb.configuration = configuration;

    vsqr = block_3_vsqr_t::type_id::create("vsqr", this);
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
    wb_master.monitored_ap.connect(block_3_pred.wb_ae);
    axi_slave.monitored_ap.connect(block_3_sb.axi_ae);
    block_3_pred.pre_to_sco_ap.connect(block_3_sb.sco_from_pre_ae);
    wb_master.monitored_ap.connect(block_3_wb_ap);
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
     configuration.block_3_configuration_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

