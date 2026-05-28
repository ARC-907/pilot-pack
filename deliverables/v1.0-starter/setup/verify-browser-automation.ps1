# Pilot Pack — verify-browser-automation.ps1
# MIT Licensed. See LICENSE in package root.
# Version 1.0 — read-only setup checker. No installs, no edits.

param(
    [string]$PackageRoot = (Split-Path -Parent $PSScriptRoot)
)

$TROUBLESHOOTING_PATH = Join-Path $PackageRoot "TROUBLESHOOTING.md"

Write-Host "Browser Automation Setup Check" -ForegroundColor Cyan
Write-Host "Package root: $PackageRoot"
Write-Host ""

function Test-CommandAvailable {
    param([string]$Name)
    $cmd = Get-Command $Name -ErrorAction SilentlyContinue
    if ($cmd) {
        $version = $null
        try { $version = & $Name --version 2>$null | Select-Object -First 1 } catch { }
        if ($version) {
            Write-Host "OK   $Name found: $version" -ForegroundColor Green
        }
        else {
            Write-Host "OK   $Name found: $($cmd.Source)" -ForegroundColor Green
        }
        return $true
    }
    Write-Host "MISS $Name not found" -ForegroundColor Yellow
    return $false
}

$nodeOk = Test-CommandAvailable -Name "node"
$npmOk = Test-CommandAvailable -Name "npm"
$npxOk = Test-CommandAvailable -Name "npx"
$codeOk = Test-CommandAvailable -Name "code"

Write-Host ""
Write-Host "Chrome detection" -ForegroundColor Cyan
$chromeCandidates = @(
    (Join-Path $env:ProgramFiles "Google\Chrome\Application\chrome.exe"),
    (Join-Path ${env:ProgramFiles(x86)} "Google\Chrome\Application\chrome.exe"),
    (Join-Path $env:LOCALAPPDATA "Google\Chrome\Application\chrome.exe")
) | Where-Object { $_ -and (Test-Path $_) }

if ($chromeCandidates.Count -gt 0) {
    $chromeCandidates | ForEach-Object { Write-Host "OK   Chrome found: $_" -ForegroundColor Green }
}
else {
    Write-Host "MISS Chrome was not found in common locations" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Chrome debug port" -ForegroundColor Cyan
$portOpen = $false
try {
    $connection = Test-NetConnection -ComputerName 127.0.0.1 -Port 9222 -InformationLevel Quiet -WarningAction SilentlyContinue
    $portOpen = [bool]$connection
}
catch {
    $portOpen = $false
}

if ($portOpen) {
    Write-Host "OK   Port 9222 is listening" -ForegroundColor Green
}
else {
    Write-Host "INFO Port 9222 is not listening. This is fine unless you want Chrome debug mode." -ForegroundColor DarkYellow
}

Write-Host ""
Write-Host "Package files" -ForegroundColor Cyan
$mcpPath = Join-Path $PackageRoot ".vscode\mcp.json"
$agentPath = Join-Path $PackageRoot "AGENT-SETUP-INSTRUCTIONS.md"
$testFormPath = Join-Path $PackageRoot "examples\test-form.html"

foreach ($path in @($mcpPath, $agentPath, $testFormPath)) {
    if (Test-Path $path) {
        Write-Host "OK   $path" -ForegroundColor Green
    }
    else {
        Write-Host "MISS $path" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "Summary" -ForegroundColor Cyan
if ($nodeOk -and $npmOk -and $npxOk) {
    Write-Host "Node.js tooling is ready for Playwright MCP." -ForegroundColor Green
}
else {
    Write-Host "Install Node.js LTS before starting Playwright MCP." -ForegroundColor Yellow
}

if ($codeOk) {
    Write-Host "VS Code CLI is available." -ForegroundColor Green
}
else {
    Write-Host "VS Code CLI was not found. You can still use VS Code manually." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "This script made no changes." -ForegroundColor Cyan

# LHF-4: surface a fix-path URL on any MISS results.
$anyMiss = -not ($nodeOk -and $npmOk -and $npxOk -and $codeOk -and ($chromeCandidates.Count -gt 0))
if ($anyMiss) {
    Write-Host ""
    Write-Host "Some checks did not pass. For fixes, see:" -ForegroundColor Yellow
    Write-Host "  $TROUBLESHOOTING_PATH" -ForegroundColor Yellow
}
