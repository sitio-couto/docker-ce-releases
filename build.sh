set -e
home=$(pwd)

echo "=========> [UPGRADING DOCKER] >>>"
printf "\n\nRemoving Docker...\n"
sudo service docker stop
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo service docker status
print "\n\Upgrading Docker...\n"
wget -q https://oplab9.parqtec.unicamp.br/pub/ppc64el/docker/version-19.03.5/ubuntu-bionic/docker-ce-cli_19.03.5~3-0~ubuntu-bionic_ppc64el.deb
wget -q https://oplab9.parqtec.unicamp.br/pub/ppc64el/docker/version-19.03.5/ubuntu-bionic/docker-ce_19.03.5~3-0~ubuntu-bionic_ppc64el.deb
sudo apt install ./*.deb

echo "=========> [CHECKING ENVIRONMENT] >>> "
printf "\n\nBuild Distro:\n"
lsb_release -a
printf "\n\nDocker Version:\n"
docker version
printf "\n\nDocker Test:\n"
docker run hello-world | grep "Hello from Docker!" 

echo "=========> [CLONNING MASTER AND PATCHING] >>>"
git clone https://github.com/docker/docker-ce
cd docker-ce && git apply -v --3way ../patches/*
cd ../

echo "=========> [BUILDING <ubuntu-bionic> PACKAGES] >>>"
cd ./docker-ce/components/packaging/deb
VERSION=0.0.0 make ubuntu-bionic 
cd ../

# echo "=========> [CHECKING <$sys> PACKAGES] >>>"
# ls $home/$bin_dir