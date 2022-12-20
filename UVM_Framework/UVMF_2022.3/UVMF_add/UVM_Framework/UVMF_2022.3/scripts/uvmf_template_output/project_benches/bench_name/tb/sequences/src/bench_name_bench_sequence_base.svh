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


typedef environment_name_env_configuration  environment_name_env_configuration_t;

class bench_name_bench_sequence_base extends uvmf_sequence_base #(uvm_sequence_item);

  `uvm_object_utils( bench_name_bench_sequence_base );

  // pragma uvmf custom sequences begin

typedef environment_name_env_sequence_base #(
        .CONFIG_T(environment_name_env_configuration_t)
        )
        environment_name_env_sequence_base_t;
rand environment_name_env_sequence_base_t environment_name_env_seq;



  // UVMF_CHANGE_ME : Instantiate, construct, and start sequences as needed to create stimulus scenarios.
  // Instantiate sequences here
  typedef interface_name_random_sequence  agent_instance_name_random_seq_t;
  agent_instance_name_random_seq_t agent_instance_name_random_seq;
  // pragma uvmf custom sequences end

  // Sequencer handles for each active interface in the environment
  typedef interface_name_transaction  agent_instance_name_transaction_t;
  uvm_sequencer #(agent_instance_name_transaction_t)  agent_instance_name_sequencer; 


  // Top level environment configuration handle
  environment_name_env_configuration_t top_configuration;

  // Configuration handles to access interface BFM's
  interface_name_configuration  agent_instance_name_config;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // ****************************************************************************
  function new( string name = "" );
    super.new( name );
    // Retrieve the configuration handles from the uvm_config_db

    // Retrieve top level configuration handle
    if ( !uvm_config_db#(environment_name_env_configuration_t)::get(null,UVMF_CONFIGURATIONS, "TOP_ENV_CONFIG",top_configuration) ) begin
      `uvm_info("CFG", "*** FATAL *** uvm_config_db::get can not find TOP_ENV_CONFIG.  Are you using an older UVMF release than what was used to generate this bench?",UVM_NONE);
      `uvm_fatal("CFG", "uvm_config_db#(environment_name_env_configuration_t)::get cannot find resource TOP_ENV_CONFIG");
    end

    // Retrieve config handles for all agents
    if( !uvm_config_db #( interface_name_configuration )::get( null , UVMF_CONFIGURATIONS , agent_instance_name_BFM , agent_instance_name_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( interface_name_configuration )::get cannot find resource agent_instance_name_BFM" )

    // Assign the sequencer handles from the handles within agent configurations
    agent_instance_name_sequencer = agent_instance_name_config.get_sequencer();



    // pragma uvmf custom new begin
    // pragma uvmf custom new end

  endfunction

  // ****************************************************************************
  virtual task body();
    // pragma uvmf custom body begin

    // Construct sequences here

    environment_name_env_seq = environment_name_env_sequence_base_t::type_id::create("environment_name_env_seq");

    agent_instance_name_random_seq     = agent_instance_name_random_seq_t::type_id::create("agent_instance_name_random_seq");
    fork
      agent_instance_name_config.wait_for_reset();
    join
    // Start RESPONDER sequences here
    fork
    join_none
    // Start INITIATOR sequences here
    fork
      repeat (25) agent_instance_name_random_seq.start(agent_instance_name_sequencer);
    join

environment_name_env_seq.start(top_configuration.vsqr);

    // UVMF_CHANGE_ME : Extend the simulation XXX number of clocks after 
    // the last sequence to allow for the last sequence item to flow 
    // through the design.
    fork
      agent_instance_name_config.wait_for_num_clocks(400);
    join

    // pragma uvmf custom body end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

