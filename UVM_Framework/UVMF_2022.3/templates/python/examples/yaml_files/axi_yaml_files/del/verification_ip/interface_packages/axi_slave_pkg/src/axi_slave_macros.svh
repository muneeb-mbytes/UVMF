//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This file contains macros used with the axi_slave package.
//   These macros include packed struct definitions.  These structs are
//   used to pass data between classes, hvl, and BFM's, hdl.  Use of 
//   structs are more efficient and simpler to modify.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_struct
//      and from_struct methods defined in the macros below that are used in  
//      the axi_slave_configuration class.
//
  `define axi_slave_CONFIGURATION_STRUCT \
typedef struct packed  { \
     uvmf_active_passive_t active_passive; \
     uvmf_initiator_responder_t initiator_responder; \
     } axi_slave_configuration_s;

  `define axi_slave_CONFIGURATION_TO_STRUCT_FUNCTION \
  virtual function axi_slave_configuration_s to_struct();\
    axi_slave_configuration_struct = \
       {\
       this.active_passive,\
       this.initiator_responder\
       };\
    return ( axi_slave_configuration_struct );\
  endfunction

  `define axi_slave_CONFIGURATION_FROM_STRUCT_FUNCTION \
  virtual function void from_struct(axi_slave_configuration_s axi_slave_configuration_struct);\
      {\
      this.active_passive,\
      this.initiator_responder  \
      } = axi_slave_configuration_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_monitor_struct
//      and from_monitor_struct methods of the axi_slave_transaction class.
//
  `define axi_slave_MONITOR_STRUCT typedef struct packed  { \
  bit awvalid ; \
  bit awready ; \
  bit [ID_WIDTH-1:0] awid ; \
  bit [LEN_WIDTH-1:0] awlen ; \
  bit [SIZE_WIDTH-1:0] awsize ; \
  bit [ADDR_WIDTH-1:0] awaddr ; \
  bit [BURST_WIDTH-1:0] awburst ; \
  bit wvalid ; \
  bit wready ; \
  bit [ID_WIDTH-1:0] wid ; \
  bit [DATA_WIDTH-1:0] wdata ; \
  bit [STRB_WIDTH-1:0] wstrb ; \
  bit wlast ; \
  bit bready ; \
  bit bvalid ; \
  bit bid ; \
  bit [RESP_WIDTH-1:0] bresp ; \
  bit arvalid ; \
  bit arready ; \
  bit [ID_WIDTH-1:0] arid ; \
  bit [LEN_WIDTH-1:0] arlen ; \
  bit [SIZE_WIDTH-1:0] arsize ; \
  bit [ADDR_WIDTH-1:0] araddr ; \
  bit [BURST_WIDTH-1:0] arburst ; \
  bit rvalid ; \
  bit rready ; \
  bit [ID_WIDTH-1:0] rid ; \
  bit [DATA_WIDTH-1:0] rdata ; \
  bit rlast ; \
  bit [RESP_WIDTH-1:0] rresp ; \
     } axi_slave_monitor_s;

  `define axi_slave_TO_MONITOR_STRUCT_FUNCTION \
  virtual function axi_slave_monitor_s to_monitor_struct();\
    axi_slave_monitor_struct = \
            { \
            this.awvalid , \
            this.awready , \
            this.awid , \
            this.awlen , \
            this.awsize , \
            this.awaddr , \
            this.awburst , \
            this.wvalid , \
            this.wready , \
            this.wid , \
            this.wdata , \
            this.wstrb , \
            this.wlast , \
            this.bready , \
            this.bvalid , \
            this.bid , \
            this.bresp , \
            this.arvalid , \
            this.arready , \
            this.arid , \
            this.arlen , \
            this.arsize , \
            this.araddr , \
            this.arburst , \
            this.rvalid , \
            this.rready , \
            this.rid , \
            this.rdata , \
            this.rlast , \
            this.rresp  \
            };\
    return ( axi_slave_monitor_struct);\
  endfunction\

  `define axi_slave_FROM_MONITOR_STRUCT_FUNCTION \
  virtual function void from_monitor_struct(axi_slave_monitor_s axi_slave_monitor_struct);\
            {\
            this.awvalid , \
            this.awready , \
            this.awid , \
            this.awlen , \
            this.awsize , \
            this.awaddr , \
            this.awburst , \
            this.wvalid , \
            this.wready , \
            this.wid , \
            this.wdata , \
            this.wstrb , \
            this.wlast , \
            this.bready , \
            this.bvalid , \
            this.bid , \
            this.bresp , \
            this.arvalid , \
            this.arready , \
            this.arid , \
            this.arlen , \
            this.arsize , \
            this.araddr , \
            this.arburst , \
            this.rvalid , \
            this.rready , \
            this.rid , \
            this.rdata , \
            this.rlast , \
            this.rresp  \
            } = axi_slave_monitor_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_initiator_struct
