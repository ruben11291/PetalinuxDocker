###Author: Ruben Perez Pascual
###Email: ruben11291@gmail.com
###Github:ruben11291

sudo mkdir -p /opt/petalinux
sudo chmod ${USER}:${USER} /opt/petalinux
sudo mount -t nfs lapitusa:/opt/petalinux /opt/petalinux
if [ ! -f /opt/petalinux/settings.sh ];then
    echo "Petalinux installation not found in /opt/petalinux"
fi

