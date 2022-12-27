
// UVM
+incdir+${UVM_HOME}/src
${UVM_HOME}/src/uvm_pkg.sv

// Common UVMF files
-f ${UVMF_HOME}/common/common_sve.f

// BFM Files
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/wb_m_pkg/wb_m_pkg_sve.F
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/axi_s_pkg/axi_s_pkg_sve.F

// Environment Files
-F ${UVMF_VIP_LIBRARY_HOME}/environment_packages/block_3_env_pkg/block_3_env_pkg_sve.F

// Bench Files
+incdir+./tb/tests
./tb/tests/block_3_tests_pkg.sv

+incdir+./tb/sequences
./tb/sequences/block_3_sequences_pkg.sv

+incdir+./tb/parameters
./tb/parameters/block_3_parameters_pkg.sv

./tb/testbench/hdl_top.sv
./tb/testbench/hvl_top.sv

