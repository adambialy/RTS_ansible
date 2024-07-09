#/bin/bash

# This script will run gpu_burn binary on selected hosts
# defaut run
# example run for 20 minutes (1200 sec) default on all gpu nodes
# ./stress_gpu
# example run for 10 minutes (600 sec) on all gpu nodes
# ./stress_gpu 600
# example run for 5 minutes (300 sec) on all gpu01 and gpu02
# ./stress_gpu 300 gpu01,gpu02



if [ -z "${1}" ]; then
	T_DURATION=1200
else
	T_DURATION=${1}
fi


if [ -z "${2}" ]; then
	T_NODES=gpu
else
	T_NODES=${2}
fi

ansible -i hosts.yaml -m shell -a "cd /root/gpu-burn ; ./gpu_burn ${T_DURATION}" gpu

