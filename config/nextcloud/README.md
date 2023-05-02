# Nextcloud vps

## Requirements

- docker
- docker-compose

## How to start

Create a .env file

Here a template
```
# Mysql
MYSQL_ROOT_PASSWORD=
MYSQL_USER=
MYSQL_PASSWORD=
MYSQL_DATABASE=
MYSQL_DATABASE_FOLDER_PATH=

# nextcloud
NEXTCLOUD_TRUSTED_DOMAINS=
NEXTCLOUD_ADMIN_USER=
NEXTCLOUD_ADMIN_PASSWORD=
NEXTCLOUD_FOLDER_PATH=

# timezone
TZ=Europe/Paris

BACKUP_DIR=./backup
```

You need to fill all the fields

```bash
docker-compose up
```

## informations

- nextcloud files are stored in `./files`
- user files are stored in `./files/data` 
- the db is stored in `./db`

## Todo before stable release
- [ ] move in portainer
- [ ] backup database 
- [ ] backup files
- [ ] automate install
- [ ] automate restore database
- [ ] automate restore files
