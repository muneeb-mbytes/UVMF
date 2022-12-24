//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This file contains macros used with the spi_slave package.
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
//      the spi_slave_configuration class.
//
  `define spi_slave_CONFIGURATION_STRUCT \
typedef struct packed  { \
     bit is_active;\
     int no_of_slaves;\
     bit has_coverage;\
     uvmf_active_passive_t active_passive; \
     uvmf_initiator_responder_t initiator_responder; \
     } spi_slave_configuration_s;

  `define spi_slave_CONFIGURATION_TO_STRUCT_FUNCTION \
  virtual function spi_slave_configuration_s to_struct();\
    spi_slave_configuration_struct = \
       {\
       this.is_active,\
       this.no_of_slaves,\
       this.has_coverage,\
       this.active_passive,\
       this.initiator_responder\
       };\
    return ( spi_slave_configuration_struct );\
  endfunction

  `define spi_slave_CONFIGURATION_FROM_STRUCT_FUNCTION \
  virtual function void from_struct(spi_slave_configuration_s spi_slave_configuration_struct);\
      {\
      this.is_active,\
      this.no_of_slaves,\
      this.has_coverage,\
      this.active_passive,\
      this.initiator_responder  \
      } = spi_slave_configuration_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_monitor_struct
//      and from_monitor_struct methods of the spi_slave_transaction class.
//
  `define spi_slave_MONITOR_STRUCT typedef struct packed  { \
  bit sck ; \
  bit cs ; \
  bit mosi ; \
  bit miso ; \
     } spi_slave_monitor_s;

  `define spi_slave_TO_MONITOR_STRUCT_FUNCTION \
  virtual function spi_slave_monitor_s to_monitor_struct();\
    spi_slave_monitor_struct = \
            { \
            this.sck , \
            this.cs , \
            this.mosi , \
            this.miso  \
            };\
    return ( spi_slave_monitor_struct);\
  endfunction\

  `define spi_slave_FROM_MONITOR_STRUCT_FUNCTION \
  virtual function void from_monitor_struct(spi_slave_monitor_s spi_slave_monitor_struct);\
            {\
            this.sck , \
            this.cs , \
            this.mosi , \
            this.miso  \
            } = spi_slave_monitor_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_initiator_struct
//      and from_initiator_struct methods of the spi_slave_transaction class.
//      Also update the comments in the driver BFM.
//
  `define spi_slave_INITIATOR_STRUCT typedef struct packed  { \
  bit sck ; \
  bit cs ; \
  bit mosi ; \
  bit miso ; \
     } spi_slave_initiator_s;

  `define spi_slave_TO_INITIATOR_STRUCT_FUNCTION \
  virtual function spi_slave_initiator_s to_initiator_struct();\
    spi_slave_initiator_struct = \
           {\
           this.sck , \
           this.cs , \
           this.mosi , \
           this.miso  \
           };\
    return ( spi_slave_initiator_struct);\
  endfunction

  `define spi_slave_FROM_INITIATOR_STRUCT_FUNCTION \
  virtual function void from_initiator_struct(spi_slave_initiator_s spi_slave_initiator_struct);\
           {\
           this.sck , \
           this.cs , \
           this.mosi , \
           this.miso  \
           } = spi_slave_initiator_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_responder_struct
//      and from_responder_struct methods of the spi_slave_transaction class.
//      Also update the comments in the driver BFM.
//
  `define spi_slave_RESPONDER_STRUCT typedef struct packed  { \
  bit sck ; \
  bit cs ; \
  bit mosi ; \
  bit miso ; \
     } spi_slave_responder_s;

  `define spi_slave_TO_RESPONDER_STRUCT_FUNCTION \
  virtual function spi_slave_responder_s to_responder_struct();\
    spi_slave_responder_struct = \
           {\
           this.sck , \
           this.cs , \
           this.mosi , \
           this.miso  \
           };\
    return ( spi_slave_responder_struct);\
  endfunction

  `define spi_slave_FROM_RESPONDER_STRUCT_FUNCTION \
  virtual function void from_responder_struct(spi_slave_responder_s spi_slave_responder_struct);\
           {\
           this.sck , \
           this.cs , \
           this.mosi , \
           this.miso  \
           } = spi_slave_responder_struct;\
  endfunction
// pragma uvmf custom additional begin
// pragma uvmf custom additional end
