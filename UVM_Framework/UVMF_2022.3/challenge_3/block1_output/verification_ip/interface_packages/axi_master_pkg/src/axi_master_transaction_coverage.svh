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
class axi_master_transaction_coverage  extends uvm_subscriber #(.T(axi_master_transaction ));

  `uvm_component_utils( axi_master_transaction_coverage )

  T coverage_trans;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  // ****************************************************************************
  covergroup axi_master_transaction_cg;
    // pragma uvmf custom covergroup begin
    // UVMF_CHANGE_ME : Add coverage bins, crosses, exclusions, etc. according to coverage needs.
    option.auto_bin_max=1024;
    option.per_instance=1;
    AWID: coverpoint coverage_trans.AWID;
    AWADDR: coverpoint coverage_trans.AWADDR;
    AWLEN: coverpoint coverage_trans.AWLEN;
    AWSIZE: coverpoint coverage_trans.AWSIZE;
    AWBURST: coverpoint coverage_trans.AWBURST;
    AWLOCK: coverpoint coverage_trans.AWLOCK;
    AWCACHE: coverpoint coverage_trans.AWCACHE;
    AWQOS: coverpoint coverage_trans.AWQOS;
    AWREGION: coverpoint coverage_trans.AWREGION;
    AWUSER: coverpoint coverage_trans.AWUSER;
    AWPROT: coverpoint coverage_trans.AWPROT;
    AWVALID: coverpoint coverage_trans.AWVALID;
    AWREADY: coverpoint coverage_trans.AWREADY;
    WDATA: coverpoint coverage_trans.WDATA;
    WSTRB: coverpoint coverage_trans.WSTRB;
    WUSER: coverpoint coverage_trans.WUSER;
    WLAST: coverpoint coverage_trans.WLAST;
    BID: coverpoint coverage_trans.BID;
    BRESP: coverpoint coverage_trans.BRESP;
    BUSER: coverpoint coverage_trans.BUSER;
    BVALID: coverpoint coverage_trans.BVALID;
    ARID: coverpoint coverage_trans.ARID;
    ARADDR: coverpoint coverage_trans.ARADDR;
    ARLEN: coverpoint coverage_trans.ARLEN;
    ARSIZE: coverpoint coverage_trans.ARSIZE;
    ARBURST: coverpoint coverage_trans.ARBURST;
    ARCACHE: coverpoint coverage_trans.ARCACHE;
    ARPROT: coverpoint coverage_trans.ARPROT;
    ARQOS: coverpoint coverage_trans.ARQOS;
    ARREGION: coverpoint coverage_trans.ARREGION;
    ARUSER: coverpoint coverage_trans.ARUSER;
    ARLOCK: coverpoint coverage_trans.ARLOCK;
    RID: coverpoint coverage_trans.RID;
    RDATA: coverpoint coverage_trans.RDATA;
    RRESP: coverpoint coverage_trans.RRESP;
    RUSER: coverpoint coverage_trans.RUSER;
    RLAST: coverpoint coverage_trans.RLAST;
    RVALID: coverpoint coverage_trans.RVALID;
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

