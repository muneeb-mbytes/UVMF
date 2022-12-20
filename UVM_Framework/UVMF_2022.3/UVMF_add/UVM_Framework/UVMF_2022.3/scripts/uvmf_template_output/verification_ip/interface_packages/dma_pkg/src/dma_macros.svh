//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This file contains macros used with the dma package.
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
//      the dma_configuration class.
//
  `define dma_CONFIGURATION_STRUCT \
typedef struct packed  { \
     uvmf_active_passive_t active_passive; \
     uvmf_initiator_responder_t initiator_responder; \
     } dma_configuration_s;

  `define dma_CONFIGURATION_TO_STRUCT_FUNCTION \
  virtual function dma_configuration_s to_struct();\
    dma_configuration_struct = \
       {\
       this.active_passive,\
       this.initiator_responder\
       };\
    return ( dma_configuration_struct );\
  endfunction

  `define dma_CONFIGURATION_FROM_STRUCT_FUNCTION \
  virtual function void from_struct(dma_configuration_s dma_configuration_struct);\
      {\
      this.active_passive,\
      this.initiator_responder  \
      } = dma_configuration_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_monitor_struct
//      and from_monitor_struct methods of the dma_transaction class.
//
  `define dma_MONITOR_STRUCT typedef struct packed  { \
  bit [ADDR_WIDTH-1:0] addr ; \
  bit [DATA_WIDTH-1:0] data ; \
  bit wr ; \
     } dma_monitor_s;

  `define dma_TO_MONITOR_STRUCT_FUNCTION \
  virtual function dma_monitor_s to_monitor_struct();\
    dma_monitor_struct = \
            { \
            this.addr , \
            this.data , \
            this.wr  \
            };\
    return ( dma_monitor_struct);\
  endfunction\

  `define dma_FROM_MONITOR_STRUCT_FUNCTION \
  virtual function void from_monitor_struct(dma_monitor_s dma_monitor_struct);\
            {\
            this.addr , \
            this.data , \
            this.wr  \
            } = dma_monitor_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_initiator_struct
//      and from_initiator_struct methods of the dma_transaction class.
//      Also update the comments in the driver BFM.
//
  `define dma_INITIATOR_STRUCT typedef struct packed  { \
  bit [ADDR_WIDTH-1:0] addr ; \
  bit [DATA_WIDTH-1:0] data ; \
  bit wr ; \
     } dma_initiator_s;

  `define dma_TO_INITIATOR_STRUCT_FUNCTION \
  virtual function dma_initiator_s to_initiator_struct();\
    dma_initiator_struct = \
           {\
           this.addr , \
           this.data , \
           this.wr  \
           };\
    return ( dma_initiator_struct);\
  endfunction

  `define dma_FROM_INITIATOR_STRUCT_FUNCTION \
  virtual function void from_initiator_struct(dma_initiator_s dma_initiator_struct);\
           {\
           this.addr , \
           this.data , \
           this.wr  \
           } = dma_initiator_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_responder_struct
//      and from_responder_struct methods of the dma_transaction class.
//      Also update the comments in the driver BFM.
//
  `define dma_RESPONDER_STRUCT typedef struct packed  { \
  bit [ADDR_WIDTH-1:0] addr ; \
  bit [DATA_WIDTH-1:0] data ; \
  bit wr ; \
     } dma_responder_s;

  `define dma_TO_RESPONDER_STRUCT_FUNCTION \
  virtual function dma_responder_s to_responder_struct();\
    dma_responder_struct = \
           {\
           this.addr , \
           this.data , \
           this.wr  \
           };\
    return ( dma_responder_struct);\
  endfunction

  `define dma_FROM_RESPONDER_STRUCT_FUNCTION \
  virtual function void from_responder_struct(dma_responder_s dma_responder_struct);\
           {\
           this.addr , \
           this.data , \
           this.wr  \
           } = dma_responder_struct;\
  endfunction
// pragma uvmf custom additional begin
// pragma uvmf custom additional end
