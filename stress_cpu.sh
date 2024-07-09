#/bin/bash

# This script will run gpu_burn binary on selected hosts
# defaut run
# example run for 20 minutes (1200 sec) default on all nodes
# ./stress_cpu
# example run for 10 minutes (600 sec) on all gpu nodes
# ./stress_cpu 600 gpu
# example run for 5 minutes (300 sec) on gpu01 and gpu02
# ./stress_cpu 300 gpu01,gpu02



if [ -z "${1}" ]; then
	T_DURATION=1200
else
	T_DURATION=${1}
fi


if [ -z "${2}" ]; then
	T_NODES=all
else
	T_NODES=${2}
fi

echo ansible -i hosts.yaml -m shell -a "stress-ng --matrix 1 -t ${T_DURATION}s" ${T_NODES}


