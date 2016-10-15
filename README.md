# WORDPRESS BIBBOX application

## Hints
* approx. time with medium fast internet connection: **15 minutes**
* initial user/passwordd: **Admin / admin**


## Docker Images Used
 * [wordpress](https://hub.docker.com/_/wordpress/), official wordpress container
 * [mySQL](https://hub.docker.com/_/mysql/), offical mySQL container
 * [busybox](https://hub.docker.com/_/busybox/), offical data container
 
## Install Environment Variables
  *	MYSQL_ROOT_PASSWORD = password, only used within the docker container
  * MYSQL_DATABASE = name of the mysql database, typical *wordpress*. The DB file is stored in the mounted volume
  * MYSQL_USER = name of the mysql user, typical *wordpress*
  * MYSQL_PASSWORD = mysql user password, only used within the docker container

## Mounted Volumes

* the mysql datafolder _/var/mysql_ will be mounted to _/opt/apps/INSTANCE_NAME/var/mysql_ in your BIBBOX kit 

## Installation Instructions 

* 


## After the installation

Have a nice ride with the new Admins youngtimer.

![FINAL](install-screen-final.jpg)