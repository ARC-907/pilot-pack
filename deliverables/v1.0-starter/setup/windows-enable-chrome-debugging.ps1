# Pilot Pack — windows-enable-chrome-debugging.ps1
# MIT Licensed. See LICENSE in package root.
# Version 1.0 — creates a separate Chrome shortcut with --remote-debugging-port.

param(
    [string]$ChromePath,
    [int]$Port = 9222,
    [string]$ShortcutName = "Chrome Browser Automation.lnk"
)

Write-Host "Chrome Debug Setup" -ForegroundColor Cyan
Write-Host "This script can create a dedicated Chrome shortcut for browser automation." -ForegroundColor Cyan
Write-Host "It uses a separate automation profile and does not need your normal Chrome profile." -ForegroundColor Cyan
Write-Host ""

function Ask-YesNo {
    param([string]$Question)
    while ($true) {
        $answer = Read-Host "$Question [y/n]"
        switch ($answer.Trim().ToLowerInvariant()) {
            "y" { return $true }
            "yes" { return $true }
            "n" { return $false }
            "no" { return $false }
            default { Write-Host "Please answer y or n." -ForegroundColor Yellow }
        }
    }
}

function Find-Chrome {
    $candidates = @(
        (Join-Path $env:ProgramFiles "Google\Chrome\Application\chrome.exe"),
        (Join-Path ${env:ProgramFiles(x86)} "Google\Chrome\Application\chrome.exe"),
        (Join-Path $env:LOCALAPPDATA "Google\Chrome\Application\chrome.exe")
    ) | Where-Object { $_ -and (Test-Path $_) }

    if ($candidates.Count -gt 0) {
        return $candidates[0]
    }

    return $null
}

if (-not $ChromePath) {
    $ChromePath = Find-Chrome
}

if (-not $ChromePath -or -not (Test-Path $ChromePath)) {
    Write-Host "Chrome was not found in common locations." -ForegroundColor Yellow
    $ChromePath = Read-Host "Enter the full path to chrome.exe, or press Enter to cancel"
    if (-not $ChromePath -or -not (Test-Path $ChromePath)) {
        Write-Host "Cancelled. No changes were made." -ForegroundColor Yellow
        exit 1
    }
}

$profileDir = Join-Path $env:LOCALAPPDATA "BrowserAutomationChromeProfile"
$desktopDir = [Environment]::GetFolderPath("Desktop")
$shortcutPath = Join-Path $desktopDir $ShortcutName
$arguments = "--remote-debugging-port=$Port --user-data-dir=`"$profileDir`" --new-window"

Write-Host "Chrome path: $ChromePath"
Write-Host "Shortcut path: $shortcutPath"
Write-Host "Automation profile: $profileDir"
Write-Host "Arguments: $arguments"
Write-Host ""

$approved = Ask-YesNo "Create or update this dedicated automation Chrome shortcut?"
if (-not $approved) {
    Write-Host "Cancelled. No changes were made." -ForegroundColor Yellow
    exit 0
}

if (-not (Test-Path $profileDir)) {
    New-Item -ItemType Directory -Path $profileDir -Force | Out-Null
}

$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = $ChromePath
$shortcut.Arguments = $arguments
$shortcut.WorkingDirectory = Split-Path -Parent $ChromePath
$shortcut.IconLocation = "$ChromePath,0"
$shortcut.Save()

Write-Host "Created shortcut: $shortcutPath" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Close Chrome windows that are using the automation profile, if any."
Write-Host "2. Launch Chrome from the new '$ShortcutName' shortcut."
Write-Host "3. Keep that Chrome window visible."
Write-Host "4. Run setup\verify-browser-automation.ps1 and check whether port $Port is listening."
Write-Host ""
Write-Host "To undo: delete the shortcut and, after Chrome is closed, delete the automation profile folder if desired." -ForegroundColor Cyan
