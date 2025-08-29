#!/bin/bash
set -e

# Create data folders
mkdir -p ~/n8n_data
mkdir -p ~/db_data

# Run Postgres
docker run -d \
  --name n8n-postgres \
  -e POSTGRES_USER=n8n \
  -e POSTGRES_PASSWORD=n8npass \
  -e POSTGRES_DB=n8n \
  -v ~/db_data:/var/lib/postgresql/data \
  postgres:15

# Run n8n
docker run -d \
  --name n8n \
  --restart unless-stopped \
  -p 5678:5678 \
  -e N8N_BASIC_AUTH_ACTIVE=true \
  -e N8N_BASIC_AUTH_USER=admin \
  -e N8N_BASIC_AUTH_PASSWORD=strongpassword \
  -e DB_TYPE=postgresdb \
  -e DB_POSTGRESDB_HOST=n8n-postgres \
  -e DB_POSTGRESDB_PORT=5432 \
  -e DB_POSTGRESDB_DATABASE=n8n \
  -e DB_POSTGRESDB_USER=n8n \
  -e DB_POSTGRESDB_PASSWORD=n8npass \
  -e GENERIC_TIMEZONE=Asia/Kolkata \
  -e N8N_SECURE_COOKIE=false \
  -v ~/n8n_data:/home/node/.n8n \
  --link n8n-postgres:db \
  n8nio/n8n:latest
