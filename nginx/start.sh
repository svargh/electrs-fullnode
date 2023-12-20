#!/bin/bash

export FILES_RUNTIME="/home/user01/files-runtime"
export CERTS_DIR="${FILES_RUNTIME}/certs"
export CERTFILES_COUNT=$(find $CERTS_DIR -type f | wc -l)
if [ "$CERTFILES_COUNT" -eq "0" ]; then
  echo "No cert files found, recreating new self-signed certs."
  mkdir -p ${CERTS_DIR}
  openssl req -x509 -nodes -newkey rsa:4096 \
    -keyout ${CERTS_DIR}/nginx-selfsigned.key \
    -out ${CERTS_DIR}/nginx-selfsigned.crt \
    -subj "/CN=bitcoinserver" -days 3650
fi

cp ${CERTS_DIR}/nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key
cp ${CERTS_DIR}/nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt

echo "Starting nginx"
nginx -g "daemon off;"
#tail -F somethingToKeepOpen