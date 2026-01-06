# Start Invisible - Hides the console window immediately upon execution.
# SW_MINIMIZE (2) is used to minimize the console window.
Add-Type -Name Window -Namespace Console -MemberDefinition '[DllImport("Kernel32.dll")]public static extern IntPtr GetConsoleWindow();[DllImport("user32.dll")]public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);'

$consolePtr = [Console.Window]::GetConsoleWindow()
[Console.Window]::ShowWindow($consolePtr, 2)  # 2 = SW_MINIMIZE

# Delete ASA files older than 14 days
$limit = (Get-Date).AddDays(-14)
$directories = @(
    "F:\ARK Survival Ascended\Aberration",
    "F:\ARK Survival Ascended\Scorched Earth",
    "F:\ARK Survival Ascended\The Island",
    "F:\ARK Survival Ascended\Bobs Missions",
    "F:\ARK Survival Ascended\The Center",
	"F:\ARK Survival Ascended\Ragnarok",
	"F:\ARK Survival Ascended\Valguero",
    "F:\ARK Survival Ascended\Extinction"
)

foreach ($dir in $directories) {
    # Get all files and folders in the current directory and its subdirectories
    Get-ChildItem -Path $dir -Recurse | Where-Object { $_.LastWriteTime -lt $limit } | Remove-Item -Force
}

# Sleep 5 - Adds a pause for 5 seconds
Start-Sleep -Seconds 5

# Backup Scorched Earth
cd "G:\WindowsGSM\servers\2\serverfiles\ShooterGame\Saved\SavedArks\ScorchedEarth_WP"
$date = Get-Date -Format "yyyy-MM-dd-HH-mm"
$zipFilePath = "F:\ARK Survival Ascended\Scorched Earth\ScorchedEarth_$date.zip"

# Remove existing file before creating a new one (This line is redundant if using -Force with Compress-Archive, but kept for clarity)
if (Test-Path $zipFilePath) {
    Remove-Item -Path $zipFilePath -Force
}

# Compress files into a zip archive. -Force overwrites existing archives.
Compress-Archive -Path *.arkprofile, *.tribebak, *.profilebak, *.arktribe, ScorchedEarth_WP.ark -DestinationPath $zipFilePath -Force

# Sleep 5
Start-Sleep -Seconds 5

# Backup The Island
cd "G:\WindowsGSM\servers\1\serverfiles\ShooterGame\Saved\SavedArks\TheIsland_WP"
$date = Get-Date -Format "yyyy-MM-dd-HH-mm"
$zipFilePath = "F:\ARK Survival Ascended\The Island\TheIsland_$date.zip"

# Remove existing file before creating a new one
if (Test-Path $zipFilePath) {
    Remove-Item -Path $zipFilePath -Force
}

Compress-Archive -Path *.arkprofile, *.tribebak, *.profilebak, *.arktribe, TheIsland_WP.ark -DestinationPath $zipFilePath -Force

# Sleep 5
Start-Sleep -Seconds 5

# Backup The Center
cd "G:\WindowsGSM\servers\4\serverfiles\ShooterGame\Saved\SavedArks\TheCenter_WP"
$date = Get-Date -Format "yyyy-MM-dd-HH-mm"
$zipFilePath = "F:\ARK Survival Ascended\The Center\TheCenter_$date.zip"

# Remove existing file before creating a new one
if (Test-Path $zipFilePath) {
    Remove-Item -Path $zipFilePath -Force
}

Compress-Archive -Path *.arkprofile, *.tribebak, *.profilebak, *.arktribe, TheCenter_WP.ark -DestinationPath $zipFilePath -Force

# Sleep 5
Start-Sleep -Seconds 5

# Backup Aberration
cd "G:\WindowsGSM\servers\6\serverfiles\ShooterGame\Saved\SavedArks\Aberration_WP"
$date = Get-Date -Format "yyyy-MM-dd-HH-mm"
$zipFilePath = "F:\ARK Survival Ascended\Aberration\Aberration_$date.zip"

# Remove existing file before creating a new one
if (Test-Path $zipFilePath) {
    Remove-Item -Path $zipFilePath -Force
}

Compress-Archive -Path *.arkprofile, *.tribebak, *.profilebak, *.arktribe, Aberration_WP.ark -DestinationPath $zipFilePath -Force

Start-Sleep -Seconds 5

# Backup Extinction
cd "G:\WindowsGSM\servers\8\serverfiles\ShooterGame\Saved\SavedArks\Extinction_WP"
$date = Get-Date -Format "yyyy-MM-dd-HH-mm"
$zipFilePath = "F:\ARK Survival Ascended\Extinction\Extinction_$date.zip"

# Remove existing file before creating a new one
if (Test-Path $zipFilePath) {
    Remove-Item -Path $zipFilePath -Force
}

Compress-Archive -Path *.arkprofile, *.tribebak, *.profilebak, *.arktribe, Extinction_WP.ark -DestinationPath $zipFilePath -Force

Start-Sleep -Seconds 5

# Backup Valguero
cd "G:\WindowsGSM\servers\13\serverfiles\ShooterGame\Saved\SavedArks\Valguero_WP"
$date = Get-Date -Format "yyyy-MM-dd-HH-mm"
$zipFilePath = "F:\ARK Survival Ascended\Valguero\Valguero_$date.zip"

# Remove existing file before creating a new one
if (Test-Path $zipFilePath) {
    Remove-Item -Path $zipFilePath -Force
}

Compress-Archive -Path *.arkprofile, *.tribebak, *.profilebak, *.arktribe, Valguero_WP.ark -DestinationPath $zipFilePath -Force

Start-Sleep -Seconds 5


# Backup Ragnarok
cd "G:\WindowsGSM\servers\10\serverfiles\ShooterGame\Saved\SavedArks\Ragnarok_WP"
$date = Get-Date -Format "yyyy-MM-dd-HH-mm"
$zipFilePath = "F:\ARK Survival Ascended\Ragnarok\Ragnarok_$date.zip"

# Remove existing file before creating a new one
if (Test-Path $zipFilePath) {
    Remove-Item -Path $zipFilePath -Force
}

Compress-Archive -Path *.arkprofile, *.tribebak, *.profilebak, *.arktribe, Ragnarok_WP.ark -DestinationPath $zipFilePath -Force

Start-Sleep -Seconds 5

# Exit the PowerShell window to prevent it from lingering in Task Scheduler
Exit
