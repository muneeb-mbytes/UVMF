//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This file contains macros used with the mem package.
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
//      the mem_configuration class.
//
  `define mem_CONFIGURATION_STRUCT \
typedef struct packed  { \
     bit [3:0] transfer_gap;\
     bit [3:0] speed_grade;\
     uvmf_active_passive_t active_passive; \
     uvmf_initiator_responder_t initiator_responder; \
     } mem_configuration_s;

  `define mem_CONFIGURATION_TO_STRUCT_FUNCTION \
  virtual function mem_configuration_s to_struct();\
    mem_configuration_struct = \
       {\
       this.transfer_gap,\
       this.speed_grade,\
       this.active_passive,\
       this.initiator_responder\
       };\
    return ( mem_configuration_struct );\
  endfunction

  `define mem_CONFIGURATION_FROM_STRUCT_FUNCTION \
  virtual function void from_struct(mem_configuration_s mem_configuration_struct);\
      {\
      this.transfer_gap,\
      this.speed_grade,\
      this.active_passive,\
      this.initiator_responder  \
      } = mem_configuration_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_monitor_struct
//      and from_monitor_struct methods of the mem_transaction class.
//
  `define mem_MONITOR_STRUCT typedef struct packed  { \
  bit [DATA_WIDTH-1:0] read_data ; \
  bit [DATA_WIDTH-1:0] write_data ; \
  bit [ADDR_WIDTH-1:0] address ; \
  bit [3:0] byte_enable ; \
  int chksum ; \
     } mem_monitor_s;

  `define mem_TO_MONITOR_STRUCT_FUNCTION \
  virtual function mem_monitor_s to_monitor_struct();\
    mem_monitor_struct = \
            { \
            this.read_data , \
            this.write_data , \
            this.address , \
            this.byte_enable , \
            this.chksum  \
            };\
    return ( mem_monitor_struct);\
  endfunction\

  `define mem_FROM_MONITOR_STRUCT_FUNCTION \
  virtual function void from_monitor_struct(mem_monitor_s mem_monitor_struct);\
            {\
            this.read_data , \
            this.write_data , \
            this.address , \
            this.byte_enable , \
            this.chksum  \
            } = mem_monitor_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_initiator_struct
//      and from_initiator_struct methods of the mem_transaction class.
//      Also update the comments in the driver BFM.
//
  `define mem_INITIATOR_STRUCT typedef struct packed  { \
  bit [DATA_WIDTH-1:0] read_data ; \
  bit [DATA_WIDTH-1:0] write_data ; \
  bit [ADDR_WIDTH-1:0] address ; \
  bit [3:0] byte_enable ; \
  int chksum ; \
     } mem_initiator_s;

  `define mem_TO_INITIATOR_STRUCT_FUNCTION \
  virtual function mem_initiator_s to_initiator_struct();\
    mem_initiator_struct = \
           {\
           this.read_data , \
           this.write_data , \
           this.address , \
           this.byte_enable , \
           this.chksum  \
           };\
    return ( mem_initiator_struct);\
  endfunction

  `define mem_FROM_INITIATOR_STRUCT_FUNCTION \
  virtual function void from_initiator_struct(mem_initiator_s mem_initiator_struct);\
           {\
           this.read_data , \
           this.write_data , \
           this.address , \
           this.byte_enable , \
           this.chksum  \
           } = mem_initiator_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_responder_struct
//      and from_responder_struct methods of the mem_transaction class.
//      Also update the comments in the driver BFM.
//
  `define mem_RESPONDER_STRUCT typedef struct packed  { \
  bit [DATA_WIDTH-1:0] read_data ; \
  bit [DATA_WIDTH-1:0] write_data ; \
  bit [ADDR_WIDTH-1:0] address ; \
  bit [3:0] byte_enable ; \
  int chksum ; \
     } mem_responder_s;

  `define mem_TO_RESPONDER_STRUCT_FUNCTION \
  virtual function mem_responder_s to_responder_struct();\
    mem_responder_struct = \
           {\
           this.read_data , \
           this.write_data , \
           this.address , \
           this.byte_enable , \
           this.chksum  \
           };\
    return ( mem_responder_struct);\
  endfunction

  `define mem_FROM_RESPONDER_STRUCT_FUNCTION \
  virtual function void from_responder_struct(mem_responder_s mem_responder_struct);\
           {\
           this.read_data , \
           this.write_data , \
           this.address , \
           this.byte_enable , \
           this.chksum  \
           } = mem_responder_struct;\
  endfunction
// pragma uvmf custom additional begin
// pragma uvmf custom additional end
