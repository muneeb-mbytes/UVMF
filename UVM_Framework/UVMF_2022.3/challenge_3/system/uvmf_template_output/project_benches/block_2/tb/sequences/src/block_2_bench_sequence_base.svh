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


typedef block_2_env_configuration  block_2_env_configuration_t;

class block_2_bench_sequence_base extends uvmf_sequence_base #(uvm_sequence_item);

  `uvm_object_utils( block_2_bench_sequence_base );

  // pragma uvmf custom sequences begin

typedef block_2_env_sequence_base #(
        .CONFIG_T(block_2_env_configuration_t)
        )
        block_2_env_sequence_base_t;
rand block_2_env_sequence_base_t block_2_env_seq;



  // UVMF_CHANGE_ME : Instantiate, construct, and start sequences as needed to create stimulus scenarios.
  // Instantiate sequences here
  typedef spi_m_random_sequence  spi_master_random_seq_t;
  spi_master_random_seq_t spi_master_random_seq;
  typedef wb_s_responder_sequence  wb_slave_responder_seq_t;
  wb_slave_responder_seq_t wb_slave_responder_seq;
  // pragma uvmf custom sequences end

  // Sequencer handles for each active interface in the environment
  typedef spi_m_transaction  spi_master_transaction_t;
  uvm_sequencer #(spi_master_transaction_t)  spi_master_sequencer; 
  typedef wb_s_transaction  wb_slave_transaction_t;
  uvm_sequencer #(wb_slave_transaction_t)  wb_slave_sequencer; 


  // Top level environment configuration handle
  block_2_env_configuration_t top_configuration;

  // Configuration handles to access interface BFM's
  spi_m_configuration  spi_master_config;
  wb_s_configuration  wb_slave_config;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // ****************************************************************************
  function new( string name = "" );
    super.new( name );
    // Retrieve the configuration handles from the uvm_config_db

    // Retrieve top level configuration handle
    if ( !uvm_config_db#(block_2_env_configuration_t)::get(null,UVMF_CONFIGURATIONS, "TOP_ENV_CONFIG",top_configuration) ) begin
      `uvm_info("CFG", "*** FATAL *** uvm_config_db::get can not find TOP_ENV_CONFIG.  Are you using an older UVMF release than what was used to generate this bench?",UVM_NONE);
      `uvm_fatal("CFG", "uvm_config_db#(block_2_env_configuration_t)::get cannot find resource TOP_ENV_CONFIG");
    end

    // Retrieve config handles for all agents
    if( !uvm_config_db #( spi_m_configuration )::get( null , UVMF_CONFIGURATIONS , spi_master_BFM , spi_master_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( spi_m_configuration )::get cannot find resource spi_master_BFM" )
    if( !uvm_config_db #( wb_s_configuration )::get( null , UVMF_CONFIGURATIONS , wb_slave_BFM , wb_slave_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( wb_s_configuration )::get cannot find resource wb_slave_BFM" )

    // Assign the sequencer handles from the handles within agent configurations
    spi_master_sequencer = spi_master_config.get_sequencer();
    wb_slave_sequencer = wb_slave_config.get_sequencer();



    // pragma uvmf custom new begin
    // pragma uvmf custom new end

  endfunction

  // ****************************************************************************
  virtual task body();
    // pragma uvmf custom body begin

    // Construct sequences here

    block_2_env_seq = block_2_env_sequence_base_t::type_id::create("block_2_env_seq");

    spi_master_random_seq     = spi_master_random_seq_t::type_id::create("spi_master_random_seq");
    wb_slave_responder_seq  = wb_slave_responder_seq_t::type_id::create("wb_slave_responder_seq");
    fork
      spi_master_config.wait_for_reset();
      wb_slave_config.wait_for_reset();
    join
    // Start RESPONDER sequences here
    fork
      wb_slave_responder_seq.start(wb_slave_sequencer);
    join_none
    // Start INITIATOR sequences here
    fork
      repeat (25) spi_master_random_seq.start(spi_master_sequencer);
    join

block_2_env_seq.start(top_configuration.vsqr);

    // UVMF_CHANGE_ME : Extend the simulation XXX number of clocks after 
    // the last sequence to allow for the last sequence item to flow 
    // through the design.
    fork
      spi_master_config.wait_for_num_clocks(400);
      wb_slave_config.wait_for_num_clocks(400);
    join

    // pragma uvmf custom body end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

