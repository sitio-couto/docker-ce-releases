set -e
home=$(pwd)

echo "=========> [UPGRADING DOCKER] >>>"
sudo lsb_release -a
# wget -q https://oplab9.parqtec.unicamp.br/pub/ppc64el/docker/version-19.03.5/ubuntu-bionic/docker-ce-cli_19.03.5~3-0~ubuntu-bionic_ppc64el.deb
# wget -q https://oplab9.parqtec.unicamp.br/pub/ppc64el/docker/version-19.03.5/ubuntu-bionic/docker-ce_19.03.5~3-0~ubuntu-bionic_ppc64el.deb
# sudo apt install ./*.deb

echo "=========> [CHECKING DOCKER] >>> "
docker run hello-world | grep "Hello from Docker!" 

echo "=========> [CLONNING MASTER AND PATCHING] >>>"
git clone https://github.com/docker/docker-ce
cd docker-ce && git apply -v --3way ../patches/*
cd ../

echo "=========> [BUILDING <$sys> PACKAGES] >>>"
cd ./$dir
VERSION=0.0.0 make $sys 
cd ../

# echo "=========> [CHECKING <$sys> PACKAGES] >>>"
# ls $home/$bin_dir