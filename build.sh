github_version="18.09.7"
ftp_version=$(cat ftp_version.txt)
del_version=$(cat delete_version.txt)

echo "===> Downloading docker-ce version $github_version"
wget https://codeload.github.com/docker/docker-ce/zip/v$github_version

echo "===> Unziping docker-ce version $github_version"
unzip v$github_version

echo "===> Renaming docker-ce folder"
mv docker-ce-$github_version docker-ce

echo "VALIDACAO 8"
cd $dir

echo "VALIDACAO 9"
VERSION=$github_version make $sys

echo "VALIDACAO 10"
cd ../../../

echo "VALIDACAO 11"
cd $bin_dir

