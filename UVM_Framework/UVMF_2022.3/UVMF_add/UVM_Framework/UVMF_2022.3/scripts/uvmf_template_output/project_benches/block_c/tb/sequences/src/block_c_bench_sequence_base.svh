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


typedef block_c_env_configuration  block_c_env_configuration_t;

class block_c_bench_sequence_base extends uvmf_sequence_base #(uvm_sequence_item);

  `uvm_object_utils( block_c_bench_sequence_base );

  // pragma uvmf custom sequences begin

typedef block_c_env_sequence_base #(
        .CONFIG_T(block_c_env_configuration_t)
        )
        block_c_env_sequence_base_t;
rand block_c_env_sequence_base_t block_c_env_seq;



  // UVMF_CHANGE_ME : Instantiate, construct, and start sequences as needed to create stimulus scenarios.
  // Instantiate sequences here
  typedef mem_random_sequence  mem_in_random_seq_t;
  mem_in_random_seq_t mem_in_random_seq;
  typedef mem_random_sequence  mem_out_random_seq_t;
  mem_out_random_seq_t mem_out_random_seq;
  typedef pkt_random_sequence  pkt_out_random_seq_t;
  pkt_out_random_seq_t pkt_out_random_seq;
  // pragma uvmf custom sequences end

  // Sequencer handles for each active interface in the environment
  typedef mem_transaction  mem_in_transaction_t;
  uvm_sequencer #(mem_in_transaction_t)  mem_in_sequencer; 
  typedef mem_transaction  mem_out_transaction_t;
  uvm_sequencer #(mem_out_transaction_t)  mem_out_sequencer; 
  typedef pkt_transaction  pkt_out_transaction_t;
  uvm_sequencer #(pkt_out_transaction_t)  pkt_out_sequencer; 

  // Sequencer handles for each QVIP interface
  mvc_sequencer uvm_test_top_environment_qvip_env_pcie_ep_sqr;
  mvc_sequencer uvm_test_top_environment_qvip_env_axi4_master_0_sqr;
  mvc_sequencer uvm_test_top_environment_qvip_env_axi4_master_1_sqr;
  mvc_sequencer uvm_test_top_environment_qvip_env_axi4_slave_sqr;
  mvc_sequencer uvm_test_top_environment_qvip_env_apb3_config_master_sqr;

  // Top level environment configuration handle
  block_c_env_configuration_t top_configuration;

  // Configuration handles to access interface BFM's
  mem_configuration  mem_in_config;
  mem_configuration  mem_out_config;
  pkt_configuration  pkt_out_config;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // ****************************************************************************
  function new( string name = "" );
    super.new( name );
    // Retrieve the configuration handles from the uvm_config_db

    // Retrieve top level configuration handle
    if ( !uvm_config_db#(block_c_env_configuration_t)::get(null,UVMF_CONFIGURATIONS, "TOP_ENV_CONFIG",top_configuration) ) begin
      `uvm_info("CFG", "*** FATAL *** uvm_config_db::get can not find TOP_ENV_CONFIG.  Are you using an older UVMF release than what was used to generate this bench?",UVM_NONE);
      `uvm_fatal("CFG", "uvm_config_db#(block_c_env_configuration_t)::get cannot find resource TOP_ENV_CONFIG");
    end

    // Retrieve config handles for all agents
    if( !uvm_config_db #( mem_configuration )::get( null , UVMF_CONFIGURATIONS , mem_in_BFM , mem_in_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( mem_configuration )::get cannot find resource mem_in_BFM" )
    if( !uvm_config_db #( mem_configuration )::get( null , UVMF_CONFIGURATIONS , mem_out_BFM , mem_out_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( mem_configuration )::get cannot find resource mem_out_BFM" )
    if( !uvm_config_db #( pkt_configuration )::get( null , UVMF_CONFIGURATIONS , pkt_out_BFM , pkt_out_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( pkt_configuration )::get cannot find resource pkt_out_BFM" )

    // Assign the sequencer handles from the handles within agent configurations
    mem_in_sequencer = mem_in_config.get_sequencer();
    mem_out_sequencer = mem_out_config.get_sequencer();
    pkt_out_sequencer = pkt_out_config.get_sequencer();

    // Retrieve QVIP sequencer handles from the uvm_config_db
    if( !uvm_config_db #(mvc_sequencer)::get( null,UVMF_SEQUENCERS,"uvm_test_top.environment.qvip_env.pcie_ep", uvm_test_top_environment_qvip_env_pcie_ep_sqr) ) 
      `uvm_warning("CFG" , "uvm_config_db #( mvc_sequencer )::get cannot find resource pcie_ep" ) 
    if( !uvm_config_db #(mvc_sequencer)::get( null,UVMF_SEQUENCERS,"uvm_test_top.environment.qvip_env.axi4_master_0", uvm_test_top_environment_qvip_env_axi4_master_0_sqr) ) 
      `uvm_warning("CFG" , "uvm_config_db #( mvc_sequencer )::get cannot find resource axi4_master_0" ) 
    if( !uvm_config_db #(mvc_sequencer)::get( null,UVMF_SEQUENCERS,"uvm_test_top.environment.qvip_env.axi4_master_1", uvm_test_top_environment_qvip_env_axi4_master_1_sqr) ) 
      `uvm_warning("CFG" , "uvm_config_db #( mvc_sequencer )::get cannot find resource axi4_master_1" ) 
    if( !uvm_config_db #(mvc_sequencer)::get( null,UVMF_SEQUENCERS,"uvm_test_top.environment.qvip_env.axi4_slave", uvm_test_top_environment_qvip_env_axi4_slave_sqr) ) 
      `uvm_warning("CFG" , "uvm_config_db #( mvc_sequencer )::get cannot find resource axi4_slave" ) 
    if( !uvm_config_db #(mvc_sequencer)::get( null,UVMF_SEQUENCERS,"uvm_test_top.environment.qvip_env.apb3_config_master", uvm_test_top_environment_qvip_env_apb3_config_master_sqr) ) 
      `uvm_warning("CFG" , "uvm_config_db #( mvc_sequencer )::get cannot find resource apb3_config_master" ) 


    // pragma uvmf custom new begin
    // pragma uvmf custom new end

  endfunction

  // ****************************************************************************
  virtual task body();
    // pragma uvmf custom body begin

    // Construct sequences here

    block_c_env_seq = block_c_env_sequence_base_t::type_id::create("block_c_env_seq");

    mem_in_random_seq     = mem_in_random_seq_t::type_id::create("mem_in_random_seq");
    mem_out_random_seq     = mem_out_random_seq_t::type_id::create("mem_out_random_seq");
    pkt_out_random_seq     = pkt_out_random_seq_t::type_id::create("pkt_out_random_seq");
    fork
      mem_in_config.wait_for_reset();
      mem_out_config.wait_for_reset();
      pkt_out_config.wait_for_reset();
    join
    // Start RESPONDER sequences here
    fork
    join_none
    // Start INITIATOR sequences here
    fork
      repeat (25) mem_in_random_seq.start(mem_in_sequencer);
      repeat (25) mem_out_random_seq.start(mem_out_sequencer);
      repeat (25) pkt_out_random_seq.start(pkt_out_sequencer);
    join

block_c_env_seq.start(top_configuration.vsqr);

    // UVMF_CHANGE_ME : Extend the simulation XXX number of clocks after 
    // the last sequence to allow for the last sequence item to flow 
    // through the design.
    fork
      mem_in_config.wait_for_num_clocks(400);
      mem_out_config.wait_for_num_clocks(400);
      pkt_out_config.wait_for_num_clocks(400);
    join

    // pragma uvmf custom body end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

