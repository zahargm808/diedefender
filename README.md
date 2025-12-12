# 🛡️ DieDefender

> **⚠️ WARNING**: This tool completely disables Windows Defender. Use at your own risk!

A Windows batch script to completely disable Windows Defender without using PowerShell. Works through direct registry modifications and service management.

## 🌟 Features

- ✅ **No PowerShell required** - Uses only native Windows commands
- ✅ **Complete protection disabling** - Real-time, cloud, and behavior monitoring
- ✅ **Service management** - Stops and disables Defender services
- ✅ **Group Policy configuration** - Modifies local security policies
- ✅ **Interactive** - User-friendly with colored output and progress indicators
- ✅ **Auto-reboot option** - Optional system restart after changes

## 📋 What It Does

### Stage 1: Real-Time Protection
- Disables real-time monitoring
- Disables behavior monitoring
- Disables on-access protection
- Disables scan on real-time enable
- Disables IOAvProtection

### Stage 2: Cloud Protection
- Disables SpyNet (MAPS)
- Disables automatic sample submission
- Disables enhanced notifications

### Stage 3: Group Policy
- Disables anti-spyware
- Disables antivirus service
- Disables service keep-alive
- Blocks fast service startup
- Disables routine protection actions

### Stage 4: Service Management
- Stops WinDefend service
- Disables WinDefend auto-start
- Stops Sense service (Advanced Protection)
- Disables Sense auto-start

## 🚀 Usage

1. **Download** `DieDefender.bat`
2. **Right-click** on the file
3. Select **"Run as administrator"**
4. Follow the on-screen instructions
5. Choose whether to reboot immediately or later

```cmd
# Simple command-line execution
# Must run from an elevated (administrator) command prompt
DieDefender.bat
```

## ⚙️ Requirements

- Windows 10/11
- Administrator privileges
- No additional software needed (no PowerShell!)

## 🔧 Technical Details

### Modified Registry Keys

```
HKLM\SOFTWARE\Policies\Microsoft\Windows Defender
HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection
HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet
```

### Modified Services

- `WinDefend` - Windows Defender Antivirus Service
- `Sense` - Windows Defender Advanced Threat Protection

### Commands Used

- `reg add/delete` - Registry manipulation
- `net stop/start` - Service control
- `sc config` - Service configuration
- `shutdown` - System reboot

## ⚠️ Important Warnings

> **DANGER**: Disabling Windows Defender leaves your system vulnerable to malware and viruses!

**Use cases:**
- Testing software flagged as false positives
- Development/debugging antivirus-sensitive applications
- Controlled lab environments
- Personal testing (NOT recommended for production systems)

**Recommendations:**
- Only use on isolated or test systems
- Re-enable protection as soon as possible
- Use alternative antivirus if Defender must stay disabled
- **Reboot required** for full effect

## 🔄 Restoring Protection

To re-enable Windows Defender:
1. Manually reverse the changes via Windows Security settings
2. Or create a restore script that deletes the registry keys and re-enables services

## 📸 Screenshot

```
========================================
Отключение Windows Defender (без PowerShell)
========================================

[ЭТАП 1/3] Отключение защиты в режиме реального времени...
  [1.1] Отключение мониторинга в реальном времени...
  [OK] Мониторинг в реальном времени отключен
  ...
```

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## 📝 License

This project is licensed under the MIT License - see below for details.

**Disclaimer**: The author is not responsible for any damage or security issues caused by using this script. Use at your own risk.

## 👤 Author

Created by **Alex**

---

**⚡ Remember**: With great power comes great responsibility. Only use this tool when absolutely necessary and understand the security implications!
