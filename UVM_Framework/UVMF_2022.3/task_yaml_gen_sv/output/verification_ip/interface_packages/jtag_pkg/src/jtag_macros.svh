//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This file contains macros used with the jtag package.
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
//      the jtag_configuration class.
//
  `define jtag_CONFIGURATION_STRUCT \
typedef struct packed  { \
     bit isactive;\
     int noofslaves;\
     bit hascoverage;\
     uvmf_active_passive_t active_passive; \
     uvmf_initiator_responder_t initiator_responder; \
     } jtag_configuration_s;

  `define jtag_CONFIGURATION_TO_STRUCT_FUNCTION \
  virtual function jtag_configuration_s to_struct();\
    jtag_configuration_struct = \
       {\
       this.isactive,\
       this.noofslaves,\
       this.hascoverage,\
       this.active_passive,\
       this.initiator_responder\
       };\
    return ( jtag_configuration_struct );\
  endfunction

  `define jtag_CONFIGURATION_FROM_STRUCT_FUNCTION \
  virtual function void from_struct(jtag_configuration_s jtag_configuration_struct);\
      {\
      this.isactive,\
      this.noofslaves,\
      this.hascoverage,\
      this.active_passive,\
      this.initiator_responder  \
      } = jtag_configuration_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_monitor_struct
//      and from_monitor_struct methods of the jtag_transaction class.
//
  `define jtag_MONITOR_STRUCT typedef struct packed  { \
  bit T_clock ; \
  bit T_MS ; \
  bit T_datain ; \
  bit T_dataout ; \
     } jtag_monitor_s;

  `define jtag_TO_MONITOR_STRUCT_FUNCTION \
  virtual function jtag_monitor_s to_monitor_struct();\
    jtag_monitor_struct = \
            { \
            this.T_clock , \
            this.T_MS , \
            this.T_datain , \
            this.T_dataout  \
            };\
    return ( jtag_monitor_struct);\
  endfunction\

  `define jtag_FROM_MONITOR_STRUCT_FUNCTION \
  virtual function void from_monitor_struct(jtag_monitor_s jtag_monitor_struct);\
            {\
            this.T_clock , \
            this.T_MS , \
            this.T_datain , \
            this.T_dataout  \
            } = jtag_monitor_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_initiator_struct
//      and from_initiator_struct methods of the jtag_transaction class.
//      Also update the comments in the driver BFM.
//
  `define jtag_INITIATOR_STRUCT typedef struct packed  { \
  bit T_clock ; \
  bit T_MS ; \
  bit T_datain ; \
  bit T_dataout ; \
     } jtag_initiator_s;

  `define jtag_TO_INITIATOR_STRUCT_FUNCTION \
  virtual function jtag_initiator_s to_initiator_struct();\
    jtag_initiator_struct = \
           {\
           this.T_clock , \
           this.T_MS , \
           this.T_datain , \
           this.T_dataout  \
           };\
    return ( jtag_initiator_struct);\
  endfunction

  `define jtag_FROM_INITIATOR_STRUCT_FUNCTION \
  virtual function void from_initiator_struct(jtag_initiator_s jtag_initiator_struct);\
           {\
           this.T_clock , \
           this.T_MS , \
           this.T_datain , \
           this.T_dataout  \
           } = jtag_initiator_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_responder_struct
//      and from_responder_struct methods of the jtag_transaction class.
//      Also update the comments in the driver BFM.
//
  `define jtag_RESPONDER_STRUCT typedef struct packed  { \
  bit T_clock ; \
  bit T_MS ; \
  bit T_datain ; \
  bit T_dataout ; \
     } jtag_responder_s;

  `define jtag_TO_RESPONDER_STRUCT_FUNCTION \
  virtual function jtag_responder_s to_responder_struct();\
    jtag_responder_struct = \
           {\
           this.T_clock , \
           this.T_MS , \
           this.T_datain , \
           this.T_dataout  \
           };\
    return ( jtag_responder_struct);\
  endfunction

  `define jtag_FROM_RESPONDER_STRUCT_FUNCTION \
  virtual function void from_responder_struct(jtag_responder_s jtag_responder_struct);\
           {\
           this.T_clock , \
           this.T_MS , \
           this.T_datain , \
           this.T_dataout  \
           } = jtag_responder_struct;\
  endfunction
// pragma uvmf custom additional begin
// pragma uvmf custom additional end
