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
class axi_slave_transaction  extends uvmf_transaction_base;

  `uvm_object_utils( axi_slave_transaction )

  bit AWID ;
  bit AWADDR ;
  bit AWLEN ;
  bit AWSIZE ;
  bit AWBURST ;
  bit AWLOCK ;
  bit AWCACHE ;
  bit AWQOS ;
  bit AWREGION ;
  bit AWUSER ;
  bit AWPROT ;
  bit AWVALID ;
  bit AWREADY ;
  bit WDATA ;
  bit WSTRB ;
  bit WUSER ;
  bit WLAST ;
  bit BID ;
  bit BRESP ;
  bit BUSER ;
  bit BVALID ;
  bit ARID ;
  bit ARADDR ;
  bit ARLEN ;
  bit ARSIZE ;
  bit ARBURST ;
  bit ARCACHE ;
  bit ARPROT ;
  bit ARQOS ;
  bit ARREGION ;
  bit ARUSER ;
  bit ARLOCK ;
  bit RID ;
  bit RDATA ;
  bit RRESP ;
  bit RUSER ;
  bit RLAST ;
  bit RVALID ;

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
    return $sformatf("AWID:0x%x AWADDR:0x%x AWLEN:0x%x AWSIZE:0x%x AWBURST:0x%x AWLOCK:0x%x AWCACHE:0x%x AWQOS:0x%x AWREGION:0x%x AWUSER:0x%x AWPROT:0x%x AWVALID:0x%x AWREADY:0x%x WDATA:0x%x WSTRB:0x%x WUSER:0x%x WLAST:0x%x BID:0x%x BRESP:0x%x BUSER:0x%x BVALID:0x%x ARID:0x%x ARADDR:0x%x ARLEN:0x%x ARSIZE:0x%x ARBURST:0x%x ARCACHE:0x%x ARPROT:0x%x ARQOS:0x%x ARREGION:0x%x ARUSER:0x%x ARLOCK:0x%x RID:0x%x RDATA:0x%x RRESP:0x%x RUSER:0x%x RLAST:0x%x RVALID:0x%x ",AWID,AWADDR,AWLEN,AWSIZE,AWBURST,AWLOCK,AWCACHE,AWQOS,AWREGION,AWUSER,AWPROT,AWVALID,AWREADY,WDATA,WSTRB,WUSER,WLAST,BID,BRESP,BUSER,BVALID,ARID,ARADDR,ARLEN,ARSIZE,ARBURST,ARCACHE,ARPROT,ARQOS,ARREGION,ARUSER,ARLOCK,RID,RDATA,RRESP,RUSER,RLAST,RVALID);
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
    axi_slave_transaction  RHS;
    if (!$cast(RHS,rhs)) return 0;
    // pragma uvmf custom do_compare begin
    // UVMF_CHANGE_ME : Eliminate comparison of variables not to be used for compare
    return (super.do_compare(rhs,comparer)
            &&(this.AWID == RHS.AWID)
            &&(this.AWADDR == RHS.AWADDR)
            &&(this.AWLEN == RHS.AWLEN)
            &&(this.AWSIZE == RHS.AWSIZE)
            &&(this.AWBURST == RHS.AWBURST)
            &&(this.AWLOCK == RHS.AWLOCK)
            &&(this.AWCACHE == RHS.AWCACHE)
            &&(this.AWQOS == RHS.AWQOS)
            &&(this.AWREGION == RHS.AWREGION)
            &&(this.AWUSER == RHS.AWUSER)
            &&(this.AWPROT == RHS.AWPROT)
            &&(this.AWVALID == RHS.AWVALID)
            &&(this.AWREADY == RHS.AWREADY)
            &&(this.WDATA == RHS.WDATA)
            &&(this.WSTRB == RHS.WSTRB)
            &&(this.WUSER == RHS.WUSER)
            &&(this.WLAST == RHS.WLAST)
            &&(this.BID == RHS.BID)
            &&(this.BRESP == RHS.BRESP)
            &&(this.BUSER == RHS.BUSER)
            &&(this.BVALID == RHS.BVALID)
            &&(this.ARID == RHS.ARID)
            &&(this.ARADDR == RHS.ARADDR)
            &&(this.ARLEN == RHS.ARLEN)
            &&(this.ARSIZE == RHS.ARSIZE)
            &&(this.ARBURST == RHS.ARBURST)
            &&(this.ARCACHE == RHS.ARCACHE)
            &&(this.ARPROT == RHS.ARPROT)
            &&(this.ARQOS == RHS.ARQOS)
            &&(this.ARREGION == RHS.ARREGION)
            &&(this.ARUSER == RHS.ARUSER)
            &&(this.ARLOCK == RHS.ARLOCK)
            &&(this.RID == RHS.RID)
            &&(this.RDATA == RHS.RDATA)
            &&(this.RRESP == RHS.RRESP)
            &&(this.RUSER == RHS.RUSER)
            &&(this.RLAST == RHS.RLAST)
            &&(this.RVALID == RHS.RVALID)
            );
    // pragma uvmf custom do_compare end
  endfunction

  //*******************************************************************
  // FUNCTION: do_copy()
  // This function is automatically called when the .copy() function
  // is called on this class.
  //
  virtual function void do_copy (uvm_object rhs);
    axi_slave_transaction  RHS;
    assert($cast(RHS,rhs));
    // pragma uvmf custom do_copy begin
    super.do_copy(rhs);
    this.AWID = RHS.AWID;
    this.AWADDR = RHS.AWADDR;
    this.AWLEN = RHS.AWLEN;
    this.AWSIZE = RHS.AWSIZE;
    this.AWBURST = RHS.AWBURST;
    this.AWLOCK = RHS.AWLOCK;
    this.AWCACHE = RHS.AWCACHE;
    this.AWQOS = RHS.AWQOS;
    this.AWREGION = RHS.AWREGION;
    this.AWUSER = RHS.AWUSER;
    this.AWPROT = RHS.AWPROT;
    this.AWVALID = RHS.AWVALID;
    this.AWREADY = RHS.AWREADY;
    this.WDATA = RHS.WDATA;
    this.WSTRB = RHS.WSTRB;
    this.WUSER = RHS.WUSER;
    this.WLAST = RHS.WLAST;
    this.BID = RHS.BID;
    this.BRESP = RHS.BRESP;
    this.BUSER = RHS.BUSER;
    this.BVALID = RHS.BVALID;
    this.ARID = RHS.ARID;
    this.ARADDR = RHS.ARADDR;
    this.ARLEN = RHS.ARLEN;
    this.ARSIZE = RHS.ARSIZE;
    this.ARBURST = RHS.ARBURST;
    this.ARCACHE = RHS.ARCACHE;
    this.ARPROT = RHS.ARPROT;
    this.ARQOS = RHS.ARQOS;
    this.ARREGION = RHS.ARREGION;
    this.ARUSER = RHS.ARUSER;
    this.ARLOCK = RHS.ARLOCK;
    this.RID = RHS.RID;
    this.RDATA = RHS.RDATA;
    this.RRESP = RHS.RRESP;
    this.RUSER = RHS.RUSER;
    this.RLAST = RHS.RLAST;
    this.RVALID = RHS.RVALID;
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
    $add_attribute(transaction_view_h,AWID,"AWID");
    $add_attribute(transaction_view_h,AWADDR,"AWADDR");
    $add_attribute(transaction_view_h,AWLEN,"AWLEN");
    $add_attribute(transaction_view_h,AWSIZE,"AWSIZE");
    $add_attribute(transaction_view_h,AWBURST,"AWBURST");
    $add_attribute(transaction_view_h,AWLOCK,"AWLOCK");
    $add_attribute(transaction_view_h,AWCACHE,"AWCACHE");
    $add_attribute(transaction_view_h,AWQOS,"AWQOS");
    $add_attribute(transaction_view_h,AWREGION,"AWREGION");
    $add_attribute(transaction_view_h,AWUSER,"AWUSER");
    $add_attribute(transaction_view_h,AWPROT,"AWPROT");
    $add_attribute(transaction_view_h,AWVALID,"AWVALID");
    $add_attribute(transaction_view_h,AWREADY,"AWREADY");
    $add_attribute(transaction_view_h,WDATA,"WDATA");
    $add_attribute(transaction_view_h,WSTRB,"WSTRB");
    $add_attribute(transaction_view_h,WUSER,"WUSER");
    $add_attribute(transaction_view_h,WLAST,"WLAST");
    $add_attribute(transaction_view_h,BID,"BID");
    $add_attribute(transaction_view_h,BRESP,"BRESP");
    $add_attribute(transaction_view_h,BUSER,"BUSER");
    $add_attribute(transaction_view_h,BVALID,"BVALID");
    $add_attribute(transaction_view_h,ARID,"ARID");
    $add_attribute(transaction_view_h,ARADDR,"ARADDR");
    $add_attribute(transaction_view_h,ARLEN,"ARLEN");
    $add_attribute(transaction_view_h,ARSIZE,"ARSIZE");
    $add_attribute(transaction_view_h,ARBURST,"ARBURST");
    $add_attribute(transaction_view_h,ARCACHE,"ARCACHE");
    $add_attribute(transaction_view_h,ARPROT,"ARPROT");
    $add_attribute(transaction_view_h,ARQOS,"ARQOS");
    $add_attribute(transaction_view_h,ARREGION,"ARREGION");
    $add_attribute(transaction_view_h,ARUSER,"ARUSER");
    $add_attribute(transaction_view_h,ARLOCK,"ARLOCK");
    $add_attribute(transaction_view_h,RID,"RID");
    $add_attribute(transaction_view_h,RDATA,"RDATA");
    $add_attribute(transaction_view_h,RRESP,"RRESP");
    $add_attribute(transaction_view_h,RUSER,"RUSER");
    $add_attribute(transaction_view_h,RLAST,"RLAST");
    $add_attribute(transaction_view_h,RVALID,"RVALID");
    // pragma uvmf custom add_to_wave end
    $end_transaction(transaction_view_h,end_time);
    $free_transaction(transaction_view_h);
    `endif // QUESTA
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

