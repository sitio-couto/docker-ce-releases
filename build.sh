set -e
home=$(pwd)

echo "=========> [UPDATING PACKAGES] >>>"
sudo yum update && sudo yum upgrade
sudo yum clean all

echo "=========> [CHECKING DOCKER] >>> "
sudo docker run hello-world | grep "Hello from Docker!" 

echo "=========> [CLONNING MASTER AND PATCHING] >>>"
git clone https://github.com/docker/docker-ce
cd docker-ce && git apply -v --3way ../patches/*
cd ../

echo "=========> [BUILDING <$sys> PACKAGES] >>>"
cd ./$dir
echo "'sudo make $sys' at '$pwd'"
echo "-----------------------------------------"
sudo VERSION=0.0.0 make $sys 
cd ../

echo "=========> [CHECKING <$sys> PACKAGES] >>>"
ls $home/$bin_dir