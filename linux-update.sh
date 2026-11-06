#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"
clear

echo "=================================================="
echo "    Attendance Planner - 1-Click Installer & Updater (Linux)   "
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
URL="https://github.com/Colaup747/attendance-calc/raw/main/attendance.zip"

if command -v curl >/dev/null 2>&1; then
    curl -s -L "$URL" -o "$ZIP_FILE"
elif command -v wget >/dev/null 2>&1; then
    wget -q -O "$ZIP_FILE" "$URL"
else
    echo "[!] Neither curl nor wget was found. Please install either to continue."
    rm -rf "$TMP_DIR"
    exit 1
fi

if [ -f "$ZIP_FILE" ] && [ -s "$ZIP_FILE" ]; then
    echo "[*] Unpacking extension files..."
    unzip -q -o "$ZIP_FILE" -d "$TMP_DIR"
    rm -f "$TMP_DIR/linux-update.sh" "$TMP_DIR/attendance/linux-update.sh" "$TMP_DIR/updater/linux-update.sh" 2>/dev/null
    
    if [ -d "$TMP_DIR/attendance" ]; then
        cp -R "$TMP_DIR/attendance/"* "$TARGET_DIR/"
    else
        cp -R "$TMP_DIR/"* "$TARGET_DIR/"
    fi
    rm -rf "$TMP_DIR"

    # Ensure bash scripts stay executable
    chmod +x "$TARGET_DIR/linux-update.sh" "$TARGET_DIR/updater/linux-update.sh" "$TARGET_DIR/mac-update.command" "$TARGET_DIR/updater/mac-update.command" 2>/dev/null

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
    ( google-chrome "chrome://extensions" 2>/dev/null || chromium-browser "chrome://extensions" 2>/dev/null || chromium "chrome://extensions" 2>/dev/null || xdg-open "chrome://extensions" 2>/dev/null ) &
    sleep 3
else
    echo "[!] Download failed. Please check your internet connection."
    rm -rf "$TMP_DIR"
    read -p "Press [Enter] to exit..."
fi

