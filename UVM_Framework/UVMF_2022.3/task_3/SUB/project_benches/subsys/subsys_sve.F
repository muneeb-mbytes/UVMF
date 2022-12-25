
// UVM
+incdir+${UVM_HOME}/src
${UVM_HOME}/src/uvm_pkg.sv

// Common UVMF files
-f ${UVMF_HOME}/common/common_sve.f

// BFM Files
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/apb_pkg/apb_pkg_sve.F
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/axi_m_pkg/axi_m_pkg_sve.F
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/spi_s_pkg/spi_s_pkg_sve.F
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/spi_m_pkg/spi_m_pkg_sve.F
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/wb_s_pkg/wb_s_pkg_sve.F

// Environment Files
-F ${UVMF_VIP_LIBRARY_HOME}/environment_packages/subsys_env_pkg/subsys_env_pkg_sve.F

// Bench Files
+incdir+./tb/tests
./tb/tests/subsys_tests_pkg.sv

+incdir+./tb/sequences
./tb/sequences/subsys_sequences_pkg.sv

+incdir+./tb/parameters
./tb/parameters/subsys_parameters_pkg.sv

./tb/testbench/hdl_top.sv
./tb/testbench/hvl_top.sv

