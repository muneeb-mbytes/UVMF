# Tcl do file for compile of apb_master interface

# pragma uvmf custom additional begin
# pragma uvmf custom additional end


vlog -sv -timescale 1ps/1ps -suppress 2223,2286 +incdir+$env(UVMF_VIP_LIBRARY_HOME)/interface_packages/apb_master_pkg \
  -F $env(UVMF_VIP_LIBRARY_HOME)/interface_packages/apb_master_pkg/apb_master_filelist_hdl.f

vlog -sv -timescale 1ps/1ps -suppress 2223,2286 +incdir+$env(UVMF_VIP_LIBRARY_HOME)/interface_packages/apb_master_pkg \
  -F $env(UVMF_VIP_LIBRARY_HOME)/interface_packages/apb_master_pkg/apb_master_filelist_hvl.f

vlog -sv -timescale 1ps/1ps -suppress 2223,2286 +incdir+$env(UVMF_VIP_LIBRARY_HOME)/interface_packages/apb_master_pkg \
  -F $env(UVMF_VIP_LIBRARY_HOME)/interface_packages/apb_master_pkg/apb_master_filelist_xrtl.f