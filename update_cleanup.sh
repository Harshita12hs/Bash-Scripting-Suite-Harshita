#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

LOGFILE="$(dirname "$0")/suite_log.txt"

log()  { printf '%s %s\n' "$(date +'%Y-%m-%d %H:%M:%S')" "$*" >> "$LOGFILE"; }
info() { log "INFO: $*"; }
err()  { log "ERROR: $*"; }

error_exit() {
  err "$* (exit code $?) on line ${BASH_LINENO[0]}"
  echo " Fatal error: $* (see $LOGFILE)" >&2
  exit 1
}

trap 'error_exit "Unexpected error at or before line $LINENO while running: $BASH_COMMAND"' ERR
trap 'info "Script ended with exit code $?"' EXIT

info "Starting system update and cleanup process..."

TEMP_DIR="$HOME/bash_project/temp_files"

if [ -d "$TEMP_DIR" ]; then
  info "Cleaning up temporary files..."
  rm -rf "$TEMP_DIR" || error_exit "Failed to clean up $TEMP_DIR"
else
  info "No temporary files found in $TEMP_DIR"
fi

info "Simulating system update..."
sleep 2 || error_exit "System update simulation failed"

info " Update and cleanup completed successfully!"

