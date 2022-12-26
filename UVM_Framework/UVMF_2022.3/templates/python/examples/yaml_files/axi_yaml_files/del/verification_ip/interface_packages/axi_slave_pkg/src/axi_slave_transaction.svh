//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class defines the variables required for an axi_slave
//    transaction.  Class variables to be displayed in waveform transaction
//    viewing are added to the transaction viewing stream in the add_to_wave
//    function.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class axi_slave_transaction #(
      int ADDR_WIDTH = 32,
      int DATA_WIDTH = 32,
      int RESP_WIDTH = 2,
      int ID_WIDTH = 4,
      int STRB_WIDTH = 4,
      int LEN_WIDTH = 8,
      int SIZE_WIDTH = 3,
      int BURST_WIDTH = 2
      ) extends uvmf_transaction_base;

  `uvm_object_param_utils( axi_slave_transaction #(
                           ADDR_WIDTH,
                           DATA_WIDTH,
                           RESP_WIDTH,
                           ID_WIDTH,
                           STRB_WIDTH,
                           LEN_WIDTH,
                           SIZE_WIDTH,
                           BURST_WIDTH
                           ))

  bit awvalid ;
  bit awready ;
  bit [ID_WIDTH-1:0] awid ;
  bit [LEN_WIDTH-1:0] awlen ;
  bit [SIZE_WIDTH-1:0] awsize ;
  bit [ADDR_WIDTH-1:0] awaddr ;
  bit [BURST_WIDTH-1:0] awburst ;
  bit wvalid ;
  bit wready ;
  bit [ID_WIDTH-1:0] wid ;
  bit [DATA_WIDTH-1:0] wdata ;
  bit [STRB_WIDTH-1:0] wstrb ;
  bit wlast ;
  bit bready ;
  bit bvalid ;
  bit bid ;
  bit [RESP_WIDTH-1:0] bresp ;
  bit arvalid ;
  bit arready ;
  bit [ID_WIDTH-1:0] arid ;
  bit [LEN_WIDTH-1:0] arlen ;
  bit [SIZE_WIDTH-1:0] arsize ;
  bit [ADDR_WIDTH-1:0] araddr ;
  bit [BURST_WIDTH-1:0] arburst ;
  bit rvalid ;
  bit rready ;
  bit [ID_WIDTH-1:0] rid ;
  bit [DATA_WIDTH-1:0] rdata ;
  bit rlast ;
  bit [RESP_WIDTH-1:0] rresp ;

  //Constraints for the transaction variables:

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  //*******************************************************************
  //*******************************************************************
  // Macros that define structs and associated functions are
  // located in axi_slave_macros.svh

  //*******************************************************************
  // Monitor macro used by axi_slave_monitor and axi_slave_monitor_bfm
  // This struct is defined in axi_slave_macros.svh
  `axi_slave_MONITOR_STRUCT
    axi_slave_monitor_s axi_slave_monitor_struct;
  //*******************************************************************
  // FUNCTION: to_monitor_struct()
  // This function packs transaction variables into a axi_slave_monitor_s
  // structure.  The function returns the handle to the axi_slave_monitor_struct.
  // This function is defined in axi_slave_macros.svh
  `axi_slave_TO_MONITOR_STRUCT_FUNCTION 
  //*******************************************************************
  // FUNCTION: from_monitor_struct()
  // This function unpacks the struct provided as an argument into transaction 
  // variables of this class.
  // This function is defined in axi_slave_macros.svh
  `axi_slave_FROM_MONITOR_STRUCT_FUNCTION 

  //*******************************************************************
  // Initiator macro used by axi_slave_driver and axi_slave_driver_bfm
  // to communicate initiator driven data to axi_slave_driver_bfm.
  // This struct is defined in axi_slave_macros.svh
  `axi_slave_INITIATOR_STRUCT
    axi_slave_initiator_s axi_slave_initiator_struct;
  //*******************************************************************
  // FUNCTION: to_initiator_struct()
  // This function packs transaction variables into a axi_slave_initiator_s
  // structure.  The function returns the handle to the axi_slave_initiator_struct.
  // This function is defined in axi_slave_macros.svh
  `axi_slave_TO_INITIATOR_STRUCT_FUNCTION  
  //*******************************************************************
  // FUNCTION: from_initiator_struct()
  // This function unpacks the struct provided as an argument into transaction 
  // variables of this class.
  // This function is defined in axi_slave_macros.svh
  `axi_slave_FROM_INITIATOR_STRUCT_FUNCTION 

  //*******************************************************************
  // Responder macro used by axi_slave_driver and axi_slave_driver_bfm
  // to communicate Responder driven data to axi_slave_driver_bfm.
  // This struct is defined in axi_slave_macros.svh
  `axi_slave_RESPONDER_STRUCT
    axi_slave_responder_s axi_slave_responder_struct;
  //*******************************************************************
  // FUNCTION: to_responder_struct()
  // This function packs transaction variables into a axi_slave_responder_s
  // structure.  The function returns the handle to the axi_slave_responder_struct.
  // This function is defined in axi_slave_macros.svh
  `axi_slave_TO_RESPONDER_STRUCT_FUNCTION 
  //*******************************************************************
  // FUNCTION: from_responder_struct()
  // This function unpacks the struct provided as an argument into transaction 
  // variables of this class.
  // This function is defined in axi_slave_macros.svh
  `axi_slave_FROM_RESPONDER_STRUCT_FUNCTION 
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
    return $sformatf("awvalid:0x%x awready:0x%x awid:0x%x awlen:0x%x awsize:0x%x awaddr:0x%x awburst:0x%x wvalid:0x%x wready:0x%x wid:0x%x wdata:0x%x wstrb:0x%x wlast:0x%x bready:0x%x bvalid:0x%x bid:0x%x bresp:0x%x arvalid:0x%x arready:0x%x arid:0x%x arlen:0x%x arsize:0x%x araddr:0x%x arburst:0x%x rvalid:0x%x rready:0x%x rid:0x%x rdata:0x%x rlast:0x%x rresp:0x%x ",awvalid,awready,awid,awlen,awsize,awaddr,awburst,wvalid,wready,wid,wdata,wstrb,wlast,bready,bvalid,bid,bresp,arvalid,arready,arid,arlen,arsize,araddr,arburst,rvalid,rready,rid,rdata,rlast,rresp);
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
    axi_slave_transaction #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH),
        .RESP_WIDTH(RESP_WIDTH),
        .ID_WIDTH(ID_WIDTH),
        .STRB_WIDTH(STRB_WIDTH),
        .LEN_WIDTH(LEN_WIDTH),
        .SIZE_WIDTH(SIZE_WIDTH),
        .BURST_WIDTH(BURST_WIDTH)
        ) RHS;
    if (!$cast(RHS,rhs)) return 0;
    // pragma uvmf custom do_compare begin
    // UVMF_CHANGE_ME : Eliminate comparison of variables not to be used for compare
    return (super.do_compare(rhs,comparer)
            &&(this.awvalid == RHS.awvalid)
            &&(this.awready == RHS.awready)
            &&(this.awid == RHS.awid)
            &&(this.awlen == RHS.awlen)
            &&(this.awsize == RHS.awsize)
            &&(this.awaddr == RHS.awaddr)
            &&(this.awburst == RHS.awburst)
            &&(this.wvalid == RHS.wvalid)
            &&(this.wready == RHS.wready)
            &&(this.wid == RHS.wid)
            &&(this.wdata == RHS.wdata)
            &&(this.wstrb == RHS.wstrb)
            &&(this.wlast == RHS.wlast)
            &&(this.bready == RHS.bready)
            &&(this.bvalid == RHS.bvalid)
            &&(this.bid == RHS.bid)
            &&(this.bresp == RHS.bresp)
            &&(this.arvalid == RHS.arvalid)
            &&(this.arready == RHS.arready)
            &&(this.arid == RHS.arid)
            &&(this.arlen == RHS.arlen)
            &&(this.arsize == RHS.arsize)
            &&(this.araddr == RHS.araddr)
            &&(this.arburst == RHS.arburst)
            &&(this.rvalid == RHS.rvalid)
            &&(this.rready == RHS.rready)
            &&(this.rid == RHS.rid)
            &&(this.rdata == RHS.rdata)
            &&(this.rlast == RHS.rlast)
            &&(this.rresp == RHS.rresp)
            );
    // pragma uvmf custom do_compare end
  endfunction

  //*******************************************************************
  // FUNCTION: do_copy()
  // This function is automatically called when the .copy() function
  // is called on this class.
  //
  virtual function void do_copy (uvm_object rhs);
    axi_slave_transaction #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH),
        .RESP_WIDTH(RESP_WIDTH),
        .ID_WIDTH(ID_WIDTH),
        .STRB_WIDTH(STRB_WIDTH),
        .LEN_WIDTH(LEN_WIDTH),
        .SIZE_WIDTH(SIZE_WIDTH),
        .BURST_WIDTH(BURST_WIDTH)
        ) RHS;
    assert($cast(RHS,rhs));
    // pragma uvmf custom do_copy begin
    super.do_copy(rhs);
    this.awvalid = RHS.awvalid;
    this.awready = RHS.awready;
    this.awid = RHS.awid;
    this.awlen = RHS.awlen;
    this.awsize = RHS.awsize;
    this.awaddr = RHS.awaddr;
    this.awburst = RHS.awburst;
    this.wvalid = RHS.wvalid;
    this.wready = RHS.wready;
    this.wid = RHS.wid;
    this.wdata = RHS.wdata;
    this.wstrb = RHS.wstrb;
    this.wlast = RHS.wlast;
    this.bready = RHS.bready;
    this.bvalid = RHS.bvalid;
    this.bid = RHS.bid;
    this.bresp = RHS.bresp;
    this.arvalid = RHS.arvalid;
    this.arready = RHS.arready;
    this.arid = RHS.arid;
    this.arlen = RHS.arlen;
    this.arsize = RHS.arsize;
    this.araddr = RHS.araddr;
    this.arburst = RHS.arburst;
    this.rvalid = RHS.rvalid;
    this.rready = RHS.rready;
    this.rid = RHS.rid;
    this.rdata = RHS.rdata;
    this.rlast = RHS.rlast;
    this.rresp = RHS.rresp;
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
      transaction_view_h = $begin_transaction(transaction_viewing_stream_h,"axi_slave_transaction",start_time);
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
    $add_attribute(transaction_view_h,awready,"awready");
    $add_attribute(transaction_view_h,awid,"awid");
    $add_attribute(transaction_view_h,awlen,"awlen");
    $add_attribute(transaction_view_h,awsize,"awsize");
    $add_attribute(transaction_view_h,awaddr,"awaddr");
    $add_attribute(transaction_view_h,awburst,"awburst");
    $add_attribute(transaction_view_h,wvalid,"wvalid");
    $add_attribute(transaction_view_h,wready,"wready");
    $add_attribute(transaction_view_h,wid,"wid");
    $add_attribute(transaction_view_h,wdata,"wdata");
    $add_attribute(transaction_view_h,wstrb,"wstrb");
    $add_attribute(transaction_view_h,wlast,"wlast");
    $add_attribute(transaction_view_h,bready,"bready");
    $add_attribute(transaction_view_h,bvalid,"bvalid");
    $add_attribute(transaction_view_h,bid,"bid");
    $add_attribute(transaction_view_h,bresp,"bresp");
    $add_attribute(transaction_view_h,arvalid,"arvalid");
    $add_attribute(transaction_view_h,arready,"arready");
    $add_attribute(transaction_view_h,arid,"arid");
    $add_attribute(transaction_view_h,arlen,"arlen");
    $add_attribute(transaction_view_h,arsize,"arsize");
    $add_attribute(transaction_view_h,araddr,"araddr");
    $add_attribute(transaction_view_h,arburst,"arburst");
    $add_attribute(transaction_view_h,rvalid,"rvalid");
    $add_attribute(transaction_view_h,rready,"rready");
    $add_attribute(transaction_view_h,rid,"rid");
    $add_attribute(transaction_view_h,rdata,"rdata");
    $add_attribute(transaction_view_h,rlast,"rlast");
    $add_attribute(transaction_view_h,rresp,"rresp");
    // pragma uvmf custom add_to_wave end
    $end_transaction(transaction_view_h,end_time);
    $free_transaction(transaction_view_h);
    `endif // QUESTA
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

