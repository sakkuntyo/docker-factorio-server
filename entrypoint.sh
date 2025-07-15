#!/bin/bash

set -e

# pre install
apt update;apt install xz-utils wget -y
rm -rf /var/lib/apt/lists/*

# install 
test -f /root/factrioserver.tar || {
  cd /root
  test -f /root/factrioserver.tar
  wget https://www.factorio.com/get-download/2.0.55/headless/linux64 -O ./factrioserver.tar.xz 
  unxz ./factrioserver.tar.xz
  tar -xvf ./factrioserver.tar

  # replace mods-list.json
  wget https://raw.githubusercontent.com/sakkuntyo/docker-factorio-server/refs/heads/2.0.55/mod-list.json -O ./vanila-mod-list.json
  cat ./vanila-mod-list.json
  mkdir -p /root/factorio/mods/
  cp ./vanila-mod-list.json /root/factorio/mods/mod-list.json
}

# post install
test -f /root/factoriodata/mysave.zip || {
  cd /root/factorio/bin/x64
  test -f /root/factoriodata/mysave.zip && echo "not initialized, because exist root/factoriodata/mysave.zip. " || ./factorio --create /root/factoriodata/mysave
}

# launch
exec ./factorio --start-server /root/factoriodata/mysave.zip
