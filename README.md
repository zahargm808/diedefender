# 🛡️ DieDefender

## Что делает?
- Отключает полностью Защитник Windows

## А подробнее?
- Отключение защиты в реальном времени (Real-Time Protection)
- Отключение поведенческого мониторинга (Behavior Monitoring)   
- Отключение защиты при доступе к файлам (On-Access Protection)
- Отключение сканирования при запуске защиты (Scan on Real-Time Enable)
- Отключение защиты IOAv (IOAv Protection)

- Отключение SpyNet (облачной системы защиты Microsoft / MAPS - Microsoft Active Protection Service)
- Отключение автоматической отправки образцов файлов (Automatic Sample Submission)
- Отключение расширенных уведомлений (Enhanced Notifications)

- Отключение антишпионского ПО (Anti-Spyware)
- Отключение антивирусной службы (Antivirus Service)
- Отключение постоянной работы службы (Service Keep-Alive)
- Блокировка быстрого запуска службы (Fast Service Startup)
- Отключение рутинных действий защиты (Routine Protection Actions)

- Остановка службы WinDefend (Windows Defender Antivirus Service)
- Отключение автозапуска WinDefend (WinDefend Auto-Start)
- Остановка службы Sense (расширенная защита от угроз / Advanced Threat Protection)
- Отключение автозапуска Sense (Sense Auto-Start)


## Как запустить?
- Запустить `DieDefender.bat` от имени администратора.


## Как запустить без скачивания?
- PowerShell от имени администратора:
```powershell
iwr https://raw.githubusercontent.com/zahargm808/diedefender/main/DieDefender.bat -OutFile $env:TEMP\dd.bat; Start-Process $env:TEMP\dd.bat -Verb RunAs
```

- CMD от имени администратора:
```cmd
curl -L https://raw.githubusercontent.com/zahargm808/diedefender/main/DieDefender.bat -o %TEMP%\dd.bat && start "" %TEMP%\dd.bat
```