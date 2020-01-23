set -e
home=$(pwd)

echo "=========> [UPGRADING DOCKER] >>>"
sudo apt update && sudo apt upgrade
sudo snap install docker
sudo docker version

# echo "=========> [CHECKING ENVIRONMENT] >>> "
# printf "\nBuild Distro:\n"
# lsb_release -a
# printf "\nDocker Version:\n"
# docker version
# printf "\nDocker Test:\n"
# docker run hello-world | grep "Hello from Docker!" 

printf "\n=========> [CLONNING MASTER AND PATCHING] >>>\n"
git clone https://github.com/docker/docker-ce
cd $home/docker-ce
git apply -v --3way ../patches/*

printf "\n=========> [BUILDING <$sys> PACKAGES] >>>\n"
cd $home/$dir
sudo make VERSION=0.0.0 $sys

echo "=========> [CHECKING <$sys> PACKAGES] >>>"
ls $home/$bin_dir