###Author: Ruben Perez Pascual
###Email: ruben11291@gmail.com
###Github:ruben11291

#!/bin/bash

sudo apt-get remove docker docker-engine docker.io
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y
sudo apt-get install docker-ce -y
sudo usermod -aG docker ${USER}
sudo apt-get install nfs-common
./mount
