
//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This file contains macros used with the wb_m package.
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
//      the wb_m_configuration class.
//
  `define wb_m_CONFIGURATION_STRUCT \
typedef struct packed  { \
     uvmf_active_passive_t active_passive; \
     uvmf_initiator_responder_t initiator_responder; \
     } wb_m_configuration_s;

  `define wb_m_CONFIGURATION_TO_STRUCT_FUNCTION \
  virtual function wb_m_configuration_s to_struct();\
    wb_m_configuration_struct = \
       {\
       this.active_passive,\
       this.initiator_responder\
       };\
    return ( wb_m_configuration_struct );\
  endfunction

  `define wb_m_CONFIGURATION_FROM_STRUCT_FUNCTION \
  virtual function void from_struct(wb_m_configuration_s wb_m_configuration_struct);\
      {\
      this.active_passive,\
      this.initiator_responder  \
      } = wb_m_configuration_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_monitor_struct
//      and from_monitor_struct methods of the wb_m_transaction class.
//
  `define wb_m_MONITOR_STRUCT typedef struct packed  { \
  bit [WB_DATA_WIDTH-1:0] data ; \
  bit [(WB_DATA_WIDTH/8)-1:0] byte_select ; \
  bit WrENB ; \
  bit selslv ; \
     } wb_m_monitor_s;

  `define wb_m_TO_MONITOR_STRUCT_FUNCTION \
  virtual function wb_m_monitor_s to_monitor_struct();\
    wb_m_monitor_struct = \
            { \
            this.data , \
            this.byte_select , \
            this.WrENB , \
            this.selslv  \
            };\
    return ( wb_m_monitor_struct);\
  endfunction\

  `define wb_m_FROM_MONITOR_STRUCT_FUNCTION \
  virtual function void from_monitor_struct(wb_m_monitor_s wb_m_monitor_struct);\
            {\
            this.data , \
            this.byte_select , \
            this.WrENB , \
            this.selslv  \
            } = wb_m_monitor_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_initiator_struct
//      and from_initiator_struct methods of the wb_m_transaction class.
//      Also update the comments in the driver BFM.
//
  `define wb_m_INITIATOR_STRUCT typedef struct packed  { \
  bit [WB_DATA_WIDTH-1:0] data ; \
  bit [(WB_DATA_WIDTH/8)-1:0] byte_select ; \
  bit WrENB ; \
  bit selslv ; \
     } wb_m_initiator_s;

  `define wb_m_TO_INITIATOR_STRUCT_FUNCTION \
  virtual function wb_m_initiator_s to_initiator_struct();\
    wb_m_initiator_struct = \
           {\
           this.data , \
           this.byte_select , \
           this.WrENB , \
           this.selslv  \
           };\
    return ( wb_m_initiator_struct);\
  endfunction

  `define wb_m_FROM_INITIATOR_STRUCT_FUNCTION \
  virtual function void from_initiator_struct(wb_m_initiator_s wb_m_initiator_struct);\
           {\
           this.data , \
           this.byte_select , \
           this.WrENB , \
           this.selslv  \
           } = wb_m_initiator_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_responder_struct
//      and from_responder_struct methods of the wb_m_transaction class.
//      Also update the comments in the driver BFM.
//
  `define wb_m_RESPONDER_STRUCT typedef struct packed  { \
  bit [WB_DATA_WIDTH-1:0] data ; \
  bit [(WB_DATA_WIDTH/8)-1:0] byte_select ; \
  bit WrENB ; \
  bit selslv ; \
     } wb_m_responder_s;

  `define wb_m_TO_RESPONDER_STRUCT_FUNCTION \
  virtual function wb_m_responder_s to_responder_struct();\
    wb_m_responder_struct = \
           {\
           this.data , \
           this.byte_select , \
           this.WrENB , \
           this.selslv  \
           };\
    return ( wb_m_responder_struct);\
  endfunction

  `define wb_m_FROM_RESPONDER_STRUCT_FUNCTION \
  virtual function void from_responder_struct(wb_m_responder_s wb_m_responder_struct);\
           {\
           this.data , \
           this.byte_select , \
           this.WrENB , \
           this.selslv  \
           } = wb_m_responder_struct;\
  endfunction
// pragma uvmf custom additional begin
// pragma uvmf custom additional end
