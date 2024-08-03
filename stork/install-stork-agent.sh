#/bin/bash

#
# base on Ubuntu > 20.04
# permisstion root user
#

echo ================= install stork agent =================

curl -1sLf 'https://dl.cloudsmith.io/public/isc/stork/cfg/setup/bash.deb.sh' | sudo bash

sudo apt install isc-stork-agent


echo ================= start stork agent =================

sudo systemctl enable isc-stork-agent

sudo systemctl restart isc-stork-agent


echo ================= register stork agent to stork server =================

stork-agent register -u http://192.168.4.10:8080
