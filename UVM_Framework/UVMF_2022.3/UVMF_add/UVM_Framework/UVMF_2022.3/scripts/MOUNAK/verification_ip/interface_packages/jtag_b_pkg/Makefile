# jtag_b interface packages source
# pragma uvmf custom additional begin
# pragma uvmf custom additional end

jtag_b_PKG         = \
	+incdir+$(UVMF_VIP_LIBRARY_HOME)/interface_packages/jtag_b_pkg \
	-F $(UVMF_VIP_LIBRARY_HOME)/interface_packages/jtag_b_pkg/jtag_b_filelist_hvl.f 

jtag_b_PKG_HDL         = \
	+incdir+$(UVMF_VIP_LIBRARY_HOME)/interface_packages/jtag_b_pkg \
	-F $(UVMF_VIP_LIBRARY_HOME)/interface_packages/jtag_b_pkg/jtag_b_filelist_hdl.f 

jtag_b_PKG_XRTL         = \
	+incdir+$(UVMF_VIP_LIBRARY_HOME)/interface_packages/jtag_b_pkg \
	-F $(UVMF_VIP_LIBRARY_HOME)/interface_packages/jtag_b_pkg/jtag_b_filelist_xrtl.f 

COMP_jtag_b_PKG_TGT_0 = q_comp_jtag_b_pkg
COMP_jtag_b_PKG_TGT_1 = v_comp_jtag_b_pkg
COMP_jtag_b_PKG_TGT = $(COMP_jtag_b_PKG_TGT_$(USE_VELOCE))

comp_jtag_b_pkg: $(COMP_jtag_b_PKG_TGT) 

q_comp_jtag_b_pkg:
	$(HDL_COMP_CMD) $(jtag_b_PKG_HDL)
	$(HVL_COMP_CMD) $(jtag_b_PKG)
	$(HDL_COMP_CMD) $(jtag_b_PKG_XRTL) 

v_comp_jtag_b_pkg:
	$(HVL_COMP_CMD) $(jtag_b_PKG_HDL)
	$(HVL_COMP_CMD) $(jtag_b_PKG)
	$(VELANALYZE_CMD) $(jtag_b_PKG_HDL) 
	$(VELANALYZE_HVL_CMD) $(jtag_b_PKG) 
	$(HDL_COMP_CMD) $(jtag_b_PKG_XRTL)

ifeq ($(MTI_VCO_MODE),64)
  GCC_COMP_ARCH = -m64
else
  GCC_COMP_ARCH = -m32
endif

export jtag_b_IF_DPI_SRC ?= $(UVMF_VIP_LIBRARY_HOME)/interface_packages/jtag_b_pkg/dpi

C_FILE_COMPILE_LIST_jtag_b_pkg	= \

O_FILE_COMPILE_LIST_jtag_b_pkg = $(notdir $(C_FILE_COMPILE_LIST_jtag_b_pkg:.c=.o))

GCC_COMP_ARGS_jtag_b_pkg	+= -I$(jtag_b_IF_DPI_SRC) \
	-fPIC 

GCC_COMP_ARGS_jtag_b_pkg	+= $(jtag_b_IF_GCC_COMP_ARGUMENTS)

GCC_LINK_ARGS_jtag_b_pkg	+= \
	 \
 	-o .so

comp_jtag_b_pkg_c_files:
	@echo "--------------------------------"
	@echo "Compiling Interface C source"
	@echo "--------------------------------"
	gcc $(GCC_COMP_ARCH) $(GCC_COMP_ARGS_jtag_b_pkg) $(C_FILE_COMPILE_LIST_jtag_b_pkg)
	@echo "--------------------------------"
	@echo "Linking Interface C objects into a shared object"
	@echo "--------------------------------"
	gcc $(GCC_COMP_ARCH) $(GCC_LINK_ARGS_jtag_b_pkg) $(O_FILE_COMPILE_LIST_jtag_b_pkg)
	@echo "--------------------------------"

