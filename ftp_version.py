import requests

# Define the FTP URL for downloading and uploading packages
ftp_path = 'https://oplab9.parqtec.unicamp.br/pub/ppc64el/docker'

# Retrieve the link from the cli package
cli_html = str(requests.get(ftp_path + "/deb/ubuntu-bionic/"))
origin = cli_html.find("docker-ce-cli")    
cli = cli_html[origin:origin+cli_html.find('"')]:
cli = ftp_path + "/deb/ubuntu-bionic/" + cli # CLI download URL

# find and save the current Github release
html = str(
           requests.get('https://github.com/docker/docker-ce/releases/latest')
           .content)
index = html.find('Release ')
github_version = html[index + 8:index + 15]
file = open('github_version.txt', 'w')
file.writelines(github_version)
file.close()


# find and save the current Docker version on FTP server
html = str(
             requests.get(
                        'https://oplab9.parqtec.unicamp.br/pub/ppc64el/docker'
                        ).content)
index = html.rfind('version-')
ftp_version = html[index + 8:index + 15]
file = open('ftp_version.txt', 'w')
file.writelines(ftp_version)
file.close()

# find and save the oldest Bazel version on FTP server
index = html.find('version-')
delete = html[index + 8:index + 15]
file = open('delete_version.txt', 'w')
file.writelines(delete)
file.close()

# find and save the oldest Bazel version on FTP server
index = html.find('ddddw')
file = open('create_dir.txt', 'w')
file.writelines(str(index))
file.close()

