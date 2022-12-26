# Setting the path for making "make cli" command works fine.

setenv UVMF_HOME /hwetools/work_area/frontend/vinay_B7/UVMF/UVM_Framework/UVMF_2022.3/

# This is the command to generate you block_2_level bench

python ../../../UVMF_2022.3/scripts/yaml2uvmf.py ../intf/spi_m_intf.yaml ../intf/wb_s_intf.yaml ../block_2/block2_env.yaml ../block_2/block2_util.yaml
