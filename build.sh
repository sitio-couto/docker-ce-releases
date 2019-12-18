# set -e
home=$(pwd)

echo "=========> [CHECKING DOCKER] >>> "
sudo docker run hello-world | grep "Hello from Docker!" 

echo "=========> [REMOVING DOCKER] >>> "
sudo apt-get purge -y docker-engine docker docker.io docker-ce  
sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce 
exit

echo "=========> [CLONNING MASTER AND PATCHING] >>>"
git clone https://github.com/docker/docker-ce
cd docker-ce && git apply -v --3way ../patches/*
cd ../

echo "=========> [BUILDING <$sys> PACKAGES] >>>"
cd ./$dir
sudo make VERSION=0.0.0 $sys

echo "=========> [CHECKING <$sys> PACKAGES] >>>"
ls $home/$bin_dir