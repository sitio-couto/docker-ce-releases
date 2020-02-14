#!/bin/bash
set -e
home=$(pwd)

printf "\n\n=========> [CLONNING MASTER AND PATCHING] >>>\n"
git clone https://github.com/docker/docker-ce
cd $home/docker-ce
git apply -v --3way ../patches/*

printf "\n\n=========> [BUILDING <$sys> PACKAGES] >>>\n"
cd $home/$dir
sudo make $sys

printf "\n\n=========> [CHECKING <$sys> PACKAGES] >>>\n"
if [[ $sys == centos ]] 
then
    ls $home/$bin_dir
else 
    ls $home/$bin_dir/$sys
fi;