
// UVM
+incdir+${UVM_HOME}/src
${UVM_HOME}/src/uvm_pkg.sv

// Common UVMF files
-f ${UVMF_HOME}/common/common_sve.f

// BFM Files
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/add_in_pkg/add_in_pkg_sve.F
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/add_out_pkg/add_out_pkg_sve.F

// Environment Files
-F ${UVMF_VIP_LIBRARY_HOME}/environment_packages/add_env_pkg/add_env_pkg_sve.F

// Bench Files
+incdir+./tb/tests
./tb/tests/add_ben_tests_pkg.sv

+incdir+./tb/sequences
./tb/sequences/add_ben_sequences_pkg.sv

+incdir+./tb/parameters
./tb/parameters/add_ben_parameters_pkg.sv

./tb/testbench/hdl_top.sv
./tb/testbench/hvl_top.sv

