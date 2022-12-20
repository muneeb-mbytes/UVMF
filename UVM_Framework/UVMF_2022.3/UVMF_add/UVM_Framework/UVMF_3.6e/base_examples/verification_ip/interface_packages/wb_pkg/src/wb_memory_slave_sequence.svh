//----------------------------------------------------------------------
//   Copyright 2013 Mentor Graphics Corporation
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//                   Mentor Graphics Inc
//----------------------------------------------------------------------
// Project         : WB interface agent
// Unit            : Sequence library
// File            : wb_memory_slave_sequence.svh
//----------------------------------------------------------------------
// Creation Date   : 05.12.2011
//----------------------------------------------------------------------
// Description: This file contains wb sequence used to model a memory
//    slave on the wb agent.
//
//----------------------------------------------------------------------
//
class wb_memory_slave_sequence extends wb_sequence_base #(wb_transaction);

  // declaration macros
  `uvm_object_utils(wb_memory_slave_sequence)

  // variables  
  bit[WB_DATA_WIDTH-1:0] mem [bit[WB_ADDR_WIDTH-1:0]];

//*****************************************************************
  function new(string name = "");
    super.new(name);
  endfunction: new

//*****************************************************************
  task body();

      forever begin
         req=wb_transaction::type_id::create("req");
         req.op = WB_SLAVE;
         start_item(req);
         finish_item(req);
         @(req.slave_op_started);
         if (req.op == WB_READ) begin
            if ( mem.exists(req.addr)) req.data = mem[req.addr];
            else                      req.data = ~req.addr;
            //req.data = mem[req.addr];
         end else begin
            mem[req.addr] = req.data;
         end
         `uvm_info("wb_slave_sequence",{"Slave transaction:",req.convert2string()}, UVM_MEDIUM)
         ->req.slave_op_complete;
      end

  endtask: body


endclass: wb_memory_slave_sequence
