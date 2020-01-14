# ultratendency_mariadb
Ansible Role to deploy MariaDB on Centos7, backup the database and delete backup files older than 5 days



## Requirements

- Ansible must be installed on the machine where you will run the script ( it can be remotely from another node of where you want to install MariaDB )

## Getting Started

To run mysql in master and slave replication :

  1. Install Ansible on your machine
  2. Download the repo from github or use git to clone it in your home directory: git clone https://github.com/ghassencherni/ultratendency.git
  3. Move to the downloaded repo : cd ultratendency
  4. Add the host IP in the "hosts.ini" file and put the path of its pem key ( generated from the pvk.ppk ) 

## How to test the deploy :

   1. Connect to your target machine using SSH
   2. Check that you are able to connect to you Mariadb server: "mysql -u root -p$PASSWORD"
   3. Check that the backup directory is created: ls /opt/backup
   4. check that the cron job is created: cat /etc/cron.daily/mariadb-backup


## Variables

Available variables are listed below, along with default values (see `ultratendency_mariadb/vars/main.yml`):


The default root password for the database

    mariadb_root_password: mypass

    

The backup dir where to put mariadb dumps 

    backup_dir: /opt/backup




## Author Information

This script  was created by [Ghassen CHARNI](https://github.com/ghassencherni/)
