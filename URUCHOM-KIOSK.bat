@echo off
setlocal
set "EDGE=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"
if not exist "%EDGE%" set "EDGE=%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"
if not exist "%EDGE%" (
 start "" "%~dp0index.html"
 exit /b
)
start "" "%EDGE%" --kiosk "%~dp0index.html" --edge-kiosk-type=fullscreen --no-first-run
