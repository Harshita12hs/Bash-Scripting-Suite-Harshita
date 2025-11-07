#!/bin/bash
# =========================================
# Bash Script: maintenance_suite.sh
# Purpose: Final menu-driven system maintenance suite with error handling & logging
# Author: Harshita Swain
# =========================================

LOG_FILE="$HOME/bash_project/suite_log.txt"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

handle_error() {
    echo "❌ An error occurred while running $1"
    log "ERROR: $1 failed"
}

while true
do
    clear
    echo "=================================="
    echo "🧩 FINAL SYSTEM MAINTENANCE SUITE"
    echo "=================================="
    echo "1. Run Backup Script"
    echo "2. Run System Update & Cleanup"
    echo "3. Run Log Monitoring"
    echo "4. View Central Log File"
    echo "5. Exit"
    echo "----------------------------------"
    read -p "👉 Enter your choice [1-5]: " choice

    case $choice in
        1)
            echo "🚀 Running Backup Script..."
            sleep 1
            if bash "$HOME/bash_project/backup_script.sh"; then
                echo "✅ Backup Completed Successfully!"
                log "Backup script executed successfully"
            else
                handle_error "Backup Script"
            fi
            read -p "Press Enter to return to menu..."
            ;;
        2)
            echo "🚀 Running System Update & Cleanup..."
            sleep 1
            if bash "$HOME/bash_project/update_cleanup.sh"; then
                echo "✅ Update & Cleanup Completed Successfully!"
                log "Update & Cleanup script executed successfully"
            else
                handle_error "Update & Cleanup Script"
            fi
            read -p "Press Enter to return to menu..."
            ;;
        3)
            echo "🚀 Running Log Monitoring Script..."
            sleep 1
            if bash "$HOME/bash_project/log_monitor.sh"; then
                echo "✅ Log Monitoring Completed Successfully!"
                log "Log Monitoring script executed successfully"
            else
                handle_error "Log Monitoring Script"
            fi
            read -p "Press Enter to return to menu..."
            ;;
        4)
            echo "📜 Displaying Central Log File:"
            echo "----------------------------------"
            if [ -f "$LOG_FILE" ]; then
                cat "$LOG_FILE"
            else
                echo "⚠️ No logs found yet!"
            fi
            echo "----------------------------------"
            read -p "Press Enter to return to menu..."
            ;;
        5)
            echo "👋 Exiting Final Maintenance Suite. Goodbye, Harshita!"
            log "Exited Maintenance Suite"
            break
            ;;
        *)
            echo "❌ Invalid choice! Please enter a number between 1 and 5."
            sleep 2
            ;;
    esac
done

