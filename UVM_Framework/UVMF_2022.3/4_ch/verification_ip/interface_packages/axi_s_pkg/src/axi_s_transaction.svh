`ifndef AXI_S_IF_TRANSACTION
`define AXI_S_IF_TRANSACTION
//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class defines the variables required for an axi_s
//    transaction.  Class variables to be displayed in waveform transaction
//    viewing are added to the transaction viewing stream in the add_to_wave
//    function.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class axi_s_transaction #(
      int AW_WIDTH = 32,
      int LEN = 8,
      int DATA_WIDTH = 32,
      int X = 16
      ) extends uvmf_transaction_base;

  `uvm_object_param_utils( axi_s_transaction #(
                           AW_WIDTH,
                           LEN,
                           DATA_WIDTH,
                           X
                           ))

  bit awvalid ;
  bit awready ;
  bit [AW_WIDTH-1:0] awaddr ;
  bit awsize ;
  bit awburst ;
  bit awcache ;
  bit awprot ;
  bit [X-1:0] awid ;
  bit [LEN-1:0] awlen ;
  bit awlock ;
  bit awqos ;
  bit awregion ;
  bit [X-1:0] awuser ;
  bit wvalid ;
  bit wready ;
  bit wlast ;
  bit [DATA_WIDTH-1:0] wdata ;
  bit [DATA_WIDTH/8-1:0] wstrb ;
  bit [X-1:0] wid ;
  bit [X-1:0] wuser ;
  bit bwvalid ;
  bit bwready ;
  rand bit bresp ;
  bit [X-1:0] bid ;
  rand bit [X-1:0] buser ;
  bit arvalid ;
  bit aready ;
  rand bit [AW_WIDTH-1:0] araddr ;
  rand bit arsize ;
  rand bit arburst ;
  rand bit arcache ;
  rand bit arprot ;
  rand bit [X-1:0] arid ;
  rand bit [LEN-1:0] arlen ;
  rand bit arlock ;
  rand bit arqos ;
  bit aregion ;
  bit [X-1:0] aruser ;
  bit rvalid ;
  bit rready ;
  bit rlast ;
  rand bit [DATA_WIDTH-1:0] rdata ;
  rand bit [X-1:0] rid ;
  rand bit [X-1:0] ruser ;
  rand bit rresp ;

  //Constraints for the transaction variables:

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  //*******************************************************************
  //*******************************************************************
  // Macros that define structs and associated functions are
  // located in axi_s_macros.svh

  //*******************************************************************
  // Monitor macro used by axi_s_monitor and axi_s_monitor_bfm
  // This struct is defined in axi_s_macros.svh
  `axi_s_MONITOR_STRUCT
    axi_s_monitor_s axi_s_monitor_struct;
  //*******************************************************************
  // FUNCTION: to_monitor_struct()
  // This function packs transaction variables into a axi_s_monitor_s
  // structure.  The function returns the handle to the axi_s_monitor_struct.
  // This function is defined in axi_s_macros.svh
  `axi_s_TO_MONITOR_STRUCT_FUNCTION 
  //*******************************************************************
  // FUNCTION: from_monitor_struct()
  // This function unpacks the struct provided as an argument into transaction 
  // variables of this class.
  // This function is defined in axi_s_macros.svh
  `axi_s_FROM_MONITOR_STRUCT_FUNCTION 

  //*******************************************************************
  // Initiator macro used by axi_s_driver and axi_s_driver_bfm
  // to communicate initiator driven data to axi_s_driver_bfm.
  // This struct is defined in axi_s_macros.svh
  `axi_s_INITIATOR_STRUCT
    axi_s_initiator_s axi_s_initiator_struct;
  //*******************************************************************
  // FUNCTION: to_initiator_struct()
  // This function packs transaction variables into a axi_s_initiator_s
  // structure.  The function returns the handle to the axi_s_initiator_struct.
  // This function is defined in axi_s_macros.svh
  `axi_s_TO_INITIATOR_STRUCT_FUNCTION  
  //*******************************************************************
  // FUNCTION: from_initiator_struct()
  // This function unpacks the struct provided as an argument into transaction 
  // variables of this class.
  // This function is defined in axi_s_macros.svh
  `axi_s_FROM_INITIATOR_STRUCT_FUNCTION 

  //*******************************************************************
  // Responder macro used by axi_s_driver and axi_s_driver_bfm
  // to communicate Responder driven data to axi_s_driver_bfm.
  // This struct is defined in axi_s_macros.svh
  `axi_s_RESPONDER_STRUCT
    axi_s_responder_s axi_s_responder_struct;
  //*******************************************************************
  // FUNCTION: to_responder_struct()
  // This function packs transaction variables into a axi_s_responder_s
  // structure.  The function returns the handle to the axi_s_responder_struct.
  // This function is defined in axi_s_macros.svh
  `axi_s_TO_RESPONDER_STRUCT_FUNCTION 
  //*******************************************************************
  // FUNCTION: from_responder_struct()
  // This function unpacks the struct provided as an argument into transaction 
  // variables of this class.
  // This function is defined in axi_s_macros.svh
  `axi_s_FROM_RESPONDER_STRUCT_FUNCTION 
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
    return $sformatf("awvalid:0x%x awready:0x%x awaddr:0x%x awsize:0x%x awburst:0x%x awcache:0x%x awprot:0x%x awid:0x%x awlen:0x%x awlock:0x%x awqos:0x%x awregion:0x%x awuser:0x%x wvalid:0x%x wready:0x%x wlast:0x%x wdata:0x%x wstrb:0x%x wid:0x%x wuser:0x%x bwvalid:0x%x bwready:0x%x bresp:0x%x bid:0x%x buser:0x%x arvalid:0x%x aready:0x%x araddr:0x%x arsize:0x%x arburst:0x%x arcache:0x%x arprot:0x%x arid:0x%x arlen:0x%x arlock:0x%x arqos:0x%x aregion:0x%x aruser:0x%x rvalid:0x%x rready:0x%x rlast:0x%x rdata:0x%x rid:0x%x ruser:0x%x rresp:0x%x ",awvalid,awready,awaddr,awsize,awburst,awcache,awprot,awid,awlen,awlock,awqos,awregion,awuser,wvalid,wready,wlast,wdata,wstrb,wid,wuser,bwvalid,bwready,bresp,bid,buser,arvalid,aready,araddr,arsize,arburst,arcache,arprot,arid,arlen,arlock,arqos,aregion,aruser,rvalid,rready,rlast,rdata,rid,ruser,rresp);
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
    axi_s_transaction #(
        .AW_WIDTH(AW_WIDTH),
        .LEN(LEN),
        .DATA_WIDTH(DATA_WIDTH),
        .X(X)
        ) RHS;
    if (!$cast(RHS,rhs)) return 0;
    // pragma uvmf custom do_compare begin
    // UVMF_CHANGE_ME : Eliminate comparison of variables not to be used for compare
    return (super.do_compare(rhs,comparer)
            );
    // pragma uvmf custom do_compare end
  endfunction

  //*******************************************************************
  // FUNCTION: do_copy()
  // This function is automatically called when the .copy() function
  // is called on this class.
  //
  virtual function void do_copy (uvm_object rhs);
    axi_s_transaction #(
        .AW_WIDTH(AW_WIDTH),
        .LEN(LEN),
        .DATA_WIDTH(DATA_WIDTH),
        .X(X)
        ) RHS;
    assert($cast(RHS,rhs));
    // pragma uvmf custom do_copy begin
    super.do_copy(rhs);
    this.awvalid = RHS.awvalid;
    this.awready = RHS.awready;
    this.awaddr = RHS.awaddr;
    this.awsize = RHS.awsize;
    this.awburst = RHS.awburst;
    this.awcache = RHS.awcache;
    this.awprot = RHS.awprot;
    this.awid = RHS.awid;
    this.awlen = RHS.awlen;
    this.awlock = RHS.awlock;
    this.awqos = RHS.awqos;
    this.awregion = RHS.awregion;
    this.awuser = RHS.awuser;
    this.wvalid = RHS.wvalid;
    this.wready = RHS.wready;
    this.wlast = RHS.wlast;
    this.wdata = RHS.wdata;
    this.wstrb = RHS.wstrb;
    this.wid = RHS.wid;
    this.wuser = RHS.wuser;
    this.bwvalid = RHS.bwvalid;
    this.bwready = RHS.bwready;
    this.bresp = RHS.bresp;
    this.bid = RHS.bid;
    this.buser = RHS.buser;
    this.arvalid = RHS.arvalid;
    this.aready = RHS.aready;
    this.araddr = RHS.araddr;
    this.arsize = RHS.arsize;
    this.arburst = RHS.arburst;
    this.arcache = RHS.arcache;
    this.arprot = RHS.arprot;
    this.arid = RHS.arid;
    this.arlen = RHS.arlen;
    this.arlock = RHS.arlock;
    this.arqos = RHS.arqos;
    this.aregion = RHS.aregion;
    this.aruser = RHS.aruser;
    this.rvalid = RHS.rvalid;
    this.rready = RHS.rready;
    this.rlast = RHS.rlast;
    this.rdata = RHS.rdata;
    this.rid = RHS.rid;
    this.ruser = RHS.ruser;
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
      transaction_view_h = $begin_transaction(transaction_viewing_stream_h,"axi_s_transaction",start_time);
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
    $add_attribute(transaction_view_h,awaddr,"awaddr");
    $add_attribute(transaction_view_h,awsize,"awsize");
    $add_attribute(transaction_view_h,awburst,"awburst");
    $add_attribute(transaction_view_h,awcache,"awcache");
    $add_attribute(transaction_view_h,awprot,"awprot");
    $add_attribute(transaction_view_h,awid,"awid");
    $add_attribute(transaction_view_h,awlen,"awlen");
    $add_attribute(transaction_view_h,awlock,"awlock");
    $add_attribute(transaction_view_h,awqos,"awqos");
    $add_attribute(transaction_view_h,awregion,"awregion");
    $add_attribute(transaction_view_h,awuser,"awuser");
    $add_attribute(transaction_view_h,wvalid,"wvalid");
    $add_attribute(transaction_view_h,wready,"wready");
    $add_attribute(transaction_view_h,wlast,"wlast");
    $add_attribute(transaction_view_h,wdata,"wdata");
    $add_attribute(transaction_view_h,wstrb,"wstrb");
    $add_attribute(transaction_view_h,wid,"wid");
    $add_attribute(transaction_view_h,wuser,"wuser");
    $add_attribute(transaction_view_h,bwvalid,"bwvalid");
    $add_attribute(transaction_view_h,bwready,"bwready");
    $add_attribute(transaction_view_h,bresp,"bresp");
    $add_attribute(transaction_view_h,bid,"bid");
    $add_attribute(transaction_view_h,buser,"buser");
    $add_attribute(transaction_view_h,arvalid,"arvalid");
    $add_attribute(transaction_view_h,aready,"aready");
    $add_attribute(transaction_view_h,araddr,"araddr");
    $add_attribute(transaction_view_h,arsize,"arsize");
    $add_attribute(transaction_view_h,arburst,"arburst");
    $add_attribute(transaction_view_h,arcache,"arcache");
    $add_attribute(transaction_view_h,arprot,"arprot");
    $add_attribute(transaction_view_h,arid,"arid");
    $add_attribute(transaction_view_h,arlen,"arlen");
    $add_attribute(transaction_view_h,arlock,"arlock");
    $add_attribute(transaction_view_h,arqos,"arqos");
    $add_attribute(transaction_view_h,aregion,"aregion");
    $add_attribute(transaction_view_h,aruser,"aruser");
    $add_attribute(transaction_view_h,rvalid,"rvalid");
    $add_attribute(transaction_view_h,rready,"rready");
    $add_attribute(transaction_view_h,rlast,"rlast");
    $add_attribute(transaction_view_h,rdata,"rdata");
    $add_attribute(transaction_view_h,rid,"rid");
    $add_attribute(transaction_view_h,ruser,"ruser");
    $add_attribute(transaction_view_h,rresp,"rresp");
    // pragma uvmf custom add_to_wave end
    $end_transaction(transaction_view_h,end_time);
    $free_transaction(transaction_view_h);
    `endif // QUESTA
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end
`endif
