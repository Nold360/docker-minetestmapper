############################################################
# Dockerfile to build minetestserver
# Based on Debian
############################################################
FROM debian:buster-slim

WORKDIR /tmp
RUN apt-get update && apt-get -y install \
      git build-essential cmake \
      libgd-dev libsqlite3-dev libhiredis-dev \
    libleveldb-dev && \
    git clone --depth 1 https://github.com/minetest/minetestmapper && \
    cd minetestmapper && \
    cmake . -DENABLE_LEVELDB=1 -DENABLE_REDIS=1 && \
    make -j2 && make install && \
    apt-get purge -y git build-essential cmake && \
    apt-get -y autoremove && \	
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

CMD /usr/local/bin/minetestmapper -i /world -o /world/map.png
