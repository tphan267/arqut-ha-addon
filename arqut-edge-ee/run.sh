#!/usr/bin/env bashio
# shellcheck shell=bash
set -e

# ==============================================================================
# Home Assistant Add-on: Arqut Edge EE
# ==============================================================================

# Load configuration values
bashio::log.info "Loading configuration..."
DATA_DIR="$(bashio::config 'data_dir')"
LOG_LEVEL="$(bashio::config 'log_level')"

bashio::log.info "Configuration loaded:"
bashio::log.info "  - Data directory: ${DATA_DIR}"
bashio::log.info "  - Log level: ${LOG_LEVEL}"

# Create data directory if it doesn't exist
if [ ! -d "${DATA_DIR}" ]; then
    bashio::log.info "Creating data directory: ${DATA_DIR}"
    mkdir -p "${DATA_DIR}"
fi

# Start the application
/arqut-edge-ee \
    -config="${DATA_DIR}/arqut.yaml" \
    -loglevel="${LOG_LEVEL}" \
    -haaddon
