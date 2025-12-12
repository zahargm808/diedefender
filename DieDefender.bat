@echo off
chcp 65001 >nul
color 0A
echo ========================================
echo Windows Defender Disabler
echo ========================================
echo.

:: Check administrator privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    color 0C
    echo [ERROR] Administrator privileges required!
    echo.
    echo Run this file as administrator:
    echo 1. Right-click on file
    echo 2. "Run as administrator"
    echo.
    pause
    exit /b 1
)

echo [STAGE 1/3] Disabling Real-Time Protection...
echo.

echo   [1.1] Disabling real-time monitoring...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 1 /f >nul
if %errorLevel% equ 0 (echo   [OK] Real-time monitoring disabled) else (echo   [ERROR] Failed to disable)

echo   [1.2] Disabling behavior monitoring...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d 1 /f >nul
if %errorLevel% equ 0 (echo   [OK] Behavior monitoring disabled) else (echo   [ERROR] Failed to disable)

echo   [1.3] Disabling on-access protection...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d 1 /f >nul
if %errorLevel% equ 0 (echo   [OK] On-access protection disabled) else (echo   [ERROR] Failed to disable)

echo   [1.4] Disabling scan on real-time enable...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t REG_DWORD /d 1 /f >nul
if %errorLevel% equ 0 (echo   [OK] Scan on enable disabled) else (echo   [ERROR] Failed to disable)

echo   [1.5] Disabling IOAvProtection monitoring...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t REG_DWORD /d 1 /f >nul
if %errorLevel% equ 0 (echo   [OK] IOAvProtection disabled) else (echo   [ERROR] Failed to disable)

echo.
echo [STAGE 2/3] Disabling Cloud Protection...
echo.

echo   [2.1] Disabling SpyNet (MAPS)...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SpyNetReporting" /t REG_DWORD /d 0 /f >nul
if %errorLevel% equ 0 (echo   [OK] SpyNet disabled) else (echo   [ERROR] Failed to disable SpyNet)

echo   [2.2] Disabling automatic sample submission...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d 2 /f >nul
if %errorLevel% equ 0 (echo   [OK] Sample submission disabled) else (echo   [ERROR] Failed to disable)

echo   [2.3] Disabling enhanced notifications...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "DisableEnhancedNotifications" /t REG_DWORD /d 1 /f >nul
if %errorLevel% equ 0 (echo   [OK] Enhanced notifications disabled) else (echo   [ERROR] Failed to disable)

echo.
echo [STAGE 3/3] Complete Windows Defender shutdown via Group Policy...
echo.

echo   [3.1] Disabling anti-spyware...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 1 /f >nul
if %errorLevel% equ 0 (echo   [OK] Anti-spyware disabled) else (echo   [ERROR] Failed to disable)

echo   [3.2] Disabling antivirus service...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiVirus" /t REG_DWORD /d 1 /f >nul
if %errorLevel% equ 0 (echo   [OK] Antivirus service disabled) else (echo   [ERROR] Failed to disable)

echo   [3.3] Disabling service keep-alive...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t REG_DWORD /d 0 /f >nul
if %errorLevel% equ 0 (echo   [OK] Service keep-alive disabled) else (echo   [ERROR] Failed to disable)

echo   [3.4] Blocking fast service startup...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "AllowFastServiceStartup" /t REG_DWORD /d 0 /f >nul
if %errorLevel% equ 0 (echo   [OK] Fast startup blocked) else (echo   [ERROR] Failed to disable)

echo   [3.5] Disabling routine protection...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d 1 /f >nul
if %errorLevel% equ 0 (echo   [OK] Routine protection disabled) else (echo   [ERROR] Failed to disable)

echo.
echo [ADDITIONAL] Stopping Windows Defender services...
echo.

echo   [4.1] Stopping WinDefend service...
net stop WinDefend >nul 2>&1
if %errorLevel% equ 0 (echo   [OK] WinDefend service stopped) else (echo   [WARNING] Service already stopped or unavailable)

echo   [4.2] Disabling WinDefend auto-start...
sc config WinDefend start=disabled >nul 2>&1
if %errorLevel% equ 0 (echo   [OK] WinDefend auto-start disabled) else (echo   [WARNING] Failed to disable auto-start)

echo   [4.3] Stopping Sense service (Advanced Protection)...
net stop Sense >nul 2>&1
if %errorLevel% equ 0 (echo   [OK] Sense service stopped) else (echo   [WARNING] Service unavailable or already stopped)

echo   [4.4] Disabling Sense auto-start...
sc config Sense start=disabled >nul 2>&1
if %errorLevel% equ 0 (echo   [OK] Sense auto-start disabled) else (echo   [WARNING] Failed to disable)

echo.
echo ========================================
echo Windows Defender completely disabled!
echo ========================================
echo.
color 0E
echo WARNING: Your system is now UNPROTECTED!
echo Use at your own risk.
echo.
color 0A

echo Maybe you need reboot to apply all changes. bye-bye.
