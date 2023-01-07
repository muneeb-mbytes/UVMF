
// UVM
+incdir+${UVM_HOME}/src
${UVM_HOME}/src/uvm_pkg.sv

// Common UVMF files
-f ${UVMF_HOME}/common/common_sve.f

// BFM Files
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/spi_m_pkg/spi_m_pkg_sve.F
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/wb_s_pkg/wb_s_pkg_sve.F

// Environment Files
-F ${UVMF_VIP_LIBRARY_HOME}/environment_packages/block_2_env_pkg/block_2_env_pkg_sve.F

// Bench Files
+incdir+./tb/tests
./tb/tests/block_2_tests_pkg.sv

+incdir+./tb/sequences
./tb/sequences/block_2_sequences_pkg.sv

+incdir+./tb/parameters
./tb/parameters/block_2_parameters_pkg.sv

./tb/testbench/hdl_top.sv
./tb/testbench/hvl_top.sv

