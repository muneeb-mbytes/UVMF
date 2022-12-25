//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class records apb transaction information using
//       a covergroup named apb_transaction_cg.  An instance of this
//       coverage component is instantiated in the uvmf_parameterized_agent
//       if the has_coverage flag is set.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class apb_transaction_coverage #(
      int APB_ADDR_WIDTH = 32,
      int APB_DATA_WIDTH = 32,
      int STRB_LEN = APB_ADDR_WIDTH/8
      ) extends uvm_subscriber #(.T(apb_transaction #(
                                            .APB_ADDR_WIDTH(APB_ADDR_WIDTH),
                                            .APB_DATA_WIDTH(APB_DATA_WIDTH),
                                            .STRB_LEN(STRB_LEN)
                                            )));

  `uvm_component_param_utils( apb_transaction_coverage #(
                              APB_ADDR_WIDTH,
                              APB_DATA_WIDTH,
                              STRB_LEN
                              ))

  T coverage_trans;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  // ****************************************************************************
  covergroup apb_transaction_cg;
    // pragma uvmf custom covergroup begin
    // UVMF_CHANGE_ME : Add coverage bins, crosses, exclusions, etc. according to coverage needs.
    option.auto_bin_max=1024;
    option.per_instance=1;
    psel: coverpoint coverage_trans.psel;
    penable: coverpoint coverage_trans.penable;
    paddr: coverpoint coverage_trans.paddr;
    pwdata: coverpoint coverage_trans.pwdata;
    pwrite: coverpoint coverage_trans.pwrite;
    pstrb: coverpoint coverage_trans.pstrb;
    pprot: coverpoint coverage_trans.pprot;
    prdata: coverpoint coverage_trans.prdata;
    pready: coverpoint coverage_trans.pready;
    pslverr: coverpoint coverage_trans.pslverr;
    // pragma uvmf custom covergroup end
  endgroup

  // ****************************************************************************
  // FUNCTION : new()
  // This function is the standard SystemVerilog constructor.
  //
  function new(string name="", uvm_component parent=null);
    super.new(name,parent);
    apb_transaction_cg=new;
    `uvm_warning("COVERAGE_MODEL_REVIEW", "A covergroup has been constructed which may need review because of either generation or re-generation with merging.  Please note that transaction variables added as a result of re-generation and merging are not automatically added to the covergroup.  Remove this warning after the covergroup has been reviewed.")
  endfunction

  // ****************************************************************************
  // FUNCTION : build_phase()
  // This function is the standard UVM build_phase.
  //
  function void build_phase(uvm_phase phase);
    apb_transaction_cg.set_inst_name($sformatf("apb_transaction_cg_%s",get_full_name()));
  endfunction

  // ****************************************************************************
  // FUNCTION: write (T t)
  // This function is automatically executed when a transaction arrives on the
  // analysis_export.  It copies values from the variables in the transaction 
  // to local variables used to collect functional coverage.  
  //
  virtual function void write (T t);
    `uvm_info("COV","Received transaction",UVM_HIGH);
    coverage_trans = t;
    apb_transaction_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

