#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run this script as root."
  exit
fi

apt install patch curl -y
curl -L https://github.com/honklol/patches/raw/main/patches/bashrc.patch | patch -u /root/.bashrc
