<#
.SYNOPSIS
    Unlocks project workspace files, restoring write permissions for the human developer.
#>

$TargetDir = $PSScriptRoot

Write-Host "Unlocking files in $TargetDir (restoring Write access)..." -ForegroundColor Cyan

Get-ChildItem -Path $TargetDir -Recurse -File | ForEach-Object {
    if ($_.FullName -notmatch "\\\.git\\") {
        $_.IsReadOnly = $false
    }
}

Write-Host "[OK] Project files are now writable." -ForegroundColor Green
Write-Host "Remember to run .\Protect-Project.ps1 when you finish editing." -ForegroundColor Yellow
