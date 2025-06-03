#!/bin/bash
sudo tar -zxvf /opt/dep/admin/dist.tar.gz -C /opt/www/admin
sudo chown -R wdc:www-data /opt/www
sudo chmod -R 755 /opt/www
sudo rm -rf /opt/dep/admin/dist.tar.gz
echo "ok"
