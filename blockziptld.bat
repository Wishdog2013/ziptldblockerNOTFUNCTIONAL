@echo off
echo Hello! This program will block the new .zip TLD from Google. Are you sure you want to continue?
pause
set hosts_path=%SystemRoot%\System32\drivers\etc\hosts
set blocked_domain=*.zip

REM Check if the script is running with administrator privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo This script requires administrator privileges. Please run it as an administrator.
    pause
    exit /b
)

REM Add the entry to block the .zip TLD in the hosts file
echo 127.0.0.1   %blocked_domain% >> "%hosts_path%"

echo Blocking of .zip TLD complete.

pause
