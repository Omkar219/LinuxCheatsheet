#!/bin/bash
ansible localhost -m ping
ansible localhost -m file -a "path=ansible.txt state=touch"
echo "hello world"
