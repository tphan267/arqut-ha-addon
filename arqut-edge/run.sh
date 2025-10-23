#!/usr/bin/with-contenv bashio
set -e

DATA_DIR=$(bashio::config 'data_dir')
LOG_LEVEL=$(bashio::config 'log_level')

DB_DIR="$DATA_DIR/db"

if [ ! -d $DB_DIR ]; then
  mkdir -p $DB_DIR
  bashio::log.info "Create db dir $DB_DIR"
fi

bashio::log.info "Starting Arqut Edge with data_dir=$DATA_DIR, log_level=$LOG_LEVEL ..."

SME_DATA_DIR="$DATA_DIR" /arqut-edge -haaddon -loglevel=$LOG_LEVEL
