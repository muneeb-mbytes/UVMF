//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This file contains macros used with the jtag_b package.
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
//      the jtag_b_configuration class.
//
  `define jtag_b_CONFIGURATION_STRUCT \
typedef struct packed  { \
     bit is_active;\
     int no_of_slaves;\
     bit has_coverage;\
     uvmf_active_passive_t active_passive; \
     uvmf_initiator_responder_t initiator_responder; \
     } jtag_b_configuration_s;

  `define jtag_b_CONFIGURATION_TO_STRUCT_FUNCTION \
  virtual function jtag_b_configuration_s to_struct();\
    jtag_b_configuration_struct = \
       {\
       this.is_active,\
       this.no_of_slaves,\
       this.has_coverage,\
       this.active_passive,\
       this.initiator_responder\
       };\
    return ( jtag_b_configuration_struct );\
  endfunction

  `define jtag_b_CONFIGURATION_FROM_STRUCT_FUNCTION \
  virtual function void from_struct(jtag_b_configuration_s jtag_b_configuration_struct);\
      {\
      this.is_active,\
      this.no_of_slaves,\
      this.has_coverage,\
      this.active_passive,\
      this.initiator_responder  \
      } = jtag_b_configuration_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_monitor_struct
//      and from_monitor_struct methods of the jtag_b_transaction class.
//
  `define jtag_b_MONITOR_STRUCT typedef struct packed  { \
  bit tck ; \
  bit tms ; \
  bit tdi ; \
  bit tdo ; \
     } jtag_b_monitor_s;

  `define jtag_b_TO_MONITOR_STRUCT_FUNCTION \
  virtual function jtag_b_monitor_s to_monitor_struct();\
    jtag_b_monitor_struct = \
            { \
            this.tck , \
            this.tms , \
            this.tdi , \
            this.tdo  \
            };\
    return ( jtag_b_monitor_struct);\
  endfunction\

  `define jtag_b_FROM_MONITOR_STRUCT_FUNCTION \
  virtual function void from_monitor_struct(jtag_b_monitor_s jtag_b_monitor_struct);\
            {\
            this.tck , \
            this.tms , \
            this.tdi , \
            this.tdo  \
            } = jtag_b_monitor_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_initiator_struct
//      and from_initiator_struct methods of the jtag_b_transaction class.
//      Also update the comments in the driver BFM.
//
  `define jtag_b_INITIATOR_STRUCT typedef struct packed  { \
  bit tck ; \
  bit tms ; \
  bit tdi ; \
  bit tdo ; \
     } jtag_b_initiator_s;

  `define jtag_b_TO_INITIATOR_STRUCT_FUNCTION \
  virtual function jtag_b_initiator_s to_initiator_struct();\
    jtag_b_initiator_struct = \
           {\
           this.tck , \
           this.tms , \
           this.tdi , \
           this.tdo  \
           };\
    return ( jtag_b_initiator_struct);\
  endfunction

  `define jtag_b_FROM_INITIATOR_STRUCT_FUNCTION \
  virtual function void from_initiator_struct(jtag_b_initiator_s jtag_b_initiator_struct);\
           {\
           this.tck , \
           this.tms , \
           this.tdi , \
           this.tdo  \
           } = jtag_b_initiator_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_responder_struct
//      and from_responder_struct methods of the jtag_b_transaction class.
//      Also update the comments in the driver BFM.
//
  `define jtag_b_RESPONDER_STRUCT typedef struct packed  { \
  bit tck ; \
  bit tms ; \
  bit tdi ; \
  bit tdo ; \
     } jtag_b_responder_s;

  `define jtag_b_TO_RESPONDER_STRUCT_FUNCTION \
  virtual function jtag_b_responder_s to_responder_struct();\
    jtag_b_responder_struct = \
           {\
           this.tck , \
           this.tms , \
           this.tdi , \
           this.tdo  \
           };\
    return ( jtag_b_responder_struct);\
  endfunction

  `define jtag_b_FROM_RESPONDER_STRUCT_FUNCTION \
  virtual function void from_responder_struct(jtag_b_responder_s jtag_b_responder_struct);\
           {\
           this.tck , \
           this.tms , \
           this.tdi , \
           this.tdo  \
           } = jtag_b_responder_struct;\
  endfunction
// pragma uvmf custom additional begin
// pragma uvmf custom additional end
