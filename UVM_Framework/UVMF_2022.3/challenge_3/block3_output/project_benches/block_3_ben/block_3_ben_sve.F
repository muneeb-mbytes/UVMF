
// UVM
+incdir+${UVM_HOME}/src
${UVM_HOME}/src/uvm_pkg.sv

// Common UVMF files
-f ${UVMF_HOME}/common/common_sve.f

// BFM Files
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/wishbone_master_pkg/wishbone_master_pkg_sve.F
-F ${UVMF_VIP_LIBRARY_HOME}/interface_packages/axi_slave_pkg/axi_slave_pkg_sve.F

// Environment Files
-F ${UVMF_VIP_LIBRARY_HOME}/environment_packages/block_3_env_pkg/block_3_env_pkg_sve.F

// Bench Files
+incdir+./tb/tests
./tb/tests/block_3_ben_tests_pkg.sv

+incdir+./tb/sequences
./tb/sequences/block_3_ben_sequences_pkg.sv

+incdir+./tb/parameters
./tb/parameters/block_3_ben_parameters_pkg.sv

./tb/testbench/hdl_top.sv
./tb/testbench/hvl_top.sv

