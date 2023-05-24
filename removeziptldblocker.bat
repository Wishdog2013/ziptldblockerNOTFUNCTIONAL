@echo off
echo Are you sure you want to continue? ONLY USE IF YOU HAVE ADDED THE .ZIP BLOCKER TO HOSTS
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

REM Remove the entry that blocks the .zip TLD from the hosts file
findstr /v %blocked_domain% "%hosts_path%" > "%hosts_path%.tmp"
move /y "%hosts_path%.tmp" "%hosts_path%" >nul

echo Removal of .zip TLD block complete.

pause
