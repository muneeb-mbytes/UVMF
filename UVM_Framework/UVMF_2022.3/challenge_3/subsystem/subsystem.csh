# This is the command to generate you subsystem_1_level bench

python ../../../UVMF_2022.3/scripts/yaml2uvmf.py ../intf/apb_m_intf.yaml ../intf/axi_m_intf.yaml ../intf/spi_s_intf.yaml ../intf/spi_m_intf.yaml ../intf/wb_s_intf.yaml ../block_1/block1_env.yaml ../block_1/block1_util.yaml ../block_1/block1_bench.yaml ../block_2/block2_env.yaml ../block_2/block2_util.yaml ../block_2/block2_bench.yaml ../subsystem/subsystem.yaml ../subsystem/subsystem_utils.yaml ../subsystem/subsystem_bench.yaml
