//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This file contains macros used with the apb package.
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
//      the apb_configuration class.
//
  `define apb_CONFIGURATION_STRUCT \
typedef struct packed  { \
     uvmf_active_passive_t active_passive; \
     uvmf_initiator_responder_t initiator_responder; \
     } apb_configuration_s;

  `define apb_CONFIGURATION_TO_STRUCT_FUNCTION \
  virtual function apb_configuration_s to_struct();\
    apb_configuration_struct = \
       {\
       this.active_passive,\
       this.initiator_responder\
       };\
    return ( apb_configuration_struct );\
  endfunction

  `define apb_CONFIGURATION_FROM_STRUCT_FUNCTION \
  virtual function void from_struct(apb_configuration_s apb_configuration_struct);\
      {\
      this.active_passive,\
      this.initiator_responder  \
      } = apb_configuration_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_monitor_struct
//      and from_monitor_struct methods of the apb_transaction class.
//
  `define apb_MONITOR_STRUCT typedef struct packed  { \
  bit psel ; \
  bit penable ; \
  bit [APB_ADDR_WIDTH-1:0] paddr ; \
  bit [APB_DATA_WIDTH-1:0] pwdata ; \
  bit pwrite ; \
  bit [3:0] pstrb ; \
  bit [3:0] pprot ; \
  APB_DATA_WIDTH prdata ; \
  bit pready ; \
  bit pslverr ; \
     } apb_monitor_s;

  `define apb_TO_MONITOR_STRUCT_FUNCTION \
  virtual function apb_monitor_s to_monitor_struct();\
    apb_monitor_struct = \
            { \
            this.psel , \
            this.penable , \
            this.paddr , \
            this.pwdata , \
            this.pwrite , \
            this.pstrb , \
            this.pprot , \
            this.prdata , \
            this.pready , \
            this.pslverr  \
            };\
    return ( apb_monitor_struct);\
  endfunction\

  `define apb_FROM_MONITOR_STRUCT_FUNCTION \
  virtual function void from_monitor_struct(apb_monitor_s apb_monitor_struct);\
            {\
            this.psel , \
            this.penable , \
            this.paddr , \
            this.pwdata , \
            this.pwrite , \
            this.pstrb , \
            this.pprot , \
            this.prdata , \
            this.pready , \
            this.pslverr  \
            } = apb_monitor_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_initiator_struct
//      and from_initiator_struct methods of the apb_transaction class.
//      Also update the comments in the driver BFM.
//
  `define apb_INITIATOR_STRUCT typedef struct packed  { \
  bit psel ; \
  bit penable ; \
  bit [APB_ADDR_WIDTH-1:0] paddr ; \
  bit [APB_DATA_WIDTH-1:0] pwdata ; \
  bit pwrite ; \
  bit [3:0] pstrb ; \
  bit [3:0] pprot ; \
  APB_DATA_WIDTH prdata ; \
  bit pready ; \
  bit pslverr ; \
     } apb_initiator_s;

  `define apb_TO_INITIATOR_STRUCT_FUNCTION \
  virtual function apb_initiator_s to_initiator_struct();\
    apb_initiator_struct = \
           {\
           this.psel , \
           this.penable , \
           this.paddr , \
           this.pwdata , \
           this.pwrite , \
           this.pstrb , \
           this.pprot , \
           this.prdata , \
           this.pready , \
           this.pslverr  \
           };\
    return ( apb_initiator_struct);\
  endfunction

  `define apb_FROM_INITIATOR_STRUCT_FUNCTION \
  virtual function void from_initiator_struct(apb_initiator_s apb_initiator_struct);\
           {\
           this.psel , \
           this.penable , \
           this.paddr , \
           this.pwdata , \
           this.pwrite , \
           this.pstrb , \
           this.pprot , \
           this.prdata , \
           this.pready , \
           this.pslverr  \
           } = apb_initiator_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_responder_struct
//      and from_responder_struct methods of the apb_transaction class.
//      Also update the comments in the driver BFM.
//
  `define apb_RESPONDER_STRUCT typedef struct packed  { \
  bit psel ; \
  bit penable ; \
  bit [APB_ADDR_WIDTH-1:0] paddr ; \
  bit [APB_DATA_WIDTH-1:0] pwdata ; \
  bit pwrite ; \
  bit [3:0] pstrb ; \
  bit [3:0] pprot ; \
  APB_DATA_WIDTH prdata ; \
  bit pready ; \
  bit pslverr ; \
     } apb_responder_s;

  `define apb_TO_RESPONDER_STRUCT_FUNCTION \
  virtual function apb_responder_s to_responder_struct();\
    apb_responder_struct = \
           {\
           this.psel , \
           this.penable , \
           this.paddr , \
           this.pwdata , \
           this.pwrite , \
           this.pstrb , \
           this.pprot , \
           this.prdata , \
           this.pready , \
           this.pslverr  \
           };\
    return ( apb_responder_struct);\
  endfunction

  `define apb_FROM_RESPONDER_STRUCT_FUNCTION \
  virtual function void from_responder_struct(apb_responder_s apb_responder_struct);\
           {\
           this.psel , \
           this.penable , \
           this.paddr , \
           this.pwdata , \
           this.pwrite , \
           this.pstrb , \
           this.pprot , \
           this.prdata , \
           this.pready , \
           this.pslverr  \
           } = apb_responder_struct;\
  endfunction
// pragma uvmf custom additional begin
// pragma uvmf custom additional end
