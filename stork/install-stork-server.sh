#/bin/bash -x

#
# base on Ubuntu > 20.04
# permisstion root user
#

DB_HOST=127.0.0.1
DB_PORT=5423
DB_NAME=ulabstork1
DB_USER=ulabstork1
DB_PASS=            # auto generate


echo ================= install postgresql =================

sudo apt install -y postgresql


echo ================= install stork server =================

curl -1sLf 'https://dl.cloudsmith.io/public/isc/stork/cfg/setup/bash.deb.sh' | sudo bash

sudo apt install -y isc-stork-server
mkdir -p /var/lib/stork-server/hooks

echo ================= preparing and configure stork server database =================

cd /

DB_PASS=`su postgres -c "stork-tool db-create --db-name $DB_NAME --db-user $DB_USER | grep -i \"password\" | sed -n 's/.*password=\"\([^\"]*\)\".*/\1/p'"`

su postgres -c "createdb $DB_NAME"
su postgres -c "psql -c \"CREATE USER $DB_USER WITH PASSWORD '$DB_PASS';\""
su postgres -c "psql -c \"GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;\""
su postgres -c "psql -c \"ALTER USER $DB_USER WITH SUPERUSER;\""

echo "STORK_DATABASE_HOST=$DB_HOST" >> /etc/stork/server.env
echo "STORK_DATABASE_PORT=$DB_PORT" >> /etc/stork/server.env
echo "STORK_DATABASE_NAME=$DB_NAME" >> /etc/stork/server.env
echo "STORK_DATABASE_USER_NAME=$DB_USER" >> /etc/stork/server.env
echo "STORK_DATABASE_PASSWORD=$DB_PASS" >> /etc/stork/server.env


echo ================= start stork server =================

sudo systemctl unmask isc-stork-server
sudo systemctl restart isc-stork-server
sudo systemctl enable isc-stork-server

echo Done!