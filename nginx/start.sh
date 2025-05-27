#!/bin/bash

# Verificar se os certificados já existem
if [ ! -f /etc/letsencrypt/live/$DOMAIN/fullchain.pem ]; then
    echo "Certificados SSL não encontrados. Solicitando um novo certificado..."
    certbot certonly --nginx --non-interactive --agree-tos --email $EMAIL -d $DOMAIN -d www.$DOMAIN
else
    echo "Certificados SSL já existem."
fi

# Iniciar o Nginx
nginx -g 'daemon off;'
