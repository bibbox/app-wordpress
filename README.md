# WORDPRESS BIBBOX application

WORDPRESS can be installed as [BIBBOX APP](https://bibbox.readthedocs.io/en/latest/ "BIBBOX App Store") or standalone. 

## Hints
* approx. time with medium fast internet connection: **5 minutes**
* initial user/passwordd: set at installation
* After the installation follow these [instructions](INSTALL-APP.md)

adminer static credentials:
field | value
------ | ------ 
server | wordpress-db
database | wordpress


## Standalone Installation

Clone the github repsoitory. If necessary change the ports and volume mounts in `docker-compose.yml`.  

```
git clone https://github.com/bibbox/app-wordpress
cd app-wordpress
mkdir data
docker-compose up -d
```

The main app can be opened at 

```
http://localhost:8010
```

## Docker Images Used
 * [wordpress](https://hub.docker.com/_/wordpress/), official wordpress container
 * [mariadb](https://hub.docker.com/_/mariadb/), offical mySQL container
 * [adminer](https://hub.docker.com/_/adminer/), db management tool
 
## Install Environment Variables
  * MYSQL_ROOT_PASSWORD = password, only used within the docker container
  * MYSQL_USER = name of the mysql user, typical *wordpress*
  * MYSQL_PASSWORD = mysql user password, only used within the docker container


