# Tcl do file for compile of jtag_a interface

# pragma uvmf custom additional begin
# pragma uvmf custom additional end


vlog -sv -timescale 1ps/1ps -suppress 2223,2286 +incdir+$env(UVMF_VIP_LIBRARY_HOME)/interface_packages/jtag_a_pkg \
  -F $env(UVMF_VIP_LIBRARY_HOME)/interface_packages/jtag_a_pkg/jtag_a_filelist_hdl.f

vlog -sv -timescale 1ps/1ps -suppress 2223,2286 +incdir+$env(UVMF_VIP_LIBRARY_HOME)/interface_packages/jtag_a_pkg \
  -F $env(UVMF_VIP_LIBRARY_HOME)/interface_packages/jtag_a_pkg/jtag_a_filelist_hvl.f

vlog -sv -timescale 1ps/1ps -suppress 2223,2286 +incdir+$env(UVMF_VIP_LIBRARY_HOME)/interface_packages/jtag_a_pkg \
  -F $env(UVMF_VIP_LIBRARY_HOME)/interface_packages/jtag_a_pkg/jtag_a_filelist_xrtl.f