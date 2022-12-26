# Tcl do file for compile of apb_m interface

# pragma uvmf custom additional begin
# pragma uvmf custom additional end


vlog -sv -timescale 1ps/1ps -suppress 2223,2286 +incdir+$env(UVMF_VIP_LIBRARY_HOME)/interface_packages/apb_m_pkg \
  -F $env(UVMF_VIP_LIBRARY_HOME)/interface_packages/apb_m_pkg/apb_m_filelist_hdl.f

vlog -sv -timescale 1ps/1ps -suppress 2223,2286 +incdir+$env(UVMF_VIP_LIBRARY_HOME)/interface_packages/apb_m_pkg \
  -F $env(UVMF_VIP_LIBRARY_HOME)/interface_packages/apb_m_pkg/apb_m_filelist_hvl.f

vlog -sv -timescale 1ps/1ps -suppress 2223,2286 +incdir+$env(UVMF_VIP_LIBRARY_HOME)/interface_packages/apb_m_pkg \
  -F $env(UVMF_VIP_LIBRARY_HOME)/interface_packages/apb_m_pkg/apb_m_filelist_xrtl.f