# pkt interface packages source
# pragma uvmf custom additional begin
# pragma uvmf custom additional end

pkt_PKG         = \
	+incdir+$(UVMF_VIP_LIBRARY_HOME)/interface_packages/pkt_pkg \
	-F $(UVMF_VIP_LIBRARY_HOME)/interface_packages/pkt_pkg/pkt_filelist_hvl.f 

pkt_PKG_HDL         = \
	+incdir+$(UVMF_VIP_LIBRARY_HOME)/interface_packages/pkt_pkg \
	-F $(UVMF_VIP_LIBRARY_HOME)/interface_packages/pkt_pkg/pkt_filelist_hdl.f 

pkt_PKG_XRTL         = \
	+incdir+$(UVMF_VIP_LIBRARY_HOME)/interface_packages/pkt_pkg \
	-F $(UVMF_VIP_LIBRARY_HOME)/interface_packages/pkt_pkg/pkt_filelist_xrtl.f 

COMP_pkt_PKG_TGT_0 = q_comp_pkt_pkg
COMP_pkt_PKG_TGT_1 = v_comp_pkt_pkg
COMP_pkt_PKG_TGT = $(COMP_pkt_PKG_TGT_$(USE_VELOCE))

comp_pkt_pkg: $(COMP_pkt_PKG_TGT)  comp_pkt_pkg_c_files 

q_comp_pkt_pkg:
	$(HDL_COMP_CMD) $(pkt_PKG_HDL)
	$(HVL_COMP_CMD) $(pkt_PKG)
	$(HDL_COMP_CMD) $(pkt_PKG_XRTL) 

v_comp_pkt_pkg:
	$(HVL_COMP_CMD) $(pkt_PKG_HDL)
	$(HVL_COMP_CMD) $(pkt_PKG)
	$(VELANALYZE_CMD) $(pkt_PKG_HDL) 
	$(VELANALYZE_HVL_CMD) $(pkt_PKG) 
	$(HDL_COMP_CMD) $(pkt_PKG_XRTL)

ifeq ($(MTI_VCO_MODE),64)
  GCC_COMP_ARCH = -m64
else
  GCC_COMP_ARCH = -m32
endif

export pkt_IF_DPI_SRC ?= $(UVMF_VIP_LIBRARY_HOME)/interface_packages/pkt_pkg/dpi

C_FILE_COMPILE_LIST_pkt_pkg	= \
	$(pkt_IF_DPI_SRC)/myFirstIfFile.c \
	$(pkt_IF_DPI_SRC)/mySecondIfFile.c \

O_FILE_COMPILE_LIST_pkt_pkg = $(notdir $(C_FILE_COMPILE_LIST_pkt_pkg:.c=.o))

GCC_COMP_ARGS_pkt_pkg	+= -I$(pkt_IF_DPI_SRC) \
	-fPIC -c -DPRINT32 -O2

GCC_COMP_ARGS_pkt_pkg	+= $(pkt_IF_GCC_COMP_ARGUMENTS)

GCC_LINK_ARGS_pkt_pkg	+= \
	-shared \
 	-o pktPkgCFunctions.so

comp_pkt_pkg_c_files:
	@echo "--------------------------------"
	@echo "Compiling Interface C source"
	@echo "--------------------------------"
	gcc $(GCC_COMP_ARCH) $(GCC_COMP_ARGS_pkt_pkg) $(C_FILE_COMPILE_LIST_pkt_pkg)
	@echo "--------------------------------"
	@echo "Linking Interface C objects into a shared object"
	@echo "--------------------------------"
	gcc $(GCC_COMP_ARCH) $(GCC_LINK_ARGS_pkt_pkg) $(O_FILE_COMPILE_LIST_pkt_pkg)
	@echo "--------------------------------"

