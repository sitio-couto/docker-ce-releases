#!/bin/bash

home=$(pwd)
bin_dir=docker-ce/components/packaging/deb/debbuild/ubuntu-bionic/
dir=docker-ce/components/packaging/deb
sys=ubuntu-bionic

printf "\n\n=========> [CLONNING MASTER AND PATCHING] >>>\n"
git clone https://github.com/docker/docker-ce
cd $home/docker-ce
git checkout v19.03.5
# git apply -v --3way ../patches/*

printf "\n\n=========> [BUILDING <$sys> PACKAGES] >>>\n"
cd $home/$dir
sudo make $sys

printf "\n\n=========> [CHECKING <$sys> PACKAGES] >>>\n"
ls $home/$bin_dir