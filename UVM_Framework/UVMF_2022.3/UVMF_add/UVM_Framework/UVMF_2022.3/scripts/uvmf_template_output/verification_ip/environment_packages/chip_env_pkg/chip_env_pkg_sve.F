
// UVM
+incdir+${UVM_HOME}/src
${UVM_HOME}/src/uvm_pkg.sv

// Common UVMF files
-f ${UVMF_HOME}/common/common_sve.f

// Sub-Environments
-F ${UVMF_VIP_LIBRARY_HOME}/environment_packages/block_a_env_pkg/block_a_env_pkg_sve.F
-F ${UVMF_VIP_LIBRARY_HOME}/environment_packages/block_b_env_pkg/block_b_env_pkg_sve.F

+incdir+.
./chip_env_pkg.sv
