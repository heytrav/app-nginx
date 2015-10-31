#!/bin/sh

: ${API_HOST:=app}
sed -i 's/API_HOST/'"$API_HOST"'/g' /etc/nginx/sites-available/app.conf
sed -i 's/API_SERVER_NAME/'"$API_SERVER_NAME"'/g' /etc/nginx/sites-available/app.conf
sed -i 's/CERT_FILE/'"$CERT_FILE"'/g' /etc/nginx/sites-available/app.conf
sed -i 's/KEY_FILE/'"$KEY_FILE"'/g' /etc/nginx/sites-available/app.conf
/usr/bin/supervisord --nodaemon -c /etc/supervisor/supervisord.conf
