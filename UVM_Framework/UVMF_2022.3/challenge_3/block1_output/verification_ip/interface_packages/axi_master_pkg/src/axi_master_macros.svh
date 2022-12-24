//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This file contains macros used with the axi_master package.
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
//      the axi_master_configuration class.
//
  `define axi_master_CONFIGURATION_STRUCT \
typedef struct packed  { \
     int no_of_slaves;\
     bit has_coverage;\
     uvmf_active_passive_t active_passive; \
     uvmf_initiator_responder_t initiator_responder; \
     } axi_master_configuration_s;

  `define axi_master_CONFIGURATION_TO_STRUCT_FUNCTION \
  virtual function axi_master_configuration_s to_struct();\
    axi_master_configuration_struct = \
       {\
       this.no_of_slaves,\
       this.has_coverage,\
       this.active_passive,\
       this.initiator_responder\
       };\
    return ( axi_master_configuration_struct );\
  endfunction

  `define axi_master_CONFIGURATION_FROM_STRUCT_FUNCTION \
  virtual function void from_struct(axi_master_configuration_s axi_master_configuration_struct);\
      {\
      this.no_of_slaves,\
      this.has_coverage,\
      this.active_passive,\
      this.initiator_responder  \
      } = axi_master_configuration_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_monitor_struct
//      and from_monitor_struct methods of the axi_master_transaction class.
//
  `define axi_master_MONITOR_STRUCT typedef struct packed  { \
  bit AWID ; \
  bit AWADDR ; \
  bit AWLEN ; \
  bit AWSIZE ; \
  bit AWBURST ; \
  bit AWLOCK ; \
  bit AWCACHE ; \
  bit AWQOS ; \
  bit AWREGION ; \
  bit AWUSER ; \
  bit AWPROT ; \
  bit AWVALID ; \
  bit AWREADY ; \
  bit WDATA ; \
  bit WSTRB ; \
  bit WUSER ; \
  bit WLAST ; \
  bit BID ; \
  bit BRESP ; \
  bit BUSER ; \
  bit BVALID ; \
  bit ARID ; \
  bit ARADDR ; \
  bit ARLEN ; \
  bit ARSIZE ; \
  bit ARBURST ; \
  bit ARCACHE ; \
  bit ARPROT ; \
  bit ARQOS ; \
  bit ARREGION ; \
  bit ARUSER ; \
  bit ARLOCK ; \
  bit RID ; \
  bit RDATA ; \
  bit RRESP ; \
  bit RUSER ; \
  bit RLAST ; \
  bit RVALID ; \
     } axi_master_monitor_s;

  `define axi_master_TO_MONITOR_STRUCT_FUNCTION \
  virtual function axi_master_monitor_s to_monitor_struct();\
    axi_master_monitor_struct = \
            { \
            this.AWID , \
            this.AWADDR , \
            this.AWLEN , \
            this.AWSIZE , \
            this.AWBURST , \
            this.AWLOCK , \
            this.AWCACHE , \
            this.AWQOS , \
            this.AWREGION , \
            this.AWUSER , \
            this.AWPROT , \
            this.AWVALID , \
            this.AWREADY , \
            this.WDATA , \
            this.WSTRB , \
            this.WUSER , \
            this.WLAST , \
            this.BID , \
            this.BRESP , \
            this.BUSER , \
            this.BVALID , \
            this.ARID , \
            this.ARADDR , \
            this.ARLEN , \
            this.ARSIZE , \
            this.ARBURST , \
            this.ARCACHE , \
            this.ARPROT , \
            this.ARQOS , \
            this.ARREGION , \
            this.ARUSER , \
            this.ARLOCK , \
            this.RID , \
            this.RDATA , \
            this.RRESP , \
            this.RUSER , \
            this.RLAST , \
            this.RVALID  \
            };\
    return ( axi_master_monitor_struct);\
  endfunction\

  `define axi_master_FROM_MONITOR_STRUCT_FUNCTION \
  virtual function void from_monitor_struct(axi_master_monitor_s axi_master_monitor_struct);\
            {\
            this.AWID , \
            this.AWADDR , \
            this.AWLEN , \
            this.AWSIZE , \
            this.AWBURST , \
            this.AWLOCK , \
            this.AWCACHE , \
            this.AWQOS , \
            this.AWREGION , \
            this.AWUSER , \
            this.AWPROT , \
            this.AWVALID , \
            this.AWREADY , \
            this.WDATA , \
            this.WSTRB , \
            this.WUSER , \
            this.WLAST , \
            this.BID , \
            this.BRESP , \
            this.BUSER , \
            this.BVALID , \
            this.ARID , \
            this.ARADDR , \
            this.ARLEN , \
            this.ARSIZE , \
            this.ARBURST , \
            this.ARCACHE , \
            this.ARPROT , \
            this.ARQOS , \
            this.ARREGION , \
            this.ARUSER , \
            this.ARLOCK , \
            this.RID , \
            this.RDATA , \
            this.RRESP , \
            this.RUSER , \
            this.RLAST , \
            this.RVALID  \
            } = axi_master_monitor_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_initiator_struct
