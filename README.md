# mariadb_galera_cluster
Ansible Role to deploy MariaDB on Centos7, configure Galera Cluster, backup the database and delete backup files older than 5 days
You can run the playbook in the same machine where you want to install MariaDB or from another machine ( ex: Ansible Master node )



## Requirements

- Ansible must be installed on the machine where you will run the script : You can use the "init.sh" script located inside this repository, it will install Ansible for you on your Centos7 machine.

## Getting Started

To run MariaDB deployement :

  
  1. Download the repo from github or use git to clone it in your home directory: 


     git clone https://github.com/ghassencherni/ultratendency.git
  
  

  2. Move to the downloaded repo : 


     cd ultratendency
  


  3. Install Ansible on your machine : you can use the "init.sh" script inside the repository
    
     chmod +x init.sh

     ./init.sh
  
  

  4. Add the host IP in the "hosts.ini" file and put the path of its pem key ( generated from the pvk.ppk ) 


> Note: It's mandatory to change the permission of your pem file to 600: chmod 600 your_key.pem, 
        You can convert you ppk key to pem using this command : puttygen my.ppk -O private-openssh -o my.key
 
  
  5. Run the command: 
     

     ansible-playbook deploy_mariadb.yml -i hosts.ini -v -u ultratendency



> Note: You can add many hosts in order to install several mariadb instances ( HA configuration case ), just add the IPs in the hosts.ini and specify the SSH key of each one.




## How to test the deploy :

   1. Connect to your target machine using SSH

   2. Check that you are able to connect to you Mariadb server: "mysql -u root -p$PASSWORD"

   3. Check that the backup directory is created: ls /opt/backup

   4. check that the cron job is created: cat /etc/cron.daily/mariadb-backup

   5. check that your cluster is working properly:
      
      - Connect to your databse and put the root pssword already difined : mysql -u root -p
      
      - Run the sql command : SHOW STATUS LIKE 'wsrep_cluster_size'; 
 
      => The expected Value is the number of servers added on your galera conf "wsrep_cluster_address" ( equal to 1 if you have only one node ) 



## Variables

Available variables are listed below, along with default values (see `ultratendency_mariadb/vars/main.yml`):


The default root password for the database

    mariadb_root_password: mypass

    

The backup dir where to put mariadb dumps 

    backup_dir: /opt/backup




## Author Information

This script  was created by [Ghassen CHARNI](https://github.com/ghassencherni/)
