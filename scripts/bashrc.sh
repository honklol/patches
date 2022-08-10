#!/bin/bash
apt install patch curl -y
curl -L https://github.com/honklol/patches/raw/main/bashrc.patch | patch -u /root/.bashrc
