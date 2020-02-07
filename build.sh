#!/bin/bash

set -e
home=$(pwd)
version="19.03.4"


echo "=========> [INSTALLING DOCKER] >>>"
sudo apt update
wget https://oplab9.parqtec.unicamp.br/pub/ppc64el/docker/version-19.03.5/ubuntu-bionic/docker-ce-cli_19.03.5~3-0~ubuntu-bionic_ppc64el.deb
wget https://oplab9.parqtec.unicamp.br/pub/ppc64el/docker/version-19.03.5/ubuntu-bionic/docker-ce_19.03.5~3-0~ubuntu-bionic_ppc64el.deb
sudo apt install ./docker-ce-cli_19.03.5~3-0~ubuntu-bionic_ppc64el.deb ./docker-ce_19.03.5~3-0~ubuntu-bionic_ppc64el.deb

echo "=========> [CHECKING ENVIRONMENT] >>> "
printf "\nBuild Distro:\n"
lsb_release -a
printf "\nDocker Version:\n"
sudo docker version
printf "\nDocker Test:\n"
sudo service docker* status
sudo docker run hello-world | grep "Hello from Docker!" 

# printf "\n=========> [CLONNING MASTER AND PATCHING] >>>\n"
# git clone https://github.com/docker/docker-ce
# cd $home/docker-ce
# git checkout v$version
# git apply -v --3way ../patches/*

# printf "\n=========> [BUILDING <$sys> PACKAGES] >>>\n"
# cd $home/$dir
# sudo VERSION=0.0.0 make $sys

# echo "=========> [CHECKING <$sys> PACKAGES] >>>"
# ls $home/$bin_dir