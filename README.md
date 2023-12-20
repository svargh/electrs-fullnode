# Motivation - Personal bitcoinserver without manual configuration
I like to use the electrum client with my own electrs server and bitcoin fullnode without 
any configuration as possible.

For this purpose an easy-to-start docker-compose is created with all Dockerfiles defined here.
This project contains mainly preconfigured electrs, bitcoind and nginx server for ssl connections from electrum client.

# How to use
- Clone this project to a disk where lots of space is available.
  - cd bitcoinserver
  - ./start.sh
- This project will use the ./persistent-data
- Check .env file changing settings or the persistent-data folder.
- On first time start, selfsigned certifications will be created in nginx/files-runtime/certs/ 
# Features
- Provides an ElectrumServer at localhost:50002 (SSL) with its own bitcoin fullnode
- Connect with SSL: /electrum.AppImage --oneserver --server localhost:50002:s
- To change defaults, adjust .env file

# Hint
Thanks and Credits go to the proejcts listed in References section below
This project aims to put everything in one central directory, 
and to start without any manual internevtion as possible.
Ideally only the .env file can be editing, if needed


- apt update; apt install -y inetutils-ping netcat; nc -zvw10 bitcoind 29123

# References
- How to use nginx ssl reverse proxy: https://raspibolt.org/guide/bitcoin/electrum-server.html#firewall--reverse-proxy
- Based on mu373 work for running electrs and bitcoind: https://github.com/mu373
- Run RDP Server with https://github.com/scottyhardy/docker-remote-desktop
- BTC Explorer https://github.com/horizontalsystems/bitcoin-block-explorer
- My personal notes: DO-A-25


# ToDos
- Builds for arm processors and more
- Rate limits nginx exposed ports
- VPN outgoing traffic 
- Add remote desktop for Desktop clients: https://github.com/scottyhardy/docker-remote-desktop
- Put exposed ports into .env file
- Use -rpcauth= for starting bitcoind
- Use always start.sh script
- Check if +x is needed, or just sh is needed
- docker-compose.override.yaml for disabled unwanted services