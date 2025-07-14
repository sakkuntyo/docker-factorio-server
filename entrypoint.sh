#!/bin/bash

set -e

# pre install
apt update;apt install xz-utils wget

# install 
cd /root
wget https://www.factorio.com/get-download/2.0.55/headless/linux64 -O ./factrioserver.tar.xz
unxz ./factrioserver.tar.xz
tar -xvf ./factrioserver.tar.xz

# replace mods-list.json
wget https://raw.githubusercontent.com/sakkuntyo/docker-factorio-server/refs/heads/2.0.55/mod-list.json -O ./vanila-mod-list.json
cat ./vanila-mod-list.json
cp ./vanila-mod-list.json /root/factorio/mods/mod-list.json

# post install
cd /root/factorio/bin/x64
test -f /root/factoriodata/mysave.zip && echo "not initialized because exist root/factoriodata/mysave.zip. " || ./factorio --create /root/factoriodata/mysave

# launch
./factorio --start-server /root/corekeeperdata/mysave.zip
