FROM ubuntu:22.04
RUN apt update && apt install -y build-essential unzip wget git kmod autoconf automake


RUN git clone https://github.com/nns779/px4_drv.git
WORKDIR /px4_drv
RUN cd fwtool \
  && make \
  && wget http://plex-net.co.jp/download/pxw3u4v1.4.zip \
  && unzip pxw3u4v1.4.zip \
  && cp pxw3u4v1/x64/PXW3U4.sys . \
  && ./fwtool PXW3U4.sys it930x-firmware.bin

ADD px4.sh /
CMD ["/px4.sh"]
