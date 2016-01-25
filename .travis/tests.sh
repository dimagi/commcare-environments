#!/bin/bash

test_syntax() {
  ansible-playbook -i ansible/inventories/test ansible/deploy_stack.yml --syntax-check
}

test_localsettings() {
  mkdir -p www/dev/current
  ansible-playbook -i ansible/inventories/test ansible/deploy_stack --tags=localsettings
  python -m py_compile www/dev/current/localsettings.py
}

test_syntax
test_localsettings
