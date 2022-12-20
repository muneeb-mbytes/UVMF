//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This file contains macros used with the interface_name package.
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
//      the interface_name_configuration class.
//
  `define interface_name_CONFIGURATION_STRUCT \
typedef struct packed  { \
     uvmf_active_passive_t active_passive; \
     uvmf_initiator_responder_t initiator_responder; \
     } interface_name_configuration_s;

  `define interface_name_CONFIGURATION_TO_STRUCT_FUNCTION \
  virtual function interface_name_configuration_s to_struct();\
    interface_name_configuration_struct = \
       {\
       this.active_passive,\
       this.initiator_responder\
       };\
    return ( interface_name_configuration_struct );\
  endfunction

  `define interface_name_CONFIGURATION_FROM_STRUCT_FUNCTION \
  virtual function void from_struct(interface_name_configuration_s interface_name_configuration_struct);\
      {\
      this.active_passive,\
      this.initiator_responder  \
      } = interface_name_configuration_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_monitor_struct
//      and from_monitor_struct methods of the interface_name_transaction class.
//
  `define interface_name_MONITOR_STRUCT typedef struct packed  { \
  bit transaction_variable_name ; \
     } interface_name_monitor_s;

  `define interface_name_TO_MONITOR_STRUCT_FUNCTION \
  virtual function interface_name_monitor_s to_monitor_struct();\
    interface_name_monitor_struct = \
            { \
            this.transaction_variable_name  \
            };\
    return ( interface_name_monitor_struct);\
  endfunction\

  `define interface_name_FROM_MONITOR_STRUCT_FUNCTION \
  virtual function void from_monitor_struct(interface_name_monitor_s interface_name_monitor_struct);\
            {\
            this.transaction_variable_name  \
            } = interface_name_monitor_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_initiator_struct
//      and from_initiator_struct methods of the interface_name_transaction class.
//      Also update the comments in the driver BFM.
//
  `define interface_name_INITIATOR_STRUCT typedef struct packed  { \
  bit transaction_variable_name ; \
     } interface_name_initiator_s;

  `define interface_name_TO_INITIATOR_STRUCT_FUNCTION \
  virtual function interface_name_initiator_s to_initiator_struct();\
    interface_name_initiator_struct = \
           {\
           this.transaction_variable_name  \
           };\
    return ( interface_name_initiator_struct);\
  endfunction

  `define interface_name_FROM_INITIATOR_STRUCT_FUNCTION \
  virtual function void from_initiator_struct(interface_name_initiator_s interface_name_initiator_struct);\
           {\
           this.transaction_variable_name  \
           } = interface_name_initiator_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_responder_struct
//      and from_responder_struct methods of the interface_name_transaction class.
//      Also update the comments in the driver BFM.
//
  `define interface_name_RESPONDER_STRUCT typedef struct packed  { \
  bit transaction_variable_name ; \
     } interface_name_responder_s;

  `define interface_name_TO_RESPONDER_STRUCT_FUNCTION \
  virtual function interface_name_responder_s to_responder_struct();\
    interface_name_responder_struct = \
           {\
           this.transaction_variable_name  \
           };\
    return ( interface_name_responder_struct);\
  endfunction

  `define interface_name_FROM_RESPONDER_STRUCT_FUNCTION \
  virtual function void from_responder_struct(interface_name_responder_s interface_name_responder_struct);\
           {\
           this.transaction_variable_name  \
           } = interface_name_responder_struct;\
  endfunction
// pragma uvmf custom additional begin
// pragma uvmf custom additional end
