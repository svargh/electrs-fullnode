FROM ubuntu:22.04

RUN apt update \
    && apt install -y --no-install-recommends \
    nginx openssl \
    && apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN groupadd -g 1011 user01
RUN useradd -rm -d /home/user01 -s /bin/bash -u 1011 user01 -g 1011
