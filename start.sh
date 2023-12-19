#!/bin/bash

source .env

#echo "Going to reset permissions in ${HOST_SERVER_DIR}/. Press any key to continue."
#read
#hmod 777 -R ${HOST_SERVER_DIR}/*

docker compose up --build --force-recreate --remove-orphans
#docker compose up
