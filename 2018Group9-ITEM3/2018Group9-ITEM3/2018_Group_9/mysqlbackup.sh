#!/bin/bash
DATE=$(date +"%Y%m%d%H%M")
BACKUP_DIR="/backup/mysql"

MYSQL_USER="root"
MYSQL_PASSWORD="root"

MYSQL=/usr/bin/mysql
MYSQLDUMP=/usr/bin/mysqldump

SKIPDATABASES="Database|information_schema|performance_schema|mysql|sys"

RETENTION=14
DATABASE_IP=
mkdir -p $BACKUP_DIR/$DATE

# Retrieve a list of all databases

databases=`$MYSQL -h $DATABASE_IP -u$MYSQL_USER -p$MYSQL_PASSWORD -e "SHOW DATABASES;" | grep -Ev "($SKIPDATABASES)"`
for db in $databases; do
echo $db
$MYSQLDUMP --force --opt -h $DATABASE_IP --user=$MYSQL_USER -p$MYSQL_PASSWORD --skip-lock-tables --events --databases $db | gzip > "$BACKUP_DIR/$DATE/$db.sql.gz"
done

# Remove files older than X days

find $BACKUP_DIR/* -mtime +$RETENTION -delete
