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


typedef block_a_env_configuration  block_a_env_configuration_t;

class block_a_bench_sequence_base extends uvmf_sequence_base #(uvm_sequence_item);

  `uvm_object_utils( block_a_bench_sequence_base );

  // pragma uvmf custom sequences begin

typedef block_a_env_sequence_base #(
        .CONFIG_T(block_a_env_configuration_t)
        )
        block_a_env_sequence_base_t;
rand block_a_env_sequence_base_t block_a_env_seq;



  // UVMF_CHANGE_ME : Instantiate, construct, and start sequences as needed to create stimulus scenarios.
  // Instantiate sequences here
  typedef mem_random_sequence  control_plane_in_random_seq_t;
  control_plane_in_random_seq_t control_plane_in_random_seq;
  typedef mem_responder_sequence  control_plane_out_responder_seq_t;
  control_plane_out_responder_seq_t control_plane_out_responder_seq;
  typedef pkt_random_sequence  secure_data_plane_in_random_seq_t;
  secure_data_plane_in_random_seq_t secure_data_plane_in_random_seq;
  typedef pkt_responder_sequence  secure_data_plane_out_responder_seq_t;
  secure_data_plane_out_responder_seq_t secure_data_plane_out_responder_seq;
  // pragma uvmf custom sequences end

  // Sequencer handles for each active interface in the environment
  typedef mem_transaction  control_plane_in_transaction_t;
  uvm_sequencer #(control_plane_in_transaction_t)  control_plane_in_sequencer; 
  typedef mem_transaction  control_plane_out_transaction_t;
  uvm_sequencer #(control_plane_out_transaction_t)  control_plane_out_sequencer; 
  typedef pkt_transaction  secure_data_plane_in_transaction_t;
  uvm_sequencer #(secure_data_plane_in_transaction_t)  secure_data_plane_in_sequencer; 
  typedef pkt_transaction  secure_data_plane_out_transaction_t;
  uvm_sequencer #(secure_data_plane_out_transaction_t)  secure_data_plane_out_sequencer; 


  // Top level environment configuration handle
  block_a_env_configuration_t top_configuration;

  // Configuration handles to access interface BFM's
  mem_configuration  control_plane_in_config;
  mem_configuration  control_plane_out_config;
  pkt_configuration  secure_data_plane_in_config;
  pkt_configuration  secure_data_plane_out_config;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // ****************************************************************************
  function new( string name = "" );
    super.new( name );
    // Retrieve the configuration handles from the uvm_config_db

    // Retrieve top level configuration handle
    if ( !uvm_config_db#(block_a_env_configuration_t)::get(null,UVMF_CONFIGURATIONS, "TOP_ENV_CONFIG",top_configuration) ) begin
      `uvm_info("CFG", "*** FATAL *** uvm_config_db::get can not find TOP_ENV_CONFIG.  Are you using an older UVMF release than what was used to generate this bench?",UVM_NONE);
      `uvm_fatal("CFG", "uvm_config_db#(block_a_env_configuration_t)::get cannot find resource TOP_ENV_CONFIG");
    end

    // Retrieve config handles for all agents
    if( !uvm_config_db #( mem_configuration )::get( null , UVMF_CONFIGURATIONS , control_plane_in_BFM , control_plane_in_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( mem_configuration )::get cannot find resource control_plane_in_BFM" )
    if( !uvm_config_db #( mem_configuration )::get( null , UVMF_CONFIGURATIONS , control_plane_out_BFM , control_plane_out_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( mem_configuration )::get cannot find resource control_plane_out_BFM" )
    if( !uvm_config_db #( pkt_configuration )::get( null , UVMF_CONFIGURATIONS , secure_data_plane_in_BFM , secure_data_plane_in_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( pkt_configuration )::get cannot find resource secure_data_plane_in_BFM" )
    if( !uvm_config_db #( pkt_configuration )::get( null , UVMF_CONFIGURATIONS , secure_data_plane_out_BFM , secure_data_plane_out_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( pkt_configuration )::get cannot find resource secure_data_plane_out_BFM" )

    // Assign the sequencer handles from the handles within agent configurations
    control_plane_in_sequencer = control_plane_in_config.get_sequencer();
    control_plane_out_sequencer = control_plane_out_config.get_sequencer();
    secure_data_plane_in_sequencer = secure_data_plane_in_config.get_sequencer();
    secure_data_plane_out_sequencer = secure_data_plane_out_config.get_sequencer();



    // pragma uvmf custom new begin
    // pragma uvmf custom new end

  endfunction

  // ****************************************************************************
  virtual task body();
    // pragma uvmf custom body begin

    // Construct sequences here

    block_a_env_seq = block_a_env_sequence_base_t::type_id::create("block_a_env_seq");

    control_plane_in_random_seq     = control_plane_in_random_seq_t::type_id::create("control_plane_in_random_seq");
    control_plane_out_responder_seq  = control_plane_out_responder_seq_t::type_id::create("control_plane_out_responder_seq");
    secure_data_plane_in_random_seq     = secure_data_plane_in_random_seq_t::type_id::create("secure_data_plane_in_random_seq");
    secure_data_plane_out_responder_seq  = secure_data_plane_out_responder_seq_t::type_id::create("secure_data_plane_out_responder_seq");
    fork
      control_plane_in_config.wait_for_reset();
      control_plane_out_config.wait_for_reset();
      secure_data_plane_in_config.wait_for_reset();
      secure_data_plane_out_config.wait_for_reset();
    join
    // Start RESPONDER sequences here
    fork
      control_plane_out_responder_seq.start(control_plane_out_sequencer);
      secure_data_plane_out_responder_seq.start(secure_data_plane_out_sequencer);
    join_none
    // Start INITIATOR sequences here
    fork
      repeat (25) control_plane_in_random_seq.start(control_plane_in_sequencer);
      repeat (25) secure_data_plane_in_random_seq.start(secure_data_plane_in_sequencer);
    join

block_a_env_seq.start(top_configuration.vsqr);

    // UVMF_CHANGE_ME : Extend the simulation XXX number of clocks after 
    // the last sequence to allow for the last sequence item to flow 
    // through the design.
    fork
      control_plane_in_config.wait_for_num_clocks(400);
      control_plane_out_config.wait_for_num_clocks(400);
      secure_data_plane_in_config.wait_for_num_clocks(400);
      secure_data_plane_out_config.wait_for_num_clocks(400);
    join

    // pragma uvmf custom body end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