//      and from_initiator_struct methods of the axi_slave_transaction class.
//      Also update the comments in the driver BFM.
//
  `define axi_slave_INITIATOR_STRUCT typedef struct packed  { \
  bit awvalid ; \
  bit awready ; \
  bit [ID_WIDTH-1:0] awid ; \
  bit [LEN_WIDTH-1:0] awlen ; \
  bit [SIZE_WIDTH-1:0] awsize ; \
  bit [ADDR_WIDTH-1:0] awaddr ; \
  bit [BURST_WIDTH-1:0] awburst ; \
  bit wvalid ; \
  bit wready ; \
  bit [ID_WIDTH-1:0] wid ; \
  bit [DATA_WIDTH-1:0] wdata ; \
  bit [STRB_WIDTH-1:0] wstrb ; \
  bit wlast ; \
  bit bready ; \
  bit bvalid ; \
  bit bid ; \
  bit [RESP_WIDTH-1:0] bresp ; \
  bit arvalid ; \
  bit arready ; \
  bit [ID_WIDTH-1:0] arid ; \
  bit [LEN_WIDTH-1:0] arlen ; \
  bit [SIZE_WIDTH-1:0] arsize ; \
  bit [ADDR_WIDTH-1:0] araddr ; \
  bit [BURST_WIDTH-1:0] arburst ; \
  bit rvalid ; \
  bit rready ; \
  bit [ID_WIDTH-1:0] rid ; \
  bit [DATA_WIDTH-1:0] rdata ; \
  bit rlast ; \
  bit [RESP_WIDTH-1:0] rresp ; \
     } axi_slave_initiator_s;

  `define axi_slave_TO_INITIATOR_STRUCT_FUNCTION \
  virtual function axi_slave_initiator_s to_initiator_struct();\
    axi_slave_initiator_struct = \
           {\
           this.awvalid , \
           this.awready , \
           this.awid , \
           this.awlen , \
           this.awsize , \
           this.awaddr , \
           this.awburst , \
           this.wvalid , \
           this.wready , \
           this.wid , \
           this.wdata , \
           this.wstrb , \
           this.wlast , \
           this.bready , \
           this.bvalid , \
           this.bid , \
           this.bresp , \
           this.arvalid , \
           this.arready , \
           this.arid , \
           this.arlen , \
           this.arsize , \
           this.araddr , \
           this.arburst , \
           this.rvalid , \
           this.rready , \
           this.rid , \
           this.rdata , \
           this.rlast , \
           this.rresp  \
           };\
    return ( axi_slave_initiator_struct);\
  endfunction

  `define axi_slave_FROM_INITIATOR_STRUCT_FUNCTION \
  virtual function void from_initiator_struct(axi_slave_initiator_s axi_slave_initiator_struct);\
           {\
           this.awvalid , \
           this.awready , \
           this.awid , \
           this.awlen , \
           this.awsize , \
           this.awaddr , \
           this.awburst , \
           this.wvalid , \
           this.wready , \
           this.wid , \
           this.wdata , \
           this.wstrb , \
           this.wlast , \
           this.bready , \
           this.bvalid , \
           this.bid , \
           this.bresp , \
           this.arvalid , \
           this.arready , \
           this.arid , \
           this.arlen , \
           this.arsize , \
           this.araddr , \
           this.arburst , \
           this.rvalid , \
           this.rready , \
           this.rid , \
           this.rdata , \
           this.rlast , \
           this.rresp  \
           } = axi_slave_initiator_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_responder_struct
//      and from_responder_struct methods of the axi_slave_transaction class.
//      Also update the comments in the driver BFM.
//
  `define axi_slave_RESPONDER_STRUCT typedef struct packed  { \
  bit awvalid ; \
  bit awready ; \
  bit [ID_WIDTH-1:0] awid ; \
  bit [LEN_WIDTH-1:0] awlen ; \
  bit [SIZE_WIDTH-1:0] awsize ; \
  bit [ADDR_WIDTH-1:0] awaddr ; \
  bit [BURST_WIDTH-1:0] awburst ; \
  bit wvalid ; \
  bit wready ; \
  bit [ID_WIDTH-1:0] wid ; \
  bit [DATA_WIDTH-1:0] wdata ; \
  bit [STRB_WIDTH-1:0] wstrb ; \
  bit wlast ; \
  bit bready ; \
  bit bvalid ; \
  bit bid ; \
  bit [RESP_WIDTH-1:0] bresp ; \
  bit arvalid ; \
  bit arready ; \
  bit [ID_WIDTH-1:0] arid ; \
  bit [LEN_WIDTH-1:0] arlen ; \
  bit [SIZE_WIDTH-1:0] arsize ; \
  bit [ADDR_WIDTH-1:0] araddr ; \
  bit [BURST_WIDTH-1:0] arburst ; \
  bit rvalid ; \
  bit rready ; \
  bit [ID_WIDTH-1:0] rid ; \
  bit [DATA_WIDTH-1:0] rdata ; \
  bit rlast ; \
  bit [RESP_WIDTH-1:0] rresp ; \
     } axi_slave_responder_s;

  `define axi_slave_TO_RESPONDER_STRUCT_FUNCTION \
  virtual function axi_slave_responder_s to_responder_struct();\
    axi_slave_responder_struct = \
           {\
           this.awvalid , \
           this.awready , \
           this.awid , \
           this.awlen , \
           this.awsize , \
           this.awaddr , \
           this.awburst , \
           this.wvalid , \
           this.wready , \
           this.wid , \
           this.wdata , \
           this.wstrb , \
           this.wlast , \
           this.bready , \
           this.bvalid , \
           this.bid , \
           this.bresp , \
           this.arvalid , \
           this.arready , \
           this.arid , \
           this.arlen , \
           this.arsize , \
           this.araddr , \
           this.arburst , \
           this.rvalid , \
           this.rready , \
           this.rid , \
           this.rdata , \
           this.rlast , \
           this.rresp  \
           };\
    return ( axi_slave_responder_struct);\
  endfunction

  `define axi_slave_FROM_RESPONDER_STRUCT_FUNCTION \
  virtual function void from_responder_struct(axi_slave_responder_s axi_slave_responder_struct);\
           {\
           this.awvalid , \
           this.awready , \
           this.awid , \
           this.awlen , \
           this.awsize , \
           this.awaddr , \
           this.awburst , \
           this.wvalid , \
           this.wready , \
           this.wid , \
           this.wdata , \
           this.wstrb , \
           this.wlast , \
           this.bready , \
           this.bvalid , \
           this.bid , \
           this.bresp , \
           this.arvalid , \
           this.arready , \
           this.arid , \
           this.arlen , \
           this.arsize , \
           this.araddr , \
           this.arburst , \
           this.rvalid , \
           this.rready , \
           this.rid , \
           this.rdata , \
           this.rlast , \
           this.rresp  \
           } = axi_slave_responder_struct;\
  endfunction
// pragma uvmf custom additional begin
// pragma uvmf custom additional end
