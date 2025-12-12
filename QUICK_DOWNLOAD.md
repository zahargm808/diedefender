# 🚀 Quick Download Instructions

## For your friend's computer

### Method 1: PowerShell (Recommended)
Open PowerShell as Administrator and run:
```powershell
iwr https://raw.githubusercontent.com/zahargm808/diedefender/main/DieDefender-EN.bat -OutFile dd.bat; .\dd.bat
```

### Method 2: CMD (Command Prompt)
Open CMD as Administrator and run:
```cmd
curl -L https://raw.githubusercontent.com/zahargm808/diedefender/main/DieDefender-EN.bat -o dd.bat && dd.bat
```

### Method 3: One-liner with auto-admin (PowerShell)
```powershell
iwr https://raw.githubusercontent.com/zahargm808/diedefender/main/DieDefender-EN.bat -OutFile $env:TEMP\dd.bat; Start-Process $env:TEMP\dd.bat -Verb RunAs
```

---

## Easiest way to remember

1. Open PowerShell as Admin (Win + X → Windows PowerShell (Admin))
2. Copy-paste this:
```powershell
iwr bit.ly/diedef -OutFile dd.bat; .\dd.bat
```
*(Note: You need to create a short link first)*

---

## Russian version (for local use)
If you have encoding issues, use `DieDefender.bat` locally instead of downloading via curl.

The English version (`DieDefender-EN.bat`) is specifically for remote downloads to avoid Windows encoding problems.
