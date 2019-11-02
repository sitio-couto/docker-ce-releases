home_dir=$(pwd)
github_version=$(cat github_version.txt)
ftp_version=$(cat ftp_version.txt)
# del_version=$(cat delete_version.txt)
cli_version=$(cat cli_version.txt)

echo "=========> [INSTALLING DOCKER] >>> "
git clone https://github.com/Unicamp-OpenPower/docker.git
sudo snap install docker

echo "=========> [CLONNING DOCKER-CE REPO] >>>"
git clone https://github.com/docker/docker-ce

echo "=========> [CHECKING OUT TO VERSION <$github_version>] >>>"
cd docker-ce && git checkout v$github_version

echo "=========> [MOVING TO <$dir> AND BUILDING <$sys> PACKAGE]"
cd $home_dir/$dir
VERSION=$github_version make $sys

echo "=========> [MOVING TO BUILT PACKAGES FOLDER] >>>"
cd $home_dir/$bin_dir
ls
