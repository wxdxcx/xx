#!/bin/bash
cat /dev/null > /var/log/btmp
cat /dev/null > /var/log/lastlog
cat /dev/null > /var/log/secure
cat /dev/null >  /var/log/wtmp


#sudo apt clean
#sudo apt autoremove -y 


sudo journalctl --vacuum-time=7d


sudo rm -rf /tmp/*
sudo find /var/tmp -type f -mtime +7 -delete

history -c && history -w
