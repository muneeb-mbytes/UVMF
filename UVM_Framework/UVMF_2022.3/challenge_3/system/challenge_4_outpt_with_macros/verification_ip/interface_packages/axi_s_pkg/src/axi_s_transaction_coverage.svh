//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class records axi_s transaction information using
//       a covergroup named axi_s_transaction_cg.  An instance of this
//       coverage component is instantiated in the uvmf_parameterized_agent
//       if the has_coverage flag is set.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
`ifndef AXI_S_TRANSACTION_COVERAGE
`define AXI_S_TRANSACTION_COVERAGE
class axi_s_transaction_coverage #(
      int AW_WIDTH = 32,
      int LEN = 8,
      int DATA_WIDTH = 32,
      int X = 16
      ) extends uvm_subscriber #(.T(axi_s_transaction #(
                                            .AW_WIDTH(AW_WIDTH),
                                            .LEN(LEN),
                                            .DATA_WIDTH(DATA_WIDTH),
                                            .X(X)
                                            )));

  `uvm_component_param_utils( axi_s_transaction_coverage #(
                              AW_WIDTH,
                              LEN,
                              DATA_WIDTH,
                              X
                              ))

  T coverage_trans;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  // ****************************************************************************
  covergroup axi_s_transaction_cg;
    // pragma uvmf custom covergroup begin
    // UVMF_CHANGE_ME : Add coverage bins, crosses, exclusions, etc. according to coverage needs.
    option.auto_bin_max=1024;
    option.per_instance=1;
    awvalid: coverpoint coverage_trans.awvalid;
    awready: coverpoint coverage_trans.awready;
    awaddr: coverpoint coverage_trans.awaddr;
    awsize: coverpoint coverage_trans.awsize;
    awburst: coverpoint coverage_trans.awburst;
    awcache: coverpoint coverage_trans.awcache;
    awprot: coverpoint coverage_trans.awprot;
    awid: coverpoint coverage_trans.awid;
    awlen: coverpoint coverage_trans.awlen;
    awlock: coverpoint coverage_trans.awlock;
    awqos: coverpoint coverage_trans.awqos;
    awregion: coverpoint coverage_trans.awregion;
    awuser: coverpoint coverage_trans.awuser;
    wvalid: coverpoint coverage_trans.wvalid;
    wready: coverpoint coverage_trans.wready;
    wlast: coverpoint coverage_trans.wlast;
    wdata: coverpoint coverage_trans.wdata;
    wstrb: coverpoint coverage_trans.wstrb;
    wid: coverpoint coverage_trans.wid;
    wuser: coverpoint coverage_trans.wuser;
    bwvalid: coverpoint coverage_trans.bwvalid;
    bwready: coverpoint coverage_trans.bwready;
    bresp: coverpoint coverage_trans.bresp;
    bid: coverpoint coverage_trans.bid;
    buser: coverpoint coverage_trans.buser;
    arvalid: coverpoint coverage_trans.arvalid;
    aready: coverpoint coverage_trans.aready;
    araddr: coverpoint coverage_trans.araddr;
    arsize: coverpoint coverage_trans.arsize;
    arburst: coverpoint coverage_trans.arburst;
    arcache: coverpoint coverage_trans.arcache;
    arprot: coverpoint coverage_trans.arprot;
    arid: coverpoint coverage_trans.arid;
    arlen: coverpoint coverage_trans.arlen;
    arlock: coverpoint coverage_trans.arlock;
    arqos: coverpoint coverage_trans.arqos;
    aregion: coverpoint coverage_trans.aregion;
    aruser: coverpoint coverage_trans.aruser;
    rvalid: coverpoint coverage_trans.rvalid;
    rready: coverpoint coverage_trans.rready;
    rlast: coverpoint coverage_trans.rlast;
    rdata: coverpoint coverage_trans.rdata;
    rid: coverpoint coverage_trans.rid;
    ruser: coverpoint coverage_trans.ruser;
    rresp: coverpoint coverage_trans.rresp;
    // pragma uvmf custom covergroup end
  endgroup

  // ****************************************************************************
  // FUNCTION : new()
  // This function is the standard SystemVerilog constructor.
  //
  function new(string name="", uvm_component parent=null);
    super.new(name,parent);
    axi_s_transaction_cg=new;
    `uvm_warning("COVERAGE_MODEL_REVIEW", "A covergroup has been constructed which may need review because of either generation or re-generation with merging.  Please note that transaction variables added as a result of re-generation and merging are not automatically added to the covergroup.  Remove this warning after the covergroup has been reviewed.")
  endfunction

  // ****************************************************************************
  // FUNCTION : build_phase()
  // This function is the standard UVM build_phase.
  //
  function void build_phase(uvm_phase phase);
    axi_s_transaction_cg.set_inst_name($sformatf("axi_s_transaction_cg_%s",get_full_name()));
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
    axi_s_transaction_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

`endif
