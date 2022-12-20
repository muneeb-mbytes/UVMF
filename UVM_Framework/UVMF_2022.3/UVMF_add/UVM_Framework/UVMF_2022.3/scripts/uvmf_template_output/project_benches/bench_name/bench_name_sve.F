
// UVM
+incdir+${UVM_HOME}/src
${UVM_HOME}/src/uvm_pkg.sv

// Common UVMF files
-f ${UVMF_HOME}/common/common_sve.f

// BFM Files
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/interface_name_pkg/interface_name_pkg_sve.F

// Environment Files
-F ${UVMF_VIP_LIBRARY_HOME}/environment_packages/environment_name_env_pkg/environment_name_env_pkg_sve.F

// Bench Files
+incdir+./tb/tests
./tb/tests/bench_name_tests_pkg.sv

+incdir+./tb/sequences
./tb/sequences/bench_name_sequences_pkg.sv

+incdir+./tb/parameters
./tb/parameters/bench_name_parameters_pkg.sv

./tb/testbench/hdl_top.sv
./tb/testbench/hvl_top.sv

