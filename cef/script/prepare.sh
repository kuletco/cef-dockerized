#!/bin/bash

set -e

os_codename=$(awk -F= '/^VERSION_CODENAME/ {print $2}' /etc/os-release)
source_url='http://mirrors.ustc.edu.cn'

mv /etc/apt/sources.list /etc/apt/sources.list.bak

cat > /etc/apt/sources.list << EOF
deb ${source_url}/debian/ ${os_codename} main contrib non-free
deb ${source_url}/debian/ ${os_codename}-updates main contrib non-free
deb ${source_url}/debian-security ${os_codename}/updates main contrib non-free

# deb-src ${source_url}/debian/ ${os_codename} main contrib non-free
# deb-src ${source_url}/debian/ ${os_codename}-updates main contrib non-free
# deb-src ${source_url}/debian-security ${os_codename}/updates main contrib non-free
EOF

