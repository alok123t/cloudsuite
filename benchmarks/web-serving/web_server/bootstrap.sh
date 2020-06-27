#!/bin/bash

set -ex

DB_SERVER_IP=${1:-"mysql_server"}
MEMCACHE_SERVER_IP=${2:-"memcache_server"}
sed -i -e"s/mysql_server/${DB_SERVER_IP}/" elgg/elgg-config/settings.php
sed -i -e"s/'memcache_server'/'${MEMCACHE_SERVER_IP}'/" elgg/elgg-config/settings.php

if [[ ! -z "${HHVM}" && "${HHVM}" = "true" ]]; then
	chmod 700 /tmp/configure_hhvm.sh
	/tmp/configure_hhvm.sh
else
	cat /tmp/nginx_sites_avail.append >> /etc/nginx/sites-available/default
	FPM_CHILDREN=${3:-80}
	sed -i -e"s/pm.max_children = root/pm.max_children = ${FPM_CHILDREN}/" /etc/php/7.4/fpm/pool.d/www.conf
	service php7.4-fpm start
fi

service nginx restart
bash
