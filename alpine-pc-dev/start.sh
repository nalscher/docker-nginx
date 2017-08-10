#!/bin/bash

# Replace variables in conf
sed -i "s~ENV_APP_ROOT~${APP_ROOT}~" /etc/nginx/conf.d/default.conf
sed -i "s/ENV_APP_ENVIRONMENT/${APP_ENVIRONMENT}/" /etc/nginx/conf.d/default.conf
sed -i "s/ENV_APP_DEPLOY_ENV/${APP_DEPLOY_ENV}/" /etc/nginx/conf.d/default.conf
sed -i "s/ENV_APP_REGION/${APP_REGION}/" /etc/nginx/conf.d/default.conf

# Change GUID et PUID
usermod -u ${PUID} nginx
groupmod -g ${GUID} nginx
chown -R nginx:nginx /var/cache/nginx

# Start nginx
exec nginx -g "daemon off;"