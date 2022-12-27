`ifndef BLOCK_1_ENVIRONMENT_COMPILE_DO.TMPL
# Tcl do file for compile of block_1 interface

# pragma uvmf custom additional begin
# pragma uvmf custom additional end



quietly set cmd [format "vlog -timescale 1ps/1ps +incdir+%s/environment_packages/block_1_env_pkg" $env(UVMF_VIP_LIBRARY_HOME)]
quietly set cmd [format "%s %s/environment_packages/block_1_env_pkg/block_1_env_pkg.sv" $cmd $env(UVMF_VIP_LIBRARY_HOME)]
eval $cmd

`endif