
// UVM
+incdir+${UVM_HOME}/src
${UVM_HOME}/src/uvm_pkg.sv

// Common UVMF files
-f ${UVMF_HOME}/common/common_sve.f

// BFM Files
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/apb_m_pkg/apb_m_pkg_sve.F
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/axi_m_pkg/axi_m_pkg_sve.F
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/spi_s_pkg/spi_s_pkg_sve.F

// Environment Files
-F ${UVMF_VIP_LIBRARY_HOME}/environment_packages/block_1_env_pkg/block_1_env_pkg_sve.F

// Bench Files
+incdir+./tb/tests
./tb/tests/block_1_tests_pkg.sv

+incdir+./tb/sequences
./tb/sequences/block_1_sequences_pkg.sv

+incdir+./tb/parameters
./tb/parameters/block_1_parameters_pkg.sv

./tb/testbench/hdl_top.sv
./tb/testbench/hvl_top.sv

