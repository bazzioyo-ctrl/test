@echo off
rem Automatically pulls the latest conversation from GitHub into this folder.
cd /d "%~dp0.."
git pull --ff-only origin main >> "%TEMP%\apple_bazzi_sync.log" 2>&1
