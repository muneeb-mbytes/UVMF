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


typedef block_3_env_configuration  block_3_env_configuration_t;

class block_3_ben_bench_sequence_base extends uvmf_sequence_base #(uvm_sequence_item);

  `uvm_object_utils( block_3_ben_bench_sequence_base );

  // pragma uvmf custom sequences begin

typedef block_3_env_sequence_base #(
        .CONFIG_T(block_3_env_configuration_t)
        )
        block_3_env_sequence_base_t;
rand block_3_env_sequence_base_t block_3_env_seq;



  // UVMF_CHANGE_ME : Instantiate, construct, and start sequences as needed to create stimulus scenarios.
  // Instantiate sequences here
  typedef wishbone_master_random_sequence  wishbone_master_agent_random_seq_t;
  wishbone_master_agent_random_seq_t wishbone_master_agent_random_seq;
  // pragma uvmf custom sequences end

  // Sequencer handles for each active interface in the environment
  typedef wishbone_master_transaction  wishbone_master_agent_transaction_t;
  uvm_sequencer #(wishbone_master_agent_transaction_t)  wishbone_master_agent_sequencer; 


  // Top level environment configuration handle
  block_3_env_configuration_t top_configuration;

  // Configuration handles to access interface BFM's
  wishbone_master_configuration  wishbone_master_agent_config;
  axi_slave_configuration  axi_slave_agent_config;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // ****************************************************************************
  function new( string name = "" );
    super.new( name );
    // Retrieve the configuration handles from the uvm_config_db

    // Retrieve top level configuration handle
    if ( !uvm_config_db#(block_3_env_configuration_t)::get(null,UVMF_CONFIGURATIONS, "TOP_ENV_CONFIG",top_configuration) ) begin
      `uvm_info("CFG", "*** FATAL *** uvm_config_db::get can not find TOP_ENV_CONFIG.  Are you using an older UVMF release than what was used to generate this bench?",UVM_NONE);
      `uvm_fatal("CFG", "uvm_config_db#(block_3_env_configuration_t)::get cannot find resource TOP_ENV_CONFIG");
    end

    // Retrieve config handles for all agents
    if( !uvm_config_db #( wishbone_master_configuration )::get( null , UVMF_CONFIGURATIONS , wishbone_master_agent_BFM , wishbone_master_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( wishbone_master_configuration )::get cannot find resource wishbone_master_agent_BFM" )
    if( !uvm_config_db #( axi_slave_configuration )::get( null , UVMF_CONFIGURATIONS , axi_slave_agent_BFM , axi_slave_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( axi_slave_configuration )::get cannot find resource axi_slave_agent_BFM" )

    // Assign the sequencer handles from the handles within agent configurations
    wishbone_master_agent_sequencer = wishbone_master_agent_config.get_sequencer();



    // pragma uvmf custom new begin
    // pragma uvmf custom new end

  endfunction

  // ****************************************************************************
  virtual task body();
    // pragma uvmf custom body begin

    // Construct sequences here

    block_3_env_seq = block_3_env_sequence_base_t::type_id::create("block_3_env_seq");

    wishbone_master_agent_random_seq     = wishbone_master_agent_random_seq_t::type_id::create("wishbone_master_agent_random_seq");
    fork
      wishbone_master_agent_config.wait_for_reset();
      axi_slave_agent_config.wait_for_reset();
    join
    // Start RESPONDER sequences here
    fork
    join_none
    // Start INITIATOR sequences here
    fork
      repeat (25) wishbone_master_agent_random_seq.start(wishbone_master_agent_sequencer);
    join

block_3_env_seq.start(top_configuration.vsqr);

    // UVMF_CHANGE_ME : Extend the simulation XXX number of clocks after 
    // the last sequence to allow for the last sequence item to flow 
    // through the design.
    fork
      wishbone_master_agent_config.wait_for_num_clocks(400);
      axi_slave_agent_config.wait_for_num_clocks(400);
    join

    // pragma uvmf custom body end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

