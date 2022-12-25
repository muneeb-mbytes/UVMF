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
class block_1_env_sequence_base #( 
      type CONFIG_T
      ) extends uvmf_virtual_sequence_base #(.CONFIG_T(CONFIG_T));


  `uvm_object_param_utils( block_1_env_sequence_base #(
                           CONFIG_T
                           ) );

  
// This block_1_env_sequence_base contains a handle to a block_1_env_configuration object 
// named configuration.  This configuration variable contains a handle to each 
// sequencer within each agent within this environment and any sub-environments.
// The configuration object handle is automatically assigned in the pre_body in the
// base class of this sequence.  The configuration handle is retrieved from the
// virtual sequencer that this sequence is started on.
// Available sequencer handles within the environment configuration:

  // Initiator agent sequencers in block_1_environment:
    // configuration.apb_master_config.sequencer
    // configuration.axi_master1_config.sequencer
    // configuration.axi_master2_config.sequencer

  // Responder agent sequencers in block_1_environment:
    // configuration.spi_slave_config.sequencer


    typedef apb_random_sequence apb_master_random_sequence_t;
    apb_master_random_sequence_t apb_master_rand_seq;

    typedef axi_m_random_sequence axi_master1_random_sequence_t;
    axi_master1_random_sequence_t axi_master1_rand_seq;

    typedef axi_m_random_sequence axi_master2_random_sequence_t;
    axi_master2_random_sequence_t axi_master2_rand_seq;





  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  function new(string name = "" );
    super.new(name);
    apb_master_rand_seq = apb_master_random_sequence_t::type_id::create("apb_master_rand_seq");
    axi_master1_rand_seq = axi_master1_random_sequence_t::type_id::create("axi_master1_rand_seq");
    axi_master2_rand_seq = axi_master2_random_sequence_t::type_id::create("axi_master2_rand_seq");


  endfunction

  virtual task body();

    if ( configuration.apb_master_config.sequencer != null )
       repeat (25) apb_master_rand_seq.start(configuration.apb_master_config.sequencer);
    if ( configuration.axi_master1_config.sequencer != null )
       repeat (25) axi_master1_rand_seq.start(configuration.axi_master1_config.sequencer);
    if ( configuration.axi_master2_config.sequencer != null )
       repeat (25) axi_master2_rand_seq.start(configuration.axi_master2_config.sequencer);


  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

