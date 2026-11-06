#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"
clear

echo "=================================================="
echo "    Attendance Planner - 1-Click Installer & Updater (macOS)   "
echo "=================================================="
echo ""
echo "[*] Downloading latest version from GitHub..."

# Target directory: if inside updater/ folder, target is parent folder (..)
if [ -f "../manifest.json" ] || [ "$(basename "$DIR")" = "updater" ]; then
    TARGET_DIR=".."
else
    TARGET_DIR="."
fi

TMP_DIR=$(mktemp -d)
ZIP_FILE="$TMP_DIR/update.zip"

curl -s -L "https://github.com/Colaup747/attendance-calc/raw/main/attendance.zip" -o "$ZIP_FILE"
if [ $? -eq 0 ] && [ -f "$ZIP_FILE" ]; then
    echo "[*] Unpacking extension files..."
    unzip -q -o "$ZIP_FILE" -d "$TMP_DIR"
    rm -f "$TMP_DIR/mac-update.command" "$TMP_DIR/attendance/mac-update.command" "$TMP_DIR/updater/mac-update.command" 2>/dev/null
    
    if [ -d "$TMP_DIR/attendance" ]; then
        cp -R "$TMP_DIR/attendance/"* "$TARGET_DIR/"
    else
        cp -R "$TMP_DIR/"* "$TARGET_DIR/"
    fi
    rm -rf "$TMP_DIR"
    echo ""
    echo "=================================================="
    echo "[SUCCESS] Extension files are ready!"
    echo "=================================================="
    echo ""
    echo "  * IF FIRST-TIME INSTALLING:"
    echo "    1. Turn ON 'Developer mode' in top-right of Chrome"
    echo "    2. Click 'Load unpacked'"
    echo "    3. Select your Attendance folder!"
    echo ""
    echo "  * IF UPDATING AN EXISTING INSTALL:"
    echo "    • Click the circular reload arrow on Attendance Planner!"
    echo "=================================================="
    echo ""
    open -a "Google Chrome" "chrome://extensions" 2>/dev/null || open "chrome://extensions" 2>/dev/null
    sleep 4
else
    echo "[!] Download failed. Please check your internet connection."
    rm -rf "$TMP_DIR"
    read -p "Press [Enter] to exit..."
fi

