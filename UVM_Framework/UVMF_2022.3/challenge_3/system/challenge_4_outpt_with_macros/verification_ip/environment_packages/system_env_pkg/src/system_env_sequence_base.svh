//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//                                          
// DESCRIPTION: This file contains environment level sequences that will
//    be reused from block to top level simulations.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
`ifndef SYSTEM_ENV_SEQUENCE_BASE
`define SYSTEM_ENV_SEQUENCE_BASE

class system_env_sequence_base #( 
      type CONFIG_T
      ) extends uvmf_virtual_sequence_base #(.CONFIG_T(CONFIG_T));


  `uvm_object_param_utils( system_env_sequence_base #(
                           CONFIG_T
                           ) );

  
// This system_env_sequence_base contains a handle to a system_env_configuration object 
// named configuration.  This configuration variable contains a handle to each 
// sequencer within each agent within this environment and any sub-environments.
// The configuration object handle is automatically assigned in the pre_body in the
// base class of this sequence.  The configuration handle is retrieved from the
// virtual sequencer that this sequence is started on.
// Available sequencer handles within the environment configuration:

  // Initiator agent sequencers in system_environment:

  // Responder agent sequencers in system_environment:

  // Virtual sequencers in sub-environments located in sub-environment configuration
    // configuration.s1_config.vsqr
    // configuration.b3_config.vsqr


typedef subsys_env_sequence_base #(
        .CONFIG_T(subsys_env_configuration)
        ) 
        s1_sequence_base_t;
rand s1_sequence_base_t s1_seq;

typedef block_3_env_sequence_base #(
        .CONFIG_T(block_3_env_configuration)
        ) 
        b3_sequence_base_t;
rand b3_sequence_base_t b3_seq;



  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  function new(string name = "" );
    super.new(name);

    s1_seq = s1_sequence_base_t::type_id::create("s1_seq");
    b3_seq = b3_sequence_base_t::type_id::create("b3_seq");

  endfunction

  virtual task body();


    s1_seq.start(configuration.s1_config.vsqr);
    b3_seq.start(configuration.b3_config.vsqr);

  endtask

endclass
// pragma uvmf custom external begin
// pragma uvmf custom external end

`endif
