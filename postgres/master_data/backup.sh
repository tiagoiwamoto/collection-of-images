#!/bin/bash

# Configurações
DB_CONTAINER="postgres-master"
BACKUP_DIR="/backup"
TIMESTAMP=$(date +"%F_%T")
BACKUP_FILE="${BACKUP_DIR}/backup_${TIMESTAMP}.sql"

# Criação de diretório de backup
mkdir -p ${BACKUP_DIR}

# Dump do banco de dados
docker exec -t ${DB_CONTAINER} pg_dumpall -U masteruser > ${BACKUP_FILE}

# Verificação de erros no dump
if [ $? -eq 0 ]; then
  echo "Backup realizado com sucesso: ${BACKUP_FILE}"
else
  echo "Erro ao realizar o backup"
  exit 1
fi

# Enviando para o Google Drive usando rclone
rclone copy ${BACKUP_FILE} gdrive:/path/to/backup

# Verificação de sucesso do envio
if [ $? -eq 0 ]; then
  echo "Backup enviado com sucesso para o Google Drive"
else
  echo "Erro ao enviar o backup para o Google Drive"
  exit 1
fi
