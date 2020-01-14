#This Script will help to install Ansible and git 
#in order to help you to run the Mariadb Role, 
#You can install it on a remote node or in the same machine
#where you want to run the mariadb instance 

# nable epel repository for CentOS 7 
yum -y install epel-release -y

# install Ansible 
yum -y install ansible

#Check that Ansible is working ok 
ansible --version

#install git 
yum -y install git

