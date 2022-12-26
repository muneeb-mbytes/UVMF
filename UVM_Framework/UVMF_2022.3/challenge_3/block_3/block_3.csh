# Setting the path for making "make cli" command works fine.

setenv UVMF_HOME /hwetools/work_area/frontend/vinay_B7/UVMF/UVM_Framework/UVMF_2022.3/

# This is the command to generate you block_3_level bench

python ../../../UVMF_2022.3/scripts/yaml2uvmf.py ../intf/wb_m_intf.yaml ../intf/axi_s_intf.yaml ../block_3/block3_env.yaml ../block_3/block3_util.yaml
