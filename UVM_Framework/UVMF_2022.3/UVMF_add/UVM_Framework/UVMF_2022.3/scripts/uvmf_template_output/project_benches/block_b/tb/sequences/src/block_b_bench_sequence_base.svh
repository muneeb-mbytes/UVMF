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


typedef block_b_env_configuration #(
        .CP_IN_DATA_WIDTH(TEST_CP_IN_DATA_WIDTH),
        .CP_OUT_ADDR_WIDTH(TEST_CP_OUT_ADDR_WIDTH),
        .CP_IN_ADDR_WIDTH(TEST_CP_IN_ADDR_WIDTH),
        .UDP_DATA_WIDTH(TEST_UDP_DATA_WIDTH)
        ) block_b_env_configuration_t;

class block_b_bench_sequence_base extends uvmf_sequence_base #(uvm_sequence_item);

  `uvm_object_utils( block_b_bench_sequence_base );

  // pragma uvmf custom sequences begin

typedef block_b_env_sequence_base #(
        .CONFIG_T(block_b_env_configuration_t),
        .CP_IN_DATA_WIDTH(TEST_CP_IN_DATA_WIDTH),
        .CP_OUT_ADDR_WIDTH(TEST_CP_OUT_ADDR_WIDTH),
        .CP_IN_ADDR_WIDTH(TEST_CP_IN_ADDR_WIDTH),
        .UDP_DATA_WIDTH(TEST_UDP_DATA_WIDTH)
        )
        block_b_env_sequence_base_t;
rand block_b_env_sequence_base_t block_b_env_seq;



  // UVMF_CHANGE_ME : Instantiate, construct, and start sequences as needed to create stimulus scenarios.
  // Instantiate sequences here
  typedef mem_random_sequence #(
        .ADDR_WIDTH(TEST_CP_IN_ADDR_WIDTH),
        .DATA_WIDTH(TEST_CP_IN_DATA_WIDTH)
        ) control_plane_in_random_seq_t;
  control_plane_in_random_seq_t control_plane_in_random_seq;
  typedef mem_random_sequence #(
        .ADDR_WIDTH(TEST_CP_OUT_ADDR_WIDTH)
        ) control_plane_out_random_seq_t;
  control_plane_out_random_seq_t control_plane_out_random_seq;
  typedef pkt_random_sequence #(
        .DATA_WIDTH(TEST_UDP_DATA_WIDTH)
        ) unsecure_data_plane_in_random_seq_t;
  unsecure_data_plane_in_random_seq_t unsecure_data_plane_in_random_seq;
  typedef pkt_random_sequence  unsecure_data_plane_out_random_seq_t;
  unsecure_data_plane_out_random_seq_t unsecure_data_plane_out_random_seq;
  // pragma uvmf custom sequences end

  // Sequencer handles for each active interface in the environment
  typedef mem_transaction #(
        .ADDR_WIDTH(TEST_CP_IN_ADDR_WIDTH),
        .DATA_WIDTH(TEST_CP_IN_DATA_WIDTH)
        ) control_plane_in_transaction_t;
  uvm_sequencer #(control_plane_in_transaction_t)  control_plane_in_sequencer; 
  typedef mem_transaction #(
        .ADDR_WIDTH(TEST_CP_OUT_ADDR_WIDTH)
        ) control_plane_out_transaction_t;
  uvm_sequencer #(control_plane_out_transaction_t)  control_plane_out_sequencer; 
  typedef pkt_transaction #(
        .DATA_WIDTH(TEST_UDP_DATA_WIDTH)
        ) unsecure_data_plane_in_transaction_t;
  uvm_sequencer #(unsecure_data_plane_in_transaction_t)  unsecure_data_plane_in_sequencer; 
  typedef pkt_transaction  unsecure_data_plane_out_transaction_t;
  uvm_sequencer #(unsecure_data_plane_out_transaction_t)  unsecure_data_plane_out_sequencer; 


  // Top level environment configuration handle
  block_b_env_configuration_t top_configuration;

  // Configuration handles to access interface BFM's
  mem_configuration #(
        .ADDR_WIDTH(TEST_CP_IN_ADDR_WIDTH),
        .DATA_WIDTH(TEST_CP_IN_DATA_WIDTH)
        ) control_plane_in_config;
  mem_configuration #(
        .ADDR_WIDTH(TEST_CP_OUT_ADDR_WIDTH)
        ) control_plane_out_config;
  pkt_configuration #(
        .DATA_WIDTH(TEST_UDP_DATA_WIDTH)
        ) unsecure_data_plane_in_config;
  pkt_configuration  unsecure_data_plane_out_config;
  // Local handle to register model for convenience
  blkb_reg_block reg_model;
  uvm_status_e status;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // ****************************************************************************
  function new( string name = "" );
    super.new( name );
    // Retrieve the configuration handles from the uvm_config_db

    // Retrieve top level configuration handle
    if ( !uvm_config_db#(block_b_env_configuration_t)::get(null,UVMF_CONFIGURATIONS, "TOP_ENV_CONFIG",top_configuration) ) begin
      `uvm_info("CFG", "*** FATAL *** uvm_config_db::get can not find TOP_ENV_CONFIG.  Are you using an older UVMF release than what was used to generate this bench?",UVM_NONE);
      `uvm_fatal("CFG", "uvm_config_db#(block_b_env_configuration_t)::get cannot find resource TOP_ENV_CONFIG");
    end

    // Retrieve config handles for all agents
    if( !uvm_config_db #( mem_configuration#(
        .ADDR_WIDTH(TEST_CP_IN_ADDR_WIDTH),
        .DATA_WIDTH(TEST_CP_IN_DATA_WIDTH)
        ) )::get( null , UVMF_CONFIGURATIONS , control_plane_in_BFM , control_plane_in_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( mem_configuration )::get cannot find resource control_plane_in_BFM" )
    if( !uvm_config_db #( mem_configuration#(
        .ADDR_WIDTH(TEST_CP_OUT_ADDR_WIDTH)
        ) )::get( null , UVMF_CONFIGURATIONS , control_plane_out_BFM , control_plane_out_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( mem_configuration )::get cannot find resource control_plane_out_BFM" )
    if( !uvm_config_db #( pkt_configuration#(
        .DATA_WIDTH(TEST_UDP_DATA_WIDTH)
        ) )::get( null , UVMF_CONFIGURATIONS , unsecure_data_plane_in_BFM , unsecure_data_plane_in_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( pkt_configuration )::get cannot find resource unsecure_data_plane_in_BFM" )
    if( !uvm_config_db #( pkt_configuration )::get( null , UVMF_CONFIGURATIONS , unsecure_data_plane_out_BFM , unsecure_data_plane_out_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( pkt_configuration )::get cannot find resource unsecure_data_plane_out_BFM" )

    // Assign the sequencer handles from the handles within agent configurations
    control_plane_in_sequencer = control_plane_in_config.get_sequencer();
    control_plane_out_sequencer = control_plane_out_config.get_sequencer();
    unsecure_data_plane_in_sequencer = unsecure_data_plane_in_config.get_sequencer();
    unsecure_data_plane_out_sequencer = unsecure_data_plane_out_config.get_sequencer();

    reg_model = top_configuration.block_b_rm;


    // pragma uvmf custom new begin
    // pragma uvmf custom new end

  endfunction

  // ****************************************************************************
  virtual task body();
    // pragma uvmf custom body begin

    // Construct sequences here

    block_b_env_seq = block_b_env_sequence_base_t::type_id::create("block_b_env_seq");

    control_plane_in_random_seq     = control_plane_in_random_seq_t::type_id::create("control_plane_in_random_seq");
    control_plane_out_random_seq     = control_plane_out_random_seq_t::type_id::create("control_plane_out_random_seq");
    unsecure_data_plane_in_random_seq     = unsecure_data_plane_in_random_seq_t::type_id::create("unsecure_data_plane_in_random_seq");
    unsecure_data_plane_out_random_seq     = unsecure_data_plane_out_random_seq_t::type_id::create("unsecure_data_plane_out_random_seq");
    fork
      control_plane_in_config.wait_for_reset();
      control_plane_out_config.wait_for_reset();
      unsecure_data_plane_in_config.wait_for_reset();
      unsecure_data_plane_out_config.wait_for_reset();
    join
    reg_model.reset();
    // Start RESPONDER sequences here
    fork
    join_none
    // Start INITIATOR sequences here
    fork
      repeat (25) control_plane_in_random_seq.start(control_plane_in_sequencer);
      repeat (25) control_plane_out_random_seq.start(control_plane_out_sequencer);
      repeat (25) unsecure_data_plane_in_random_seq.start(unsecure_data_plane_in_sequencer);
      repeat (25) unsecure_data_plane_out_random_seq.start(unsecure_data_plane_out_sequencer);
    join

block_b_env_seq.start(top_configuration.vsqr);

    // UVMF_CHANGE_ME : Extend the simulation XXX number of clocks after 
    // the last sequence to allow for the last sequence item to flow 
    // through the design.
    fork
      control_plane_in_config.wait_for_num_clocks(400);
      control_plane_out_config.wait_for_num_clocks(400);
      unsecure_data_plane_in_config.wait_for_num_clocks(400);
      unsecure_data_plane_out_config.wait_for_num_clocks(400);
    join

    // pragma uvmf custom body end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

