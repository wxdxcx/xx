#!/bin/bash
sudo tar -zxvf /opt/dep/web/build.tar.gz -C /opt/www/web
cd /opt/www/web
sudo pnpm install
sudo chown -R wdc:www-data /opt/www
sudo chmod -R 755 /opt/www
sudo rm -rf /opt/dep/web/build.tar.gz
echo "web is ok"

# sudo pm2 reload ecosystem.config.js
