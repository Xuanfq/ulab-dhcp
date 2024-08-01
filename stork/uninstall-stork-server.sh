#/bin/bash

#
# base on Ubuntu > 20.04
# permisstion root user
#

DB_HOST=127.0.0.1
DB_PORT=5423
DB_NAME=ulabstork
DB_USER=ulabstork
DB_PASS=            # auto generate


echo ================= uninstall postgresql =================

sudo apt --purge -y postgresql
sudo apt remove -y postgresql
sudo apt autoremove
# sudo rm -rf /etc/postgresql
# sudo rm -rf /etc/postgresql-common
# sudo rm -rf /var/lib/postgresql
# sudo rm -rf /var/log/postgresql
# sudo rm -rf /usr/share/doc/postgresql*
# sudo rm -rf /usr/share/man/man*/postgresql*
# sudo rm -rf /usr/share/postgresql-common
sudo userdel -r postgres
sudo groupdel postgres


echo ================= uninstall stork server =================

sudo apt --purge -y isc-stork-server
sudo apt remove -y isc-stork-server
sudo apt autoremove
# sudo rm -rf /var/lib/stork-server
# sudo rm -rf /var/bin/stork-server
# sudo rm -rf /var/bin/stork-tool
# sudo rm -rf /usr/share/man/man8/stork-server.8
# sudo rm -rf /usr/share/man/man8/stork-tool.8
# sudo rm -rf /usr/share/stork

echo ================= remove stork server =================

sudo systemctl stop isc-stork-server
sudo systemctl disable isc-stork-server
sudo systemctl mask isc-stork-server
sudo systemctl daemon-reload

echo Done!