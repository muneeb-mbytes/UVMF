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
class block_c_env_sequence_base #( 
      type CONFIG_T
      ) extends uvmf_virtual_sequence_base #(.CONFIG_T(CONFIG_T));


  `uvm_object_param_utils( block_c_env_sequence_base #(
                           CONFIG_T
                           ) );

  
// This block_c_env_sequence_base contains a handle to a block_c_env_configuration object 
// named configuration.  This configuration variable contains a handle to each 
// sequencer within each agent within this environment and any sub-environments.
// The configuration object handle is automatically assigned in the pre_body in the
// base class of this sequence.  The configuration handle is retrieved from the
// virtual sequencer that this sequence is started on.
// Available sequencer handles within the environment configuration:

  // Initiator agent sequencers in block_c_environment:
    // configuration.mem_in_config.sequencer
    // configuration.mem_out_config.sequencer
    // configuration.pkt_out_config.sequencer

  // Responder agent sequencers in block_c_environment:


    typedef mem_random_sequence mem_in_random_sequence_t;
    mem_in_random_sequence_t mem_in_rand_seq;

    typedef mem_random_sequence mem_out_random_sequence_t;
    mem_out_random_sequence_t mem_out_rand_seq;

    typedef pkt_random_sequence pkt_out_random_sequence_t;
    pkt_out_random_sequence_t pkt_out_rand_seq;




  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  function new(string name = "" );
    super.new(name);
    mem_in_rand_seq = mem_in_random_sequence_t::type_id::create("mem_in_rand_seq");
    mem_out_rand_seq = mem_out_random_sequence_t::type_id::create("mem_out_rand_seq");
    pkt_out_rand_seq = pkt_out_random_sequence_t::type_id::create("pkt_out_rand_seq");


  endfunction

  virtual task body();

    if ( configuration.mem_in_config.sequencer != null )
       repeat (25) mem_in_rand_seq.start(configuration.mem_in_config.sequencer);
    if ( configuration.mem_out_config.sequencer != null )
       repeat (25) mem_out_rand_seq.start(configuration.mem_out_config.sequencer);
    if ( configuration.pkt_out_config.sequencer != null )
       repeat (25) pkt_out_rand_seq.start(configuration.pkt_out_config.sequencer);


  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

