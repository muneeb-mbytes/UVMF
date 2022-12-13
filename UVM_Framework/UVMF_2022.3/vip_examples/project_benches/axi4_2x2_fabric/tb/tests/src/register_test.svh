//----------------------------------------------------------------------
// Created with uvmf_gen version 2019.4_5
//----------------------------------------------------------------------
// Created by: Vijay Gill
// E-mail:     vijay_gill@mentor.com
// Date:       2019/11/05
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//                                          
// DESCRIPTION: This test extends test_top and makes 
//    changes to test_top using the UVM factory type_override:
//
//    Test scenario: 
//      This is a template test that can be used to create future tests.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class register_test extends test_top;

  `uvm_component_utils( register_test );

  function new( string name = "", uvm_component parent = null );
    super.new( name, parent );
  endfunction

  virtual function void build_phase(uvm_phase phase);
    // The factory override below replaces the axi4_2x2_fabric_bench_sequence_base 
    // sequence with the register_test_sequence.
    axi4_2x2_fabric_bench_sequence_base::type_id::set_type_override(register_test_sequence::get_type());
    // Execute the build_phase of test_top AFTER all factory overrides have been created.
    super.build_phase(phase);
  endfunction

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    // pragma uvmf custom register_test_scoreboard_control begin

    // These UVMF scoreboards may need to be disabled for the register test.  
    
    // environment.axi4_m0_sb.disable_scoreboard();
    // environment.axi4_m0_sb.disable_end_of_test_activity_check();
    
    // environment.axi4_m1_sb.disable_scoreboard();
    // environment.axi4_m1_sb.disable_end_of_test_activity_check();
    
    // environment.axi4_m0_rw_sb.disable_scoreboard();
    // environment.axi4_m0_rw_sb.disable_end_of_test_activity_check();
    
    // environment.axi4_m1_rw_sb.disable_scoreboard();
    // environment.axi4_m1_rw_sb.disable_end_of_test_activity_check();
    
    // pragma uvmf custom register_test_scoreboard_control end
  endfunction

endclass
