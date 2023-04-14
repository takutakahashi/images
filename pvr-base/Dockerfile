FROM ubuntu
RUN apt update && apt install -y build-essential unzip wget git


RUN git clone https://github.com/nns779/px4_drv.git
WORKDIR /px4_drv
RUN cd fwtool \
  && make \
  && wget http://plex-net.co.jp/download/202104_PX-W3U4_Driver.zip \
  && unzip 202104_PX-W3U4_Driver.zip \
  && cp 202104_PX-W3U4_Driver/x64/PXW3U4.sys . \
  && ./fwtool PXW3U4.sys it930x-firmware.bin

ADD px4.sh /
CMD ["/px4.sh"]
