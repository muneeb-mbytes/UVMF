`ifndef BLOCK_1_INCLUDED_
`define BLOCK_1_INCLUDED_


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


typedef block_1_env_configuration  block_1_env_configuration_t;

class block_1_bench_sequence_base extends uvmf_sequence_base #(uvm_sequence_item);

  `uvm_object_utils( block_1_bench_sequence_base );

  // pragma uvmf custom sequences begin

typedef block_1_env_sequence_base #(
        .CONFIG_T(block_1_env_configuration_t)
        )
        block_1_env_sequence_base_t;
rand block_1_env_sequence_base_t block_1_env_seq;



  // UVMF_CHANGE_ME : Instantiate, construct, and start sequences as needed to create stimulus scenarios.
  // Instantiate sequences here
  typedef apb_m_random_sequence  apb_master_random_seq_t;
  apb_master_random_seq_t apb_master_random_seq;
  typedef axi_m_random_sequence  axi_master1_random_seq_t;
  axi_master1_random_seq_t axi_master1_random_seq;
  typedef axi_m_random_sequence  axi_master2_random_seq_t;
  axi_master2_random_seq_t axi_master2_random_seq;
  // pragma uvmf custom sequences end

  // Sequencer handles for each active interface in the environment
  typedef apb_m_transaction  apb_master_transaction_t;
  uvm_sequencer #(apb_master_transaction_t)  apb_master_sequencer; 
  typedef axi_m_transaction  axi_master1_transaction_t;
  uvm_sequencer #(axi_master1_transaction_t)  axi_master1_sequencer; 
  typedef axi_m_transaction  axi_master2_transaction_t;
  uvm_sequencer #(axi_master2_transaction_t)  axi_master2_sequencer; 


  // Top level environment configuration handle
  block_1_env_configuration_t top_configuration;

  // Configuration handles to access interface BFM's
  apb_m_configuration  apb_master_config;
  axi_m_configuration  axi_master1_config;
  axi_m_configuration  axi_master2_config;
  spi_s_configuration  spi_slave_config;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // ****************************************************************************
  function new( string name = "" );
    super.new( name );
    // Retrieve the configuration handles from the uvm_config_db

    // Retrieve top level configuration handle
    if ( !uvm_config_db#(block_1_env_configuration_t)::get(null,UVMF_CONFIGURATIONS, "TOP_ENV_CONFIG",top_configuration) ) begin
      `uvm_info("CFG", "*** FATAL *** uvm_config_db::get can not find TOP_ENV_CONFIG.  Are you using an older UVMF release than what was used to generate this bench?",UVM_NONE);
      `uvm_fatal("CFG", "uvm_config_db#(block_1_env_configuration_t)::get cannot find resource TOP_ENV_CONFIG");
    end

    // Retrieve config handles for all agents
    if( !uvm_config_db #( apb_m_configuration )::get( null , UVMF_CONFIGURATIONS , apb_master_BFM , apb_master_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( apb_m_configuration )::get cannot find resource apb_master_BFM" )
    if( !uvm_config_db #( axi_m_configuration )::get( null , UVMF_CONFIGURATIONS , axi_master1_BFM , axi_master1_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( axi_m_configuration )::get cannot find resource axi_master1_BFM" )
    if( !uvm_config_db #( axi_m_configuration )::get( null , UVMF_CONFIGURATIONS , axi_master2_BFM , axi_master2_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( axi_m_configuration )::get cannot find resource axi_master2_BFM" )
    if( !uvm_config_db #( spi_s_configuration )::get( null , UVMF_CONFIGURATIONS , spi_slave_BFM , spi_slave_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( spi_s_configuration )::get cannot find resource spi_slave_BFM" )

    // Assign the sequencer handles from the handles within agent configurations
    apb_master_sequencer = apb_master_config.get_sequencer();
    axi_master1_sequencer = axi_master1_config.get_sequencer();
    axi_master2_sequencer = axi_master2_config.get_sequencer();



    // pragma uvmf custom new begin
    // pragma uvmf custom new end

  endfunction

  // ****************************************************************************
  virtual task body();
    // pragma uvmf custom body begin

    // Construct sequences here

    block_1_env_seq = block_1_env_sequence_base_t::type_id::create("block_1_env_seq");

    apb_master_random_seq     = apb_master_random_seq_t::type_id::create("apb_master_random_seq");
    axi_master1_random_seq     = axi_master1_random_seq_t::type_id::create("axi_master1_random_seq");
    axi_master2_random_seq     = axi_master2_random_seq_t::type_id::create("axi_master2_random_seq");
    fork
      apb_master_config.wait_for_reset();
      axi_master1_config.wait_for_reset();
      axi_master2_config.wait_for_reset();
      spi_slave_config.wait_for_reset();
    join
    // Start RESPONDER sequences here
    fork
    join_none
    // Start INITIATOR sequences here
    fork
      repeat (25) apb_master_random_seq.start(apb_master_sequencer);
      repeat (25) axi_master1_random_seq.start(axi_master1_sequencer);
      repeat (25) axi_master2_random_seq.start(axi_master2_sequencer);
    join

block_1_env_seq.start(top_configuration.vsqr);

    // UVMF_CHANGE_ME : Extend the simulation XXX number of clocks after 
    // the last sequence to allow for the last sequence item to flow 
    // through the design.
    fork
      apb_master_config.wait_for_num_clocks(400);
      axi_master1_config.wait_for_num_clocks(400);
      axi_master2_config.wait_for_num_clocks(400);
      spi_slave_config.wait_for_num_clocks(400);
    join

    // pragma uvmf custom body end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end
`endif
