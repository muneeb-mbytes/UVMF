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
class chip_env_sequence_base #( 
      type CONFIG_T,
      int CHIP_CP_IN_DATA_WIDTH = 20,
      int CHIP_CP_IN_ADDR_WIDTH = 10,
      int CHIP_CP_OUT_ADDR_WIDTH = 25,
      int CHIP_UDP_DATA_WIDTH = 40
      ) extends uvmf_virtual_sequence_base #(.CONFIG_T(CONFIG_T));


  `uvm_object_param_utils( chip_env_sequence_base #(
                           CONFIG_T,
                           CHIP_CP_IN_DATA_WIDTH,
                           CHIP_CP_IN_ADDR_WIDTH,
                           CHIP_CP_OUT_ADDR_WIDTH,
                           CHIP_UDP_DATA_WIDTH
                           ) );

  // Handle to the environments register model
// This handle needs to be set before use.
  chip_reg_model  reg_model;

// This chip_env_sequence_base contains a handle to a chip_env_configuration object 
// named configuration.  This configuration variable contains a handle to each 
// sequencer within each agent within this environment and any sub-environments.
// The configuration object handle is automatically assigned in the pre_body in the
// base class of this sequence.  The configuration handle is retrieved from the
// virtual sequencer that this sequence is started on.
// Available sequencer handles within the environment configuration:

  // Initiator agent sequencers in chip_environment:

  // Responder agent sequencers in chip_environment:

  // Virtual sequencers in sub-environments located in sub-environment configuration
    // configuration.block_a_env_config.vsqr
    // configuration.block_b_env_config.vsqr


typedef block_a_env_sequence_base #(
        .CONFIG_T(block_a_env_configuration)
        ) 
        block_a_env_sequence_base_t;
rand block_a_env_sequence_base_t block_a_env_seq;

typedef block_b_env_sequence_base #(
        .CONFIG_T(block_b_env_configuration#(
                .CP_IN_DATA_WIDTH(CHIP_CP_IN_DATA_WIDTH),
                .CP_OUT_ADDR_WIDTH(CHIP_CP_OUT_ADDR_WIDTH),
                .CP_IN_ADDR_WIDTH(CHIP_CP_IN_ADDR_WIDTH),
                .UDP_DATA_WIDTH(CHIP_UDP_DATA_WIDTH)
                )),
        .CP_IN_DATA_WIDTH(CHIP_CP_IN_DATA_WIDTH),
        .CP_OUT_ADDR_WIDTH(CHIP_CP_OUT_ADDR_WIDTH),
        .CP_IN_ADDR_WIDTH(CHIP_CP_IN_ADDR_WIDTH),
        .UDP_DATA_WIDTH(CHIP_UDP_DATA_WIDTH)
        ) 
        block_b_env_sequence_base_t;
rand block_b_env_sequence_base_t block_b_env_seq;



  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  function new(string name = "" );
    super.new(name);

    block_a_env_seq = block_a_env_sequence_base_t::type_id::create("block_a_env_seq");
    block_b_env_seq = block_b_env_sequence_base_t::type_id::create("block_b_env_seq");

  endfunction

  virtual task body();


    block_a_env_seq.start(configuration.block_a_env_config.vsqr);
    block_b_env_seq.start(configuration.block_b_env_config.vsqr);

  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

