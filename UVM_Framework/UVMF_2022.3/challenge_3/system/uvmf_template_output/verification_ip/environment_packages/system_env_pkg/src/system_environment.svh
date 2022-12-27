`ifndef SYSTEM_ENV_
`define SYSTEM_ENV_
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

class system_environment  extends uvmf_environment_base #(
    .CONFIG_T( system_env_configuration 
  ));
  `uvm_component_utils( system_environment )

  typedef subsys_environment s1_t;
  s1_t s1;
   
  typedef block_3_environment b3_t;
  b3_t b3;
   







  typedef sys_predictor #(
                .CONFIG_T(CONFIG_T)
                ) sys_pred_t;
  sys_pred_t sys_pred;
  typedef sys_scoreboard #(
                .CONFIG_T(CONFIG_T)
                ) sys_sb_t;
  sys_sb_t sys_sb;




  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(system_env_configuration)) system_vsqr_t;
  system_vsqr_t vsqr;

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
    s1 = s1_t::type_id::create("s1",this);
    s1.set_config(configuration.s1_config);
    b3 = b3_t::type_id::create("b3",this);
    b3.set_config(configuration.b3_config);
    sys_pred = sys_pred_t::type_id::create("sys_pred",this);
    sys_pred.configuration = configuration;
    sys_sb = sys_sb_t::type_id::create("sys_sb",this);
    sys_sb.configuration = configuration;

    vsqr = system_vsqr_t::type_id::create("vsqr", this);
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
    s1.block_1_ap1.connect(sys_pred.sys_apb_ae);
    s1.block_1_ap2.connect(sys_pred.sys_axi_1_ae);
    s1.block_1_ap3.connect(sys_pred.sys_axi_2_ae);
    sys_pred.sys_pre_to_sco_ap.connect(sys_sb.sys_sco_from_pre_ae);
    b3.axi_slave_ap.connect(sys_sb.sys_axi_ae);
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
     configuration.system_configuration_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end
`endif
