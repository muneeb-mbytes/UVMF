//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class records wb_slave transaction information using
//       a covergroup named wb_slave_transaction_cg.  An instance of this
//       coverage component is instantiated in the uvmf_parameterized_agent
//       if the has_coverage flag is set.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class wb_slave_transaction_coverage #(
      bit ADDR_WIDTH = 32,
      bit DATA_WIDTH = 32
      ) extends uvm_subscriber #(.T(wb_slave_transaction #(
                                            .ADDR_WIDTH(ADDR_WIDTH),
                                            .DATA_WIDTH(DATA_WIDTH)
                                            )));

  `uvm_component_param_utils( wb_slave_transaction_coverage #(
                              ADDR_WIDTH,
                              DATA_WIDTH
                              ))

  T coverage_trans;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  // ****************************************************************************
  covergroup wb_slave_transaction_cg;
    // pragma uvmf custom covergroup begin
    // UVMF_CHANGE_ME : Add coverage bins, crosses, exclusions, etc. according to coverage needs.
    option.auto_bin_max=1024;
    option.per_instance=1;
    adr_i: coverpoint coverage_trans.adr_i;
    dat_o: coverpoint coverage_trans.dat_o;
    dat_i: coverpoint coverage_trans.dat_i;
    we_i: coverpoint coverage_trans.we_i;
    sel_i: coverpoint coverage_trans.sel_i;
    stb_i: coverpoint coverage_trans.stb_i;
    ack_o: coverpoint coverage_trans.ack_o;
    cyc_i: coverpoint coverage_trans.cyc_i;
    // pragma uvmf custom covergroup end
  endgroup

  // ****************************************************************************
  // FUNCTION : new()
  // This function is the standard SystemVerilog constructor.
  //
  function new(string name="", uvm_component parent=null);
    super.new(name,parent);
    wb_slave_transaction_cg=new;
    `uvm_warning("COVERAGE_MODEL_REVIEW", "A covergroup has been constructed which may need review because of either generation or re-generation with merging.  Please note that transaction variables added as a result of re-generation and merging are not automatically added to the covergroup.  Remove this warning after the covergroup has been reviewed.")
  endfunction

  // ****************************************************************************
  // FUNCTION : build_phase()
  // This function is the standard UVM build_phase.
  //
  function void build_phase(uvm_phase phase);
    wb_slave_transaction_cg.set_inst_name($sformatf("wb_slave_transaction_cg_%s",get_full_name()));
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
    wb_slave_transaction_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

