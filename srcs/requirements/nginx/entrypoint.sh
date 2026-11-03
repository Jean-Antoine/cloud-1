#!/bin/sh
set -e

if [ ! -f /etc/letsencrypt/live/${DOMAIN_NAME}/fullchain.pem ]; then
    certbot certonly --standalone \
        -d ${DOMAIN_NAME} \
        --non-interactive \
        --agree-tos \
        -m ${CERTBOT_EMAIL} \
        ${CERTBOT_STAGING:+--staging}
fi

envsubst '${DOMAIN_NAME}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf


exec nginx -g 'daemon off;'
