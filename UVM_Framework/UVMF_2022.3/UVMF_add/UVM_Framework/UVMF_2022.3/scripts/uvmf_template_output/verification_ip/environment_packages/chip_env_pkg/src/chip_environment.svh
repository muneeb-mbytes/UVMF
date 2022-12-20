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

class chip_environment #(
  int CHIP_CP_IN_DATA_WIDTH = 20,
  int CHIP_CP_IN_ADDR_WIDTH = 10,
  int CHIP_CP_OUT_ADDR_WIDTH = 25,
  int CHIP_UDP_DATA_WIDTH = 40
  ) extends uvmf_environment_base #(
    .CONFIG_T( chip_env_configuration #(
                      .CHIP_CP_IN_DATA_WIDTH(CHIP_CP_IN_DATA_WIDTH),
                      .CHIP_CP_IN_ADDR_WIDTH(CHIP_CP_IN_ADDR_WIDTH),
                      .CHIP_CP_OUT_ADDR_WIDTH(CHIP_CP_OUT_ADDR_WIDTH),
                      .CHIP_UDP_DATA_WIDTH(CHIP_UDP_DATA_WIDTH)
                      )
  ));
  `uvm_component_param_utils( chip_environment #(
                              CHIP_CP_IN_DATA_WIDTH,
                              CHIP_CP_IN_ADDR_WIDTH,
                              CHIP_CP_OUT_ADDR_WIDTH,
                              CHIP_UDP_DATA_WIDTH
                              ))

  typedef block_a_environment block_a_env_t;
  block_a_env_t block_a_env;
   
  typedef block_b_environment#(
                .CP_IN_DATA_WIDTH(CHIP_CP_IN_DATA_WIDTH),
                .CP_OUT_ADDR_WIDTH(CHIP_CP_OUT_ADDR_WIDTH),
                .CP_IN_ADDR_WIDTH(CHIP_CP_IN_ADDR_WIDTH),
                .UDP_DATA_WIDTH(CHIP_UDP_DATA_WIDTH)
                ) block_b_env_t;
  block_b_env_t block_b_env;
   











  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(chip_env_configuration#(
                      .CHIP_CP_IN_DATA_WIDTH(CHIP_CP_IN_DATA_WIDTH),
                      .CHIP_CP_IN_ADDR_WIDTH(CHIP_CP_IN_ADDR_WIDTH),
                      .CHIP_CP_OUT_ADDR_WIDTH(CHIP_CP_OUT_ADDR_WIDTH),
                      .CHIP_UDP_DATA_WIDTH(CHIP_UDP_DATA_WIDTH)
                      ))) chip_vsqr_t;
  chip_vsqr_t vsqr;

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
    block_a_env = block_a_env_t::type_id::create("block_a_env",this);
    block_a_env.set_config(configuration.block_a_env_config);
    block_b_env = block_b_env_t::type_id::create("block_b_env",this);
    block_b_env.set_config(configuration.block_b_env_config);
// pragma uvmf custom reg_model_build_phase begin
// pragma uvmf custom reg_model_build_phase end

    vsqr = chip_vsqr_t::type_id::create("vsqr", this);
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
     configuration.chip_configuration_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

