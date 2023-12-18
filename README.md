# my personal bitcoinserver
I like to use the electrum client. 
Altough connecting to other electrumservers is not a problem,
I would like to conenct my client to my own electrum-server which connects to my own blockchain 
served by my bitcoind process.

For this purpose, an easy-to-start docker-compose is created, 
which contains preconfigured electrs and bitcoind.


Hint:
Based on mu373' work, but putting all needed Dockerfiles in one central directory.
Electrs with SSL and bitcoind and tor and nginx ssl

# Some useful docker commands
- docker exec -it -u root bitcoind bash
- ENV=staging docker-compose up
- docker compose up --build --force-recreate --remove-orphans
- chmod 777 -R /home/user01/dev/projects/Others/bitcoinserver/persistent-data

