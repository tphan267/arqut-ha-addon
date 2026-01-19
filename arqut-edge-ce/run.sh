#!/usr/bin/env bashio
# shellcheck shell=bash
set -e

# ==============================================================================
# Home Assistant Add-on: Arqut Edge EE
# ==============================================================================

# Load configuration values
bashio::log.info "Loading configuration..."
EDGE_ID="$(bashio::config 'edge_id')"
API_KEY="$(bashio::config 'api_key')"
SERVER_URL="$(bashio::config 'server_url')"
DATA_DIR="$(bashio::config 'data_dir')"
LOG_LEVEL="$(bashio::config 'log_level')"

bashio::log.info "Configuration loaded:"
bashio::log.info "  - Edge ID: ${EDGE_ID}"
bashio::log.info "  - API Key: ${API_KEY}"
bashio::log.info "  - Server URL: ${SERVER_URL}"
bashio::log.info "  - Data directory: ${DATA_DIR}"
bashio::log.info "  - Log level: ${LOG_LEVEL}"

# Create data directory if it doesn't exist
if [ ! -d "${DATA_DIR}" ]; then
    bashio::log.info "Creating data directory: ${DATA_DIR}"
    mkdir -p "${DATA_DIR}"
fi

# Start the application
ARQUT_DB_PATH="$DATA_DIR/arqut.db" ARQUT_CLOUD_URL="$SERVER_URL" ARQUT_API_KEY="$API_KEY" ARQUT_EDGE_ID="$EDGE_ID" /arqut-edge-ce -loglevel=$LOG_LEVEL
