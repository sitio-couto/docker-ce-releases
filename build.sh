set -e
home=$(pwd)

echo "=========> [DOCKER DEPENDENCIES] >>>"
sudo apt install -f 
 > containerd
 > iptables
 > libseccomp2
 > libc6
 > libdevmapper1.02.1
 > libsystemd0


# echo "=========> [UPGRADING DOCKER] >>>"
# printf "\n\Upgrading Docker...\n"
# wget -q https://oplab9.parqtec.unicamp.br/pub/ppc64el/docker/version-19.03.5/ubuntu-bionic/docker-ce-cli_19.03.5~3-0~ubuntu-bionic_ppc64el.deb
# wget -q https://oplab9.parqtec.unicamp.br/pub/ppc64el/docker/version-19.03.5/ubuntu-bionic/docker-ce_19.03.5~3-0~ubuntu-bionic_ppc64el.deb
# sudo apt install ./*.deb

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
VERSION=0.0.0 make $sys

echo "=========> [CHECKING <$sys> PACKAGES] >>>"
ls $home/$bin_dir