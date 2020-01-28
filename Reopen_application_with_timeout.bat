@echo off
taskkill /IM ApplicationName.exe /T /F
TIMEOUT /T 2
start ApplicationName.exe
exit
