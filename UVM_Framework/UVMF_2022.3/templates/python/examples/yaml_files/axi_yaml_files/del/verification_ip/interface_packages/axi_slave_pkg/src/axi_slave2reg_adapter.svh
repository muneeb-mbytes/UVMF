//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This file contains the UVM register adapter for the axi_slave interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class axi_slave2reg_adapter #(
      int ADDR_WIDTH = 32,
      int DATA_WIDTH = 32,
      int RESP_WIDTH = 2,
      int ID_WIDTH = 4,
      int STRB_WIDTH = 4,
      int LEN_WIDTH = 8,
      int SIZE_WIDTH = 3,
      int BURST_WIDTH = 2
      ) extends uvm_reg_adapter;

  `uvm_object_param_utils( axi_slave2reg_adapter #(
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

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------
  function new (string name = "axi_slave2reg_adapter" );
    super.new(name);
    // pragma uvmf custom new begin
    // UVMF_CHANGE_ME : Configure the adapter regarding byte enables and provides response.

    // Does the protocol the Agent is modeling support byte enables?
    // 0 = NO
    // 1 = YES
    supports_byte_enable = 0;

    // Does the Agent's Driver provide separate response sequence items?
    // i.e. Does the driver call seq_item_port.put() 
    // and do the sequences call get_response()?
    // 0 = NO
    // 1 = YES
    provides_responses = 0;
    // pragma uvmf custom new end

  endfunction: new

  //--------------------------------------------------------------------
  // reg2bus
  //--------------------------------------------------------------------
  virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);

    axi_slave_transaction #(
                    .ADDR_WIDTH(ADDR_WIDTH),
                    .DATA_WIDTH(DATA_WIDTH),
                    .RESP_WIDTH(RESP_WIDTH),
                    .ID_WIDTH(ID_WIDTH),
                    .STRB_WIDTH(STRB_WIDTH),
                    .LEN_WIDTH(LEN_WIDTH),
                    .SIZE_WIDTH(SIZE_WIDTH),
                    .BURST_WIDTH(BURST_WIDTH)
                    ) trans_h = axi_slave_transaction #(
                             .ADDR_WIDTH(ADDR_WIDTH),
                             .DATA_WIDTH(DATA_WIDTH),
                             .RESP_WIDTH(RESP_WIDTH),
                             .ID_WIDTH(ID_WIDTH),
                             .STRB_WIDTH(STRB_WIDTH),
                             .LEN_WIDTH(LEN_WIDTH),
                             .SIZE_WIDTH(SIZE_WIDTH),
                             .BURST_WIDTH(BURST_WIDTH)
                             )::type_id::create("trans_h");
    
    // pragma uvmf custom reg2bus begin
    // UVMF_CHANGE_ME : Fill in the reg2bus adapter mapping registe fields to protocol fields.

    //Adapt the following for your sequence item type
    // trans_h.op = (rw.kind == UVM_READ) ? WB_READ : WB_WRITE;
    //Copy over address
    // trans_h.addr = rw.addr;
    //Copy over write data
    // trans_h.data = rw.data;

    // pragma uvmf custom reg2bus end
    
    // Return the adapted transaction
    return trans_h;

  endfunction: reg2bus

  //--------------------------------------------------------------------
  // bus2reg
  //--------------------------------------------------------------------
  virtual function void bus2reg(uvm_sequence_item bus_item,
                                ref uvm_reg_bus_op rw);
    axi_slave_transaction #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH),
        .RESP_WIDTH(RESP_WIDTH),
        .ID_WIDTH(ID_WIDTH),
        .STRB_WIDTH(STRB_WIDTH),
        .LEN_WIDTH(LEN_WIDTH),
        .SIZE_WIDTH(SIZE_WIDTH),
        .BURST_WIDTH(BURST_WIDTH)
        ) trans_h;
    if (!$cast(trans_h, bus_item)) begin
      `uvm_fatal("ADAPT","Provided bus_item is not of the correct type")
      return;
    end
    // pragma uvmf custom bus2reg begin
    // UVMF_CHANGE_ME : Fill in the bus2reg adapter mapping protocol fields to register fields.
    //Adapt the following for your sequence item type
    //Copy over instruction type 
    // rw.kind = (trans_h.op == WB_WRITE) ? UVM_WRITE : UVM_READ;
    //Copy over address
    // rw.addr = trans_h.addr;
    //Copy over read data
    // rw.data = trans_h.data;
    //Check for errors on the bus and return UVM_NOT_OK if there is an error
    // rw.status = UVM_IS_OK;
    // pragma uvmf custom bus2reg end

  endfunction: bus2reg

endclass : axi_slave2reg_adapter

// pragma uvmf custom external begin
// pragma uvmf custom external end

