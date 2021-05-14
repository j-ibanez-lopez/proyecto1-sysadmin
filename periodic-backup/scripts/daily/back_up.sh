#!/bin/bash

USER="user_prestashop"
PASSWORD=""
DATABASE="bitnami_database"

FINAL_OUTPUT=/bitnami/mariadb/`date +%Y%m%d`_$DATABASE.sql
mysqldump --user=$USER --password=$PASSWORD $DATABASE > $FINAL_OUTPUT
gzip $FINAL_OUTPUT

