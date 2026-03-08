# Migration script for Claude Code managed settings
# Migrates from: C:\ProgramData\ClaudeCode\managed-settings.json
# Migrates to: C:\Program Files\ClaudeCode\managed-settings.json

$oldPath = "C:\ProgramData\ClaudeCode\managed-settings.json"
$newPath = "C:\Program Files\ClaudeCode\managed-settings.json"

# Check if old file exists
if (Test-Path $oldPath) {
    Write-Host "Found managed settings at legacy location: $oldPath"
    
    # Create destination directory if it doesn't exist
    $newDir = Split-Path $newPath
    if (-not (Test-Path $newDir)) {
        New-Item -ItemType Directory -Path $newDir -Force | Out-Null
        Write-Host "Created directory: $newDir"
    }
    
    # Copy the file
    Copy-Item -Path $oldPath -Destination $newPath -Force
    Write-Host "Successfully migrated managed settings to: $newPath"
} else {
    Write-Host "No managed settings found at legacy location: $oldPath"
}