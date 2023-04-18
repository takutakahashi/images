FROM debian:buster
RUN apt update && apt install -y build-essential unzip wget git kmod autoconf automake

WORKDIR /recpt1
RUN git clone https://github.com/stz2012/recpt1.git \
  && cd recpt1/recpt1/ \
  && ./autogen.sh \
  && ./configure --enable-b25 \
  && make \
  && make install
