# Tcl do file for compile of pkt interface

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
    quietly set gcc_out_ext "so"
    quietly set gcc_comp_args "-fPIC"
  } 
  windows {
    quietly set gcc_out_ext "dll"
    quietly set gcc_comp_args ""
  }
  default {
    quietly echo "Unknown OS platform detected in compile.do"
    quit -code 103
  }
}

set cmd [format "gcc %s -I%s/interface_packages/pkt_pkg/dpi -c -DPRINT32 -O2 %s %s/interface_packages/pkt_pkg/dpi/myFirstIfFile.c" $gcc_comp_arch $env(UVMF_VIP_LIBRARY_HOME) $gcc_comp_args $env(UVMF_VIP_LIBRARY_HOME) ]
eval $cmd
set cmd [format "gcc %s -I%s/interface_packages/pkt_pkg/dpi -c -DPRINT32 -O2 %s %s/interface_packages/pkt_pkg/dpi/mySecondIfFile.c" $gcc_comp_arch $env(UVMF_VIP_LIBRARY_HOME) $gcc_comp_args $env(UVMF_VIP_LIBRARY_HOME) ]
eval $cmd
 
quietly set ofiles ""
quietly append ofiles " " [regsub -- {([^\.]*)\.c} myFirstIfFile.c {\1.o}]
quietly append ofiles " " [regsub -- {([^\.]*)\.c} mySecondIfFile.c {\1.o}]
set gcccmd [format "gcc %s -shared %s -o pktPkgCFunctions.%s" $gcc_comp_arch $ofiles $gcc_out_ext ]
eval $gcccmd

vlog -sv -timescale 1ps/1ps -suppress 2223,2286 +incdir+$env(UVMF_VIP_LIBRARY_HOME)/interface_packages/pkt_pkg \
  -F $env(UVMF_VIP_LIBRARY_HOME)/interface_packages/pkt_pkg/pkt_filelist_hdl.f

vlog -sv -timescale 1ps/1ps -suppress 2223,2286 +incdir+$env(UVMF_VIP_LIBRARY_HOME)/interface_packages/pkt_pkg \
  -F $env(UVMF_VIP_LIBRARY_HOME)/interface_packages/pkt_pkg/pkt_filelist_hvl.f

vlog -sv -timescale 1ps/1ps -suppress 2223,2286 +incdir+$env(UVMF_VIP_LIBRARY_HOME)/interface_packages/pkt_pkg \
  -F $env(UVMF_VIP_LIBRARY_HOME)/interface_packages/pkt_pkg/pkt_filelist_xrtl.f