#!/bin/bash -x

cd /px4_drv
ls /lib/firmware/it930x-firmware.bin || mv fwtool/it930x-firmware.bin /lib/firmware
cd driver
apt update && apt install -y linux-headers-$(uname -r)
make && make install
modprobe px4_drv
