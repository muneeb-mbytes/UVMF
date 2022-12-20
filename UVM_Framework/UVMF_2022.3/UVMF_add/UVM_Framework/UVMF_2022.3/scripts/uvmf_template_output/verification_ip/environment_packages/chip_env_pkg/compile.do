# Tcl do file for compile of chip interface

# pragma uvmf custom additional begin
# pragma uvmf custom additional end


# Include build for sub-environment block_a_env_pkg
quietly set cmd [format "source %s/environment_packages/block_a_env_pkg/compile.do" $env(UVMF_VIP_LIBRARY_HOME)]
eval $cmd
# Include build for sub-environment block_b_env_pkg
quietly set cmd [format "source %s/environment_packages/block_b_env_pkg/compile.do" $env(UVMF_VIP_LIBRARY_HOME)]
eval $cmd

quietly set cmd [format "vlog -timescale 1ps/1ps +incdir+%s/environment_packages/chip_env_pkg" $env(UVMF_VIP_LIBRARY_HOME)]
quietly set cmd [format "%s %s/environment_packages/chip_env_pkg/registers/chip_reg_pkg.sv" $cmd $env(UVMF_VIP_LIBRARY_HOME)]
quietly set cmd [format "%s %s/environment_packages/chip_env_pkg/chip_env_pkg.sv" $cmd $env(UVMF_VIP_LIBRARY_HOME)]
eval $cmd


