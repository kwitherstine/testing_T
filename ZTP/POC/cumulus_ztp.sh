#!/bin/bash
function error() {
  echo -e "\e[0;33mERROR: The Zero Touch Provisioning script failed while running the command $BASH_COMMAND at line $BASH_LINENO.\e[0m" >&2
  exit 1
}

# Log all output from this script
exec >/var/log/autoprovision 2>&1

trap error ERR

#ssh-keygen
#ssh-keygen
mkdir /home/cumulus/.ssh

#Copy SSH keys from http server
sudo curl http://172.16.30.1/cumulus/authorized_keys >> /home/cumulus/.ssh/authorized_keys

#Add Debian Repositories
#echo "deb http://http.us.debian.org/debian jessie main" >> /etc/apt/sources.list
#echo "deb http://security.debian.org/ jessie/updates main" >> /etc/apt/sources.list

#Update Package Cache
#apt-get update -y

#Install pre-reqs for mako templating
sudo apt-get install -y python-ipaddr

#Copy license file from server
sudo curl http://172.16.30.1/cumulus/license.txt > /home/cumulus/license.txt

#Install a License and restart switchd
sudo cl-license -i /home/cumulus/license.txt && sudo systemctl restart switchd.service

#Load Layer 2 interfaces file from http server for nodes
if [[ $(hostname -s) = leaf* ]]; then
    sudo curl http://172.16.30.1/cumulus/cumulus_l2_interfaces_leaf > /home/cumulus/cumulus_l2_interfaces_leaf
    sudo cp /home/cumulus/cumulus_l2_interfaces_leaf /etc/network/interfaces

elif [[ $(hostname -s) = spine* ]]; then
    sudo curl http://172.16.30.1/cumulus/cumulus_l2_interfaces_spine > /home/cumulus/cumulus_l2_interfaces_spine
    sudo cp /home/cumulus/cumulus_l2_interfaces_spine /etc/network/interfaces

fi

#Reload interfaces to apply loaded config
sudo ifreload -a

#Output state of interfaces
netshow interface

exit 0

# CUMULUS-AUTOPROVISIONING