//      and from_initiator_struct methods of the axi_master_transaction class.
//      Also update the comments in the driver BFM.
//
  `define axi_master_INITIATOR_STRUCT typedef struct packed  { \
  bit AWID ; \
  bit AWADDR ; \
  bit AWLEN ; \
  bit AWSIZE ; \
  bit AWBURST ; \
  bit AWLOCK ; \
  bit AWCACHE ; \
  bit AWQOS ; \
  bit AWREGION ; \
  bit AWUSER ; \
  bit AWPROT ; \
  bit AWVALID ; \
  bit AWREADY ; \
  bit WDATA ; \
  bit WSTRB ; \
  bit WUSER ; \
  bit WLAST ; \
  bit BID ; \
  bit BRESP ; \
  bit BUSER ; \
  bit BVALID ; \
  bit ARID ; \
  bit ARADDR ; \
  bit ARLEN ; \
  bit ARSIZE ; \
  bit ARBURST ; \
  bit ARCACHE ; \
  bit ARPROT ; \
  bit ARQOS ; \
  bit ARREGION ; \
  bit ARUSER ; \
  bit ARLOCK ; \
  bit RID ; \
  bit RDATA ; \
  bit RRESP ; \
  bit RUSER ; \
  bit RLAST ; \
  bit RVALID ; \
     } axi_master_initiator_s;

  `define axi_master_TO_INITIATOR_STRUCT_FUNCTION \
  virtual function axi_master_initiator_s to_initiator_struct();\
    axi_master_initiator_struct = \
           {\
           this.AWID , \
           this.AWADDR , \
           this.AWLEN , \
           this.AWSIZE , \
           this.AWBURST , \
           this.AWLOCK , \
           this.AWCACHE , \
           this.AWQOS , \
           this.AWREGION , \
           this.AWUSER , \
           this.AWPROT , \
           this.AWVALID , \
           this.AWREADY , \
           this.WDATA , \
           this.WSTRB , \
           this.WUSER , \
           this.WLAST , \
           this.BID , \
           this.BRESP , \
           this.BUSER , \
           this.BVALID , \
           this.ARID , \
           this.ARADDR , \
           this.ARLEN , \
           this.ARSIZE , \
           this.ARBURST , \
           this.ARCACHE , \
           this.ARPROT , \
           this.ARQOS , \
           this.ARREGION , \
           this.ARUSER , \
           this.ARLOCK , \
           this.RID , \
           this.RDATA , \
           this.RRESP , \
           this.RUSER , \
           this.RLAST , \
           this.RVALID  \
           };\
    return ( axi_master_initiator_struct);\
  endfunction

  `define axi_master_FROM_INITIATOR_STRUCT_FUNCTION \
  virtual function void from_initiator_struct(axi_master_initiator_s axi_master_initiator_struct);\
           {\
           this.AWID , \
           this.AWADDR , \
           this.AWLEN , \
           this.AWSIZE , \
           this.AWBURST , \
           this.AWLOCK , \
           this.AWCACHE , \
           this.AWQOS , \
           this.AWREGION , \
           this.AWUSER , \
           this.AWPROT , \
           this.AWVALID , \
           this.AWREADY , \
           this.WDATA , \
           this.WSTRB , \
           this.WUSER , \
           this.WLAST , \
           this.BID , \
           this.BRESP , \
           this.BUSER , \
           this.BVALID , \
           this.ARID , \
           this.ARADDR , \
           this.ARLEN , \
           this.ARSIZE , \
           this.ARBURST , \
           this.ARCACHE , \
           this.ARPROT , \
           this.ARQOS , \
           this.ARREGION , \
           this.ARUSER , \
           this.ARLOCK , \
           this.RID , \
           this.RDATA , \
           this.RRESP , \
           this.RUSER , \
           this.RLAST , \
           this.RVALID  \
           } = axi_master_initiator_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_responder_struct
//      and from_responder_struct methods of the axi_master_transaction class.
//      Also update the comments in the driver BFM.
//
  `define axi_master_RESPONDER_STRUCT typedef struct packed  { \
  bit AWID ; \
  bit AWADDR ; \
  bit AWLEN ; \
  bit AWSIZE ; \
  bit AWBURST ; \
  bit AWLOCK ; \
  bit AWCACHE ; \
  bit AWQOS ; \
  bit AWREGION ; \
  bit AWUSER ; \
  bit AWPROT ; \
  bit AWVALID ; \
  bit AWREADY ; \
  bit WDATA ; \
  bit WSTRB ; \
  bit WUSER ; \
  bit WLAST ; \
  bit BID ; \
  bit BRESP ; \
  bit BUSER ; \
  bit BVALID ; \
  bit ARID ; \
  bit ARADDR ; \
  bit ARLEN ; \
  bit ARSIZE ; \
  bit ARBURST ; \
  bit ARCACHE ; \
  bit ARPROT ; \
  bit ARQOS ; \
  bit ARREGION ; \
  bit ARUSER ; \
  bit ARLOCK ; \
  bit RID ; \
  bit RDATA ; \
  bit RRESP ; \
  bit RUSER ; \
  bit RLAST ; \
  bit RVALID ; \
     } axi_master_responder_s;

  `define axi_master_TO_RESPONDER_STRUCT_FUNCTION \
  virtual function axi_master_responder_s to_responder_struct();\
    axi_master_responder_struct = \
           {\
           this.AWID , \
           this.AWADDR , \
           this.AWLEN , \
           this.AWSIZE , \
           this.AWBURST , \
           this.AWLOCK , \
           this.AWCACHE , \
           this.AWQOS , \
           this.AWREGION , \
           this.AWUSER , \
           this.AWPROT , \
           this.AWVALID , \
           this.AWREADY , \
           this.WDATA , \
           this.WSTRB , \
           this.WUSER , \
           this.WLAST , \
           this.BID , \
           this.BRESP , \
           this.BUSER , \
           this.BVALID , \
           this.ARID , \
           this.ARADDR , \
           this.ARLEN , \
           this.ARSIZE , \
           this.ARBURST , \
           this.ARCACHE , \
           this.ARPROT , \
           this.ARQOS , \
           this.ARREGION , \
           this.ARUSER , \
           this.ARLOCK , \
           this.RID , \
           this.RDATA , \
           this.RRESP , \
           this.RUSER , \
           this.RLAST , \
           this.RVALID  \
           };\
    return ( axi_master_responder_struct);\
  endfunction

  `define axi_master_FROM_RESPONDER_STRUCT_FUNCTION \
  virtual function void from_responder_struct(axi_master_responder_s axi_master_responder_struct);\
           {\
           this.AWID , \
           this.AWADDR , \
           this.AWLEN , \
           this.AWSIZE , \
           this.AWBURST , \
           this.AWLOCK , \
           this.AWCACHE , \
           this.AWQOS , \
           this.AWREGION , \
           this.AWUSER , \
           this.AWPROT , \
           this.AWVALID , \
           this.AWREADY , \
           this.WDATA , \
           this.WSTRB , \
           this.WUSER , \
           this.WLAST , \
           this.BID , \
           this.BRESP , \
           this.BUSER , \
           this.BVALID , \
           this.ARID , \
           this.ARADDR , \
           this.ARLEN , \
           this.ARSIZE , \
           this.ARBURST , \
           this.ARCACHE , \
           this.ARPROT , \
           this.ARQOS , \
           this.ARREGION , \
           this.ARUSER , \
           this.ARLOCK , \
           this.RID , \
           this.RDATA , \
           this.RRESP , \
           this.RUSER , \
           this.RLAST , \
           this.RVALID  \
           } = axi_master_responder_struct;\
  endfunction
// pragma uvmf custom additional begin
// pragma uvmf custom additional end
