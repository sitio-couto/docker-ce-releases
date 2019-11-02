home_dir=$(pwd)
github_version=$(cat github_version.txt)
ftp_version=$(cat ftp_version.txt)
# del_version=$(cat delete_version.txt)
cli_version=$(cat cli_version.txt)

echo "===> Installing Docker"
git clone https://github.com/Unicamp-OpenPower/docker.git
sudo snap install docker

echo "===> Clonning docker-ce repo"
git clone https://github.com/docker/docker-ce

echo "===> Checking out to docker-ce version $github_version"
cd docker-ce && git checkout v$github_version

# echo "===> Downloading and installing docker-ce-cli from FTP"
# wget https://oplab9.parqtec.unicamp.br/pub/ppc64el/docker/deb/ubuntu-bionic/$cli_version
# sudo apt install ./$cli_version
# rm $cli_version

echo "===> Moving to $dir and building $sys package"
cd $home_dir/$dir
VERSION=$github_version make $sys

echo "===> Moving to built pakcages folder"
cd $home_dir/$bin_dir
ls
