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
      int id_width = 4,
      int len_width = 4,
      int size_width = 3,
      int addr_width = 32,
      int burst_width = 2,
      int data_width = 32,
      int strb_width = 4,
      int resp_width = 2
      ) extends uvmf_monitor_base #(
                    .CONFIG_T(axi_master_configuration  #(
                             .id_width(id_width),
                             .len_width(len_width),
                             .size_width(size_width),
                             .addr_width(addr_width),
                             .burst_width(burst_width),
                             .data_width(data_width),
                             .strb_width(strb_width),
                             .resp_width(resp_width)
                             )),
                    .BFM_BIND_T(virtual axi_master_monitor_bfm  #(
                             .id_width(id_width),
                             .len_width(len_width),
                             .size_width(size_width),
                             .addr_width(addr_width),
                             .burst_width(burst_width),
                             .data_width(data_width),
                             .strb_width(strb_width),
                             .resp_width(resp_width)
                             )),
                    .TRANS_T(axi_master_transaction  #(
                             .id_width(id_width),
                             .len_width(len_width),
                             .size_width(size_width),
                             .addr_width(addr_width),
                             .burst_width(burst_width),
                             .data_width(data_width),
                             .strb_width(strb_width),
                             .resp_width(resp_width)
                             )));

  `uvm_component_param_utils( axi_master_monitor #(
                              id_width,
                              len_width,
                              size_width,
                              addr_width,
                              burst_width,
                              data_width,
                              strb_width,
                              resp_width
                              ))

// Structure used to pass data from monitor BFM to monitor class in agent.
// Use to_monitor_struct function to pack transaction variables into structure.
// Use from_monitor_struct function to unpack transaction variables from structure.
`axi_master_MONITOR_STRUCT

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
// monitor BFM.  Data is passed using the axi_master_monitor_struct.          
 virtual function void notify_transaction(input axi_master_monitor_s axi_master_monitor_struct);
 
 
    trans = new("trans");
    trans.from_monitor_struct(axi_master_monitor_struct);
    trans.start_time = time_stamp;                                                          
    trans.end_time = $time;                                                                 
    time_stamp = trans.end_time;
 
    analyze(trans);                                                                         
  endfunction  

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

