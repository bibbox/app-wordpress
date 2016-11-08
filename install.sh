#!/bin/bash
#
# SCRIPT TO INSTALL A WORDPRESS INSTANCE WITHIN A BIBBOX SERVER
#
#


echo "Installing OpenSpecimen BIBBOX Application"
echo "installing from $PWD"

PROGNAME=$(basename $0)

clean_up() {	
	exit $1
}

error_exit()
{
	echo "ERROR in ${PROGNAME}: ${1:-"Unknown Error"}" 1>&2
	clean_up 1
}

 #ADD CUSTOM CHECKS AN LOSs as YOU LIKE
 checkParameters() 
{
    echo "Setup parameters:"
    if [[ -z "$MYSQL_ROOT_PASSWORD" ]]; then
        error_exit "The mysql root password is not set."
    else
        echo "MYSQL root passwort: ****"
    fi  
    if [[ -z "$MYSQL_DATABASE" ]]; then
        error_exit "The my dabase user is not set."
    else
        echo "MYSQL Database: $MYSQL_DATABASE"
    fi 
    if [[ -z "$MYSQL_USER" ]]; then
        error_exit "The my sql user is not set."
    else
        echo "MYSQL User: $MYSQL_USER"
    fi 
    if [[ -z "$MYSQL_PASSWORD" ]]; then
        error_exit "The my sql user password is not set."
    else
        echo "MYSQL User Password: $MYSQL_PASSWORD"
    fi 
}

updateConfigurationFile()
{
    echo "Create and Update config files"  
    if  [[ ! -f "$folder/docker-compose.yml" ]]; then
        cp docker-compose-template.yml "$folder/docker-compose.yml"
    fi
  # SAME IN EVERY INSTALL.SH / DONT CHANGE  
    sed -i  "s/§§INSTANCE/${instance}/g" "$folder/docker-compose.yml"
    sed -i  "s#§§FOLDER#${folder}#g" "$folder/docker-compose.yml"
    sed -i  "s/§§PORT/${port}/g" "$folder/docker-compose.yml"
  # CHANGE  
  # TODO special characters in passwords 
    sed -i "s#§§MYSQL_ROOT_PASSWORD#${MYSQL_ROOT_PASSWORD}#g" "$folder/docker-compose.yml"
    sed -i "s/§§MYSQL_DATABASE/${MYSQL_DATABASE}/g" "$folder/docker-compose.yml"
    sed -i "s/§§MYSQL_USER/${MYSQL_USER}/g" "$folder/docker-compose.yml"
    sed -i "s#§§MYSQL_PASSWORD#${MYSQL_PASSWORD}#g" "$folder/docker-compose.yml"
    sed -i "s/§§EXTAPI_PORT/${EXTAPI_PORT}/g" "$folder/docker-compose.yml"
}


createFolders()
{
    echo "Create folders within $folder"
    if [[ ! -d "$folder" ]]; then
        echo "Creating Installation Folder"
        mkdir -p "$folder/var/lib/mysql"
    fi
}

#
# MAIN
while [ "$1" != "" ]; do
    case $1 in
        -i | --instance )       shift
                                instance=$1
                                ;;
        -f | --folder )         shift
                                folder=$1
                                ;;
        -p | --port )           shift
                                port=$1
                                ;;
        --MYSQL_ROOT_PASSWORD ) shift
                                MYSQL_ROOT_PASSWORD=$1
                                ;;
        --MYSQL_DATABASE )      shift
                                MYSQL_DATABASE=$1
                                ;;
        --MYSQL_USER )          shift
                                MYSQL_USER=$1
                                ;;   
        --MYSQL_PASSWORD )      shift
                                MYSQL_PASSWORD=$1
                                ;;
    esac
    shift
done
#
# SAME IN EVERY INSTALL.SH / DONT CHANGE
checkParametersAndWriteLog
createFolders
updateConfigurationFile
