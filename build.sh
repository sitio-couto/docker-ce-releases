#!/bin/bash

set -e
home=$(pwd)
bin_dir=docker-ce/components/packaging/deb/debbuild/debian-stretch/
dir=docker-ce/components/packaging/deb
sys=ubuntu-bionic

printf "\n\n=========> [INSTALLING DOCKER] >>>\n"
sudo apt update
wget -q https://oplab9.parqtec.unicamp.br/pub/ppc64el/docker/version-19.03.5/ubuntu-bionic/docker-ce-cli_19.03.5~3-0~ubuntu-bionic_ppc64el.deb
wget -q https://oplab9.parqtec.unicamp.br/pub/ppc64el/docker/version-19.03.5/ubuntu-bionic/docker-ce_19.03.5~3-0~ubuntu-bionic_ppc64el.deb
sudo apt install -y ./docker-ce-cli_19.03.5~3-0~ubuntu-bionic_ppc64el.deb 
sudo apt install -y ./docker-ce_19.03.5~3-0~ubuntu-bionic_ppc64el.deb
rm -f *.deb

printf "\n\n=========> [CHECKING ENVIRONMENT] >>>\n"
printf "\nBuild Distro:\n"
lsb_release -a
printf "\nDocker Version:\n"
sudo docker version
printf "\nDocker Test:\n"
sudo service docker* status
sudo docker run hello-world | grep "Hello from Docker!" 

printf "\n\n=========> [CLONNING MASTER AND PATCHING] >>>\n"
git clone https://github.com/docker/docker-ce
cd $home/docker-ce
git apply -v --3way ../patches/*

printf "\n\n=========> [BUILDING <$sys> PACKAGES] >>>\n"
cd $home/$dir
sudo VERSION=0.0.0 make $sys

printf "\n\n=========> [CHECKING <$sys> PACKAGES] >>>\n"
ls $home/$bin_dir