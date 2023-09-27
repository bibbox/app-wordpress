# wordpress BIBBOX application

This container can be installed as [BIBBOX APP](https://bibbox.readthedocs.io/en/latest/ "BIBBOX App Store") or standalone. 

- after the docker installation follow these [instructions](INSTALL-APP.md)

## Standalone Installation 

Clone the github repository. If necessary change the ports in the environment file `.env` and the volume mounts in `docker-compose.yml`.

```
git clone https://github.com/bibbox/app-wordpress
cd app-wordpress
docker-compose up -d
```

The main app can be opened and set up at
```
http://localhost:8010
```

## Install within BIBBOX

Visit the BIBBOX page and find the App by its name in the Store. Click on the symbol and select Install. Then fill the parameters below and name your app click install again.

## Docker Images used
  - [wordpress](https://hub.docker.com/r/wordpress) 
  - [adminer](https://hub.docker.com/r/adminer) 
  - [mariadb](https://hub.docker.com/r/mariadb) 


 
## Install Environment Variables
  - MYSQL_USER = username for the mysql-db account
  - MYSQL_PASSWORD = Password of the mySQL database, only visible within the container
  - MYSQL_ROOT_PASSWORD = Root password of the mySQL database, only visible within the container

  
The default values for the standalone installation are:
  - MYSQL_USER = user
  - MYSQL_PASSWORD = changethispasswordinproductionenvironments
  - MYSQL_ROOT_PASSWORD = changethisrootpasswordinproductionenvironments

  
## Mounted Volumes
### mariadb Conatiner
  - *./database/mysql:/var/lib/mysql*
