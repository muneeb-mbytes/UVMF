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
     uvmf_active_passive_t active_passive; \
     uvmf_initiator_responder_t initiator_responder; \
     } axi_master_configuration_s;

  `define axi_master_CONFIGURATION_TO_STRUCT_FUNCTION \
  virtual function axi_master_configuration_s to_struct();\
    axi_master_configuration_struct = \
       {\
       this.active_passive,\
       this.initiator_responder\
       };\
    return ( axi_master_configuration_struct );\
  endfunction

  `define axi_master_CONFIGURATION_FROM_STRUCT_FUNCTION \
  virtual function void from_struct(axi_master_configuration_s axi_master_configuration_struct);\
      {\
      this.active_passive,\
      this.initiator_responder  \
      } = axi_master_configuration_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_monitor_struct
//      and from_monitor_struct methods of the axi_master_transaction class.
//
  `define axi_master_MONITOR_STRUCT typedef struct packed  { \
  bit awvalid ; \
  int awid ; \
  int awlen ; \
  int awsize ; \
  int awaddr ; \
  int awburst ; \
  bit wvalid ; \
  bit wready ; \
  int wid ; \
  int wsize ; \
  int wdata ; \
  int wstrb ; \
  bit wlast ; \
  bit arvalid ; \
  bit arready ; \
  int arid ; \
  int arlen ; \
  int arsize ; \
  int arburst ; \
     } axi_master_monitor_s;

  `define axi_master_TO_MONITOR_STRUCT_FUNCTION \
  virtual function axi_master_monitor_s to_monitor_struct();\
    axi_master_monitor_struct = \
            { \
            this.awvalid , \
            this.awid , \
            this.awlen , \
            this.awsize , \
            this.awaddr , \
            this.awburst , \
            this.wvalid , \
            this.wready , \
            this.wid , \
            this.wsize , \
            this.wdata , \
            this.wstrb , \
            this.wlast , \
            this.arvalid , \
            this.arready , \
            this.arid , \
            this.arlen , \
            this.arsize , \
            this.arburst  \
            };\
    return ( axi_master_monitor_struct);\
  endfunction\

  `define axi_master_FROM_MONITOR_STRUCT_FUNCTION \
  virtual function void from_monitor_struct(axi_master_monitor_s axi_master_monitor_struct);\
            {\
            this.awvalid , \
            this.awid , \
            this.awlen , \
            this.awsize , \
            this.awaddr , \
            this.awburst , \
            this.wvalid , \
            this.wready , \
            this.wid , \
            this.wsize , \
            this.wdata , \
            this.wstrb , \
            this.wlast , \
            this.arvalid , \
            this.arready , \
            this.arid , \
            this.arlen , \
            this.arsize , \
            this.arburst  \
            } = axi_master_monitor_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_initiator_struct
//      and from_initiator_struct methods of the axi_master_transaction class.
//      Also update the comments in the driver BFM.
//
  `define axi_master_INITIATOR_STRUCT typedef struct packed  { \
  bit awvalid ; \
  int awid ; \
  int awlen ; \
  int awsize ; \
  int awaddr ; \
  int awburst ; \
  bit wvalid ; \
  bit wready ; \
  int wid ; \
  int wsize ; \
  int wdata ; \
  int wstrb ; \
  bit wlast ; \
  bit arvalid ; \
  bit arready ; \
  int arid ; \
  int arlen ; \
  int arsize ; \
  int arburst ; \
     } axi_master_initiator_s;

  `define axi_master_TO_INITIATOR_STRUCT_FUNCTION \
  virtual function axi_master_initiator_s to_initiator_struct();\
    axi_master_initiator_struct = \
           {\
           this.awvalid , \
           this.awid , \
           this.awlen , \
           this.awsize , \
           this.awaddr , \
           this.awburst , \
           this.wvalid , \
           this.wready , \
           this.wid , \
           this.wsize , \
           this.wdata , \
           this.wstrb , \
           this.wlast , \
           this.arvalid , \
           this.arready , \
           this.arid , \
           this.arlen , \
           this.arsize , \
           this.arburst  \
           };\
    return ( axi_master_initiator_struct);\
  endfunction

  `define axi_master_FROM_INITIATOR_STRUCT_FUNCTION \
  virtual function void from_initiator_struct(axi_master_initiator_s axi_master_initiator_struct);\
           {\
           this.awvalid , \
           this.awid , \
           this.awlen , \
           this.awsize , \
           this.awaddr , \
           this.awburst , \
           this.wvalid , \
           this.wready , \
           this.wid , \
           this.wsize , \
           this.wdata , \
           this.wstrb , \
           this.wlast , \
           this.arvalid , \
           this.arready , \
           this.arid , \
           this.arlen , \
           this.arsize , \
           this.arburst  \
           } = axi_master_initiator_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_responder_struct
//      and from_responder_struct methods of the axi_master_transaction class.
//      Also update the comments in the driver BFM.
//
  `define axi_master_RESPONDER_STRUCT typedef struct packed  { \
  bit awvalid ; \
  int awid ; \
  int awlen ; \
  int awsize ; \
  int awaddr ; \
  int awburst ; \
  bit wvalid ; \
  bit wready ; \
  int wid ; \
  int wsize ; \
  int wdata ; \
  int wstrb ; \
  bit wlast ; \
  bit arvalid ; \
  bit arready ; \
  int arid ; \
  int arlen ; \
  int arsize ; \
  int arburst ; \
     } axi_master_responder_s;

  `define axi_master_TO_RESPONDER_STRUCT_FUNCTION \
  virtual function axi_master_responder_s to_responder_struct();\
    axi_master_responder_struct = \
           {\
           this.awvalid , \
           this.awid , \
           this.awlen , \
           this.awsize , \
           this.awaddr , \
           this.awburst , \
           this.wvalid , \
           this.wready , \
           this.wid , \
           this.wsize , \
           this.wdata , \
           this.wstrb , \
           this.wlast , \
           this.arvalid , \
           this.arready , \
           this.arid , \
           this.arlen , \
           this.arsize , \
           this.arburst  \
           };\
    return ( axi_master_responder_struct);\
  endfunction

  `define axi_master_FROM_RESPONDER_STRUCT_FUNCTION \
  virtual function void from_responder_struct(axi_master_responder_s axi_master_responder_struct);\
           {\
           this.awvalid , \
           this.awid , \
           this.awlen , \
           this.awsize , \
           this.awaddr , \
           this.awburst , \
           this.wvalid , \
           this.wready , \
           this.wid , \
           this.wsize , \
           this.wdata , \
           this.wstrb , \
           this.wlast , \
           this.arvalid , \
           this.arready , \
           this.arid , \
           this.arlen , \
           this.arsize , \
           this.arburst  \
           } = axi_master_responder_struct;\
  endfunction
// pragma uvmf custom additional begin
// pragma uvmf custom additional end
