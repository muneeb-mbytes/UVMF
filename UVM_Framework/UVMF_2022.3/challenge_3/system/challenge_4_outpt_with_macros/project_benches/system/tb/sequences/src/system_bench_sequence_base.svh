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
`ifndef SYSTEM_BENCH_SEQUENCE_BASE
`define SYSTEM_BENCH_SEQUENCE_BASE

typedef system_env_configuration  system_env_configuration_t;

class system_bench_sequence_base extends uvmf_sequence_base #(uvm_sequence_item);

  `uvm_object_utils( system_bench_sequence_base );

  // pragma uvmf custom sequences begin

typedef system_env_sequence_base #(
        .CONFIG_T(system_env_configuration_t)
        )
        system_env_sequence_base_t;
rand system_env_sequence_base_t system_env_seq;



  // UVMF_CHANGE_ME : Instantiate, construct, and start sequences as needed to create stimulus scenarios.
  // Instantiate sequences here
  typedef apb_m_random_sequence  s1_b1_apb_master_random_seq_t;
  s1_b1_apb_master_random_seq_t s1_b1_apb_master_random_seq;
  typedef axi_m_random_sequence  s1_b1_axi_master1_random_seq_t;
  s1_b1_axi_master1_random_seq_t s1_b1_axi_master1_random_seq;
  typedef axi_m_random_sequence  s1_b1_axi_master2_random_seq_t;
  s1_b1_axi_master2_random_seq_t s1_b1_axi_master2_random_seq;
  typedef spi_s_responder_sequence  s1_b1_spi_slave_responder_seq_t;
  s1_b1_spi_slave_responder_seq_t s1_b1_spi_slave_responder_seq;
  typedef spi_m_random_sequence  s1_b2_spi_master_random_seq_t;
  s1_b2_spi_master_random_seq_t s1_b2_spi_master_random_seq;
  typedef wb_s_responder_sequence  s1_b2_wb_slave_responder_seq_t;
  s1_b2_wb_slave_responder_seq_t s1_b2_wb_slave_responder_seq;
  typedef wb_m_random_sequence  b3_wb_master_random_seq_t;
  b3_wb_master_random_seq_t b3_wb_master_random_seq;
  typedef axi_s_responder_sequence  b3_axi_slave_responder_seq_t;
  b3_axi_slave_responder_seq_t b3_axi_slave_responder_seq;
  // pragma uvmf custom sequences end

  // Sequencer handles for each active interface in the environment
  typedef apb_m_transaction  s1_b1_apb_master_transaction_t;
  uvm_sequencer #(s1_b1_apb_master_transaction_t)  s1_b1_apb_master_sequencer; 
  typedef axi_m_transaction  s1_b1_axi_master1_transaction_t;
  uvm_sequencer #(s1_b1_axi_master1_transaction_t)  s1_b1_axi_master1_sequencer; 
  typedef axi_m_transaction  s1_b1_axi_master2_transaction_t;
  uvm_sequencer #(s1_b1_axi_master2_transaction_t)  s1_b1_axi_master2_sequencer; 
  typedef spi_s_transaction  s1_b1_spi_slave_transaction_t;
  uvm_sequencer #(s1_b1_spi_slave_transaction_t)  s1_b1_spi_slave_sequencer; 
  typedef spi_m_transaction  s1_b2_spi_master_transaction_t;
  uvm_sequencer #(s1_b2_spi_master_transaction_t)  s1_b2_spi_master_sequencer; 
  typedef wb_s_transaction  s1_b2_wb_slave_transaction_t;
  uvm_sequencer #(s1_b2_wb_slave_transaction_t)  s1_b2_wb_slave_sequencer; 
  typedef wb_m_transaction  b3_wb_master_transaction_t;
  uvm_sequencer #(b3_wb_master_transaction_t)  b3_wb_master_sequencer; 
  typedef axi_s_transaction  b3_axi_slave_transaction_t;
  uvm_sequencer #(b3_axi_slave_transaction_t)  b3_axi_slave_sequencer; 


  // Top level environment configuration handle
  system_env_configuration_t top_configuration;

  // Configuration handles to access interface BFM's
  apb_m_configuration  s1_b1_apb_master_config;
  axi_m_configuration  s1_b1_axi_master1_config;
  axi_m_configuration  s1_b1_axi_master2_config;
  spi_s_configuration  s1_b1_spi_slave_config;
  spi_m_configuration  s1_b2_spi_master_config;
  wb_s_configuration  s1_b2_wb_slave_config;
  wb_m_configuration  b3_wb_master_config;
  axi_s_configuration  b3_axi_slave_config;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // ****************************************************************************
  function new( string name = "" );
    super.new( name );
    // Retrieve the configuration handles from the uvm_config_db

    // Retrieve top level configuration handle
    if ( !uvm_config_db#(system_env_configuration_t)::get(null,UVMF_CONFIGURATIONS, "TOP_ENV_CONFIG",top_configuration) ) begin
      `uvm_info("CFG", "*** FATAL *** uvm_config_db::get can not find TOP_ENV_CONFIG.  Are you using an older UVMF release than what was used to generate this bench?",UVM_NONE);
      `uvm_fatal("CFG", "uvm_config_db#(system_env_configuration_t)::get cannot find resource TOP_ENV_CONFIG");
    end

    // Retrieve config handles for all agents
    if( !uvm_config_db #( apb_m_configuration )::get( null , UVMF_CONFIGURATIONS , s1_b1_apb_master_BFM , s1_b1_apb_master_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( apb_m_configuration )::get cannot find resource s1_b1_apb_master_BFM" )
    if( !uvm_config_db #( axi_m_configuration )::get( null , UVMF_CONFIGURATIONS , s1_b1_axi_master1_BFM , s1_b1_axi_master1_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( axi_m_configuration )::get cannot find resource s1_b1_axi_master1_BFM" )
    if( !uvm_config_db #( axi_m_configuration )::get( null , UVMF_CONFIGURATIONS , s1_b1_axi_master2_BFM , s1_b1_axi_master2_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( axi_m_configuration )::get cannot find resource s1_b1_axi_master2_BFM" )
    if( !uvm_config_db #( spi_s_configuration )::get( null , UVMF_CONFIGURATIONS , s1_b1_spi_slave_BFM , s1_b1_spi_slave_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( spi_s_configuration )::get cannot find resource s1_b1_spi_slave_BFM" )
    if( !uvm_config_db #( spi_m_configuration )::get( null , UVMF_CONFIGURATIONS , s1_b2_spi_master_BFM , s1_b2_spi_master_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( spi_m_configuration )::get cannot find resource s1_b2_spi_master_BFM" )
    if( !uvm_config_db #( wb_s_configuration )::get( null , UVMF_CONFIGURATIONS , s1_b2_wb_slave_BFM , s1_b2_wb_slave_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( wb_s_configuration )::get cannot find resource s1_b2_wb_slave_BFM" )
    if( !uvm_config_db #( wb_m_configuration )::get( null , UVMF_CONFIGURATIONS , b3_wb_master_BFM , b3_wb_master_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( wb_m_configuration )::get cannot find resource b3_wb_master_BFM" )
    if( !uvm_config_db #( axi_s_configuration )::get( null , UVMF_CONFIGURATIONS , b3_axi_slave_BFM , b3_axi_slave_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( axi_s_configuration )::get cannot find resource b3_axi_slave_BFM" )

    // Assign the sequencer handles from the handles within agent configurations
    s1_b1_apb_master_sequencer = s1_b1_apb_master_config.get_sequencer();
    s1_b1_axi_master1_sequencer = s1_b1_axi_master1_config.get_sequencer();
    s1_b1_axi_master2_sequencer = s1_b1_axi_master2_config.get_sequencer();
    s1_b1_spi_slave_sequencer = s1_b1_spi_slave_config.get_sequencer();
    s1_b2_spi_master_sequencer = s1_b2_spi_master_config.get_sequencer();
    s1_b2_wb_slave_sequencer = s1_b2_wb_slave_config.get_sequencer();
    b3_wb_master_sequencer = b3_wb_master_config.get_sequencer();
    b3_axi_slave_sequencer = b3_axi_slave_config.get_sequencer();



    // pragma uvmf custom new begin
    // pragma uvmf custom new end

  endfunction

  // ****************************************************************************
  virtual task body();
    // pragma uvmf custom body begin

    // Construct sequences here

    system_env_seq = system_env_sequence_base_t::type_id::create("system_env_seq");

    s1_b1_apb_master_random_seq     = s1_b1_apb_master_random_seq_t::type_id::create("s1_b1_apb_master_random_seq");
    s1_b1_axi_master1_random_seq     = s1_b1_axi_master1_random_seq_t::type_id::create("s1_b1_axi_master1_random_seq");
    s1_b1_axi_master2_random_seq     = s1_b1_axi_master2_random_seq_t::type_id::create("s1_b1_axi_master2_random_seq");
    s1_b1_spi_slave_responder_seq  = s1_b1_spi_slave_responder_seq_t::type_id::create("s1_b1_spi_slave_responder_seq");
    s1_b2_spi_master_random_seq     = s1_b2_spi_master_random_seq_t::type_id::create("s1_b2_spi_master_random_seq");
    s1_b2_wb_slave_responder_seq  = s1_b2_wb_slave_responder_seq_t::type_id::create("s1_b2_wb_slave_responder_seq");
    b3_wb_master_random_seq     = b3_wb_master_random_seq_t::type_id::create("b3_wb_master_random_seq");
    b3_axi_slave_responder_seq  = b3_axi_slave_responder_seq_t::type_id::create("b3_axi_slave_responder_seq");
    fork
      s1_b1_apb_master_config.wait_for_reset();
      s1_b1_axi_master1_config.wait_for_reset();
      s1_b1_axi_master2_config.wait_for_reset();
      s1_b1_spi_slave_config.wait_for_reset();
      s1_b2_spi_master_config.wait_for_reset();
      s1_b2_wb_slave_config.wait_for_reset();
      b3_wb_master_config.wait_for_reset();
      b3_axi_slave_config.wait_for_reset();
    join
    // Start RESPONDER sequences here
    fork
      s1_b1_spi_slave_responder_seq.start(s1_b1_spi_slave_sequencer);
      s1_b2_wb_slave_responder_seq.start(s1_b2_wb_slave_sequencer);
      b3_axi_slave_responder_seq.start(b3_axi_slave_sequencer);
    join_none
    // Start INITIATOR sequences here
    fork
      repeat (25) s1_b1_apb_master_random_seq.start(s1_b1_apb_master_sequencer);
      repeat (25) s1_b1_axi_master1_random_seq.start(s1_b1_axi_master1_sequencer);
      repeat (25) s1_b1_axi_master2_random_seq.start(s1_b1_axi_master2_sequencer);
      repeat (25) s1_b2_spi_master_random_seq.start(s1_b2_spi_master_sequencer);
      repeat (25) b3_wb_master_random_seq.start(b3_wb_master_sequencer);
    join

system_env_seq.start(top_configuration.vsqr);

    // UVMF_CHANGE_ME : Extend the simulation XXX number of clocks after 
    // the last sequence to allow for the last sequence item to flow 
    // through the design.
    fork
      s1_b1_apb_master_config.wait_for_num_clocks(400);
      s1_b1_axi_master1_config.wait_for_num_clocks(400);
      s1_b1_axi_master2_config.wait_for_num_clocks(400);
      s1_b1_spi_slave_config.wait_for_num_clocks(400);
      s1_b2_spi_master_config.wait_for_num_clocks(400);
      s1_b2_wb_slave_config.wait_for_num_clocks(400);
      b3_wb_master_config.wait_for_num_clocks(400);
      b3_axi_slave_config.wait_for_num_clocks(400);
    join

    // pragma uvmf custom body end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end
`endif
