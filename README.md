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
- Provides bitcoin blockchain explorer which is also uses the bitcoind and electrs services
- Connect with SSL: /electrum.AppImage --oneserver --server localhost:50002:s
- To change defaults, adjust .env file


# Credits

Thanks and Credits go to the projects listed in References section below.
This project aims to put everything in one central directory, 
and to start without any manual configuration as possible.
Idealy only the .env file can be editing, if needed.


# Troubleshooting
- My notes references: DO-A-25/bitcoinserver
- Check electrs reachable:


    docker exec -it -u root bitcoinserver-electrs-1 bash
    root@9b46deacc619:/home/user01/electrs-data# echo '{"jsonrpc": "2.0", "method": "server.version", "id": 0, "params": ["electrum/3.3.8", "1.4"]}' | nc 127.0.0.1 50001
    {"id":0,"jsonrpc":"2.0","result":["electrs/0.10.1","1.4"]}


- ChecK SSL proxy is working(manual) at host or in nginx service 
  Electrum reachable on its port 50001, but not reachable on ssl proxy from nginx service:apt update;


    echo '{"jsonrpc": "2.0", "method": "server.version", "id": 0, "params": ["electrum/3.3.8", "1.4"]}' | openssl s_client -connect localhost:50002 -ign_eof


  Manual cancel needed for this command.
  Solution: Restart nginx service.

- Extreme slow bitcoind RPC response: High IO on HDD from other apps, check iotop!
- terminal electrs server: 
  

    docker exec -it -u root bitcoinserver-electrs-1 bash



# References
- How to use nginx ssl reverse proxy: https://raspibolt.org/guide/bitcoin/electrum-server.html#firewall--reverse-proxy
- Based on mu373 work for running electrs and bitcoind: https://github.com/mu373
- Run RDP Server with https://github.com/scottyhardy/docker-remote-desktop
- BTC Explorer https://github.com/horizontalsystems/bitcoin-block-explorer
- My personal notes: DO-A-25
- NGINX SSL + Reverse Proxy: https://www.linkedin.com/pulse/how-use-nginx-reverse-proxy-https-wss-self-signed-ramos-da-silva
- 

# ToDos
- Builds for arm processors and more
- Remove exposing btc-eplxorer port and put behind nginx ssl and normal http
- Rate limits nginx exposed ports
- VPN outgoing traffic 
- Add remote desktop for Desktop clients: https://github.com/scottyhardy/docker-remote-desktop
- Put exposed ports into .env file
- Use -rpcauth= for starting bitcoind
- Use always start.sh script
- Check if +x is needed, or just sh is needed
- docker-compose.override.yaml for disabled unwanted services
- replace /etc/ssl path with /home/user01/files-runtime/certs, then remove cp instruction
- start electrs with: --index-lookup-limit: btc-rpc-explorer complaining showing not all transaciotn histories