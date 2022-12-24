//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This file contains macros used with the apb_master package.
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
//      the apb_master_configuration class.
//
  `define apb_master_CONFIGURATION_STRUCT \
typedef struct packed  { \
     bit is_active;\
     int no_of_slaves;\
     bit has_coverage;\
     uvmf_active_passive_t active_passive; \
     uvmf_initiator_responder_t initiator_responder; \
     } apb_master_configuration_s;

  `define apb_master_CONFIGURATION_TO_STRUCT_FUNCTION \
  virtual function apb_master_configuration_s to_struct();\
    apb_master_configuration_struct = \
       {\
       this.is_active,\
       this.no_of_slaves,\
       this.has_coverage,\
       this.active_passive,\
       this.initiator_responder\
       };\
    return ( apb_master_configuration_struct );\
  endfunction

  `define apb_master_CONFIGURATION_FROM_STRUCT_FUNCTION \
  virtual function void from_struct(apb_master_configuration_s apb_master_configuration_struct);\
      {\
      this.is_active,\
      this.no_of_slaves,\
      this.has_coverage,\
      this.active_passive,\
      this.initiator_responder  \
      } = apb_master_configuration_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_monitor_struct
//      and from_monitor_struct methods of the apb_master_transaction class.
//
  `define apb_master_MONITOR_STRUCT typedef struct packed  { \
  bit paddr ; \
  bit pwdata ; \
  bit penable ; \
  bit pwrite ; \
  bit psel ; \
  bit pready ; \
  bit pprot ; \
  bit pslverr ; \
     } apb_master_monitor_s;

  `define apb_master_TO_MONITOR_STRUCT_FUNCTION \
  virtual function apb_master_monitor_s to_monitor_struct();\
    apb_master_monitor_struct = \
            { \
            this.paddr , \
            this.pwdata , \
            this.penable , \
            this.pwrite , \
            this.psel , \
            this.pready , \
            this.pprot , \
            this.pslverr  \
            };\
    return ( apb_master_monitor_struct);\
  endfunction\

  `define apb_master_FROM_MONITOR_STRUCT_FUNCTION \
  virtual function void from_monitor_struct(apb_master_monitor_s apb_master_monitor_struct);\
            {\
            this.paddr , \
            this.pwdata , \
            this.penable , \
            this.pwrite , \
            this.psel , \
            this.pready , \
            this.pprot , \
            this.pslverr  \
            } = apb_master_monitor_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_initiator_struct
//      and from_initiator_struct methods of the apb_master_transaction class.
//      Also update the comments in the driver BFM.
//
  `define apb_master_INITIATOR_STRUCT typedef struct packed  { \
  bit paddr ; \
  bit pwdata ; \
  bit penable ; \
  bit pwrite ; \
  bit psel ; \
  bit pready ; \
  bit pprot ; \
  bit pslverr ; \
     } apb_master_initiator_s;

  `define apb_master_TO_INITIATOR_STRUCT_FUNCTION \
  virtual function apb_master_initiator_s to_initiator_struct();\
    apb_master_initiator_struct = \
           {\
           this.paddr , \
           this.pwdata , \
           this.penable , \
           this.pwrite , \
           this.psel , \
           this.pready , \
           this.pprot , \
           this.pslverr  \
           };\
    return ( apb_master_initiator_struct);\
  endfunction

  `define apb_master_FROM_INITIATOR_STRUCT_FUNCTION \
  virtual function void from_initiator_struct(apb_master_initiator_s apb_master_initiator_struct);\
           {\
           this.paddr , \
           this.pwdata , \
           this.penable , \
           this.pwrite , \
           this.psel , \
           this.pready , \
           this.pprot , \
           this.pslverr  \
           } = apb_master_initiator_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_responder_struct
//      and from_responder_struct methods of the apb_master_transaction class.
//      Also update the comments in the driver BFM.
//
  `define apb_master_RESPONDER_STRUCT typedef struct packed  { \
  bit paddr ; \
  bit pwdata ; \
  bit penable ; \
  bit pwrite ; \
  bit psel ; \
  bit pready ; \
  bit pprot ; \
  bit pslverr ; \
     } apb_master_responder_s;

  `define apb_master_TO_RESPONDER_STRUCT_FUNCTION \
  virtual function apb_master_responder_s to_responder_struct();\
    apb_master_responder_struct = \
           {\
           this.paddr , \
           this.pwdata , \
           this.penable , \
           this.pwrite , \
           this.psel , \
           this.pready , \
           this.pprot , \
           this.pslverr  \
           };\
    return ( apb_master_responder_struct);\
  endfunction

  `define apb_master_FROM_RESPONDER_STRUCT_FUNCTION \
  virtual function void from_responder_struct(apb_master_responder_s apb_master_responder_struct);\
           {\
           this.paddr , \
           this.pwdata , \
           this.penable , \
           this.pwrite , \
           this.psel , \
           this.pready , \
           this.pprot , \
           this.pslverr  \
           } = apb_master_responder_struct;\
  endfunction
// pragma uvmf custom additional begin
// pragma uvmf custom additional end
