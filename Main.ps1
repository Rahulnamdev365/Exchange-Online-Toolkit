<#
.SYNOPSIS
    Exchange Online Administration Toolkit

.DESCRIPTION
    Main launcher for the Exchange Online Administration Toolkit.

.AUTHOR
    Rahul J. Namdev

.VERSION
    1.0.0
#>

#------------------------------------------------------------
# Script Configuration
#------------------------------------------------------------

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

#------------------------------------------------------------
# Toolkit Information
#------------------------------------------------------------

$ToolkitName    = "Exchange Online Administration Toolkit"
$ToolkitVersion = "1.0.0"

#------------------------------------------------------------
# Get Toolkit Root Directory
#------------------------------------------------------------

$ToolkitRoot = $PSScriptRoot

#------------------------------------------------------------
# Folders to Import
#
# Every PowerShell script inside these folders and their
# subfolders will be automatically loaded.
#------------------------------------------------------------

$FoldersToImport = @(
    "Modules",
    "Reports"
)

#------------------------------------------------------------
# Import Toolkit Files
#------------------------------------------------------------

foreach ($Folder in $FoldersToImport)
{
    $FolderPath = Join-Path $ToolkitRoot $Folder

    if (-not (Test-Path $FolderPath))
    {
        Write-Host ""
        Write-Host "Required folder not found: $Folder" -ForegroundColor Red
        Exit
    }

    Get-ChildItem -Path $FolderPath -Recurse -Filter "*.ps1" |
        Sort-Object FullName |
        ForEach-Object {

            try
            {
                . $_.FullName

                $RelativePath = $_.FullName.Replace($ToolkitRoot, "").TrimStart("\")

                Write-Host "Loaded: $RelativePath" -ForegroundColor DarkGray
            }
            catch
            {
                Write-Host ""
                Write-Host "Failed to load script:" -ForegroundColor Red
                Write-Host $_.FullName -ForegroundColor Yellow
                Write-Host ""
                Write-Host $_.Exception.Message -ForegroundColor Red
                Exit
            }
        }
}

#------------------------------------------------------------
# Display Toolkit Banner
#------------------------------------------------------------

Clear-Host

Write-Host ""
Write-Host "==============================================================" -ForegroundColor Cyan
Write-Host "           $ToolkitName" -ForegroundColor Green
Write-Host "                    Version $ToolkitVersion" -ForegroundColor Green
Write-Host "==============================================================" -ForegroundColor Cyan
Write-Host ""

#------------------------------------------------------------
# Launch Main Menu
#------------------------------------------------------------

Show-MainMenu