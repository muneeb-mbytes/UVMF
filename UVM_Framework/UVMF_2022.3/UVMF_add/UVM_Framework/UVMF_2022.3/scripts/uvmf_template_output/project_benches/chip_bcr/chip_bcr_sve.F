
// UVM
+incdir+${UVM_HOME}/src
${UVM_HOME}/src/uvm_pkg.sv

// Common UVMF files
-f ${UVMF_HOME}/common/common_sve.f

// BFM Files
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/mem_pkg/mem_pkg_sve.F
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/pkt_pkg/pkt_pkg_sve.F

// Environment Files
-F ${UVMF_VIP_LIBRARY_HOME}/environment_packages/chip_env_pkg/chip_env_pkg_sve.F

// Bench Files
+incdir+./tb/tests
./tb/tests/chip_bcr_tests_pkg.sv

+incdir+./tb/sequences
./tb/sequences/chip_bcr_sequences_pkg.sv

+incdir+./tb/parameters
./tb/parameters/chip_bcr_parameters_pkg.sv

./tb/testbench/hdl_top.sv
./tb/testbench/hvl_top.sv

