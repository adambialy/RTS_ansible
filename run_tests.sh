#!/bin/bash

if [ -z "${1}" ]; then
	ansible-playbook -i inventory/hosts.yaml srv_info.yaml -l gpu
	ansible-playbook -i inventory/hosts.yaml storage_test.yaml -l gpu
	ansible-playbook -i inventory/hosts.yaml network_test.yaml -l gpu
else
	ansible-playbook -i inventory/hosts.yaml srv_info.yaml -l ${1}
	ansible-playbook -i inventory/hosts.yaml storage_test.yaml -l ${1}
 	ansible-playbook -i inventory/hosts.yaml network_test.yaml -l ${1}
fi


