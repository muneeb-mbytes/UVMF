//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class defines the variables required for an wb_slave
//    transaction.  Class variables to be displayed in waveform transaction
//    viewing are added to the transaction viewing stream in the add_to_wave
//    function.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class wb_slave_transaction #(
      bit ADDR_WIDTH = 32,
      bit DATA_WIDTH = 32
      ) extends uvmf_transaction_base;

  `uvm_object_param_utils( wb_slave_transaction #(
                           ADDR_WIDTH,
                           DATA_WIDTH
                           ))

  bit[ADDR_WIDTH-1:0] adr_i ;
  rand bit[DATA_WIDTH-1:0] dat_o ;
  bit[DATA_WIDTH-1:0] dat_i ;
  bit we_i ;
  bit[7:0] sel_i ;
  bit[(DATA_WIDTH/8)-1:0] stb_i ;
  bit ack_o ;
  bit cyc_i ;

  //Constraints for the transaction variables:

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

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
    return $sformatf("adr_i:0x%x dat_o:0x%x dat_i:0x%x we_i:0x%x sel_i:0x%x stb_i:0x%x ack_o:0x%x cyc_i:0x%x ",adr_i,dat_o,dat_i,we_i,sel_i,stb_i,ack_o,cyc_i);
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
    wb_slave_transaction #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH)
        ) RHS;
    if (!$cast(RHS,rhs)) return 0;
    // pragma uvmf custom do_compare begin
    // UVMF_CHANGE_ME : Eliminate comparison of variables not to be used for compare
    return (super.do_compare(rhs,comparer)
            &&(this.adr_i == RHS.adr_i)
            &&(this.dat_o == RHS.dat_o)
            &&(this.dat_i == RHS.dat_i)
            &&(this.we_i == RHS.we_i)
            &&(this.sel_i == RHS.sel_i)
            &&(this.stb_i == RHS.stb_i)
            &&(this.ack_o == RHS.ack_o)
            &&(this.cyc_i == RHS.cyc_i)
            );
    // pragma uvmf custom do_compare end
  endfunction

  //*******************************************************************
  // FUNCTION: do_copy()
  // This function is automatically called when the .copy() function
  // is called on this class.
  //
  virtual function void do_copy (uvm_object rhs);
    wb_slave_transaction #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH)
        ) RHS;
    assert($cast(RHS,rhs));
    // pragma uvmf custom do_copy begin
    super.do_copy(rhs);
    this.adr_i = RHS.adr_i;
    this.dat_o = RHS.dat_o;
    this.dat_i = RHS.dat_i;
    this.we_i = RHS.we_i;
    this.sel_i = RHS.sel_i;
    this.stb_i = RHS.stb_i;
    this.ack_o = RHS.ack_o;
    this.cyc_i = RHS.cyc_i;
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
      transaction_view_h = $begin_transaction(transaction_viewing_stream_h,"wb_slave_transaction",start_time);
    end
    super.add_to_wave(transaction_view_h);
    // pragma uvmf custom add_to_wave begin
    // UVMF_CHANGE_ME : Color can be applied to transaction entries based on content, example below
    // case()
    //   1 : $add_color(transaction_view_h,"red");
    //   default : $add_color(transaction_view_h,"grey");
    // endcase
    // UVMF_CHANGE_ME : Eliminate transaction variables not wanted in transaction viewing in the waveform viewer
    $add_attribute(transaction_view_h,adr_i,"adr_i");
    $add_attribute(transaction_view_h,dat_o,"dat_o");
    $add_attribute(transaction_view_h,dat_i,"dat_i");
    $add_attribute(transaction_view_h,we_i,"we_i");
    $add_attribute(transaction_view_h,sel_i,"sel_i");
    $add_attribute(transaction_view_h,stb_i,"stb_i");
    $add_attribute(transaction_view_h,ack_o,"ack_o");
    $add_attribute(transaction_view_h,cyc_i,"cyc_i");
    // pragma uvmf custom add_to_wave end
    $end_transaction(transaction_view_h,end_time);
    $free_transaction(transaction_view_h);
    `endif // QUESTA
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

