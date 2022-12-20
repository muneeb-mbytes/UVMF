# Tcl do file for compile of block_b interface

# pragma uvmf custom additional begin
# pragma uvmf custom additional end

# Build from associated DPI C source
if {$tcl_platform(pointerSize)==8} {
  quietly set gcc_comp_arch "-m64"
} else {
  quietly set gcc_comp_arch "-m32"
}

# OS-dependent arguments for DPI compile and link
switch $tcl_platform(platform) {
  unix {
    set gcc_out_ext "so"
    set gcc_comp_args "-fPIC"
  } 
  windows {
    set gcc_out_ext "dll"
    set gcc_comp_args ""
  }
  default {
    echo "Unknown OS platform detected in compile.do"
    quit -code 103
  }
}

quietly set ofiles ""
set cmd [format "gcc %s -I%s/environment_packages/block_b_env_pkg/dpi -c -DPRINT32 -O2 %s %s/environment_packages/block_b_env_pkg/dpi/myFirstFile.c" $gcc_comp_arch $env(UVMF_VIP_LIBRARY_HOME) $gcc_comp_args $env(UVMF_VIP_LIBRARY_HOME)]
eval $cmd
quietly set ofiles [format "%s %s" $ofiles [regsub -- {([^\.]*)\.c} myFirstFile.c {\1.o}]]
set cmd [format "gcc %s -I%s/environment_packages/block_b_env_pkg/dpi -c -DPRINT32 -O2 %s %s/environment_packages/block_b_env_pkg/dpi/mySecondFile.c" $gcc_comp_arch $env(UVMF_VIP_LIBRARY_HOME) $gcc_comp_args $env(UVMF_VIP_LIBRARY_HOME)]
eval $cmd
quietly set ofiles [format "%s %s" $ofiles [regsub -- {([^\.]*)\.c} mySecondFile.c {\1.o}]]
set cmd [format "gcc %s -shared %s -o blockBEnvPkgCFunctions.%s" $gcc_comp_arch $ofiles $gcc_out_ext ]
eval $cmd


quietly set cmd [format "vlog -timescale 1ps/1ps +incdir+%s/environment_packages/block_b_env_pkg" $env(UVMF_VIP_LIBRARY_HOME)]
quietly set cmd [format "%s %s/environment_packages/block_b_env_pkg/registers/blkb_reg_pkg.sv" $cmd $env(UVMF_VIP_LIBRARY_HOME)]
quietly set cmd [format "%s %s/environment_packages/block_b_env_pkg/block_b_env_pkg.sv" $cmd $env(UVMF_VIP_LIBRARY_HOME)]
eval $cmd


