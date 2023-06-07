@echo off

REM Check the execution environment (CMD or PowerShell)
if "%CMDER_ROOT%"=="" (
    REM Run in Command Prompt (CMD)
    echo Running in CMD
    call :createKeys
) else (
    REM Run in PowerShell
    echo Running in PowerShell
    powershell.exe -ExecutionPolicy Bypass -Command "& {Start-Process cmd -ArgumentList '/c call ""%~dpnx0"" createKeys' -Verb RunAs}"
)

REM Wait for 15 seconds before closing
ping 127.0.0.1 -n 15 > nul
exit

:createKeys
REM Create the registry key and values
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig" /v "BypassRAMCheck" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig" /v "BypassTPMCheck" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig" /v "BypassSecureBootCheck" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig" /v "BypassCPUCheck" /t REG_DWORD /d 1 /f
exit
