#!/bin/bash
ansible-playbook playbook.yml -i hosts -v
# when installing dependencies
#ansible-playbook playbook.yml -i hosts --ask-sudo-pass -v
