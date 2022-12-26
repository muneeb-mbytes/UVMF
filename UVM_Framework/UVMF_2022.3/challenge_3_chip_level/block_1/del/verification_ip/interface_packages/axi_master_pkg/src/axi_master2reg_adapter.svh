//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This file contains the UVM register adapter for the axi_master interface.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class axi_master2reg_adapter #(
      int id_width = 4,
      int len_width = 4,
      int size_width = 3,
      int addr_width = 32,
      int burst_width = 2,
      int data_width = 32,
      int strb_width = 4,
      int resp_width = 2
      ) extends uvm_reg_adapter;

  `uvm_object_param_utils( axi_master2reg_adapter #(
                           id_width,
                           len_width,
                           size_width,
                           addr_width,
                           burst_width,
                           data_width,
                           strb_width,
                           resp_width
                           ))
  
  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  //--------------------------------------------------------------------
  // new
  //--------------------------------------------------------------------
  function new (string name = "axi_master2reg_adapter" );
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

    axi_master_transaction #(
                    .id_width(id_width),
                    .len_width(len_width),
                    .size_width(size_width),
                    .addr_width(addr_width),
                    .burst_width(burst_width),
                    .data_width(data_width),
                    .strb_width(strb_width),
                    .resp_width(resp_width)
                    ) trans_h = axi_master_transaction #(
                             .id_width(id_width),
                             .len_width(len_width),
                             .size_width(size_width),
                             .addr_width(addr_width),
                             .burst_width(burst_width),
                             .data_width(data_width),
                             .strb_width(strb_width),
                             .resp_width(resp_width)
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
    axi_master_transaction #(
        .id_width(id_width),
        .len_width(len_width),
        .size_width(size_width),
        .addr_width(addr_width),
        .burst_width(burst_width),
        .data_width(data_width),
        .strb_width(strb_width),
        .resp_width(resp_width)
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

endclass : axi_master2reg_adapter

// pragma uvmf custom external begin
// pragma uvmf custom external end

