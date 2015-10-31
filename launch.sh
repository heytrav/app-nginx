#!/bin/sh

: ${APP_HOST:=app}
sed -i 's/APP_HOST/'"$APP_HOST"'/g' /etc/nginx/sites-available/app.conf
sed -i 's/APP_SERVER_NAME/'"$APP_SERVER_NAME"'/g' /etc/nginx/sites-available/app.conf
sed -i 's/CERT_FILE/'"$CERT_FILE"'/g' /etc/nginx/sites-available/app.conf
sed -i 's/KEY_FILE/'"$KEY_FILE"'/g' /etc/nginx/sites-available/app.conf
/usr/bin/supervisord --nodaemon -c /etc/supervisor/supervisord.conf
