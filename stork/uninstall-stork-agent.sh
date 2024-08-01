#/bin/bash

#
# base on Ubuntu > 20.04
# permisstion root user
#


echo ================= uninstall stork agent =================

sudo apt --purge -y isc-stork-agent

sudo apt remove -y isc-stork-agent

sudo apt autoremove


echo ================= remove stork agent =================

sudo systemctl stop isc-stork-agent
sudo systemctl disable isc-stork-agent
sudo systemctl mask isc-stork-agent
sudo systemctl daemon-reload

echo Done!