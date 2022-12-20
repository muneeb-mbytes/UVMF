//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This file contains macros used with the pkt package.
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
//      the pkt_configuration class.
//
  `define pkt_CONFIGURATION_STRUCT \
typedef struct packed  { \
     bit [DATA_WIDTH-1:0] src_address;\
     uvmf_active_passive_t active_passive; \
     uvmf_initiator_responder_t initiator_responder; \
     } pkt_configuration_s;

  `define pkt_CONFIGURATION_TO_STRUCT_FUNCTION \
  virtual function pkt_configuration_s to_struct();\
    pkt_configuration_struct = \
       {\
       this.src_address,\
       this.active_passive,\
       this.initiator_responder\
       };\
    return ( pkt_configuration_struct );\
  endfunction

  `define pkt_CONFIGURATION_FROM_STRUCT_FUNCTION \
  virtual function void from_struct(pkt_configuration_s pkt_configuration_struct);\
      {\
      this.src_address,\
      this.active_passive,\
      this.initiator_responder  \
      } = pkt_configuration_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_monitor_struct
//      and from_monitor_struct methods of the pkt_transaction class.
//
  `define pkt_MONITOR_STRUCT typedef struct packed  { \
  bit [DATA_WIDTH-1:0] data ; \
  bit [DATA_WIDTH-1:0] dst_address ; \
  bit [STATUS_WIDTH-1:0] status ; \
     } pkt_monitor_s;

  `define pkt_TO_MONITOR_STRUCT_FUNCTION \
  virtual function pkt_monitor_s to_monitor_struct();\
    pkt_monitor_struct = \
            { \
            this.data , \
            this.dst_address , \
            this.status  \
            };\
    return ( pkt_monitor_struct);\
  endfunction\

  `define pkt_FROM_MONITOR_STRUCT_FUNCTION \
  virtual function void from_monitor_struct(pkt_monitor_s pkt_monitor_struct);\
            {\
            this.data , \
            this.dst_address , \
            this.status  \
            } = pkt_monitor_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_initiator_struct
//      and from_initiator_struct methods of the pkt_transaction class.
//      Also update the comments in the driver BFM.
//
  `define pkt_INITIATOR_STRUCT typedef struct packed  { \
  bit [DATA_WIDTH-1:0] data ; \
  bit [DATA_WIDTH-1:0] dst_address ; \
  bit [STATUS_WIDTH-1:0] status ; \
     } pkt_initiator_s;

  `define pkt_TO_INITIATOR_STRUCT_FUNCTION \
  virtual function pkt_initiator_s to_initiator_struct();\
    pkt_initiator_struct = \
           {\
           this.data , \
           this.dst_address , \
           this.status  \
           };\
    return ( pkt_initiator_struct);\
  endfunction

  `define pkt_FROM_INITIATOR_STRUCT_FUNCTION \
  virtual function void from_initiator_struct(pkt_initiator_s pkt_initiator_struct);\
           {\
           this.data , \
           this.dst_address , \
           this.status  \
           } = pkt_initiator_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_responder_struct
//      and from_responder_struct methods of the pkt_transaction class.
//      Also update the comments in the driver BFM.
//
  `define pkt_RESPONDER_STRUCT typedef struct packed  { \
  bit [DATA_WIDTH-1:0] data ; \
  bit [DATA_WIDTH-1:0] dst_address ; \
  bit [STATUS_WIDTH-1:0] status ; \
     } pkt_responder_s;

  `define pkt_TO_RESPONDER_STRUCT_FUNCTION \
  virtual function pkt_responder_s to_responder_struct();\
    pkt_responder_struct = \
           {\
           this.data , \
           this.dst_address , \
           this.status  \
           };\
    return ( pkt_responder_struct);\
  endfunction

  `define pkt_FROM_RESPONDER_STRUCT_FUNCTION \
  virtual function void from_responder_struct(pkt_responder_s pkt_responder_struct);\
           {\
           this.data , \
           this.dst_address , \
           this.status  \
           } = pkt_responder_struct;\
  endfunction
// pragma uvmf custom additional begin
// pragma uvmf custom additional end
