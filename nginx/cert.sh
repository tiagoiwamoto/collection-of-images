#!/bin/bash

# Loop infinito para verificar a renovação do certificado a cada 30 dias
while true; do
    # Tenta renovar o certificado SSL
    certbot renew

    # Dorme por 30 dias antes de tentar renovar novamente
    sleep 30d
done
