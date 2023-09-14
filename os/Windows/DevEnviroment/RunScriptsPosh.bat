@echo off

:: Check if the script is running with administrative privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Running with administrative privileges
    :: Set RemoteSigned for entire local machine
    powershell.exe -ExecutionPolicy RemoteSigned -Command "Set-ExecutionPolicy RemoteSigned -Scope LocalMachine"

    powershell.exe -File .\main.ps1
) else (
    echo Please run this script as an administrator.
)