//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This file contains macros used with the axi_m package.
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
//      the axi_m_configuration class.
//
  `define axi_m_CONFIGURATION_STRUCT \
typedef struct packed  { \
     uvmf_active_passive_t active_passive; \
     uvmf_initiator_responder_t initiator_responder; \
     } axi_m_configuration_s;

  `define axi_m_CONFIGURATION_TO_STRUCT_FUNCTION \
  virtual function axi_m_configuration_s to_struct();\
    axi_m_configuration_struct = \
       {\
       this.active_passive,\
       this.initiator_responder\
       };\
    return ( axi_m_configuration_struct );\
  endfunction

  `define axi_m_CONFIGURATION_FROM_STRUCT_FUNCTION \
  virtual function void from_struct(axi_m_configuration_s axi_m_configuration_struct);\
      {\
      this.active_passive,\
      this.initiator_responder  \
      } = axi_m_configuration_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_monitor_struct
//      and from_monitor_struct methods of the axi_m_transaction class.
//
  `define axi_m_MONITOR_STRUCT typedef struct packed  { \
  bit awvalid ; \
  bit awready ; \
  bit [AW_WIDTH-1:0] awaddr ; \
  bit awsize ; \
  bit awburst ; \
  bit awcache ; \
  bit awprot ; \
  bit [X-1:0] awid ; \
  bit [LEN-1:0] awlen ; \
  bit awlock ; \
  bit awqos ; \
  bit awregion ; \
  bit [X-1:0] awuser ; \
  bit wvalid ; \
  bit wready ; \
  bit wlast ; \
  bit [DATA_WIDTH-1:0] wdata ; \
  bit [(DATA_WIDTH/8)-1:0] wstrb ; \
  bit [X-1:0] wid ; \
  bit [X-1:0] wuser ; \
  bit bwvalid ; \
  bit bwready ; \
  bit bresp ; \
  bit [X-1:0] bid ; \
  bit [X-1:0] buser ; \
  bit arvalid ; \
  bit aready ; \
  bit [AW_WIDTH-1:0] araddr ; \
  bit arsize ; \
  bit arburst ; \
  bit arcache ; \
  bit arprot ; \
  bit [X-1:0] arid ; \
  bit [LEN-1:0] arlen ; \
  bit arlock ; \
  bit arqos ; \
  bit aregion ; \
  bit [X-1:0] aruser ; \
  bit rvalid ; \
  bit rready ; \
  bit rlast ; \
  bit [DATA_WIDTH-1:0] rdata ; \
  bit [X-1:0] rid ; \
  bit [X-1:0] ruser ; \
  bit rresp ; \
     } axi_m_monitor_s;

  `define axi_m_TO_MONITOR_STRUCT_FUNCTION \
  virtual function axi_m_monitor_s to_monitor_struct();\
    axi_m_monitor_struct = \
            { \
            this.awvalid , \
            this.awready , \
            this.awaddr , \
            this.awsize , \
            this.awburst , \
            this.awcache , \
            this.awprot , \
            this.awid , \
            this.awlen , \
            this.awlock , \
            this.awqos , \
            this.awregion , \
            this.awuser , \
            this.wvalid , \
            this.wready , \
            this.wlast , \
            this.wdata , \
            this.wstrb , \
            this.wid , \
            this.wuser , \
            this.bwvalid , \
            this.bwready , \
            this.bresp , \
            this.bid , \
            this.buser , \
            this.arvalid , \
            this.aready , \
            this.araddr , \
            this.arsize , \
            this.arburst , \
            this.arcache , \
            this.arprot , \
            this.arid , \
            this.arlen , \
            this.arlock , \
            this.arqos , \
            this.aregion , \
            this.aruser , \
            this.rvalid , \
            this.rready , \
            this.rlast , \
            this.rdata , \
            this.rid , \
            this.ruser , \
            this.rresp  \
            };\
    return ( axi_m_monitor_struct);\
  endfunction\

  `define axi_m_FROM_MONITOR_STRUCT_FUNCTION \
  virtual function void from_monitor_struct(axi_m_monitor_s axi_m_monitor_struct);\
            {\
            this.awvalid , \
            this.awready , \
            this.awaddr , \
            this.awsize , \
            this.awburst , \
            this.awcache , \
            this.awprot , \
            this.awid , \
            this.awlen , \
            this.awlock , \
            this.awqos , \
            this.awregion , \
            this.awuser , \
            this.wvalid , \
            this.wready , \
            this.wlast , \
            this.wdata , \
            this.wstrb , \
            this.wid , \
            this.wuser , \
            this.bwvalid , \
            this.bwready , \
            this.bresp , \
            this.bid , \
            this.buser , \
            this.arvalid , \
            this.aready , \
            this.araddr , \
            this.arsize , \
            this.arburst , \
            this.arcache , \
            this.arprot , \
            this.arid , \
            this.arlen , \
            this.arlock , \
            this.arqos , \
            this.aregion , \
            this.aruser , \
            this.rvalid , \
            this.rready , \
            this.rlast , \
            this.rdata , \
            this.rid , \
            this.ruser , \
            this.rresp  \
            } = axi_m_monitor_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_initiator_struct
