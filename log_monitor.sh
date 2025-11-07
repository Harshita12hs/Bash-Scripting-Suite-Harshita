#!/bin/bash
# =========================================
# Bash Script: log_monitor.sh
# Purpose: Monitor log files for errors or warnings
# Author: Harshita Swain
# =========================================

echo "=================================="
echo "🧩 Starting Log Monitoring Script"
echo "=================================="

# Step 1: Define the log file to monitor
LOG_FILE="$HOME/bash_project/system.log"
ALERT_FILE="$HOME/bash_project/alerts.txt"

# Step 2: Check if the log file exists, if not create it
if [ ! -f "$LOG_FILE" ]; then
    echo "No log file found. Creating a new system.log file..."
    touch "$LOG_FILE"
    echo "INFO: Log file created successfully on $(date)" >> "$LOG_FILE"
fi

# Step 3: Simulate adding logs (for demo)
echo "Adding some dummy log entries..."
echo "INFO: System running smoothly." >> "$LOG_FILE"
echo "ERROR: Disk usage exceeded threshold!" >> "$LOG_FILE"
echo "WARNING: Low memory detected." >> "$LOG_FILE"
echo "INFO: Cleanup completed." >> "$LOG_FILE"

# Step 4: Scan the log for 'ERROR' or 'WARNING'
echo "🔍 Scanning logs for errors or warnings..."
grep -i "error\|warning" "$LOG_FILE" > "$ALERT_FILE"

# Step 5: Check if alerts were found
if [ -s "$ALERT_FILE" ]; then
    echo "⚠️  Alerts Found!"
    echo "----------------------------------"
    cat "$ALERT_FILE"
    echo "----------------------------------"
    echo "⚠️  Alerts logged to $ALERT_FILE"
else
    echo "✅ No alerts found in system logs."
fi

# Step 6: Log the monitoring activity
echo "🕒 Log monitoring performed on $(date)" >> "$HOME/bash_project/monitor_log.txt"

echo "=================================="
echo "Log monitoring completed!"
echo "=================================="
