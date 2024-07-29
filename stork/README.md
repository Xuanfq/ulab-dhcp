
# Stork

[Stork GitHub](https://github.com/isc-projects/stork)

[Reference Documentation](https://stork.readthedocs.io/en/latest/index.html)

Stork is a dashboard for BIND 9 and Kea DHCP.

Stork is divided into two parts: Server and Agent.

The difference between `stork agent` and `stork server`:

- **Stork Agent**: As an agent, it needs to be installed on the Kea DHCP service to monitor the status and actions of the Kea DHCP service and obtain data from these services.
- **Stork Server**: The stork server primarily interacts with the stork agent, retrieves information from the agent, and displays it. The server can be installed separately on other machines. After using stork server to provide token authorization for stork agent, the two can interact and provide data.

## Stork Server Install & Setup

### Preparation

[Install PostgreSQL](https://www.postgresql.org/download/linux/ubuntu/)

- Ubuntu(20.04 above)

```bash
sudo apt install -y postgresql
```

### Install Stork Server

[Install Stork](https://stork.readthedocs.io/en/latest/install.html#installation-prerequisites)

- Installing on Debian/Ubuntu
The first step for both Debian and Ubuntu is:

```bash
curl -1sLf 'https://dl.cloudsmith.io/public/isc/stork/cfg/setup/bash.deb.sh' | sudo bash
```

Next, install the Stork server package:

```bash
sudo apt install isc-stork-server
```

- Installing on CentOS/RHEL/Fedora
The first step for RPM-based distributions is:

```bash
curl -1sLf 'https://dl.cloudsmith.io/public/isc/stork/cfg/setup/bash.rpm.sh' | sudo bash
```

Next, install the Stork server package:

```bash
sudo dnf install isc-stork-server
```

If dnf is not available, yum can be used instead:

```bash
sudo yum install isc-stork-server
```

### Preparing Stork Server Database

Switch PostgreSQL super user:

```bash
su postgres
```

Create database and connect user/password:

```bash
stork-tool db-create --db-name stork --db-user stork
```

```log
~# stork-tool db-create --db-name stork --db-user stork
INFO[2024-07-26 00:11:20]       connection.go:90    Checking connection to database              
INFO[2024-07-26 00:11:20]       connection.go:155   Connected to database /var/run/postgresql/.s.PGSQL.5432 
INFO[2024-07-26 00:11:20]       migrations.go:145   Database 'stork' already exists              
INFO[2024-07-26 00:11:20]       connection.go:90    Checking connection to database              
INFO[2024-07-26 00:11:20]       connection.go:155   Connected to database /var/run/postgresql/.s.PGSQL.5432 
INFO[2024-07-26 00:11:20]       migrations.go:186   User 'stork' already exists                  
INFO[2024-07-26 00:11:20]             main.go:95    Created database and user for the server with the following credentials  database_name="stork" password="xlFAAVr99hbO77fdohcWyCWK57LlqHz1" user="stork"
~# 
```

### Configure Stork Server

The configuration file for Stork Server is `/etc/stork/server.env`.
Update the database config which get from [Preparing Stork Server Database]

```bash
sudo vim /etc/stork/stork-server.conf
```

### Start Stork Server

Restart Stork Server:

```bash
sudo systemctl restart isc-stork-server
```

Auto start Stork Server after boot:

```bash
sudo systemctl enable isc-stork-server
```

## Stork Agent Install & Setup

[Install Stork Agent](https://stork.readthedocs.io/en/latest/install.html#installation-prerequisites)

### Install Stork Agent

- Installing on Debian/Ubuntu

```bash
sudo apt install isc-stork-agent
```

- Installing on CentOS/RHEL/Fedora

```bash
sudo dnf install isc-stork-agent
```

If dnf is not available, yum can be used instead:

```bash
sudo yum install isc-stork-agent
```

### Configure Stork Agent

The configuration file for Stork Agent is `/etc/stork/agent.env`.

### Start the agent service

Set auto start Stork Server after boot:

```bash
sudo systemctl enable isc-stork-agent
```

Start Stork Agent:

```bash
sudo systemctl restart isc-stork-agent
```


