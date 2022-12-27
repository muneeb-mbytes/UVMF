`ifndef BLOCK_3_TB_SEQUENCES_SRC_BENCH_SEQUENCE_BASE_SVH
`define BLOCK_3_TB_SEQUENCES_SRC_BENCH_SEQUENCE_BASE_SVH

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

class block_3_bench_sequence_base extends uvmf_sequence_base #(uvm_sequence_item);

  `uvm_object_utils( block_3_bench_sequence_base );

  // pragma uvmf custom sequences begin

typedef block_3_env_sequence_base #(
        .CONFIG_T(block_3_env_configuration_t)
        )
        block_3_env_sequence_base_t;
rand block_3_env_sequence_base_t block_3_env_seq;



  // UVMF_CHANGE_ME : Instantiate, construct, and start sequences as needed to create stimulus scenarios.
  // Instantiate sequences here
  typedef wb_m_random_sequence  wb_master_random_seq_t;
  wb_master_random_seq_t wb_master_random_seq;
  typedef axi_s_responder_sequence  axi_slave_responder_seq_t;
  axi_slave_responder_seq_t axi_slave_responder_seq;
  // pragma uvmf custom sequences end

  // Sequencer handles for each active interface in the environment
  typedef wb_m_transaction  wb_master_transaction_t;
  uvm_sequencer #(wb_master_transaction_t)  wb_master_sequencer; 
  typedef axi_s_transaction  axi_slave_transaction_t;
  uvm_sequencer #(axi_slave_transaction_t)  axi_slave_sequencer; 


  // Top level environment configuration handle
  block_3_env_configuration_t top_configuration;

  // Configuration handles to access interface BFM's
  wb_m_configuration  wb_master_config;
  axi_s_configuration  axi_slave_config;

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
    if( !uvm_config_db #( wb_m_configuration )::get( null , UVMF_CONFIGURATIONS , wb_master_BFM , wb_master_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( wb_m_configuration )::get cannot find resource wb_master_BFM" )
    if( !uvm_config_db #( axi_s_configuration )::get( null , UVMF_CONFIGURATIONS , axi_slave_BFM , axi_slave_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( axi_s_configuration )::get cannot find resource axi_slave_BFM" )

    // Assign the sequencer handles from the handles within agent configurations
    wb_master_sequencer = wb_master_config.get_sequencer();
    axi_slave_sequencer = axi_slave_config.get_sequencer();



    // pragma uvmf custom new begin
    // pragma uvmf custom new end

  endfunction

  // ****************************************************************************
  virtual task body();
    // pragma uvmf custom body begin

    // Construct sequences here

    block_3_env_seq = block_3_env_sequence_base_t::type_id::create("block_3_env_seq");

    wb_master_random_seq     = wb_master_random_seq_t::type_id::create("wb_master_random_seq");
    axi_slave_responder_seq  = axi_slave_responder_seq_t::type_id::create("axi_slave_responder_seq");
    fork
      wb_master_config.wait_for_reset();
      axi_slave_config.wait_for_reset();
    join
    // Start RESPONDER sequences here
    fork
      axi_slave_responder_seq.start(axi_slave_sequencer);
    join_none
    // Start INITIATOR sequences here
    fork
      repeat (25) wb_master_random_seq.start(wb_master_sequencer);
    join

block_3_env_seq.start(top_configuration.vsqr);

    // UVMF_CHANGE_ME : Extend the simulation XXX number of clocks after 
    // the last sequence to allow for the last sequence item to flow 
    // through the design.
    fork
      wb_master_config.wait_for_num_clocks(400);
      axi_slave_config.wait_for_num_clocks(400);
    join

    // pragma uvmf custom body end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end
`endif
