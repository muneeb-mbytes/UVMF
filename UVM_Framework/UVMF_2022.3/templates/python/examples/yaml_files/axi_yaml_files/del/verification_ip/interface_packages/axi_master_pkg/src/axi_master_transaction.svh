//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class defines the variables required for an axi_master
//    transaction.  Class variables to be displayed in waveform transaction
//    viewing are added to the transaction viewing stream in the add_to_wave
//    function.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class axi_master_transaction #(
      int id_width = 4,
      int len_width = 4,
      int size_width = 3,
      int addr_width = 32,
      int burst_width = 2,
      int data_width = 32,
      int strb_width = 4,
      int resp_width = 2
      ) extends uvmf_transaction_base;

  `uvm_object_param_utils( axi_master_transaction #(
                           id_width,
                           len_width,
                           size_width,
                           addr_width,
                           burst_width,
                           data_width,
                           strb_width,
                           resp_width
                           ))

  bit awvalid ;
  rand int awid ;
  rand int awlen ;
  rand int awsize ;
  rand int awaddr ;
  int awburst ;
  bit wvalid ;
  bit wready ;
  rand int wid ;
  rand int wsize ;
  rand int wdata ;
  rand int wstrb ;
  bit wlast ;
  bit arvalid ;
  bit arready ;
  rand int arid ;
  rand int arlen ;
  rand int arsize ;
  rand int arburst ;

  //Constraints for the transaction variables:

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  //*******************************************************************
  //*******************************************************************
  // Macros that define structs and associated functions are
  // located in axi_master_macros.svh

  //*******************************************************************
  // Monitor macro used by axi_master_monitor and axi_master_monitor_bfm
  // This struct is defined in axi_master_macros.svh
  `axi_master_MONITOR_STRUCT
    axi_master_monitor_s axi_master_monitor_struct;
  //*******************************************************************
  // FUNCTION: to_monitor_struct()
  // This function packs transaction variables into a axi_master_monitor_s
  // structure.  The function returns the handle to the axi_master_monitor_struct.
  // This function is defined in axi_master_macros.svh
  `axi_master_TO_MONITOR_STRUCT_FUNCTION 
  //*******************************************************************
  // FUNCTION: from_monitor_struct()
  // This function unpacks the struct provided as an argument into transaction 
  // variables of this class.
  // This function is defined in axi_master_macros.svh
  `axi_master_FROM_MONITOR_STRUCT_FUNCTION 

  //*******************************************************************
  // Initiator macro used by axi_master_driver and axi_master_driver_bfm
  // to communicate initiator driven data to axi_master_driver_bfm.
  // This struct is defined in axi_master_macros.svh
  `axi_master_INITIATOR_STRUCT
    axi_master_initiator_s axi_master_initiator_struct;
  //*******************************************************************
  // FUNCTION: to_initiator_struct()
  // This function packs transaction variables into a axi_master_initiator_s
  // structure.  The function returns the handle to the axi_master_initiator_struct.
  // This function is defined in axi_master_macros.svh
  `axi_master_TO_INITIATOR_STRUCT_FUNCTION  
  //*******************************************************************
  // FUNCTION: from_initiator_struct()
  // This function unpacks the struct provided as an argument into transaction 
  // variables of this class.
  // This function is defined in axi_master_macros.svh
  `axi_master_FROM_INITIATOR_STRUCT_FUNCTION 

  //*******************************************************************
  // Responder macro used by axi_master_driver and axi_master_driver_bfm
  // to communicate Responder driven data to axi_master_driver_bfm.
  // This struct is defined in axi_master_macros.svh
  `axi_master_RESPONDER_STRUCT
    axi_master_responder_s axi_master_responder_struct;
  //*******************************************************************
  // FUNCTION: to_responder_struct()
  // This function packs transaction variables into a axi_master_responder_s
  // structure.  The function returns the handle to the axi_master_responder_struct.
  // This function is defined in axi_master_macros.svh
  `axi_master_TO_RESPONDER_STRUCT_FUNCTION 
  //*******************************************************************
  // FUNCTION: from_responder_struct()
  // This function unpacks the struct provided as an argument into transaction 
  // variables of this class.
  // This function is defined in axi_master_macros.svh
  `axi_master_FROM_RESPONDER_STRUCT_FUNCTION 
  // ****************************************************************************
  // FUNCTION : new()
  // This function is the standard SystemVerilog constructor.
  //
  function new( string name = "" );
    super.new( name );
  endfunction

  // ****************************************************************************
  // FUNCTION: convert2string()
  // This function converts all variables in this class to a single string for 
  // logfile reporting.
  //
  virtual function string convert2string();
    // pragma uvmf custom convert2string begin
    // UVMF_CHANGE_ME : Customize format if desired.
    return $sformatf("awvalid:0x%x awid:0x%x awlen:0x%x awsize:0x%x awaddr:0x%x awburst:0x%x wvalid:0x%x wready:0x%x wid:0x%x wsize:0x%x wdata:0x%x wstrb:0x%x wlast:0x%x arvalid:0x%x arready:0x%x arid:0x%x arlen:0x%x arsize:0x%x arburst:0x%x ",awvalid,awid,awlen,awsize,awaddr,awburst,wvalid,wready,wid,wsize,wdata,wstrb,wlast,arvalid,arready,arid,arlen,arsize,arburst);
    // pragma uvmf custom convert2string end
  endfunction

  //*******************************************************************
  // FUNCTION: do_print()
  // This function is automatically called when the .print() function
  // is called on this class.
  //
  virtual function void do_print(uvm_printer printer);
    // pragma uvmf custom do_print begin
    // UVMF_CHANGE_ME : Current contents of do_print allows for the use of UVM 1.1d, 1.2 or P1800.2.
    // Update based on your own printing preference according to your preferred UVM version
    $display(convert2string());
    // pragma uvmf custom do_print end
  endfunction

  //*******************************************************************
  // FUNCTION: do_compare()
  // This function is automatically called when the .compare() function
  // is called on this class.
  //
  virtual function bit do_compare (uvm_object rhs, uvm_comparer comparer);
    axi_master_transaction #(
        .id_width(id_width),
        .len_width(len_width),
        .size_width(size_width),
        .addr_width(addr_width),
        .burst_width(burst_width),
        .data_width(data_width),
        .strb_width(strb_width),
        .resp_width(resp_width)
        ) RHS;
    if (!$cast(RHS,rhs)) return 0;
    // pragma uvmf custom do_compare begin
    // UVMF_CHANGE_ME : Eliminate comparison of variables not to be used for compare
    return (super.do_compare(rhs,comparer)
            &&(this.awvalid == RHS.awvalid)
            &&(this.awid == RHS.awid)
            &&(this.awlen == RHS.awlen)
            &&(this.awsize == RHS.awsize)
            &&(this.awaddr == RHS.awaddr)
            &&(this.awburst == RHS.awburst)
            &&(this.wvalid == RHS.wvalid)
            &&(this.wready == RHS.wready)
            &&(this.wid == RHS.wid)
            &&(this.wsize == RHS.wsize)
            &&(this.wdata == RHS.wdata)
            &&(this.wstrb == RHS.wstrb)
            &&(this.wlast == RHS.wlast)
            &&(this.arvalid == RHS.arvalid)
            &&(this.arready == RHS.arready)
            &&(this.arid == RHS.arid)
            &&(this.arlen == RHS.arlen)
            &&(this.arsize == RHS.arsize)
            &&(this.arburst == RHS.arburst)
            );
    // pragma uvmf custom do_compare end
  endfunction

  //*******************************************************************
  // FUNCTION: do_copy()
  // This function is automatically called when the .copy() function
  // is called on this class.
  //
  virtual function void do_copy (uvm_object rhs);
    axi_master_transaction #(
        .id_width(id_width),
        .len_width(len_width),
        .size_width(size_width),
        .addr_width(addr_width),
        .burst_width(burst_width),
        .data_width(data_width),
        .strb_width(strb_width),
        .resp_width(resp_width)
        ) RHS;
    assert($cast(RHS,rhs));
    // pragma uvmf custom do_copy begin
    super.do_copy(rhs);
    this.awvalid = RHS.awvalid;
    this.awid = RHS.awid;
    this.awlen = RHS.awlen;
    this.awsize = RHS.awsize;
    this.awaddr = RHS.awaddr;
    this.awburst = RHS.awburst;
    this.wvalid = RHS.wvalid;
    this.wready = RHS.wready;
    this.wid = RHS.wid;
    this.wsize = RHS.wsize;
    this.wdata = RHS.wdata;
    this.wstrb = RHS.wstrb;
    this.wlast = RHS.wlast;
    this.arvalid = RHS.arvalid;
    this.arready = RHS.arready;
    this.arid = RHS.arid;
    this.arlen = RHS.arlen;
    this.arsize = RHS.arsize;
    this.arburst = RHS.arburst;
    // pragma uvmf custom do_copy end
  endfunction

  // ****************************************************************************
  // FUNCTION: add_to_wave()
  // This function is used to display variables in this class in the waveform 
  // viewer.  The start_time and end_time variables must be set before this 
  // function is called.  If the start_time and end_time variables are not set
  // the transaction will be hidden at 0ns on the waveform display.
  // 
  virtual function void add_to_wave(int transaction_viewing_stream_h);
    `ifdef QUESTA
    if (transaction_view_h == 0) begin
      transaction_view_h = $begin_transaction(transaction_viewing_stream_h,"axi_master_transaction",start_time);
    end
    super.add_to_wave(transaction_view_h);
    // pragma uvmf custom add_to_wave begin
    // UVMF_CHANGE_ME : Color can be applied to transaction entries based on content, example below
    // case()
    //   1 : $add_color(transaction_view_h,"red");
    //   default : $add_color(transaction_view_h,"grey");
    // endcase
    // UVMF_CHANGE_ME : Eliminate transaction variables not wanted in transaction viewing in the waveform viewer
    $add_attribute(transaction_view_h,awvalid,"awvalid");
    $add_attribute(transaction_view_h,awid,"awid");
    $add_attribute(transaction_view_h,awlen,"awlen");
    $add_attribute(transaction_view_h,awsize,"awsize");
    $add_attribute(transaction_view_h,awaddr,"awaddr");
    $add_attribute(transaction_view_h,awburst,"awburst");
    $add_attribute(transaction_view_h,wvalid,"wvalid");
    $add_attribute(transaction_view_h,wready,"wready");
    $add_attribute(transaction_view_h,wid,"wid");
    $add_attribute(transaction_view_h,wsize,"wsize");
    $add_attribute(transaction_view_h,wdata,"wdata");
    $add_attribute(transaction_view_h,wstrb,"wstrb");
    $add_attribute(transaction_view_h,wlast,"wlast");
    $add_attribute(transaction_view_h,arvalid,"arvalid");
    $add_attribute(transaction_view_h,arready,"arready");
    $add_attribute(transaction_view_h,arid,"arid");
    $add_attribute(transaction_view_h,arlen,"arlen");
    $add_attribute(transaction_view_h,arsize,"arsize");
    $add_attribute(transaction_view_h,arburst,"arburst");
    // pragma uvmf custom add_to_wave end
    $end_transaction(transaction_view_h,end_time);
    $free_transaction(transaction_view_h);
    `endif // QUESTA
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

