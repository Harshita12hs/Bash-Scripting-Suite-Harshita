#!/bin/bash
# =========================================
# Bash Script: update_cleanup.sh
# Purpose: Simulate system updates and cleanup
# Author: Harshita Swain
# =========================================

echo "=================================="
echo "🧩 Starting System Update & Cleanup Script"
echo "=================================="

# Step 1: Simulate a system update
echo "🔄 Checking for system updates..."
sleep 2
echo "✅ All packages are up to date!"

# Step 2: Clean temporary files (simulate cleanup)
TEMP_DIR="$HOME/bash_project/temp_files"
mkdir -p "$TEMP_DIR"

echo "🧹 Cleaning temporary files..."
rm -rf "$TEMP_DIR"/* 2>/dev/null
sleep 1

# Step 3: Create dummy temp files to show cleanup works
echo "Creating some dummy temp files for demonstration..."
touch "$TEMP_DIR/temp1.log" "$TEMP_DIR/temp2.tmp" "$TEMP_DIR/temp3.cache"
echo "Temporary files created:"
ls "$TEMP_DIR"

# Step 4: Simulate cleanup process
echo "🧼 Performing cleanup..."
rm -rf "$TEMP_DIR"/*
sleep 1

echo "✅ Cleanup completed successfully!"
echo "🕒 Operation finished on $(date)" >> "$HOME/bash_project/cleanup_log.txt"

echo "=================================="
echo "System update and cleanup completed!"
echo "=================================="
