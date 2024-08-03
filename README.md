# ulab-dhcp
DHCP for for ulab network.

Use Kea to provide DHCP services and Stork to manage DHCP services.

## Kea

[Stork GitHub](https://github.com/isc-projects/kea)

[Reference Documentation](https://kea.readthedocs.io/en/kea-2.6.0/#)

Kea is an open source implementation of the Dynamic Host Configuration Protocol (DHCP) servers, developed and maintained by Internet Systems Consortium (ISC).

Support manager by stork.

## Stork

[Stork GitHub](https://github.com/isc-projects/stork)

[Reference Documentation](https://stork.readthedocs.io/en/latest/index.html)

Stork is a dashboard for BIND 9 and Kea DHCP.

Stork is divided into two parts: Server and Agent.

The difference between `stork agent` and `stork server`:

- **Stork Agent**: As an agent, it needs to be installed on the Kea DHCP service to monitor the status and actions of the Kea DHCP service and obtain data from these services.
- **Stork Server**: The stork server primarily interacts with the stork agent, retrieves information from the agent, and displays it. The server can be installed separately on other machines. After using stork server to provide token authorization for stork agent, the two can interact and provide data.
