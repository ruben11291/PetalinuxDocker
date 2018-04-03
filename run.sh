###Author: Ruben Perez Pascual
###Email: ruben11291@gmail.com
###Github:ruben11291

#!/bin/bash
print_help(){
  echo "Usage: ./run.sh <petalinux|vnc>"
  exit 1
}

if [ -z $1 ]; then
  print_help
fi

if [ ! -f /opt/petalinux/settings.sh ];then
    echo "Petalinux installation not found in /opt/petalinux"
fi

IMAGE=petalinux:latest
NAME=petalinux
WORKDIR=/home/petalinux
NETWORK_VOLUME="-v $PWD/workspace:/home/petalinux/workspace"
INSTALLERS_VOLUME="-v /media/ruben/BA4455744455347B/:/home/installers"
USER_INTERFACE="-v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY"
PETALINUX_VOLUME="-v /opt/petalinux:/opt/petalinux"
TFTP_VOLUME="-v /tftpboot:/tftpboot"
if [ $1 == "vnc" ]; then
  docker run --rm -p 5901:5901 \
    --entrypoint=/bin/bash \
    --workdir=$WORKDIR --user=root --name=$NAME -it $NETWORK_VOLUME $INSTALLERS_VOLUME $USER_INTEFACE $PETALINUX_VOLUME $TFPT_VOLUME $IMAGE \
    -c "export USER=root && rm /tmp/.X1-lock && /usr/bin/vncserver :1 -geometry 1280x800 -depth 24 && tail -f /root/.vnc/*:1.log"
elif [ $1 == "petalinux" ]; then
  docker run --rm -p 5901:5901 \
    --entrypoint=/bin/bash --workdir=$WORKDIR/workspace --user=petalinux --name=$NAME -it $NETWORK_VOLUME $INSTALLERS_VOLUME $USER_INTERFACE $PETALINUX_VOLUME $TFTP_VOLUME $IMAGE
else
  print_help
fi
