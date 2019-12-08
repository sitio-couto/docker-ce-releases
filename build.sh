ftp_path="ftp://oplab9.parqtec.unicamp.br/test/vinicius/docker"
url="https://oplab9.parqtec.unicamp.br/pub/test/vinicius/docker"

echo "=========> [INSTALLING DOCKER] >>> "
git clone https://github.com/Unicamp-OpenPower/docker.git
sudo snap install docker

echo "=========> [CLONNING MASTER AND PATCHING] >>>"
git clone https://github.com/docker/docker-ce
cd docker-ce
git apply -v --3way ../patches/*

echo "=========> [BUILDING <$sys> PACKAGES] >>>"
cd $(pwd)/$dir
make $sys
