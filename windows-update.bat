@echo off
setlocal EnableDelayedExpansion
title Attendance Planner - 1-Click Installer ^& Auto-Updater
color 0B

echo.
echo  ========================================================
echo       Attendance Planner - 1-Click Installer ^& Auto-Updater
echo  ========================================================
echo.
echo  [*] Downloading latest version from GitHub...

:: Determine target directory: if inside updater/ folder, target is parent folder (..)
set "TARGET_DIR=."
if exist "%~dp0..\manifest.json" (
    set "TARGET_DIR=%~dp0.."
) else (
    for %%I in ("%~dp0.") do set "CUR_FOLDER=%%~nxI"
    if /I "!CUR_FOLDER!"=="updater" (
        set "TARGET_DIR=%~dp0.."
    )
)

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$ErrorActionPreference = 'Stop'; try { " ^
  "[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12; " ^
  "$zipUrl = 'https://github.com/Colaup747/attendance-calc/raw/main/attendance.zip'; " ^
  "$tmpZip = Join-Path $env:TEMP 'attendance_pkg.zip'; " ^
  "$tmpDir = Join-Path $env:TEMP 'attendance_extracted'; " ^
  "if (Test-Path $tmpZip) { Remove-Item $tmpZip -Force }; " ^
  "if (Test-Path $tmpDir) { Remove-Item $tmpDir -Recurse -Force }; " ^
  "Write-Host ' [*] Fetching extension package from GitHub...' -ForegroundColor Cyan; " ^
  "Invoke-WebRequest -Uri $zipUrl -OutFile $tmpZip -UseBasicParsing; " ^
  "Write-Host ' [*] Unpacking extension files...' -ForegroundColor Cyan; " ^
  "Expand-Archive -Path $tmpZip -DestinationPath $tmpDir -Force; " ^
  "$inner = Join-Path $tmpDir 'attendance'; " ^
  "$source = if (Test-Path $inner) { $inner } else { $tmpDir }; " ^
  "$dest = (Resolve-Path '%TARGET_DIR%').Path; " ^
  "Get-ChildItem -Path $source | Where-Object { $_.Name -ne 'windows-update.bat' } | Copy-Item -Destination $dest -Recurse -Force; " ^
  "$updaterDir = Join-Path $dest 'updater'; " ^
  "if (!(Test-Path $updaterDir)) { New-Item -ItemType Directory -Path $updaterDir -Force | Out-Null }; " ^
  "$srcUpdaterBat = Join-Path $source 'updater\windows-update.bat'; " ^
  "if (!(Test-Path $srcUpdaterBat)) { $srcUpdaterBat = Join-Path $source 'windows-update.bat' }; " ^
  "if (Test-Path $srcUpdaterBat) { Copy-Item $srcUpdaterBat (Join-Path $updaterDir 'windows-update.bat') -Force }; " ^
  "$srcMacCmd = Join-Path $source 'updater\mac-update.command'; " ^
  "if (!(Test-Path $srcMacCmd)) { $srcMacCmd = Join-Path $source 'mac-update.command' }; " ^
  "if (Test-Path $srcMacCmd) { Copy-Item $srcMacCmd (Join-Path $updaterDir 'mac-update.command') -Force }; " ^
  "Remove-Item $tmpZip -Force; " ^
  "Remove-Item $tmpDir -Recurse -Force; " ^
  "Write-Host ' [SUCCESS] Extension files are ready!' -ForegroundColor Green " ^
  "} catch { Write-Host ' [ERROR] ' $_.Exception.Message -ForegroundColor Red; exit 1 }"

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo  [!] Download or update failed. Please check your internet connection.
    pause
    exit /b 1
)

echo.
echo  ========================================================
echo   [SUCCESS] Attendance Planner is ready!
echo   Opening Chrome Extensions page for you...
echo  ========================================================
echo.
echo   * IF FIRST-TIME INSTALLING:
echo     1. Turn ON 'Developer mode' (toggle in top-right of Chrome)
echo     2. Click 'Load unpacked'
echo     3. Select the attendance folder!
echo.
echo   * IF UPDATING AN EXISTING INSTALL:
echo     • Click the circular Reload arrow on Attendance Planner!
echo  ========================================================
echo.

start chrome "chrome://extensions" 2>nul
timeout /t 5 >nul
exit /b 0

