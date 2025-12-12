@echo off
chcp 65001 >nul
color 0A
echo ========================================
echo Отключение Windows Defender (без PowerShell)
echo ========================================
echo.

:: Проверка прав администратора
net session >nul 2>&1
if %errorLevel% neq 0 (
    color 0C
    echo [ОШИБКА] Требуются права администратора!
    echo.
    echo Запустите этот файл от имени администратора:
    echo 1. Правый клик на файл
    echo 2. "Запуск от имени администратора"
    echo.
    pause
    exit /b 1
)

echo [ЭТАП 1/3] Отключение защиты в режиме реального времени...
echo.

echo   [1.1] Отключение мониторинга в реальном времени...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 1 /f >nul
if %errorLevel% equ 0 (echo   [OK] Мониторинг в реальном времени отключен) else (echo   [ОШИБКА] Не удалось отключить мониторинг)

echo   [1.2] Отключение поведенческого мониторинга...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d 1 /f >nul
if %errorLevel% equ 0 (echo   [OK] Поведенческий мониторинг отключен) else (echo   [ОШИБКА] Не удалось отключить)

echo   [1.3] Отключение защиты при доступе...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d 1 /f >nul
if %errorLevel% equ 0 (echo   [OK] Защита при доступе отключена) else (echo   [ОШИБКА] Не удалось отключить)

echo   [1.4] Отключение сканирования при включении реального времени...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t REG_DWORD /d 1 /f >nul
if %errorLevel% equ 0 (echo   [OK] Сканирование при включении отключено) else (echo   [ОШИБКА] Не удалось отключить)

echo   [1.5] Отключение мониторинга IOAvProtection...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t REG_DWORD /d 1 /f >nul
if %errorLevel% equ 0 (echo   [OK] IOAvProtection отключен) else (echo   [ОШИБКА] Не удалось отключить)

echo.
echo [ЭТАП 2/3] Отключение облачной защиты...
echo.

echo   [2.1] Отключение SpyNet (MAPS)...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SpyNetReporting" /t REG_DWORD /d 0 /f >nul
if %errorLevel% equ 0 (echo   [OK] SpyNet отключен) else (echo   [ОШИБКА] Не удалось отключить SpyNet)

echo   [2.2] Отключение автоматической отправки образцов...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d 2 /f >nul
if %errorLevel% equ 0 (echo   [OK] Отправка образцов отключена) else (echo   [ОШИБКА] Не удалось отключить)

echo   [2.3] Отключение расширенных уведомлений...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "DisableEnhancedNotifications" /t REG_DWORD /d 1 /f >nul
if %errorLevel% equ 0 (echo   [OK] Расширенные уведомления отключены) else (echo   [ОШИБКА] Не удалось отключить)

echo.
echo [ЭТАП 3/3] Полное отключение Windows Defender через групповую политику...
echo.

echo   [3.1] Отключение антишпионского ПО...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 1 /f >nul
if %errorLevel% equ 0 (echo   [OK] Антишпионское ПО отключено) else (echo   [ОШИБКА] Не удалось отключить)

echo   [3.2] Отключение антивирусной службы...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiVirus" /t REG_DWORD /d 1 /f >nul
if %errorLevel% equ 0 (echo   [OK] Антивирусная служба отключена) else (echo   [ОШИБКА] Не удалось отключить)

echo   [3.3] Отключение постоянной работы службы...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t REG_DWORD /d 0 /f >nul
if %errorLevel% equ 0 (echo   [OK] Постоянная работа службы отключена) else (echo   [ОШИБКА] Не удалось отключить)

echo   [3.4] Запрет запуска службы...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "AllowFastServiceStartup" /t REG_DWORD /d 0 /f >nul
if %errorLevel% equ 0 (echo   [OK] Быстрый запуск службы запрещен) else (echo   [ОШИБКА] Не удалось отключить)

echo   [3.5] Отключение рутинной защиты...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d 1 /f >nul
if %errorLevel% equ 0 (echo   [OK] Рутинная защита отключена) else (echo   [ОШИБКА] Не удалось отключить)

echo.
echo [ДОПОЛНИТЕЛЬНО] Отключение службы Windows Defender...
echo.

echo   [4.1] Остановка службы WinDefend...
net stop WinDefend >nul 2>&1
if %errorLevel% equ 0 (echo   [OK] Служба WinDefend остановлена) else (echo   [ПРЕДУПРЕЖДЕНИЕ] Служба уже остановлена или недоступна)

echo   [4.2] Отключение автозапуска службы WinDefend...
sc config WinDefend start=disabled >nul 2>&1
if %errorLevel% equ 0 (echo   [OK] Автозапуск службы отключен) else (echo   [ПРЕДУПРЕЖДЕНИЕ] Не удалось отключить автозапуск)

echo   [4.3] Остановка службы Sense (Advanced Protection)...
net stop Sense >nul 2>&1
if %errorLevel% equ 0 (echo   [OK] Служба Sense остановлена) else (echo   [ПРЕДУПРЕЖДЕНИЕ] Служба недоступна или уже остановлена)

echo   [4.4] Отключение автозапуска службы Sense...
sc config Sense start=disabled >nul 2>&1
if %errorLevel% equ 0 (echo   [OK] Автозапуск Sense отключен) else (echo   [ПРЕДУПРЕЖДЕНИЕ] Не удалось отключить)

echo.
echo ========================================
echo Windows Defender полностью отключен!
echo ========================================
echo.
color 0E
echo ВНИМАНИЕ: Ваша система теперь НЕ ЗАЩИЩЕНА!
echo Используйте на свой страх и риск.
echo.
color 0A

echo Для применения всех изменений необходимо перезагрузить компьютер.
echo.
echo Хотите перезагрузить компьютер сейчас? (Y/N)
choice /C YN /N /M "Ваш выбор: "
if %errorLevel% equ 1 (
    echo.
    echo Перезагрузка через 10 секунд...
    echo Нажмите Ctrl+C для отмены.
    shutdown /r /t 10 /c "Перезагрузка для применения изменений Windows Defender"
) else (
    echo.
    echo Перезагрузите компьютер вручную для применения всех изменений.
    echo.
    pause
)
