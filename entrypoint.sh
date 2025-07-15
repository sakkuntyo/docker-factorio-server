#!/bin/bash

set -e

# pre install
apt update;apt install xz-utils wget -y
rm -rf /var/lib/apt/lists/*

# install 
cd /root
test -f /root/factrioserver.tar || {
  echo "not exist /root/factrioserver.tar"
  echo "start install"
  wget https://www.factorio.com/get-download/2.0.60/headless/linux64 -O ./factrioserver.tar.xz 
  unxz ./factrioserver.tar.xz
  tar -xvf ./factrioserver.tar

  # replace mods-list.json
  echo "replace mods-list.json for vanilla"
  wget https://raw.githubusercontent.com/sakkuntyo/docker-factorio-server/refs/heads/2.0.60/mod-list.json -O ./vanila-mod-list.json
  cat ./vanila-mod-list.json
  mkdir -p /root/factorio/mods/
  cp ./vanila-mod-list.json /root/factorio/mods/mod-list.json
}

# post install
cd /root/factorio/bin/x64
test -f /root/factoriodata/mysave.zip || {
  echo "not exist /root/factoriodata/mysave.zip"
  echo "start create save data"
  test -f /root/factoriodata/mysave.zip && echo "not initialized, because exist root/factoriodata/mysave.zip. " || ./factorio --create /root/factoriodata/mysave
}

# launch
exec ./factorio --start-server /root/factoriodata/mysave.zip
