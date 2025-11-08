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

LOGFILE_TO_MONITOR="$HOME/bash_project/system.log"
info "Monitoring log file: $LOGFILE_TO_MONITOR"

if [ ! -f "$LOGFILE_TO_MONITOR" ]; then
  error_exit "Log file not found: $LOGFILE_TO_MONITOR"
fi

if grep -Ei 'error|fail|fatal' "$LOGFILE_TO_MONITOR" | tee -a "$LOGFILE"; then
  info "Errors found and logged"
else
  info "No errors found in log"
fi

info " Log monitoring completed"

