#!/bin/bash

# Replace variables in conf
sed -i "s~ENV_APP_ROOT~${APP_ROOT}~" /etc/nginx/conf.d/default.conf
sed -i "s/ENV_APP_ENVIRONMENT/${APP_ENVIRONMENT}/" /etc/nginx/conf.d/default.conf
sed -i "s/ENV_APP_DEPLOY_ENV/${APP_DEPLOY_ENV}/" /etc/nginx/conf.d/default.conf
sed -i "s/ENV_APP_REGION/${APP_REGION}/" /etc/nginx/conf.d/default.conf

# Change GUID et PUID
if [ 100 -ne ${PUID} ] || [ 101 -ne ${GUID} ]
then
	usermod -u ${PUID} nginx
	groupmod -g ${GUID} nginx
	chown -R nginx:nginx /var/cache/nginx
fi

# Start nginx
exec nginx -g "daemon off;"