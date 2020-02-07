#!/bin/bash

set -e
home=$(pwd)
version="19.03.4"


echo "=========> [UPGRADING DOCKER] >>>"
apt update && apt upgrade
exit

# echo "=========> [CHECKING ENVIRONMENT] >>> "
# printf "\nBuild Distro:\n"
# lsb_release -a
# printf "\nDocker Version:\n"
# sudo docker version
# printf "\nDocker Test:\n"
# sudo service docker* status
# sudo docker run hello-world | grep "Hello from Docker!" 

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