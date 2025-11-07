#!/bin/bash
SOURCE_DIR="$HOME/bash_project/source_files"
BACKUP_DIR="$HOME/bash_project/backup"

mkdir -p "$SOURCE_DIR"
mkdir -p "$BACKUP_DIR"

cp -r "$SOURCE_DIR"/* "$BACKUP_DIR"/ 2>/dev/null

echo "Backup completed successfully on $(date)" >> "$BACKUP_DIR/backup_log.txt"
echo "✅ Backup done! Files copied from $SOURCE_DIR to $BACKUP_DIR"

echo "Here are the files currently in your backup folder:"
ls "$BACKUP_DIR"
