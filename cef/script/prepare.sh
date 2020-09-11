#!/bin/bash

set -e

apt-get update
apt-get install -y apt-transport-https ca-certificates

os_codename=$(awk -F= '/^VERSION_CODENAME/ {print $2}' /etc/os-release)

mv /etc/apt/sources.list /etc/apt/sources.list.bak

cat > /etc/apt/sources.list << EOF
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ ${os_codename} main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ ${os_codename}-updates main contrib non-free
deb https://mirrors.tuna.tsinghua.edu.cn/debian-security ${os_codename}/updates main contrib non-free

# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ ${os_codename} main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ ${os_codename}-updates main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security ${os_codename}/updates main contrib non-free

# deb https://mirrors.tuna.tsinghua.edu.cn/debian/ ${os_codename}-backports main contrib non-free
# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ ${os_codename}-backports main contrib non-free
EOF

