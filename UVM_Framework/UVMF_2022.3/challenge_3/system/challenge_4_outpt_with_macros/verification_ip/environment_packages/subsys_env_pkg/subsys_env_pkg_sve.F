
// UVM
+incdir+${UVM_HOME}/src
${UVM_HOME}/src/uvm_pkg.sv

// Common UVMF files
-f ${UVMF_HOME}/common/common_sve.f

// Sub-Environments
-F ${UVMF_VIP_LIBRARY_HOME}/environment_packages/block_1_env_pkg/block_1_env_pkg_sve.F
-F ${UVMF_VIP_LIBRARY_HOME}/environment_packages/block_2_env_pkg/block_2_env_pkg_sve.F

+incdir+.
./subsys_env_pkg.sv
