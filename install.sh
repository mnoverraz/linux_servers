# Update du system
apt-get update && apt-get upgrade -y

# VirtualBox GestAddition
apt-get install -y build-essential module-assistant
m-a -i prepare
sh /media/cdrom/VBoxLinuxAdditions.run

# Installation des logiciels de bases
apt-get install -y sudo ssh git curl
adduser mnoverraz sudo