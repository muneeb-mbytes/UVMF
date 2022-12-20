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

class block_b_environment #(
  int CP_IN_DATA_WIDTH = 120,
  int CP_IN_ADDR_WIDTH = 110,
  int CP_OUT_ADDR_WIDTH = 111,
  int UDP_DATA_WIDTH = 140
  ) extends uvmf_environment_base #(
    .CONFIG_T( block_b_env_configuration #(
                      .CP_IN_DATA_WIDTH(CP_IN_DATA_WIDTH),
                      .CP_IN_ADDR_WIDTH(CP_IN_ADDR_WIDTH),
                      .CP_OUT_ADDR_WIDTH(CP_OUT_ADDR_WIDTH),
                      .UDP_DATA_WIDTH(UDP_DATA_WIDTH)
                      )
  ));
  `uvm_component_param_utils( block_b_environment #(
                              CP_IN_DATA_WIDTH,
                              CP_IN_ADDR_WIDTH,
                              CP_OUT_ADDR_WIDTH,
                              UDP_DATA_WIDTH
                              ))





  typedef mem_agent #(
                .ADDR_WIDTH(CP_IN_ADDR_WIDTH),
                .DATA_WIDTH(CP_IN_DATA_WIDTH)
                ) control_plane_in_t;
  control_plane_in_t control_plane_in;

  typedef mem_agent #(
                .ADDR_WIDTH(CP_OUT_ADDR_WIDTH)
                ) control_plane_out_t;
  control_plane_out_t control_plane_out;

  typedef pkt_agent #(
                .DATA_WIDTH(UDP_DATA_WIDTH)
                ) unsecure_data_plane_in_t;
  unsecure_data_plane_in_t unsecure_data_plane_in;

  typedef pkt_agent  unsecure_data_plane_out_t;
  unsecure_data_plane_out_t unsecure_data_plane_out;




  typedef control_plane_predictor #(
                .CONFIG_T(CONFIG_T),
                .ae_mem_transaction_t(mem_transaction#(.ADDR_WIDTH(CP_IN_ADDR_WIDTH),.DATA_WIDTH(CP_IN_DATA_WIDTH))),
                .ap_mem_transaction_t(mem_transaction #(.ADDR_WIDTH(CP_OUT_ADDR_WIDTH)))
                ) control_plane_pred_t;
  control_plane_pred_t control_plane_pred;
  typedef unsecure_data_plane_predictor #(
                .CONFIG_T(CONFIG_T),
                .control_plane_in_ae_t(mem_transaction #(.ADDR_WIDTH(CP_IN_ADDR_WIDTH),.DATA_WIDTH(CP_IN_DATA_WIDTH))),
                .unsecure_data_plane_in_ae_t(pkt_transaction #(.DATA_WIDTH(UDP_DATA_WIDTH))),
                .unsecure_data_plane_sb_ap_t(pkt_transaction)
                ) unsecure_data_plane_pred_t;
  unsecure_data_plane_pred_t unsecure_data_plane_pred;

  typedef uvmf_in_order_race_scoreboard #(.T(mem_transaction #(.ADDR_WIDTH(CP_OUT_ADDR_WIDTH))))  control_plane_sb_t;
  control_plane_sb_t control_plane_sb;
  typedef uvmf_in_order_race_scoreboard #(.T(pkt_transaction))  unsecure_data_plane_sb_t;
  unsecure_data_plane_sb_t unsecure_data_plane_sb;

   // Instantiate register model adapter and predictor
   typedef mem2reg_adapter#(.ADDR_WIDTH(CP_IN_ADDR_WIDTH),.DATA_WIDTH(CP_IN_DATA_WIDTH))    reg_adapter_t;
   reg_adapter_t    reg_adapter;
   typedef uvm_reg_predictor #(mem_transaction#(.ADDR_WIDTH(CP_IN_ADDR_WIDTH),.DATA_WIDTH(CP_IN_DATA_WIDTH))) reg_predictor_t;
   reg_predictor_t    reg_predictor;


  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(block_b_env_configuration#(
                      .CP_IN_DATA_WIDTH(CP_IN_DATA_WIDTH),
                      .CP_IN_ADDR_WIDTH(CP_IN_ADDR_WIDTH),
                      .CP_OUT_ADDR_WIDTH(CP_OUT_ADDR_WIDTH),
                      .UDP_DATA_WIDTH(UDP_DATA_WIDTH)
                      ))) block_b_vsqr_t;
  block_b_vsqr_t vsqr;

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
    control_plane_in = control_plane_in_t::type_id::create("control_plane_in",this);
    control_plane_in.set_config(configuration.control_plane_in_config);
    control_plane_out = control_plane_out_t::type_id::create("control_plane_out",this);
    control_plane_out.set_config(configuration.control_plane_out_config);
    unsecure_data_plane_in = unsecure_data_plane_in_t::type_id::create("unsecure_data_plane_in",this);
    unsecure_data_plane_in.set_config(configuration.unsecure_data_plane_in_config);
    unsecure_data_plane_out = unsecure_data_plane_out_t::type_id::create("unsecure_data_plane_out",this);
    unsecure_data_plane_out.set_config(configuration.unsecure_data_plane_out_config);
    control_plane_pred = control_plane_pred_t::type_id::create("control_plane_pred",this);
    control_plane_pred.configuration = configuration;
    unsecure_data_plane_pred = unsecure_data_plane_pred_t::type_id::create("unsecure_data_plane_pred",this);
    unsecure_data_plane_pred.configuration = configuration;
    control_plane_sb = control_plane_sb_t::type_id::create("control_plane_sb",this);
    unsecure_data_plane_sb = unsecure_data_plane_sb_t::type_id::create("unsecure_data_plane_sb",this);
// pragma uvmf custom reg_model_build_phase begin
  // Build register model predictor if prediction is enabled
  if (configuration.enable_reg_prediction) begin
    reg_predictor = reg_predictor_t::type_id::create("reg_predictor", this);
  end
// pragma uvmf custom reg_model_build_phase end

    vsqr = block_b_vsqr_t::type_id::create("vsqr", this);
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
    control_plane_in.monitored_ap.connect(control_plane_pred.control_plane_in_ae);
    control_plane_in.monitored_ap.connect(unsecure_data_plane_pred.control_plane_in_ae);
    unsecure_data_plane_in.monitored_ap.connect(unsecure_data_plane_pred.unsecure_data_plane_in_ae);
    control_plane_pred.control_plane_sb_ap.connect(control_plane_sb.expected_analysis_export);
    unsecure_data_plane_pred.unsecure_data_plane_sb_ap.connect(unsecure_data_plane_sb.expected_analysis_export);
    control_plane_out.monitored_ap.connect(control_plane_sb.actual_analysis_export);
    unsecure_data_plane_out.monitored_ap.connect(unsecure_data_plane_sb.actual_analysis_export);
    // pragma uvmf custom reg_model_connect_phase begin
    // Create register model adapter if required
    if (configuration.enable_reg_prediction ||
        configuration.enable_reg_adaptation)
      reg_adapter = reg_adapter_t::type_id::create("reg_adapter");
    // Set sequencer and adapter in register model map
    if ((configuration.enable_reg_adaptation) && (control_plane_in.sequencer != null ))
      configuration.block_b_rm.bus_map.set_sequencer(control_plane_in.sequencer, reg_adapter);
    // Set map and adapter handles within uvm predictor
    if (configuration.enable_reg_prediction) begin
      reg_predictor.map     = configuration.block_b_rm.bus_map;
      reg_predictor.adapter = reg_adapter;
      // The connection between the agent analysis_port and uvm_reg_predictor 
      // analysis_export could cause problems due to a uvm register package bug,
      // if this environment is used as a sub-environment at a higher level.
      // The uvm register package does not construct sub-maps within register
      // sub blocks.  While the connection below succeeds, the execution of the
      // write method associated with the analysis_export fails.  It fails because
      // the write method executes the get_reg_by_offset method of the register
      // map, which is null because of the uvm register package bug.
      // The call works when operating at block level because the uvm register 
      // package constructs the top level register map.  The call fails when the 
      // register map associated with this environment is a sub-map.  Construction
      // of the sub-maps must be done manually.
      //control_plane_in.monitored_ap.connect(reg_predictor.bus_in);
    end
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
     configuration.block_b_configuration_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

