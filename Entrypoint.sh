#!/bin/bash

set -e

# インストール準備
apt update;apt install xz-utils wget

# インストール
cd /root
wget https://www.factorio.com/get-download/2.0.55/headless/linux64 -O ./factrioserver.tar.xz
unxz ./factrioserver.tar.xz
tar -xvf ./factrioserver.tar.xz

# mods-list 書き換え
cd /root/factorio/bin/x64
cp 
