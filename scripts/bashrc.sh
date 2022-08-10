#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run this script as root."
  exit
fi

function cline { tput cuu1;tput el; }
exec 3>&1 &>/dev/null

echo ""; echo "Running apt update" >&3
apt update
cline; echo "Installing patch and curl" >&3
apt install patch curl -y
cline; echo "Patching .bashrc" >&3
curl -L https://github.com/honklol/patches/raw/main/patches/bashrc.patch | patch -u /root/.bashrc
cline; echo "Patched .bashrc - reset your session to apply changes." >&3
