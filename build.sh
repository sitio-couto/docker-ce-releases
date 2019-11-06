home_dir=$(pwd)

set -e # Exit if error

echo "=========> [INSTALLING DOCKER] >>> "
git clone https://github.com/Unicamp-OpenPower/docker.git
sudo snap install docker

echo "=========> [CLONNING MASTER AND PATCHING] >>>"
git clone https://github.com/docker/docker-ce
cd docker-ce && git apply -v --3way ../patches/*

echo "=========> [BUILDING <$sys> PACKAGES] >>>"
cd $home_dir/$dir
make $sys

echo "=========> [DONE]"
