#!/bin/bash

if [ -z "${1}" ]; then
	ansible-playbook -i hosts.yaml identify.yaml
	ansible-playbook -i hosts.yaml srv_info.yaml
	ansible-playbook -i hosts.yaml storage_test.yaml
	ansible-playbook -i hosts.yaml network_test.yaml -l gpu
	ansible-playbook -i hosts.yaml gpu_test.yaml -l gpu
else
	ansible-playbook -i hosts.yaml identify.yaml -l ${1}
	ansible-playbook -i hosts.yaml srv_info.yaml -l ${1}
	ansible-playbook -i hosts.yaml storage_test.yaml -l ${1}
 	ansible-playbook -i hosts.yaml network_test.yaml -l ${1}
 	ansible-playbook -i hosts.yaml gpu_test.yaml -l ${1}
fi

curl http://localhost | html2text > /var/www/html/index.txt

cat /var/www/html/index.txt

