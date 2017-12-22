FROM debian:sid

RUN apt-get update \
  && apt-get install -y --force-yes \
  git bison flex \
  autoconf automake autopoint libtool pkg-config \
  build-essential debhelper fakeroot autotools-dev \
  zlib1g-dev libbz2-dev libssl-dev libfuse-dev \
  python-all-dev python3-all-dev \
&& apt-get clean  \
&& rm -rf /var/lib/apt/lists/*

ENV SRC_BASE /usr/local/src/
WORKDIR ${SRC_BASE}
