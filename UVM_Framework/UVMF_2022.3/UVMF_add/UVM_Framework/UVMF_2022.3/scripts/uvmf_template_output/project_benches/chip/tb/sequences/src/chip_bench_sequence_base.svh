//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// Description: This file contains the top level and utility sequences
//     used by test_top. It can be extended to create derivative top
//     level sequences.
//
//----------------------------------------------------------------------
//
//----------------------------------------------------------------------
//


typedef chip_env_configuration #(
        .CHIP_CP_IN_ADDR_WIDTH(TEST_CP_IN_ADDR_WIDTH),
        .CHIP_CP_IN_DATA_WIDTH(TEST_CP_IN_DATA_WIDTH),
        .CHIP_CP_OUT_ADDR_WIDTH(TEST_CP_OUT_ADDR_WIDTH),
        .CHIP_UDP_DATA_WIDTH(TEST_UDP_DATA_WIDTH)
        ) chip_env_configuration_t;

class chip_bench_sequence_base extends uvmf_sequence_base #(uvm_sequence_item);

  `uvm_object_utils( chip_bench_sequence_base );

  // pragma uvmf custom sequences begin

typedef chip_env_sequence_base #(
        .CONFIG_T(chip_env_configuration_t),
        .CHIP_CP_IN_ADDR_WIDTH(TEST_CP_IN_ADDR_WIDTH),
        .CHIP_CP_IN_DATA_WIDTH(TEST_CP_IN_DATA_WIDTH),
        .CHIP_CP_OUT_ADDR_WIDTH(TEST_CP_OUT_ADDR_WIDTH),
        .CHIP_UDP_DATA_WIDTH(TEST_UDP_DATA_WIDTH)
        )
        chip_env_sequence_base_t;
rand chip_env_sequence_base_t chip_env_seq;



  // UVMF_CHANGE_ME : Instantiate, construct, and start sequences as needed to create stimulus scenarios.
  // Instantiate sequences here
  typedef mem_random_sequence  block_a_env_control_plane_in_random_seq_t;
  block_a_env_control_plane_in_random_seq_t block_a_env_control_plane_in_random_seq;
  typedef pkt_random_sequence  block_a_env_secure_data_plane_in_random_seq_t;
  block_a_env_secure_data_plane_in_random_seq_t block_a_env_secure_data_plane_in_random_seq;
  typedef pkt_responder_sequence  block_a_env_secure_data_plane_out_responder_seq_t;
  block_a_env_secure_data_plane_out_responder_seq_t block_a_env_secure_data_plane_out_responder_seq;
  typedef mem_random_sequence #(
        .ADDR_WIDTH(TEST_CP_OUT_ADDR_WIDTH)
        ) block_b_env_control_plane_out_random_seq_t;
  block_b_env_control_plane_out_random_seq_t block_b_env_control_plane_out_random_seq;
  typedef pkt_random_sequence #(
        .DATA_WIDTH(TEST_UDP_DATA_WIDTH)
        ) block_b_env_unsecure_data_plane_in_random_seq_t;
  block_b_env_unsecure_data_plane_in_random_seq_t block_b_env_unsecure_data_plane_in_random_seq;
  typedef pkt_random_sequence  block_b_env_unsecure_data_plane_out_random_seq_t;
  block_b_env_unsecure_data_plane_out_random_seq_t block_b_env_unsecure_data_plane_out_random_seq;
  // pragma uvmf custom sequences end

  // Sequencer handles for each active interface in the environment
  typedef mem_transaction  block_a_env_control_plane_in_transaction_t;
  uvm_sequencer #(block_a_env_control_plane_in_transaction_t)  block_a_env_control_plane_in_sequencer; 
  typedef pkt_transaction  block_a_env_secure_data_plane_in_transaction_t;
  uvm_sequencer #(block_a_env_secure_data_plane_in_transaction_t)  block_a_env_secure_data_plane_in_sequencer; 
  typedef pkt_transaction  block_a_env_secure_data_plane_out_transaction_t;
  uvm_sequencer #(block_a_env_secure_data_plane_out_transaction_t)  block_a_env_secure_data_plane_out_sequencer; 
  typedef mem_transaction #(
        .ADDR_WIDTH(TEST_CP_OUT_ADDR_WIDTH)
        ) block_b_env_control_plane_out_transaction_t;
  uvm_sequencer #(block_b_env_control_plane_out_transaction_t)  block_b_env_control_plane_out_sequencer; 
  typedef pkt_transaction #(
        .DATA_WIDTH(TEST_UDP_DATA_WIDTH)
        ) block_b_env_unsecure_data_plane_in_transaction_t;
  uvm_sequencer #(block_b_env_unsecure_data_plane_in_transaction_t)  block_b_env_unsecure_data_plane_in_sequencer; 
  typedef pkt_transaction  block_b_env_unsecure_data_plane_out_transaction_t;
  uvm_sequencer #(block_b_env_unsecure_data_plane_out_transaction_t)  block_b_env_unsecure_data_plane_out_sequencer; 


  // Top level environment configuration handle
  chip_env_configuration_t top_configuration;

  // Configuration handles to access interface BFM's
  mem_configuration  block_a_env_control_plane_in_config;
  mem_configuration  block_a_env_control_plane_out_config;
  pkt_configuration  block_a_env_secure_data_plane_in_config;
  pkt_configuration  block_a_env_secure_data_plane_out_config;
  mem_configuration #(
        .ADDR_WIDTH(TEST_CP_IN_ADDR_WIDTH),
        .DATA_WIDTH(TEST_CP_IN_DATA_WIDTH)
        ) block_b_env_control_plane_in_config;
  mem_configuration #(
        .ADDR_WIDTH(TEST_CP_OUT_ADDR_WIDTH)
        ) block_b_env_control_plane_out_config;
  pkt_configuration #(
        .DATA_WIDTH(TEST_UDP_DATA_WIDTH)
        ) block_b_env_unsecure_data_plane_in_config;
  pkt_configuration  block_b_env_unsecure_data_plane_out_config;
  // Local handle to register model for convenience
  chip_reg_model reg_model;
  uvm_status_e status;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // ****************************************************************************
  function new( string name = "" );
    super.new( name );
    // Retrieve the configuration handles from the uvm_config_db

    // Retrieve top level configuration handle
    if ( !uvm_config_db#(chip_env_configuration_t)::get(null,UVMF_CONFIGURATIONS, "TOP_ENV_CONFIG",top_configuration) ) begin
      `uvm_info("CFG", "*** FATAL *** uvm_config_db::get can not find TOP_ENV_CONFIG.  Are you using an older UVMF release than what was used to generate this bench?",UVM_NONE);
      `uvm_fatal("CFG", "uvm_config_db#(chip_env_configuration_t)::get cannot find resource TOP_ENV_CONFIG");
    end

    // Retrieve config handles for all agents
    if( !uvm_config_db #( mem_configuration )::get( null , UVMF_CONFIGURATIONS , block_a_env_control_plane_in_BFM , block_a_env_control_plane_in_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( mem_configuration )::get cannot find resource block_a_env_control_plane_in_BFM" )
    if( !uvm_config_db #( mem_configuration )::get( null , UVMF_CONFIGURATIONS , block_a_env_control_plane_out_BFM , block_a_env_control_plane_out_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( mem_configuration )::get cannot find resource block_a_env_control_plane_out_BFM" )
    if( !uvm_config_db #( pkt_configuration )::get( null , UVMF_CONFIGURATIONS , block_a_env_secure_data_plane_in_BFM , block_a_env_secure_data_plane_in_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( pkt_configuration )::get cannot find resource block_a_env_secure_data_plane_in_BFM" )
    if( !uvm_config_db #( pkt_configuration )::get( null , UVMF_CONFIGURATIONS , block_a_env_secure_data_plane_out_BFM , block_a_env_secure_data_plane_out_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( pkt_configuration )::get cannot find resource block_a_env_secure_data_plane_out_BFM" )
    if( !uvm_config_db #( mem_configuration#(
        .ADDR_WIDTH(TEST_CP_IN_ADDR_WIDTH),
        .DATA_WIDTH(TEST_CP_IN_DATA_WIDTH)
        ) )::get( null , UVMF_CONFIGURATIONS , block_b_env_control_plane_in_BFM , block_b_env_control_plane_in_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( mem_configuration )::get cannot find resource block_b_env_control_plane_in_BFM" )
    if( !uvm_config_db #( mem_configuration#(
        .ADDR_WIDTH(TEST_CP_OUT_ADDR_WIDTH)
        ) )::get( null , UVMF_CONFIGURATIONS , block_b_env_control_plane_out_BFM , block_b_env_control_plane_out_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( mem_configuration )::get cannot find resource block_b_env_control_plane_out_BFM" )
    if( !uvm_config_db #( pkt_configuration#(
        .DATA_WIDTH(TEST_UDP_DATA_WIDTH)
        ) )::get( null , UVMF_CONFIGURATIONS , block_b_env_unsecure_data_plane_in_BFM , block_b_env_unsecure_data_plane_in_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( pkt_configuration )::get cannot find resource block_b_env_unsecure_data_plane_in_BFM" )
    if( !uvm_config_db #( pkt_configuration )::get( null , UVMF_CONFIGURATIONS , block_b_env_unsecure_data_plane_out_BFM , block_b_env_unsecure_data_plane_out_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( pkt_configuration )::get cannot find resource block_b_env_unsecure_data_plane_out_BFM" )

    // Assign the sequencer handles from the handles within agent configurations
    block_a_env_control_plane_in_sequencer = block_a_env_control_plane_in_config.get_sequencer();
    block_a_env_secure_data_plane_in_sequencer = block_a_env_secure_data_plane_in_config.get_sequencer();
    block_a_env_secure_data_plane_out_sequencer = block_a_env_secure_data_plane_out_config.get_sequencer();
    block_b_env_control_plane_out_sequencer = block_b_env_control_plane_out_config.get_sequencer();
    block_b_env_unsecure_data_plane_in_sequencer = block_b_env_unsecure_data_plane_in_config.get_sequencer();
    block_b_env_unsecure_data_plane_out_sequencer = block_b_env_unsecure_data_plane_out_config.get_sequencer();

    reg_model = top_configuration.chip_rm;


    // pragma uvmf custom new begin
    // pragma uvmf custom new end

  endfunction

  // ****************************************************************************
  virtual task body();
    // pragma uvmf custom body begin

    // Construct sequences here

    chip_env_seq = chip_env_sequence_base_t::type_id::create("chip_env_seq");

    block_a_env_control_plane_in_random_seq     = block_a_env_control_plane_in_random_seq_t::type_id::create("block_a_env_control_plane_in_random_seq");
    block_a_env_secure_data_plane_in_random_seq     = block_a_env_secure_data_plane_in_random_seq_t::type_id::create("block_a_env_secure_data_plane_in_random_seq");
    block_a_env_secure_data_plane_out_responder_seq  = block_a_env_secure_data_plane_out_responder_seq_t::type_id::create("block_a_env_secure_data_plane_out_responder_seq");
    block_b_env_control_plane_out_random_seq     = block_b_env_control_plane_out_random_seq_t::type_id::create("block_b_env_control_plane_out_random_seq");
    block_b_env_unsecure_data_plane_in_random_seq     = block_b_env_unsecure_data_plane_in_random_seq_t::type_id::create("block_b_env_unsecure_data_plane_in_random_seq");
    block_b_env_unsecure_data_plane_out_random_seq     = block_b_env_unsecure_data_plane_out_random_seq_t::type_id::create("block_b_env_unsecure_data_plane_out_random_seq");
    fork
      block_a_env_control_plane_in_config.wait_for_reset();
      block_a_env_control_plane_out_config.wait_for_reset();
      block_a_env_secure_data_plane_in_config.wait_for_reset();
      block_a_env_secure_data_plane_out_config.wait_for_reset();
      block_b_env_control_plane_in_config.wait_for_reset();
      block_b_env_control_plane_out_config.wait_for_reset();
      block_b_env_unsecure_data_plane_in_config.wait_for_reset();
      block_b_env_unsecure_data_plane_out_config.wait_for_reset();
    join
    reg_model.reset();
    // Start RESPONDER sequences here
    fork
      block_a_env_secure_data_plane_out_responder_seq.start(block_a_env_secure_data_plane_out_sequencer);
    join_none
    // Start INITIATOR sequences here
    fork
      repeat (25) block_a_env_control_plane_in_random_seq.start(block_a_env_control_plane_in_sequencer);
      repeat (25) block_a_env_secure_data_plane_in_random_seq.start(block_a_env_secure_data_plane_in_sequencer);
      repeat (25) block_b_env_control_plane_out_random_seq.start(block_b_env_control_plane_out_sequencer);
      repeat (25) block_b_env_unsecure_data_plane_in_random_seq.start(block_b_env_unsecure_data_plane_in_sequencer);
      repeat (25) block_b_env_unsecure_data_plane_out_random_seq.start(block_b_env_unsecure_data_plane_out_sequencer);
    join

chip_env_seq.start(top_configuration.vsqr);

    // UVMF_CHANGE_ME : Extend the simulation XXX number of clocks after 
    // the last sequence to allow for the last sequence item to flow 
    // through the design.
    fork
      block_a_env_control_plane_in_config.wait_for_num_clocks(400);
      block_a_env_control_plane_out_config.wait_for_num_clocks(400);
      block_a_env_secure_data_plane_in_config.wait_for_num_clocks(400);
      block_a_env_secure_data_plane_out_config.wait_for_num_clocks(400);
      block_b_env_control_plane_in_config.wait_for_num_clocks(400);
      block_b_env_control_plane_out_config.wait_for_num_clocks(400);
      block_b_env_unsecure_data_plane_in_config.wait_for_num_clocks(400);
      block_b_env_unsecure_data_plane_out_config.wait_for_num_clocks(400);
    join

    // pragma uvmf custom body end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

