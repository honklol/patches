#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run this script as root."
  exit
fi

function cline { tput cuu1;tput el; }
exec 3>&1 &>/dev/null

echo "" >&3; echo "Running apt update" >&3
apt update
cline >&3; echo "Installing patch and curl" >&3
apt install patch curl -y
cline >&3; echo "Patching .bashrc" >&3
curl -L https://github.com/honklol/patches/raw/main/patches/bashrc.patch | patch -u /root/.bashrc
cline >&3; echo "Patched .bashrc - reset your session to apply changes." >&3
