<#
.SYNOPSIS
    Locks the project workspace to prevent file modifications by AI agents and editors.
#>

$TargetDir = $PSScriptRoot

Write-Host "Locking files in $TargetDir to Read-Only..." -ForegroundColor Cyan

# Set all files (except .git if exists) to Read-Only
Get-ChildItem -Path $TargetDir -Recurse -File | ForEach-Object {
    if ($_.FullName -notmatch "\\\.git\\") {
        $_.IsReadOnly = $true
    }
}

Write-Host "[OK] Project files are now locked (Read-Only)." -ForegroundColor Green
Write-Host "No editor, script, or AI assistant can overwrite these files." -ForegroundColor Yellow
Write-Host "To unlock, run: .\Unprotect-Project.ps1" -ForegroundColor Gray
