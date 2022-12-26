# Setting the path for making "make cli" command works fine.

setenv UVMF_HOME /hwetools/work_area/frontend/vinay_B7/UVMF/UVM_Framework/UVMF_2022.3/

# This is the command to generate you block_1_level bench

python ../../../UVMF_2022.3/scripts/yaml2uvmf.py ../intf/apb_m_intf.yaml ../intf/axi_m_intf.yaml ../intf/axi_s_intf.yaml ../intf/spi_m_intf.yaml ../intf/spi_s_intf.yaml ../intf/wb_m_intf.yaml ../intf/wb_s_intf.yaml ../block_1/block1_env.yaml ../block_1/block1_util.yaml ../block_2/block2_env.yaml ../block_2/block2_util.yaml ../block_3/block3_env.yaml ../block_3/block3_util.yaml ../subsystem/subsystem_bench.yaml ../subsystem/subsystem.yaml ../subsystem/subsystem_utils.yaml ../system/system_bench.yaml ../system/system.yaml ../system/system_util.yaml
