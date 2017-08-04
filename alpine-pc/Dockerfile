FROM nginx:alpine

ENV APP_ROOT /var/www/html/web
ENV APP_ENVIRONMENT production
ENV APP_DEPLOY_ENV production
ENV APP_REGION us1

# Install needed library
RUN apk add -v --update \
    bash

ADD default.conf /etc/nginx/conf.d/default.conf
ADD start.sh /start.sh
RUN chmod 755 /start.sh

CMD ["/start.sh"]