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

info "Welcome to Maintenance Suite!"

echo "Choose an option:"
echo "1. Backup Files"
echo "2. Clean System"
echo "3. Monitor Logs"
read -p "Enter choice: " choice

run_backup() {
  ./backup_script.sh || error_exit "Backup script failed"
}
run_cleanup() {
  ./update_cleanup.sh || error_exit "Cleanup script failed"
}
run_monitor() {
  ./log_monitor.sh || error_exit "Log monitor script failed"
}

case "$choice" in
  1) run_backup ;;
  2) run_cleanup ;;
  3) run_monitor ;;
  *) error_exit "Invalid choice. Please enter 1, 2, or 3." ;;
esac

info " Maintenance Suite completed successfully"

