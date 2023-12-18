#!/bin/bash

chown 777 -R persistent-data/*
#docker compose up --build --force-recreate --remove-orphans
docker compose up
