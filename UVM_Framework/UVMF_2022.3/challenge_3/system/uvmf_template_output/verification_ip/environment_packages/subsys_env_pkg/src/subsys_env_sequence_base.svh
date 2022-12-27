`ifndef SUBSYS_INCLUDED_
`define SUBSYS_INCLUDED_

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
class subsys_env_sequence_base #( 
      type CONFIG_T
      ) extends uvmf_virtual_sequence_base #(.CONFIG_T(CONFIG_T));


  `uvm_object_param_utils( subsys_env_sequence_base #(
                           CONFIG_T
                           ) );

  
// This subsys_env_sequence_base contains a handle to a subsys_env_configuration object 
// named configuration.  This configuration variable contains a handle to each 
// sequencer within each agent within this environment and any sub-environments.
// The configuration object handle is automatically assigned in the pre_body in the
// base class of this sequence.  The configuration handle is retrieved from the
// virtual sequencer that this sequence is started on.
// Available sequencer handles within the environment configuration:

  // Initiator agent sequencers in subsys_environment:

  // Responder agent sequencers in subsys_environment:

  // Virtual sequencers in sub-environments located in sub-environment configuration
    // configuration.b1_config.vsqr
    // configuration.b2_config.vsqr


typedef block_1_env_sequence_base #(
        .CONFIG_T(block_1_env_configuration)
        ) 
        b1_sequence_base_t;
rand b1_sequence_base_t b1_seq;

typedef block_2_env_sequence_base #(
        .CONFIG_T(block_2_env_configuration)
        ) 
        b2_sequence_base_t;
rand b2_sequence_base_t b2_seq;



  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  function new(string name = "" );
    super.new(name);

    b1_seq = b1_sequence_base_t::type_id::create("b1_seq");
    b2_seq = b2_sequence_base_t::type_id::create("b2_seq");

  endfunction

  virtual task body();


    b1_seq.start(configuration.b1_config.vsqr);
    b2_seq.start(configuration.b2_config.vsqr);

  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end
`endif
