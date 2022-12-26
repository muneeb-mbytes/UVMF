//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class can be used to provide stimulus when an interface
//              has been configured to run in a responder mode. It
//              will never finish by default, always going back to the driver
//              and driver BFM for the next transaction with which to respond.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class axi_master_responder_sequence #(
      int id_width = 4,
      int len_width = 4,
      int size_width = 3,
      int addr_width = 32,
      int burst_width = 2,
      int data_width = 32,
      int strb_width = 4,
      int resp_width = 2
      )
  extends axi_master_sequence_base #(
      .id_width(id_width),
      .len_width(len_width),
      .size_width(size_width),
      .addr_width(addr_width),
      .burst_width(burst_width),
      .data_width(data_width),
      .strb_width(strb_width),
      .resp_width(resp_width)
      );

  `uvm_object_param_utils( axi_master_responder_sequence #(
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

  function new(string name = "axi_master_responder_sequence");
    super.new(name);
  endfunction

  task body();
    req=axi_master_transaction#(
                .id_width(id_width),
                .len_width(len_width),
                .size_width(size_width),
                .addr_width(addr_width),
                .burst_width(burst_width),
                .data_width(data_width),
                .strb_width(strb_width),
                .resp_width(resp_width)
                )::type_id::create("req");
    forever begin
      start_item(req);
      finish_item(req);
      // pragma uvmf custom body begin
      // UVMF_CHANGE_ME : Do something here with the resulting req item.  The
      // finish_item() call above will block until the req transaction is ready
      // to be handled by the responder sequence.
      // If this was an item that required a response, the expectation is
      // that the response should be populated within this transaction now.
      `uvm_info("SEQ",$sformatf("Processed txn: %s",req.convert2string()),UVM_HIGH)
      // pragma uvmf custom body end
    end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

