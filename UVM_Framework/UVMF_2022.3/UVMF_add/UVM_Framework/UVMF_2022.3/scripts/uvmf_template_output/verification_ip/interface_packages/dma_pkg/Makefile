# dma interface packages source
# pragma uvmf custom additional begin
# pragma uvmf custom additional end

dma_PKG         = \
	+incdir+$(UVMF_VIP_LIBRARY_HOME)/interface_packages/dma_pkg \
	-F $(UVMF_VIP_LIBRARY_HOME)/interface_packages/dma_pkg/dma_filelist_hvl.f 

dma_PKG_HDL         = \
	+incdir+$(UVMF_VIP_LIBRARY_HOME)/interface_packages/dma_pkg \
	-F $(UVMF_VIP_LIBRARY_HOME)/interface_packages/dma_pkg/dma_filelist_hdl.f 

dma_PKG_XRTL         = \
	+incdir+$(UVMF_VIP_LIBRARY_HOME)/interface_packages/dma_pkg \
	-F $(UVMF_VIP_LIBRARY_HOME)/interface_packages/dma_pkg/dma_filelist_xrtl.f 

COMP_dma_PKG_TGT_0 = q_comp_dma_pkg
COMP_dma_PKG_TGT_1 = v_comp_dma_pkg
COMP_dma_PKG_TGT = $(COMP_dma_PKG_TGT_$(USE_VELOCE))

comp_dma_pkg: $(COMP_dma_PKG_TGT) 

q_comp_dma_pkg:
	$(HDL_COMP_CMD) $(dma_PKG_HDL)
	$(HVL_COMP_CMD) $(dma_PKG)
	$(HDL_COMP_CMD) $(dma_PKG_XRTL) 

v_comp_dma_pkg:
	$(HVL_COMP_CMD) $(dma_PKG_HDL)
	$(HVL_COMP_CMD) $(dma_PKG)
	$(VELANALYZE_CMD) $(dma_PKG_HDL) 
	$(VELANALYZE_HVL_CMD) $(dma_PKG) 
	$(HDL_COMP_CMD) $(dma_PKG_XRTL)

ifeq ($(MTI_VCO_MODE),64)
  GCC_COMP_ARCH = -m64
else
  GCC_COMP_ARCH = -m32
endif

export dma_IF_DPI_SRC ?= $(UVMF_VIP_LIBRARY_HOME)/interface_packages/dma_pkg/dpi

C_FILE_COMPILE_LIST_dma_pkg	= \

O_FILE_COMPILE_LIST_dma_pkg = $(notdir $(C_FILE_COMPILE_LIST_dma_pkg:.c=.o))

GCC_COMP_ARGS_dma_pkg	+= -I$(dma_IF_DPI_SRC) \
	-fPIC 

GCC_COMP_ARGS_dma_pkg	+= $(dma_IF_GCC_COMP_ARGUMENTS)

GCC_LINK_ARGS_dma_pkg	+= \
	 \
 	-o .so

comp_dma_pkg_c_files:
	@echo "--------------------------------"
	@echo "Compiling Interface C source"
	@echo "--------------------------------"
	gcc $(GCC_COMP_ARCH) $(GCC_COMP_ARGS_dma_pkg) $(C_FILE_COMPILE_LIST_dma_pkg)
	@echo "--------------------------------"
	@echo "Linking Interface C objects into a shared object"
	@echo "--------------------------------"
	gcc $(GCC_COMP_ARCH) $(GCC_LINK_ARGS_dma_pkg) $(O_FILE_COMPILE_LIST_dma_pkg)
	@echo "--------------------------------"

