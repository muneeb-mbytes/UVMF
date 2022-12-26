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
`ifndef SUBSYS_ENVIRONMENT
`define SUBSYS_ENVIRONMENT

class subsys_environment  extends uvmf_environment_base #(
    .CONFIG_T( subsys_env_configuration 
  ));
  `uvm_component_utils( subsys_environment )

  typedef block_1_environment b1_t;
  b1_t b1;
   
  typedef block_2_environment b2_t;
  b2_t b2;
   


  uvm_analysis_port #(apb_m_transaction) block_1_ap1;
  uvm_analysis_port #(axi_m_transaction) block_1_ap2;
  uvm_analysis_port #(axi_m_transaction) block_1_ap3;
  uvm_analysis_port #(wb_s_transaction) block_2_ap1;





  typedef subsys_predictor #(
                .CONFIG_T(CONFIG_T)
                ) sub_pred_t;
  sub_pred_t sub_pred;
  typedef subsys_scoreboard #(
                .CONFIG_T(CONFIG_T)
                ) sub_sb_t;
  sub_sb_t sub_sb;




  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(subsys_env_configuration)) subsys_vsqr_t;
  subsys_vsqr_t vsqr;

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
    b1 = b1_t::type_id::create("b1",this);
    b1.set_config(configuration.b1_config);
    b2 = b2_t::type_id::create("b2",this);
    b2.set_config(configuration.b2_config);
    block_1_ap1 = new("block_1_ap1",this);
    block_1_ap2 = new("block_1_ap2",this);
    block_1_ap3 = new("block_1_ap3",this);
    block_2_ap1 = new("block_2_ap1",this);
    sub_pred = sub_pred_t::type_id::create("sub_pred",this);
    sub_pred.configuration = configuration;
    sub_sb = sub_sb_t::type_id::create("sub_sb",this);
    sub_sb.configuration = configuration;

    vsqr = subsys_vsqr_t::type_id::create("vsqr", this);
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
    b1.apb_master_ap.connect(sub_pred.subsys_apb_ae);
    b1.axi_master1_ap.connect(sub_pred.subsys_axi_1_ae);
    b1.axi_master2_ap.connect(sub_pred.subsys_axi_2_ae);
    sub_pred.subsys_pre_to_sco_ap.connect(sub_sb.subsys_sco_from_pre_ae);
    b2.wb_slave_ap.connect(sub_sb.subsys_wb_ae);
    b1.apb_master_ap.connect(block_1_ap1);
    b1.axi_master1_ap.connect(block_1_ap2);
    b1.axi_master2_ap.connect(block_1_ap3);
    b2.wb_slave_ap.connect(block_2_ap1);
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
     configuration.subsys_configuration_cg.sample();
  endfunction

endclass
// pragma uvmf custom external begin
// pragma uvmf custom external end

`endif
