#!/usr/bin/with-contenv bashio
set -e

EDGE_ID=$(bashio::config 'edge_id')
API_KEY=$(bashio::config 'api_key')
SERVER_URL=$(bashio::config 'server_url')
DATA_DIR=$(bashio::config 'data_dir')
LOG_LEVEL=$(bashio::config 'log_level')

DB_DIR="$DATA_DIR"

if [ ! -d $DB_DIR ]; then
  mkdir -p $DB_DIR
  bashio::log.info "Create db dir $DB_DIR"
fi

bashio::log.info "Starting Arqut Edge with data_dir=$DATA_DIR, log_level=$LOG_LEVEL ..."

DB_PATH="$DATA_DIR/arqut.db" CLOUD_URL="$SERVER_URL" ARQUT_API_KEY="$API_KEY" EDGE_ID="$EDGE_ID" /arqut-edge-ce -loglevel=$LOG_LEVEL
