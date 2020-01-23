set -e
home=$(pwd)

echo "=========> [UPGRADING DOCKER] >>>"
printf "\n\Upgrading Docker...\n"
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
git checkout v19.03.5
cd docker-ce && git apply -v --3way ../patches/*
cd ../

printf "\n=========> [BUILDING <ubuntu-bionic> PACKAGES] >>>\n"
cd $home/$dir
VERSION=0.0.0 make $sys
cd ../

# echo "=========> [CHECKING <$sys> PACKAGES] >>>"
# ls $home/$bin_dir