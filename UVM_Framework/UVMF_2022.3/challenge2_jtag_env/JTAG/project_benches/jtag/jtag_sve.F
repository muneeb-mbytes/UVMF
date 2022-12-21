
// UVM
+incdir+${UVM_HOME}/src
${UVM_HOME}/src/uvm_pkg.sv

// Common UVMF files
-f ${UVMF_HOME}/common/common_sve.f

// BFM Files
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/jtag_a_pkg/jtag_a_pkg_sve.F
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/jtag_b_pkg/jtag_b_pkg_sve.F

// Environment Files
-F ${UVMF_VIP_LIBRARY_HOME}/environment_packages/jtag_env_pkg/jtag_env_pkg_sve.F

// Bench Files
+incdir+./tb/tests
./tb/tests/jtag_tests_pkg.sv

+incdir+./tb/sequences
./tb/sequences/jtag_sequences_pkg.sv

+incdir+./tb/parameters
./tb/parameters/jtag_parameters_pkg.sv

./tb/testbench/hdl_top.sv
./tb/testbench/hvl_top.sv

