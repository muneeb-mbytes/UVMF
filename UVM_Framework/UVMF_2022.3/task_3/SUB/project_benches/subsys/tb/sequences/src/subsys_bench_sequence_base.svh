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


typedef subsys_env_configuration  subsys_env_configuration_t;

class subsys_bench_sequence_base extends uvmf_sequence_base #(uvm_sequence_item);

  `uvm_object_utils( subsys_bench_sequence_base );

  // pragma uvmf custom sequences begin

typedef subsys_env_sequence_base #(
        .CONFIG_T(subsys_env_configuration_t)
        )
        subsys_env_sequence_base_t;
rand subsys_env_sequence_base_t subsys_env_seq;



  // UVMF_CHANGE_ME : Instantiate, construct, and start sequences as needed to create stimulus scenarios.
  // Instantiate sequences here
  typedef apb_random_sequence  b1_apb_master_random_seq_t;
  b1_apb_master_random_seq_t b1_apb_master_random_seq;
  typedef axi_m_random_sequence  b1_axi_master1_random_seq_t;
  b1_axi_master1_random_seq_t b1_axi_master1_random_seq;
  typedef axi_m_random_sequence  b1_axi_master2_random_seq_t;
  b1_axi_master2_random_seq_t b1_axi_master2_random_seq;
  typedef wb_s_responder_sequence  b2_wb_slave_responder_seq_t;
  b2_wb_slave_responder_seq_t b2_wb_slave_responder_seq;
  // pragma uvmf custom sequences end

  // Sequencer handles for each active interface in the environment
  typedef apb_transaction  b1_apb_master_transaction_t;
  uvm_sequencer #(b1_apb_master_transaction_t)  b1_apb_master_sequencer; 
  typedef axi_m_transaction  b1_axi_master1_transaction_t;
  uvm_sequencer #(b1_axi_master1_transaction_t)  b1_axi_master1_sequencer; 
  typedef axi_m_transaction  b1_axi_master2_transaction_t;
  uvm_sequencer #(b1_axi_master2_transaction_t)  b1_axi_master2_sequencer; 
  typedef wb_s_transaction  b2_wb_slave_transaction_t;
  uvm_sequencer #(b2_wb_slave_transaction_t)  b2_wb_slave_sequencer; 


  // Top level environment configuration handle
  subsys_env_configuration_t top_configuration;

  // Configuration handles to access interface BFM's
  apb_configuration  b1_apb_master_config;
  axi_m_configuration  b1_axi_master1_config;
  axi_m_configuration  b1_axi_master2_config;
  spi_s_configuration  b1_spi_slave_config;
  spi_m_configuration  b2_spi_master_config;
  wb_s_configuration  b2_wb_slave_config;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // ****************************************************************************
  function new( string name = "" );
    super.new( name );
    // Retrieve the configuration handles from the uvm_config_db

    // Retrieve top level configuration handle
    if ( !uvm_config_db#(subsys_env_configuration_t)::get(null,UVMF_CONFIGURATIONS, "TOP_ENV_CONFIG",top_configuration) ) begin
      `uvm_info("CFG", "*** FATAL *** uvm_config_db::get can not find TOP_ENV_CONFIG.  Are you using an older UVMF release than what was used to generate this bench?",UVM_NONE);
      `uvm_fatal("CFG", "uvm_config_db#(subsys_env_configuration_t)::get cannot find resource TOP_ENV_CONFIG");
    end

    // Retrieve config handles for all agents
    if( !uvm_config_db #( apb_configuration )::get( null , UVMF_CONFIGURATIONS , b1_apb_master_BFM , b1_apb_master_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( apb_configuration )::get cannot find resource b1_apb_master_BFM" )
    if( !uvm_config_db #( axi_m_configuration )::get( null , UVMF_CONFIGURATIONS , b1_axi_master1_BFM , b1_axi_master1_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( axi_m_configuration )::get cannot find resource b1_axi_master1_BFM" )
    if( !uvm_config_db #( axi_m_configuration )::get( null , UVMF_CONFIGURATIONS , b1_axi_master2_BFM , b1_axi_master2_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( axi_m_configuration )::get cannot find resource b1_axi_master2_BFM" )
    if( !uvm_config_db #( spi_s_configuration )::get( null , UVMF_CONFIGURATIONS , b1_spi_slave_BFM , b1_spi_slave_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( spi_s_configuration )::get cannot find resource b1_spi_slave_BFM" )
    if( !uvm_config_db #( spi_m_configuration )::get( null , UVMF_CONFIGURATIONS , b2_spi_master_BFM , b2_spi_master_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( spi_m_configuration )::get cannot find resource b2_spi_master_BFM" )
    if( !uvm_config_db #( wb_s_configuration )::get( null , UVMF_CONFIGURATIONS , b2_wb_slave_BFM , b2_wb_slave_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( wb_s_configuration )::get cannot find resource b2_wb_slave_BFM" )

    // Assign the sequencer handles from the handles within agent configurations
    b1_apb_master_sequencer = b1_apb_master_config.get_sequencer();
    b1_axi_master1_sequencer = b1_axi_master1_config.get_sequencer();
    b1_axi_master2_sequencer = b1_axi_master2_config.get_sequencer();
    b2_wb_slave_sequencer = b2_wb_slave_config.get_sequencer();



    // pragma uvmf custom new begin
    // pragma uvmf custom new end

  endfunction

  // ****************************************************************************
  virtual task body();
    // pragma uvmf custom body begin

    // Construct sequences here

    subsys_env_seq = subsys_env_sequence_base_t::type_id::create("subsys_env_seq");

    b1_apb_master_random_seq     = b1_apb_master_random_seq_t::type_id::create("b1_apb_master_random_seq");
    b1_axi_master1_random_seq     = b1_axi_master1_random_seq_t::type_id::create("b1_axi_master1_random_seq");
    b1_axi_master2_random_seq     = b1_axi_master2_random_seq_t::type_id::create("b1_axi_master2_random_seq");
    b2_wb_slave_responder_seq  = b2_wb_slave_responder_seq_t::type_id::create("b2_wb_slave_responder_seq");
    fork
      b1_apb_master_config.wait_for_reset();
      b1_axi_master1_config.wait_for_reset();
      b1_axi_master2_config.wait_for_reset();
      b1_spi_slave_config.wait_for_reset();
      b2_spi_master_config.wait_for_reset();
      b2_wb_slave_config.wait_for_reset();
    join
    // Start RESPONDER sequences here
    fork
      b2_wb_slave_responder_seq.start(b2_wb_slave_sequencer);
    join_none
    // Start INITIATOR sequences here
    fork
      repeat (25) b1_apb_master_random_seq.start(b1_apb_master_sequencer);
      repeat (25) b1_axi_master1_random_seq.start(b1_axi_master1_sequencer);
      repeat (25) b1_axi_master2_random_seq.start(b1_axi_master2_sequencer);
    join

subsys_env_seq.start(top_configuration.vsqr);

    // UVMF_CHANGE_ME : Extend the simulation XXX number of clocks after 
    // the last sequence to allow for the last sequence item to flow 
    // through the design.
    fork
      b1_apb_master_config.wait_for_num_clocks(400);
      b1_axi_master1_config.wait_for_num_clocks(400);
      b1_axi_master2_config.wait_for_num_clocks(400);
      b1_spi_slave_config.wait_for_num_clocks(400);
      b2_spi_master_config.wait_for_num_clocks(400);
      b2_wb_slave_config.wait_for_num_clocks(400);
    join

    // pragma uvmf custom body end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

