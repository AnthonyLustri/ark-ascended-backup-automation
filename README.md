# ARK: Survival Ascended – Backup & Maintenance Automation

Automated PowerShell script for maintaining and backing up **ARK: Survival Ascended** dedicated servers hosted via **WindowsGSM**.  
Designed to run silently as a scheduled task using **Windows Task Scheduler**.

---

## ✨ Features

- Runs invisibly (console window minimized on launch)
- Automatically deletes old backup files older than **14 days**
- Creates timestamped ZIP backups of ARK server save data
- Supports multiple ARK maps/servers
- Optimized for unattended execution via **Windows Task Scheduler**
- Overwrites existing backups safely using PowerShell compression

---

## 🗺️ Supported Maps

The script currently backs up the following ARK: Survival Ascended maps:

- The Island
- Scorched Earth
- The Center
- Aberration
- Extinction
- Ragnarok
- Valguero

Each map is backed up individually with a timestamped ZIP archive.

---

## 🧹 Automated Cleanup

- Recursively scans configured backup directories
- Deletes files and folders with a **LastWriteTime older than 14 days**
- Helps conserve disk space while retaining recent backups

---

## 📦 Backup Process

For each configured map:

1. Navigates to the server save directory
2. Generates a timestamp (`yyyy-MM-dd-HH-mm`)
3. Compresses the following files into a ZIP archive:
   - `.arkprofile`
   - `.tribebak`
   - `.profilebak`
   - `.arktribe`
   - Main map `.ark` file
4. Saves the archive to the designated backup folder
5. Waits briefly between tasks for system stability

---

## ⏱️ Scheduling (Windows Task Scheduler)

This script is intended to be run automatically using **Windows Task Scheduler**.

**Recommended settings:**
- Run whether user is logged on or not
- Run with highest privileges
- Trigger: Daily or as needed
- Action:
  - Program/script: `powershell.exe`
  - Arguments:
    ```text
    -ExecutionPolicy Bypass -File "Path\To\Script.ps1"
    ```
- Start in (optional): Script directory

The script exits automatically upon completion to prevent lingering processes.

---

## ⚙️ Configuration

Edit the following sections in the script to match your environment:

- Server save directories
- Backup destination paths
- Retention period (default: 14 days)

Paths are currently hardcoded for clarity but can be refactored into variables or configuration files if desired.

---

## 📌 Notes

- Requires PowerShell 5.1 or later
- Must be run with sufficient permissions to read server files and write backups
- Tested with WindowsGSM-hosted ARK: Survival Ascended servers

---

## 📜 License

This project is provided as-is for personal and server administration use.  
Modify and adapt freely to fit your infrastructure.
