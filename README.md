# Motivation - Personal bitcoinserver without manual configuration
I like to use the electrum client with my own electrs server and bitcoin fullnode without 
any configuration as possible.

For this purpose an easy-to-start docker-compose is created.
This project contains mainly preconfigured electrs, bitcoind and nginx server for ssl connections from electrum client.

# How to use
- Clone this project to a disk where lots of space is available.
  - cd bitcoinserver
  - ./start.sh
- This project will use the ./persistent-data
- Check .env folder changing settings or persistent-data folder.


# Features
- Provides an ElectrumServer at localhost:50002 (SSL) with its own bitcoin fullnode
- Connect with SSL: /electrum.AppImage --oneserver --server localhost:50002:s
- To change defaults, adjust .env file

# Hint
Based on References given at bottom.
This project aims to put everything in one central directory, 
and to start without any manual internevtion as possible.
Ideally only the .env file can be editing, if needed


- apt update; apt install -y inetutils-ping netcat; nc -zvw10 bitcoind 29123

# References
- How to use nginx ssl reverse proxy: https://raspibolt.org/guide/bitcoin/electrum-server.html#firewall--reverse-proxy
- Based on mu373 work for running electrs and bitcoind: https://github.com/mu373
- Run RDP Server with https://github.com/scottyhardy/docker-remote-desktop

# Useful references for development and troubleshooting
- docker exec -it -u root bitcoind bash
- docker compose up --build --force-recreate --remove-orphans
- chmod 777 -R *; chown 1011:1011 -R *; chmod g+s -R *
- apt update; apt install -y net-tools iputils-ping curl ncat
- netstat -tulpn
- for testing: btcuser01/hallo1234
- curl --user btcuser01 --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getblockchaininfo", "params": [] }' -H 'content-type: text/plain;' http://bitcoind:29123
- start multiple bitcoinservers: 
  PERSISTENT_DATA_DIR=...EXPOSED_PORT=...; docker compose -p app01 up 
- Check bitcoind reachability: nc -zvw10 bitcoind 29123
- Check electrs SSL connection without GUI: ncat --ssl localhost 50002 # type in something to get any response
- SSL Connection:     /electrum.AppImage --oneserver --server localhost:50002:s
- Non-SSL Connection: /electrum.AppImage --oneserver --server localhost:5000t:t # Works only when port is epoxsed in service electrs

# ToDos
- Builds for arm processors and more
- Rate limits nginx exposed ports
- VPN outgoing traffic 
- Add remote desktop for Desktop clients: https://github.com/scottyhardy/docker-remote-desktop
- Put exposed ports into .env file
- Use -rpcauth= for starting bitcoind