//      and from_initiator_struct methods of the axi_m_transaction class.
//      Also update the comments in the driver BFM.
//
  `define axi_m_INITIATOR_STRUCT typedef struct packed  { \
  bit awvalid ; \
  bit awready ; \
  bit [AW_WIDTH-1:0] awaddr ; \
  bit awsize ; \
  bit awburst ; \
  bit awcache ; \
  bit awprot ; \
  bit [X-1:0] awid ; \
  bit [LEN-1:0] awlen ; \
  bit awlock ; \
  bit awqos ; \
  bit awregion ; \
  bit [X-1:0] awuser ; \
  bit wvalid ; \
  bit wready ; \
  bit wlast ; \
  bit [DATA_WIDTH-1:0] wdata ; \
  bit [(DATA_WIDTH/8)-1:0] wstrb ; \
  bit [X-1:0] wid ; \
  bit [X-1:0] wuser ; \
  bit bwvalid ; \
  bit bwready ; \
  bit bresp ; \
  bit [X-1:0] bid ; \
  bit [X-1:0] buser ; \
  bit arvalid ; \
  bit aready ; \
  bit [AW_WIDTH-1:0] araddr ; \
  bit arsize ; \
  bit arburst ; \
  bit arcache ; \
  bit arprot ; \
  bit [X-1:0] arid ; \
  bit [LEN-1:0] arlen ; \
  bit arlock ; \
  bit arqos ; \
  bit aregion ; \
  bit [X-1:0] aruser ; \
  bit rvalid ; \
  bit rready ; \
  bit rlast ; \
  bit [DATA_WIDTH-1:0] rdata ; \
  bit [X-1:0] rid ; \
  bit [X-1:0] ruser ; \
  bit rresp ; \
     } axi_m_initiator_s;

  `define axi_m_TO_INITIATOR_STRUCT_FUNCTION \
  virtual function axi_m_initiator_s to_initiator_struct();\
    axi_m_initiator_struct = \
           {\
           this.awvalid , \
           this.awready , \
           this.awaddr , \
           this.awsize , \
           this.awburst , \
           this.awcache , \
           this.awprot , \
           this.awid , \
           this.awlen , \
           this.awlock , \
           this.awqos , \
           this.awregion , \
           this.awuser , \
           this.wvalid , \
           this.wready , \
           this.wlast , \
           this.wdata , \
           this.wstrb , \
           this.wid , \
           this.wuser , \
           this.bwvalid , \
           this.bwready , \
           this.bresp , \
           this.bid , \
           this.buser , \
           this.arvalid , \
           this.aready , \
           this.araddr , \
           this.arsize , \
           this.arburst , \
           this.arcache , \
           this.arprot , \
           this.arid , \
           this.arlen , \
           this.arlock , \
           this.arqos , \
           this.aregion , \
           this.aruser , \
           this.rvalid , \
           this.rready , \
           this.rlast , \
           this.rdata , \
           this.rid , \
           this.ruser , \
           this.rresp  \
           };\
    return ( axi_m_initiator_struct);\
  endfunction

  `define axi_m_FROM_INITIATOR_STRUCT_FUNCTION \
  virtual function void from_initiator_struct(axi_m_initiator_s axi_m_initiator_struct);\
           {\
           this.awvalid , \
           this.awready , \
           this.awaddr , \
           this.awsize , \
           this.awburst , \
           this.awcache , \
           this.awprot , \
           this.awid , \
           this.awlen , \
           this.awlock , \
           this.awqos , \
           this.awregion , \
           this.awuser , \
           this.wvalid , \
           this.wready , \
           this.wlast , \
           this.wdata , \
           this.wstrb , \
           this.wid , \
           this.wuser , \
           this.bwvalid , \
           this.bwready , \
           this.bresp , \
           this.bid , \
           this.buser , \
           this.arvalid , \
           this.aready , \
           this.araddr , \
           this.arsize , \
           this.arburst , \
           this.arcache , \
           this.arprot , \
           this.arid , \
           this.arlen , \
           this.arlock , \
           this.arqos , \
           this.aregion , \
           this.aruser , \
           this.rvalid , \
           this.rready , \
           this.rlast , \
           this.rdata , \
           this.rid , \
           this.ruser , \
           this.rresp  \
           } = axi_m_initiator_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_responder_struct
//      and from_responder_struct methods of the axi_m_transaction class.
//      Also update the comments in the driver BFM.
//
  `define axi_m_RESPONDER_STRUCT typedef struct packed  { \
  bit awvalid ; \
  bit awready ; \
  bit [AW_WIDTH-1:0] awaddr ; \
  bit awsize ; \
  bit awburst ; \
  bit awcache ; \
  bit awprot ; \
  bit [X-1:0] awid ; \
  bit [LEN-1:0] awlen ; \
  bit awlock ; \
  bit awqos ; \
  bit awregion ; \
  bit [X-1:0] awuser ; \
  bit wvalid ; \
  bit wready ; \
  bit wlast ; \
  bit [DATA_WIDTH-1:0] wdata ; \
  bit [(DATA_WIDTH/8)-1:0] wstrb ; \
  bit [X-1:0] wid ; \
  bit [X-1:0] wuser ; \
  bit bwvalid ; \
  bit bwready ; \
  bit bresp ; \
  bit [X-1:0] bid ; \
  bit [X-1:0] buser ; \
  bit arvalid ; \
  bit aready ; \
  bit [AW_WIDTH-1:0] araddr ; \
  bit arsize ; \
  bit arburst ; \
  bit arcache ; \
  bit arprot ; \
  bit [X-1:0] arid ; \
  bit [LEN-1:0] arlen ; \
  bit arlock ; \
  bit arqos ; \
  bit aregion ; \
  bit [X-1:0] aruser ; \
  bit rvalid ; \
  bit rready ; \
  bit rlast ; \
  bit [DATA_WIDTH-1:0] rdata ; \
  bit [X-1:0] rid ; \
  bit [X-1:0] ruser ; \
  bit rresp ; \
     } axi_m_responder_s;

  `define axi_m_TO_RESPONDER_STRUCT_FUNCTION \
  virtual function axi_m_responder_s to_responder_struct();\
    axi_m_responder_struct = \
           {\
           this.awvalid , \
           this.awready , \
           this.awaddr , \
           this.awsize , \
           this.awburst , \
           this.awcache , \
           this.awprot , \
           this.awid , \
           this.awlen , \
           this.awlock , \
           this.awqos , \
           this.awregion , \
           this.awuser , \
           this.wvalid , \
           this.wready , \
           this.wlast , \
           this.wdata , \
           this.wstrb , \
           this.wid , \
           this.wuser , \
           this.bwvalid , \
           this.bwready , \
           this.bresp , \
           this.bid , \
           this.buser , \
           this.arvalid , \
           this.aready , \
           this.araddr , \
           this.arsize , \
           this.arburst , \
           this.arcache , \
           this.arprot , \
           this.arid , \
           this.arlen , \
           this.arlock , \
           this.arqos , \
           this.aregion , \
           this.aruser , \
           this.rvalid , \
           this.rready , \
           this.rlast , \
           this.rdata , \
           this.rid , \
           this.ruser , \
           this.rresp  \
           };\
    return ( axi_m_responder_struct);\
  endfunction

  `define axi_m_FROM_RESPONDER_STRUCT_FUNCTION \
  virtual function void from_responder_struct(axi_m_responder_s axi_m_responder_struct);\
           {\
           this.awvalid , \
           this.awready , \
           this.awaddr , \
           this.awsize , \
           this.awburst , \
           this.awcache , \
           this.awprot , \
           this.awid , \
           this.awlen , \
           this.awlock , \
           this.awqos , \
           this.awregion , \
           this.awuser , \
           this.wvalid , \
           this.wready , \
           this.wlast , \
           this.wdata , \
           this.wstrb , \
           this.wid , \
           this.wuser , \
           this.bwvalid , \
           this.bwready , \
           this.bresp , \
           this.bid , \
           this.buser , \
           this.arvalid , \
           this.aready , \
           this.araddr , \
           this.arsize , \
           this.arburst , \
           this.arcache , \
           this.arprot , \
           this.arid , \
           this.arlen , \
           this.arlock , \
           this.arqos , \
           this.aregion , \
           this.aruser , \
           this.rvalid , \
           this.rready , \
           this.rlast , \
           this.rdata , \
           this.rid , \
           this.ruser , \
           this.rresp  \
           } = axi_m_responder_struct;\
  endfunction
// pragma uvmf custom additional begin
// pragma uvmf custom additional end
