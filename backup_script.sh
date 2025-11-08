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

SOURCE_DIR="$HOME/bash_project/source_files"
BACKUP_DIR="$HOME/bash_project/backup/$(date +%F_%H%M%S)"

info "Starting backup from $SOURCE_DIR to $BACKUP_DIR"

mkdir -p "$SOURCE_DIR" || error_exit "Failed to create source directory"
mkdir -p "$BACKUP_DIR" || error_exit "Failed to create backup directory"

cp -r "$SOURCE_DIR"/. "$BACKUP_DIR"/ || error_exit "Backup copy failed"

info " Backup completed successfully at $BACKUP_DIR"
