#!/bin/bash

mysqldump -u root -p{{database_root_password}} ELGG_DB > /elgg_db_dump.sql
