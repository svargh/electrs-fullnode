# Motivation - Personal bitcoinserver with no manual configuration
I like to use the electrum client with my own electrs server and bitcoin fullnode without 
any configuration as possible.

For this purpose, an easy-to-start docker-compose is created.
This project contains mainly preconfigured electrs, bitcoind and nginx server for ssl connections from electrum client.

# How to use
- Clone this project to a disk where lots of space is available.
This docker compose project will use the ./persistent-data
- cd bitcoinserver
- ./start.sh

# Features
- You can connect you local electrum client to port 50002 (SSL):
 ./electrum-4.4.5-x86_64.AppImage --oneserver --server localhost:50002:t
- Or you an use the RDP Server in which you can start electrum server

# Hint
Based on References given at bottom.
But putting all needed Dockerfiles in one central directory, and to start without 
Electrs with SSL and bitcoind and tor and nginx ssl

- apt update; apt install -y inetutils-ping netcat; nc -zvw10 bitcoind 29123

# References
- Hot to use nginx ssl reverse proxy: https://raspibolt.org/guide/bitcoin/electrum-server.html#firewall--reverse-proxy
- Based on mu373' work for running electrs, bitcoind
- Run RDP Server with https://github.com/scottyhardy/docker-remote-desktop

# ToDos and some useful references
- rate limits nginx
- docker exec -it -u root bitcoind bash
- ENV=staging docker-compose up
- docker compose up --build --force-recreate --remove-orphans
- chmod 777 -R /home/user01/dev/projects/Others/bitcoinserver/persistent-data
- netstat -tulpn: apt update; apt install -y net-tools iputils-ping