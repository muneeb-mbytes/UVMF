# axi_slave interface packages source
# pragma uvmf custom additional begin
# pragma uvmf custom additional end

axi_slave_PKG         = \
	+incdir+$(UVMF_VIP_LIBRARY_HOME)/interface_packages/axi_slave_pkg \
	-F $(UVMF_VIP_LIBRARY_HOME)/interface_packages/axi_slave_pkg/axi_slave_filelist_hvl.f 

axi_slave_PKG_HDL         = \
	+incdir+$(UVMF_VIP_LIBRARY_HOME)/interface_packages/axi_slave_pkg \
	-F $(UVMF_VIP_LIBRARY_HOME)/interface_packages/axi_slave_pkg/axi_slave_filelist_hdl.f 

axi_slave_PKG_XRTL         = \
	+incdir+$(UVMF_VIP_LIBRARY_HOME)/interface_packages/axi_slave_pkg \
	-F $(UVMF_VIP_LIBRARY_HOME)/interface_packages/axi_slave_pkg/axi_slave_filelist_xrtl.f 

COMP_axi_slave_PKG_TGT_0 = q_comp_axi_slave_pkg
COMP_axi_slave_PKG_TGT_1 = v_comp_axi_slave_pkg
COMP_axi_slave_PKG_TGT = $(COMP_axi_slave_PKG_TGT_$(USE_VELOCE))

comp_axi_slave_pkg: $(COMP_axi_slave_PKG_TGT) 

q_comp_axi_slave_pkg:
	$(HDL_COMP_CMD) $(axi_slave_PKG_HDL)
	$(HVL_COMP_CMD) $(axi_slave_PKG)
	$(HDL_COMP_CMD) $(axi_slave_PKG_XRTL) 

v_comp_axi_slave_pkg:
	$(HVL_COMP_CMD) $(axi_slave_PKG_HDL)
	$(HVL_COMP_CMD) $(axi_slave_PKG)
	$(VELANALYZE_CMD) $(axi_slave_PKG_HDL) 
	$(VELANALYZE_HVL_CMD) $(axi_slave_PKG) 
	$(HDL_COMP_CMD) $(axi_slave_PKG_XRTL)

ifeq ($(MTI_VCO_MODE),64)
  GCC_COMP_ARCH = -m64
else
  GCC_COMP_ARCH = -m32
endif

export axi_slave_IF_DPI_SRC ?= $(UVMF_VIP_LIBRARY_HOME)/interface_packages/axi_slave_pkg/dpi

C_FILE_COMPILE_LIST_axi_slave_pkg	= \

O_FILE_COMPILE_LIST_axi_slave_pkg = $(notdir $(C_FILE_COMPILE_LIST_axi_slave_pkg:.c=.o))

GCC_COMP_ARGS_axi_slave_pkg	+= -I$(axi_slave_IF_DPI_SRC) \
	-fPIC 

GCC_COMP_ARGS_axi_slave_pkg	+= $(axi_slave_IF_GCC_COMP_ARGUMENTS)

GCC_LINK_ARGS_axi_slave_pkg	+= \
	 \
 	-o .so

comp_axi_slave_pkg_c_files:
	@echo "--------------------------------"
	@echo "Compiling Interface C source"
	@echo "--------------------------------"
	gcc $(GCC_COMP_ARCH) $(GCC_COMP_ARGS_axi_slave_pkg) $(C_FILE_COMPILE_LIST_axi_slave_pkg)
	@echo "--------------------------------"
	@echo "Linking Interface C objects into a shared object"
	@echo "--------------------------------"
	gcc $(GCC_COMP_ARCH) $(GCC_LINK_ARGS_axi_slave_pkg) $(O_FILE_COMPILE_LIST_axi_slave_pkg)
	@echo "--------------------------------"

