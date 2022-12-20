//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class passes transactions between the sequencer
//        and the BFM driver interface.  It accesses the driver BFM 
//        through the bfm handle. This driver
//        passes transactions to the driver BFM through the access
//        task.  
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class jtag_a_driver   extends uvmf_driver_base #(
                   .CONFIG_T(jtag_a_configuration   ),
                   .BFM_BIND_T(virtual jtag_a_driver_bfm   ),
                   .REQ(jtag_a_transaction   ),
                   .RSP(jtag_a_transaction   ));

  `uvm_component_utils( jtag_a_driver )
//*******************************************************************
// Macros that define structs located in jtag_a_macros.svh
//*******************************************************************
// Initiator macro used by jtag_a_driver and jtag_a_driver_bfm
// to communicate initiator driven data to jtag_a_driver_bfm.           
`jtag_a_INITIATOR_STRUCT
  jtag_a_initiator_s jtag_a_initiator_struct;
//*******************************************************************
// Responder macro used by jtag_a_driver and jtag_a_driver_bfm
// to communicate Responder driven data to jtag_a_driver_bfm.
`jtag_a_RESPONDER_STRUCT
  jtag_a_responder_s jtag_a_responder_struct;

// pragma uvmf custom class_item_additional begin
// pragma uvmf custom class_item_additional end

// ****************************************************************************
// This function is the standard SystemVerilog constructor.
//
  function new( string name = "", uvm_component parent=null );
    super.new( name, parent );
  endfunction

// ****************************************************************************
// This function sends configuration object variables to the driver BFM 
// using the configuration struct.
//
  virtual function void configure(input CONFIG_T cfg);
      bfm.configure( cfg.to_struct() );
  endfunction

// ****************************************************************************
// This function places a handle to this class in the proxy variable in the
// driver BFM.  This allows the driver BFM to call tasks and function within this class.
//
  virtual function void set_bfm_proxy_handle();
    bfm.proxy = this;  endfunction

// **************************************************************************** 
// This task is called by the run_phase in uvmf_driver_base.              
  virtual task access( inout REQ txn );
// pragma uvmf custom access begin
    if (configuration.initiator_responder==RESPONDER) begin
      // Complete current transfer and wait for next transfer
      bfm.respond_and_wait_for_next_transfer( 
          jtag_a_initiator_struct, 
          txn.to_responder_struct() 
          );
      // Unpack information about initiated transfer received by this responder
      txn.from_initiator_struct(jtag_a_initiator_struct);
    end else begin    
      // Initiate a transfer and get response
      bfm.initiate_and_get_response( 
          txn.to_initiator_struct(), 
          jtag_a_responder_struct 
          );
      // Unpack transfer response information received by this initiator
      txn.from_responder_struct(jtag_a_responder_struct);
    end
// pragma uvmf custom access end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

