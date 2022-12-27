`ifndef APB_M_MONITOR
`define APB_M_MONITOR
//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class receives apb_m transactions observed by the
//     apb_m monitor BFM and broadcasts them through the analysis port
//     on the agent. It accesses the monitor BFM through the monitor
//     task. This UVM component captures transactions
//     for viewing in the waveform viewer if the
//     enable_transaction_viewing flag is set in the configuration.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class apb_m_monitor #(
      int APB_ADDR_WIDTH = 32,
      int APB_DATA_WIDTH = 32,
      int STRB_LEN = APB_ADDR_WIDTH/8
      ) extends uvmf_monitor_base #(
                    .CONFIG_T(apb_m_configuration  #(
                             .APB_ADDR_WIDTH(APB_ADDR_WIDTH),
                             .APB_DATA_WIDTH(APB_DATA_WIDTH),
                             .STRB_LEN(STRB_LEN)
                             )),
                    .BFM_BIND_T(virtual apb_m_monitor_bfm  #(
                             .APB_ADDR_WIDTH(APB_ADDR_WIDTH),
                             .APB_DATA_WIDTH(APB_DATA_WIDTH),
                             .STRB_LEN(STRB_LEN)
                             )),
                    .TRANS_T(apb_m_transaction  #(
                             .APB_ADDR_WIDTH(APB_ADDR_WIDTH),
                             .APB_DATA_WIDTH(APB_DATA_WIDTH),
                             .STRB_LEN(STRB_LEN)
                             )));

  `uvm_component_param_utils( apb_m_monitor #(
                              APB_ADDR_WIDTH,
                              APB_DATA_WIDTH,
                              STRB_LEN
                              ))

// Structure used to pass data from monitor BFM to monitor class in agent.
// Use to_monitor_struct function to pack transaction variables into structure.
// Use from_monitor_struct function to unpack transaction variables from structure.
`apb_m_MONITOR_STRUCT

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
      bfm.configure( cfg.to_struct() );

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
// monitor BFM.  Data is passed using the apb_m_monitor_struct.          
 virtual function void notify_transaction(input apb_m_monitor_s apb_m_monitor_struct);
 
 
    trans = new("trans");
    trans.from_monitor_struct(apb_m_monitor_struct);
    trans.start_time = time_stamp;                                                          
    trans.end_time = $time;                                                                 
    time_stamp = trans.end_time;
 
    analyze(trans);                                                                         
  endfunction  

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end
`endif
