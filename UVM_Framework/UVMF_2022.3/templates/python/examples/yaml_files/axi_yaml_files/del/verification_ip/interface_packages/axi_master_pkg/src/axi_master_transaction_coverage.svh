//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class records axi_master transaction information using
//       a covergroup named axi_master_transaction_cg.  An instance of this
//       coverage component is instantiated in the uvmf_parameterized_agent
//       if the has_coverage flag is set.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class axi_master_transaction_coverage #(
      int id_width = 4,
      int len_width = 4,
      int size_width = 3,
      int addr_width = 32,
      int burst_width = 2,
      int data_width = 32,
      int strb_width = 4,
      int resp_width = 2
      ) extends uvm_subscriber #(.T(axi_master_transaction #(
                                            .id_width(id_width),
                                            .len_width(len_width),
                                            .size_width(size_width),
                                            .addr_width(addr_width),
                                            .burst_width(burst_width),
                                            .data_width(data_width),
                                            .strb_width(strb_width),
                                            .resp_width(resp_width)
                                            )));

  `uvm_component_param_utils( axi_master_transaction_coverage #(
                              id_width,
                              len_width,
                              size_width,
                              addr_width,
                              burst_width,
                              data_width,
                              strb_width,
                              resp_width
                              ))

  T coverage_trans;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  // ****************************************************************************
  covergroup axi_master_transaction_cg;
    // pragma uvmf custom covergroup begin
    // UVMF_CHANGE_ME : Add coverage bins, crosses, exclusions, etc. according to coverage needs.
    option.auto_bin_max=1024;
    option.per_instance=1;
    awvalid: coverpoint coverage_trans.awvalid;
    awid: coverpoint coverage_trans.awid;
    awlen: coverpoint coverage_trans.awlen;
    awsize: coverpoint coverage_trans.awsize;
    awaddr: coverpoint coverage_trans.awaddr;
    awburst: coverpoint coverage_trans.awburst;
    wvalid: coverpoint coverage_trans.wvalid;
    wready: coverpoint coverage_trans.wready;
    wid: coverpoint coverage_trans.wid;
    wsize: coverpoint coverage_trans.wsize;
    wdata: coverpoint coverage_trans.wdata;
    wstrb: coverpoint coverage_trans.wstrb;
    wlast: coverpoint coverage_trans.wlast;
    arvalid: coverpoint coverage_trans.arvalid;
    arready: coverpoint coverage_trans.arready;
    arid: coverpoint coverage_trans.arid;
    arlen: coverpoint coverage_trans.arlen;
    arsize: coverpoint coverage_trans.arsize;
    arburst: coverpoint coverage_trans.arburst;
    // pragma uvmf custom covergroup end
  endgroup

  // ****************************************************************************
  // FUNCTION : new()
  // This function is the standard SystemVerilog constructor.
  //
  function new(string name="", uvm_component parent=null);
    super.new(name,parent);
    axi_master_transaction_cg=new;
    `uvm_warning("COVERAGE_MODEL_REVIEW", "A covergroup has been constructed which may need review because of either generation or re-generation with merging.  Please note that transaction variables added as a result of re-generation and merging are not automatically added to the covergroup.  Remove this warning after the covergroup has been reviewed.")
  endfunction

  // ****************************************************************************
  // FUNCTION : build_phase()
  // This function is the standard UVM build_phase.
  //
  function void build_phase(uvm_phase phase);
    axi_master_transaction_cg.set_inst_name($sformatf("axi_master_transaction_cg_%s",get_full_name()));
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
    axi_master_transaction_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

