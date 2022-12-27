
//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This file contains macros used with the spi_m package.
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
//      the spi_m_configuration class.
//
  `define spi_m_CONFIGURATION_STRUCT \
typedef struct packed  { \
     uvmf_active_passive_t active_passive; \
     uvmf_initiator_responder_t initiator_responder; \
     } spi_m_configuration_s;

  `define spi_m_CONFIGURATION_TO_STRUCT_FUNCTION \
  virtual function spi_m_configuration_s to_struct();\
    spi_m_configuration_struct = \
       {\
       this.active_passive,\
       this.initiator_responder\
       };\
    return ( spi_m_configuration_struct );\
  endfunction

  `define spi_m_CONFIGURATION_FROM_STRUCT_FUNCTION \
  virtual function void from_struct(spi_m_configuration_s spi_m_configuration_struct);\
      {\
      this.active_passive,\
      this.initiator_responder  \
      } = spi_m_configuration_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_monitor_struct
//      and from_monitor_struct methods of the spi_m_transaction class.
//
  `define spi_m_MONITOR_STRUCT typedef struct packed  { \
  bit ssel ; \
  bit [7:0] mosi ; \
  bit [7:0] miso ; \
     } spi_m_monitor_s;

  `define spi_m_TO_MONITOR_STRUCT_FUNCTION \
  virtual function spi_m_monitor_s to_monitor_struct();\
    spi_m_monitor_struct = \
            { \
            this.ssel , \
            this.mosi , \
            this.miso  \
            };\
    return ( spi_m_monitor_struct);\
  endfunction\

  `define spi_m_FROM_MONITOR_STRUCT_FUNCTION \
  virtual function void from_monitor_struct(spi_m_monitor_s spi_m_monitor_struct);\
            {\
            this.ssel , \
            this.mosi , \
            this.miso  \
            } = spi_m_monitor_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_initiator_struct
//      and from_initiator_struct methods of the spi_m_transaction class.
//      Also update the comments in the driver BFM.
//
  `define spi_m_INITIATOR_STRUCT typedef struct packed  { \
  bit ssel ; \
  bit [7:0] mosi ; \
  bit [7:0] miso ; \
     } spi_m_initiator_s;

  `define spi_m_TO_INITIATOR_STRUCT_FUNCTION \
  virtual function spi_m_initiator_s to_initiator_struct();\
    spi_m_initiator_struct = \
           {\
           this.ssel , \
           this.mosi , \
           this.miso  \
           };\
    return ( spi_m_initiator_struct);\
  endfunction

  `define spi_m_FROM_INITIATOR_STRUCT_FUNCTION \
  virtual function void from_initiator_struct(spi_m_initiator_s spi_m_initiator_struct);\
           {\
           this.ssel , \
           this.mosi , \
           this.miso  \
           } = spi_m_initiator_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_responder_struct
//      and from_responder_struct methods of the spi_m_transaction class.
//      Also update the comments in the driver BFM.
//
  `define spi_m_RESPONDER_STRUCT typedef struct packed  { \
  bit ssel ; \
  bit [7:0] mosi ; \
  bit [7:0] miso ; \
     } spi_m_responder_s;

  `define spi_m_TO_RESPONDER_STRUCT_FUNCTION \
  virtual function spi_m_responder_s to_responder_struct();\
    spi_m_responder_struct = \
           {\
           this.ssel , \
           this.mosi , \
           this.miso  \
           };\
    return ( spi_m_responder_struct);\
  endfunction

  `define spi_m_FROM_RESPONDER_STRUCT_FUNCTION \
  virtual function void from_responder_struct(spi_m_responder_s spi_m_responder_struct);\
           {\
           this.ssel , \
           this.mosi , \
           this.miso  \
           } = spi_m_responder_struct;\
  endfunction
// pragma uvmf custom additional begin
// pragma uvmf custom additional end
