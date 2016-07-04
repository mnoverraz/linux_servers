# Update du system
apt-get update && apt-get upgrade -y

# VirtualBox GestAddition
apt-get install -y build-essential module-assistant
m-a -i prepare
sh /media/cdrom/VBoxLinuxAdditions.run

# Installation des logiciels de bases
apt-get install -y sudo ssh git curl
adduser mnoverraz sudo

# Création des aliases et personnalisation du bash
echo "# Personnalisations apportées par Mathieu Noverraz" >> /home/mnoverraz/.bashrc
echo "alias ls='ls -la --color=auto'" >> /home/mnoverraz/.bashrc

# Installation de Docker, Docker compose pour Debian jessie
# Il faudrait tester si le fichier existe
touch /etc/apt/sources.list.d/backports.list
echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list.d/backports.list
apt-get update
apt-get purge lxc-docker*
apt-get purge docker.io*
apt-get update
apt-get install -y apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
touch /etc/apt/sources.list.d/docker.list
echo "deb https://apt.dockerproject.org/repo debian-jessie main" >> /etc/apt/sources.list.d/docker.list
apt-get update
apt-get install -y docker-engine
﻿﻿﻿service docker start
groupadd docker
gpasswd -a mnoverraz docker
curl -L https://github.com/docker/compose/releases/download/1.8.0-rc1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
