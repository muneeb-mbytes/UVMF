`ifndef BLOCK_2_INCLUDED_
`define BLOCK_2_INCLUDED_

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
class block_2_env_sequence_base #( 
      type CONFIG_T
      ) extends uvmf_virtual_sequence_base #(.CONFIG_T(CONFIG_T));


  `uvm_object_param_utils( block_2_env_sequence_base #(
                           CONFIG_T
                           ) );

  
// This block_2_env_sequence_base contains a handle to a block_2_env_configuration object 
// named configuration.  This configuration variable contains a handle to each 
// sequencer within each agent within this environment and any sub-environments.
// The configuration object handle is automatically assigned in the pre_body in the
// base class of this sequence.  The configuration handle is retrieved from the
// virtual sequencer that this sequence is started on.
// Available sequencer handles within the environment configuration:

  // Initiator agent sequencers in block_2_environment:
    // configuration.spi_master_config.sequencer

  // Responder agent sequencers in block_2_environment:
    // configuration.wb_slave_config.sequencer


    typedef spi_m_random_sequence spi_master_random_sequence_t;
    spi_master_random_sequence_t spi_master_rand_seq;





  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  function new(string name = "" );
    super.new(name);
    spi_master_rand_seq = spi_master_random_sequence_t::type_id::create("spi_master_rand_seq");


  endfunction

  virtual task body();

    if ( configuration.spi_master_config.sequencer != null )
       repeat (25) spi_master_rand_seq.start(configuration.spi_master_config.sequencer);


  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end
`endif
