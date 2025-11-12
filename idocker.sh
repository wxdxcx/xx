#!/usr/bin/env bash

set -e

sudo apt update

sudo apt install -y ca-certificates curl gnupg


sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg \
  | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg


. /etc/os-release
echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/debian \
  ${VERSION_CODENAME} stable" \
  | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


sudo apt update


sudo apt install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-buildx-plugin \
  docker-compose-plugin

echo "====  systemctl enable Docker ===="
sudo systemctl enable docker
sudo systemctl start docker


sudo usermod -aG docker $USER


docker --version
docker compose version

echo "is ok"
