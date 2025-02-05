#!/bin/bash

# Cria e corrige as permissões do diretório .npm
docker compose exec -u root api mkdir -p /.npm
docker compose exec -u root api chown -R 1011:1011 /.npm

# Cria e corrige as permissões do diretório node_modules se não existir
docker compose exec -u root api mkdir -p /app/node_modules
docker compose exec -u root api chown -R 1011:1011 /app/node_modules

# Cria e corrige as permissões do diretório _logs
docker compose exec -u root api mkdir -p /.npm/_logs
docker compose exec -u root api chown -R 1011:1011 /.npm/_logs

# Reinicia o container para aplicar as mudanças
docker compose restart api 