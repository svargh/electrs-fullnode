FROM ubuntu:22.04

ARG BUILD_BITCOINCORE_VERSION
ARG BUILD_BITCOIN_CORE_SIGNATURE

ENV ARCH=x86_64

RUN groupadd -g 1011 user01
RUN useradd -rm -d /home/user01 -s /bin/bash -u 1011 user01 -g 1011

RUN apt update \
    && apt install -y --no-install-recommends \
    ca-certificates \
    gnupg \
    libatomic1 \
    wget \
    && apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd /tmp \
    && gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys ${BUILD_BITCOIN_CORE_SIGNATURE} \
    && wget https://bitcoincore.org/bin/bitcoin-core-${BUILD_BITCOINCORE_VERSION}/SHA256SUMS.asc \
    https://bitcoincore.org/bin/bitcoin-core-${BUILD_BITCOINCORE_VERSION}/SHA256SUMS \
    https://bitcoincore.org/bin/bitcoin-core-${BUILD_BITCOINCORE_VERSION}/bitcoin-${BUILD_BITCOINCORE_VERSION}-${ARCH}-linux-gnu.tar.gz \
    && gpg --verify --status-fd 1 --verify SHA256SUMS.asc SHA256SUMS 2>/dev/null | grep "^\[GNUPG:\] VALIDSIG.*${BUILD_BITCOIN_CORE_SIGNATURE}\$" \
    && sha256sum --ignore-missing --check SHA256SUMS \
    && tar -xzvf bitcoin-${BUILD_BITCOINCORE_VERSION}-${ARCH}-linux-gnu.tar.gz -C /opt \
    && ln -sv bitcoin-${BUILD_BITCOINCORE_VERSION} /opt/bitcoin

USER user01
WORKDIR /home/user01
RUN mkdir .bitcoin
RUN echo "$BUILD_BITCOINCORE_VERSION" > x.txt

