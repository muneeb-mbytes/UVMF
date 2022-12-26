//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class receives axi_master transactions observed by the
//     axi_master monitor BFM and broadcasts them through the analysis port
//     on the agent. It accesses the monitor BFM through the monitor
//     task. This UVM component captures transactions
//     for viewing in the waveform viewer if the
//     enable_transaction_viewing flag is set in the configuration.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class axi_master_monitor #(
      int ADDR_WIDTH = 32,
      int DATA_WIDTH = 32,
      int RESP_WIDTH = 2,
      int ID_WIDTH = 4,
      int STRB_WIDTH = 4,
      int LEN_WIDTH = 8,
      int SIZE_WIDTH = 3,
      int BURST_WIDTH = 2
      ) extends uvmf_monitor_base #(
                    .CONFIG_T(axi_master_configuration  #(
                             .ADDR_WIDTH(ADDR_WIDTH),
                             .DATA_WIDTH(DATA_WIDTH),
                             .RESP_WIDTH(RESP_WIDTH),
                             .ID_WIDTH(ID_WIDTH),
                             .STRB_WIDTH(STRB_WIDTH),
                             .LEN_WIDTH(LEN_WIDTH),
                             .SIZE_WIDTH(SIZE_WIDTH),
                             .BURST_WIDTH(BURST_WIDTH)
                             )),
                    .BFM_BIND_T(virtual axi_master_monitor_bfm  #(
                             .ADDR_WIDTH(ADDR_WIDTH),
                             .DATA_WIDTH(DATA_WIDTH),
                             .RESP_WIDTH(RESP_WIDTH),
                             .ID_WIDTH(ID_WIDTH),
                             .STRB_WIDTH(STRB_WIDTH),
                             .LEN_WIDTH(LEN_WIDTH),
                             .SIZE_WIDTH(SIZE_WIDTH),
                             .BURST_WIDTH(BURST_WIDTH)
                             )),
                    .TRANS_T(axi_master_transaction  #(
                             .ADDR_WIDTH(ADDR_WIDTH),
                             .DATA_WIDTH(DATA_WIDTH),
                             .RESP_WIDTH(RESP_WIDTH),
                             .ID_WIDTH(ID_WIDTH),
                             .STRB_WIDTH(STRB_WIDTH),
                             .LEN_WIDTH(LEN_WIDTH),
                             .SIZE_WIDTH(SIZE_WIDTH),
                             .BURST_WIDTH(BURST_WIDTH)
                             )));

  `uvm_component_param_utils( axi_master_monitor #(
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
  function new( string name = "", uvm_component parent = null );
    super.new( name, parent );
  endfunction

// ****************************************************************************
// This function sends configuration object variables to the monitor BFM 
// using the configuration struct.
//
   virtual function void configure(input CONFIG_T cfg);
      bfm.configure( cfg );

   endfunction

// ****************************************************************************
// This function places a handle to this class in the proxy variable in the
// monitor BFM.  This allows the monitor BFM to call the notify_transaction
// function within this class.
//
   virtual function void set_bfm_proxy_handle();
      bfm.proxy = this;   endfunction

// ***************************************************************************              
  virtual task run_phase(uvm_phase phase);                                                   
  // Start monitor BFM thread and don't call super.run() in order to                       
  // override the default monitor proxy 'pull' behavior with the more                      
  // emulation-friendly BFM 'push' approach using the notify_transaction                   
  // function below                                                                        
  bfm.start_monitoring();                                                   
  endtask                                                                                    
  
// **************************************************************************  
// This function is called by the monitor BFM.  It receives data observed by the
// monitor BFM.  Data is passed using the axi_master_transaction object handle.          
 virtual function void notify_transaction(axi_master_transaction
                                         #(
                                         ADDR_WIDTH,
                                         DATA_WIDTH,
                                         RESP_WIDTH,
                                         ID_WIDTH,
                                         STRB_WIDTH,
                                         LEN_WIDTH,
                                         SIZE_WIDTH,
                                         BURST_WIDTH
                                         )
 
                                         monitored_trans
                                         );
 
    trans = monitored_trans;
 
    analyze(trans);                                                                         
  endfunction  

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

