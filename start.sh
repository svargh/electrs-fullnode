#!/bin/bash

source .env

echo "Your bitcoinserver-datadir is: ${PERSISTENT_DATA_DIR}"

chmod 777 ${PERSISTENT_DATA_DIR}
chown 1011:1011 ${PERSISTENT_DATA_DIR}
chmod g+s ${PERSISTENT_DATA_DIR}

#chmod 777 -R /mnt/shareddata-tmp-dev-company/bitcoinserver-data/*
#chown 1011:1011 -R /mnt/shareddata-tmp-dev-company/bitcoinserver-data/*
#exit

#docker compose up --build --force-recreate --remove-orphans
docker compose up
