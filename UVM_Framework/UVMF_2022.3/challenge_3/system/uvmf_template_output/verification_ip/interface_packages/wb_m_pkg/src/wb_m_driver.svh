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
class wb_m_driver  #(
      int WB_ADDR_WIDTH = 32,
      int WB_DATA_WIDTH = 16
      ) extends uvmf_driver_base #(
                   .CONFIG_T(wb_m_configuration  #(
                             .WB_ADDR_WIDTH(WB_ADDR_WIDTH),
                             .WB_DATA_WIDTH(WB_DATA_WIDTH)
                             ) ),
                   .BFM_BIND_T(virtual wb_m_driver_bfm  #(
                             .WB_ADDR_WIDTH(WB_ADDR_WIDTH),
                             .WB_DATA_WIDTH(WB_DATA_WIDTH)
                             ) ),
                   .REQ(wb_m_transaction  #(
                             .WB_ADDR_WIDTH(WB_ADDR_WIDTH),
                             .WB_DATA_WIDTH(WB_DATA_WIDTH)
                             ) ),
                   .RSP(wb_m_transaction  #(
                             .WB_ADDR_WIDTH(WB_ADDR_WIDTH),
                             .WB_DATA_WIDTH(WB_DATA_WIDTH)
                             ) ));

  `uvm_component_param_utils( wb_m_driver #(
                              WB_ADDR_WIDTH,
                              WB_DATA_WIDTH
                              ))
//*******************************************************************
// Macros that define structs located in wb_m_macros.svh
//*******************************************************************
// Initiator macro used by wb_m_driver and wb_m_driver_bfm
// to communicate initiator driven data to wb_m_driver_bfm.           
`wb_m_INITIATOR_STRUCT
  wb_m_initiator_s wb_m_initiator_struct;
//*******************************************************************
// Responder macro used by wb_m_driver and wb_m_driver_bfm
// to communicate Responder driven data to wb_m_driver_bfm.
`wb_m_RESPONDER_STRUCT
  wb_m_responder_s wb_m_responder_struct;

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
          wb_m_initiator_struct, 
          txn.to_responder_struct() 
          );
      // Unpack information about initiated transfer received by this responder
      txn.from_initiator_struct(wb_m_initiator_struct);
    end else begin    
      // Initiate a transfer and get response
      bfm.initiate_and_get_response( 
          txn.to_initiator_struct(), 
          wb_m_responder_struct 
          );
      // Unpack transfer response information received by this initiator
      txn.from_responder_struct(wb_m_responder_struct);
    end
// pragma uvmf custom access end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end
