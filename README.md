# Playbooks and Random simulation environment
This is a random collection of Ansible playbooks to use with Cumulus VX and the Cumulus NOS. 

Not all of the playbooks in this repo will be in 100% working order, so please use with care. 

ocp_proto directory contains a Vagrant + Ansible simulation of a 2 leaf, 4 spine 2 border leaf build. Navigate to the directory and simply type "sudo vagrant up" to kick off the simulation. This simulation assumes that Vagrant and Ansible are both in working order, and Cumulus VX + Ubuntu Trusty VM's are available in your Vagrant environment.

## Network Diagram:
The topology for this demo can be seen here.
![Diagram](opc_proto.png)
