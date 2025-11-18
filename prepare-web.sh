#!/bin/bash
# Script untuk menjalankan setup container untuk praktikum modul 10 dan 11.
# usage: prepare-web.sh [nama-container-host-server]
# contoh: prepare-web.sh 2_GENEhost
webcontainer="$1"
echo "Menyiapkan web server pada container $webcontainer ..."

sudo docker cp apk-server "$webcontainer":/root/
sudo docker exec -w /root "$webcontainer" \
  sh -c 'apk add --no-cache --allow-untrusted --repositories-file /dev/null apk-server/apache2/*.apk'


sudo docker exec "$webcontainer" sh -c 'mkdir -p /var/www/localhost/htdocs'
sudo docker cp for-protected/private "$webcontainer":/var/www/localhost/htdocs/
sudo docker cp for-protected/httpd.conf "$webcontainer":/etc/apache2/
sudo docker exec "$webcontainer" /usr/sbin/httpd
sudo docker exec -w /root "$webcontainer" rm -rf apk-server
