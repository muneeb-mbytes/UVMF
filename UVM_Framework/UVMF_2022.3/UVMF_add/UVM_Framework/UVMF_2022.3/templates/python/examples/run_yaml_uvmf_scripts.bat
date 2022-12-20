@set QUESTA_ROOT=C:/MentorTools/questasim_2019.2
@set UVMF_HOME=C:/graemej/UVM_FRAMEWORK/UVMF_Repo_2019.4

python %UVMF_HOME%/scripts/yaml2uvmf.py jtag_interface.yaml jtag_util.yaml jtag_env.yaml jtag_bench.yaml -d ../uvmf_template_output

pause
