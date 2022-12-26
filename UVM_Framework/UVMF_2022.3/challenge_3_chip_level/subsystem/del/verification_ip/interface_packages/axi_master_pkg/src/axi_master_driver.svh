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
class axi_master_driver  #(
      int ADDR_WIDTH = 32,
      int DATA_WIDTH = 32,
      int RESP_WIDTH = 2,
      int ID_WIDTH = 4,
      int STRB_WIDTH = 4,
      int LEN_WIDTH = 8,
      int SIZE_WIDTH = 3,
      int BURST_WIDTH = 2
      ) extends uvmf_driver_base #(
                   .CONFIG_T(axi_master_configuration  #(
                             .ADDR_WIDTH(ADDR_WIDTH),
                             .DATA_WIDTH(DATA_WIDTH),
                             .RESP_WIDTH(RESP_WIDTH),
                             .ID_WIDTH(ID_WIDTH),
                             .STRB_WIDTH(STRB_WIDTH),
                             .LEN_WIDTH(LEN_WIDTH),
                             .SIZE_WIDTH(SIZE_WIDTH),
                             .BURST_WIDTH(BURST_WIDTH)
                             ) ),
                   .BFM_BIND_T(virtual axi_master_driver_bfm  #(
                             .ADDR_WIDTH(ADDR_WIDTH),
                             .DATA_WIDTH(DATA_WIDTH),
                             .RESP_WIDTH(RESP_WIDTH),
                             .ID_WIDTH(ID_WIDTH),
                             .STRB_WIDTH(STRB_WIDTH),
                             .LEN_WIDTH(LEN_WIDTH),
                             .SIZE_WIDTH(SIZE_WIDTH),
                             .BURST_WIDTH(BURST_WIDTH)
                             ) ),
                   .REQ(axi_master_transaction  #(
                             .ADDR_WIDTH(ADDR_WIDTH),
                             .DATA_WIDTH(DATA_WIDTH),
                             .RESP_WIDTH(RESP_WIDTH),
                             .ID_WIDTH(ID_WIDTH),
                             .STRB_WIDTH(STRB_WIDTH),
                             .LEN_WIDTH(LEN_WIDTH),
                             .SIZE_WIDTH(SIZE_WIDTH),
                             .BURST_WIDTH(BURST_WIDTH)
                             ) ),
                   .RSP(axi_master_transaction  #(
                             .ADDR_WIDTH(ADDR_WIDTH),
                             .DATA_WIDTH(DATA_WIDTH),
                             .RESP_WIDTH(RESP_WIDTH),
                             .ID_WIDTH(ID_WIDTH),
                             .STRB_WIDTH(STRB_WIDTH),
                             .LEN_WIDTH(LEN_WIDTH),
                             .SIZE_WIDTH(SIZE_WIDTH),
                             .BURST_WIDTH(BURST_WIDTH)
                             ) ));

  `uvm_component_param_utils( axi_master_driver #(
                              ADDR_WIDTH,
                              DATA_WIDTH,
                              RESP_WIDTH,
                              ID_WIDTH,
                              STRB_WIDTH,
                              LEN_WIDTH,
                              SIZE_WIDTH,
                              BURST_WIDTH
                              ))

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
      bfm.configure( cfg );
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
      bfm.respond_and_wait_for_next_transfer( txn );
    end else begin    
      // Initiate a transfer and get response
      bfm.initiate_and_get_response( txn );
    end
// pragma uvmf custom access end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

