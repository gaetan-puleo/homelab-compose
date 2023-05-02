#!/bin/bash

source .env
################
# restore files
################
sudo rsync  -aAvX --mkpath --delete ${BACKUP_DIR}/nextcloud/ volumes/nextcloud

sudo rsync -aAvX  --mkpath --delete ${BACKUP_DIR}/.env .env

sudo rsync -aAvX  --mkpath --delete ${BACKUP_DIR}/dump.sql dump.sql
#
# restore database  

# Turn On maintenance mode for Nextcloud
docker compose exec --user www-data nextcloud php occ maintenance:mode --on 

# delete nextcloud db

docker compose exec nextcloud-db mysql -u $MYSQL_USER --password="${MYSQL_PASSWORD}"  -e "DROP DATABASE ${MYSQL_DATABASE}" 

docker compose exec nextcloud-db mysql -u $MYSQL_USER --password="${MYSQL_PASSWORD}"  -e "CREATE DATABASE ${MYSQL_DATABASE}" 

cat ./dump.sql | docker compose exec -Ti nextcloud-db mysql -u ${MYSQL_USER} --password="${MYSQL_PASSWORD}" ${MYSQL_DATABASE}

docker compose exec --user www-data nextcloud php occ maintenance:mode --off 




