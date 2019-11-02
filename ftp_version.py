import requests
from re import findall

# path  - URL where to look for the info
# regex - Pattern of what to look for in the path to locate the info
# name  - Name of the text file to be written with the info
def get_info(path, regex, name, cut=(lambda x : x)):
    html = str(requests.get(path).content)
    info = cut(max(findall(regex, html)))
    file = open(name+'.txt', 'w')
    file.writelines(info)
    file.close()

# # Retrieve the link from the cli package
# cli_html = str(requests.get(ftp_path + "/deb/ubuntu-bionic/"))
# origin = cli_html.find("docker-ce-cli")    
# cli = cli_html[origin:origin+cli_html.find('"')]:
# cli = ftp_path + "/deb/ubuntu-bionic/" + cli # CLI download URL

# Define the FTP URL for downloading and uploading packages
ftp_path = 'https://oplab9.parqtec.unicamp.br/pub/ppc64el/docker'
git_path = 'https://github.com/docker/docker-ce/releases/latest'
cli_path = 'https://oplab9.parqtec.unicamp.br/pub/ppc64el/docker/deb/ubuntu-bionic/'

# find and save the current Github release
get_info(git_path, 'v\d\d[.]\d\d[.]\d', 'github_version', cut=(lambda x : x[1:]))

# find and save the current Docker version on FTP server
get_info(ftp_path, '\d\d[.]\d\d[.]\d', 'ftp_version')

# find and save the current docker-ce-cli pakcage from the FTP server
get_info(cli_path, 'docker-ce-cli[^"<]*', 'cli_version')
