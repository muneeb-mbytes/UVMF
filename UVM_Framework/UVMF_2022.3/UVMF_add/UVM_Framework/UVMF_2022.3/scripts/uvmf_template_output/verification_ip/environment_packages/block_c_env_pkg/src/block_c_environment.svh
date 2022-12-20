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

class block_c_environment  extends uvmf_environment_base #(
    .CONFIG_T( block_c_env_configuration 
  ));
  `uvm_component_utils( block_c_environment )


  qvip_agents_environment #()  qvip_env;



  uvm_analysis_port #( mvc_sequence_item_base ) qvip_env_pcie_ep_ap [string];
  uvm_analysis_port #( mvc_sequence_item_base ) qvip_env_axi4_master_0_ap [string];
  uvm_analysis_port #( mvc_sequence_item_base ) qvip_env_axi4_master_1_ap [string];
  uvm_analysis_port #( mvc_sequence_item_base ) qvip_env_axi4_slave_ap [string];
  uvm_analysis_port #( mvc_sequence_item_base ) qvip_env_apb3_config_master_ap [string];

  typedef mem_agent  mem_in_t;
  mem_in_t mem_in;

  typedef mem_agent  mem_out_t;
  mem_out_t mem_out;

  typedef pkt_agent  pkt_out_t;
  pkt_out_t pkt_out;




  typedef block_c_predictor #(
                .CONFIG_T(CONFIG_T)
                ) blk_c_pred_t;
  blk_c_pred_t blk_c_pred;

  typedef uvmf_in_order_scoreboard #(.T(mem_transaction))  mem_sb_t;
  mem_sb_t mem_sb;
  typedef uvmf_in_order_scoreboard #(.T(pkt_transaction))  pkt_sb_t;
  pkt_sb_t pkt_sb;
  typedef uvmf_in_order_scoreboard #(.T(mvc_sequence_item_base))  axi4_slave_sb_t;
  axi4_slave_sb_t axi4_slave_sb;
  typedef uvmf_in_order_scoreboard #(.T(mvc_sequence_item_base))  apb3_cfg_sb_t;
  apb3_cfg_sb_t apb3_cfg_sb;



  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(block_c_env_configuration)) block_c_vsqr_t;
  block_c_vsqr_t vsqr;

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
    qvip_env = qvip_agents_environment#()::type_id::create("qvip_env",this);
    qvip_env.set_config(configuration.qvip_env_config);
    mem_in = mem_in_t::type_id::create("mem_in",this);
    mem_in.set_config(configuration.mem_in_config);
    mem_out = mem_out_t::type_id::create("mem_out",this);
    mem_out.set_config(configuration.mem_out_config);
    pkt_out = pkt_out_t::type_id::create("pkt_out",this);
    pkt_out.set_config(configuration.pkt_out_config);
    blk_c_pred = blk_c_pred_t::type_id::create("blk_c_pred",this);
    blk_c_pred.configuration = configuration;
    mem_sb = mem_sb_t::type_id::create("mem_sb",this);
    pkt_sb = pkt_sb_t::type_id::create("pkt_sb",this);
    axi4_slave_sb = axi4_slave_sb_t::type_id::create("axi4_slave_sb",this);
    apb3_cfg_sb = apb3_cfg_sb_t::type_id::create("apb3_cfg_sb",this);

    vsqr = block_c_vsqr_t::type_id::create("vsqr", this);
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
    mem_in.monitored_ap.connect(blk_c_pred.mem_in_ae);
    blk_c_pred.mem_sb_ap.connect(mem_sb.expected_analysis_export);
    blk_c_pred.pkt_sb_ap.connect(pkt_sb.expected_analysis_export);
    blk_c_pred.axi4_slave_ap.connect(axi4_slave_sb.expected_analysis_export);
    blk_c_pred.apb3_config_master_ap.connect(apb3_cfg_sb.expected_analysis_export);
    mem_out.monitored_ap.connect(mem_sb.actual_analysis_export);
    pkt_out.monitored_ap.connect(pkt_sb.actual_analysis_export);
    qvip_env_pcie_ep_ap = qvip_env.pcie_ep.ap; 
    qvip_env_axi4_master_0_ap = qvip_env.axi4_master_0.ap; 
    qvip_env_axi4_master_1_ap = qvip_env.axi4_master_1.ap; 
    qvip_env_axi4_slave_ap = qvip_env.axi4_slave.ap; 
    qvip_env_apb3_config_master_ap = qvip_env.apb3_config_master.ap; 
    qvip_env_axi4_master_0_ap["trans_ap"].connect(blk_c_pred.axi4_master_0_ae);
    qvip_env_axi4_master_1_ap["trans_ap"].connect(blk_c_pred.axi4_master_1_ae);
    qvip_env_axi4_slave_ap["trans_ap"].connect(axi4_slave_sb.actual_analysis_export);
    qvip_env_apb3_config_master_ap["trans_ap"].connect(apb3_cfg_sb.actual_analysis_export);
    if ( configuration.qvip_env_interface_activity[0] == ACTIVE )
       uvm_config_db #(mvc_sequencer)::set(null,UVMF_SEQUENCERS,configuration.qvip_env_interface_names[0],qvip_env.pcie_ep.m_sequencer  );
    if ( configuration.qvip_env_interface_activity[1] == ACTIVE )
       uvm_config_db #(mvc_sequencer)::set(null,UVMF_SEQUENCERS,configuration.qvip_env_interface_names[1],qvip_env.axi4_master_0.m_sequencer  );
    if ( configuration.qvip_env_interface_activity[2] == ACTIVE )
       uvm_config_db #(mvc_sequencer)::set(null,UVMF_SEQUENCERS,configuration.qvip_env_interface_names[2],qvip_env.axi4_master_1.m_sequencer  );
    if ( configuration.qvip_env_interface_activity[3] == ACTIVE )
       uvm_config_db #(mvc_sequencer)::set(null,UVMF_SEQUENCERS,configuration.qvip_env_interface_names[3],qvip_env.axi4_slave.m_sequencer  );
    if ( configuration.qvip_env_interface_activity[4] == ACTIVE )
       uvm_config_db #(mvc_sequencer)::set(null,UVMF_SEQUENCERS,configuration.qvip_env_interface_names[4],qvip_env.apb3_config_master.m_sequencer  );
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
     configuration.block_c_configuration_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

