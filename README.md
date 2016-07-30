# Playbooks and Random simulation environment
This is a random collection of Ansible playbooks to use with Cumulus VX and the Cumulus NOS. 

Not all of the playbooks in this repo will be in 100% working order, so please use with care. 

The ocp_proto directory contains a Vagrant + Ansible simulation of a 2 leaf, 4 spine 2 border leaf build. Navigate to the directory and simply type "sudo vagrant up" to kick off the simulation. This simulation assumes that Vagrant and Ansible are both in working order, and Cumulus VX + Ubuntu Trusty VM's are available in your Vagrant environment.

### Ansible
All configuration is driven through [Ansible](http://ansible.com). The intention is for no change to be made directly on the network and all changes to be done through modifications to the playbooks and/or variables (var) files.

### VirtualBox
[VirtualBox](https://www.virtualbox.org/wiki/Downloads) is the Hypervisor that is used to run the Cumulus Linux virtual machines.

### Vagrant
[Vagrant](https://www.vagrantup.com/) is used to orchestrate VirtualBox and spin up the entire lab of nodes with all associated connectivity. 

### Cumulus Linux
[Cumulus Linux - CumulusVx](http://cumulusnetworks.com/cumulus-vx/) is used as the networking layer. CumulusVx is the virtual machine for testing Cumulus Linux production configuration. 

### Git
[Git](https://git-scm.com/) is used for all configuration file management. This allows for changes on a file and project level. 

## Network Diagram:
The topology for this demo can be seen below.

![Diagram](https://github.com/kwitherstine/testing_T/blob/master/ocp_proto.png?raw=true)

# Requirements
The following are a list of required software to run this project.
* **[Vagrant](https://www.vagrantup.com/)**
* **[VirtualBox](https://www.virtualbox.org/wiki/Downloads)**
* **[Ansible](http://ansible.com)** - This has been tested on Ansible 2.1.
* **[Yamllint](https://pypi.python.org/pypi/yamllint)** - an open source python script that will validate YAML files for proper syntax. `pip install yamllint` 
