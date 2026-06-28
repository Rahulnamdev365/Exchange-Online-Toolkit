function Export-ToolkitReport {

    param(
        [Parameter(Mandatory)]
        [string]$ReportName,

        [Parameter(Mandatory)]
        $Data
    )

    $TimeStamp = Get-Date -Format "yyyyMMdd_HHmmss"

    $OutputFolder = Join-Path $PSScriptRoot "..\SampleOutput"

    if (!(Test-Path $OutputFolder))
    {
        New-Item -ItemType Directory -Path $OutputFolder | Out-Null
    }

    $CSV = Join-Path $OutputFolder "$ReportName`_$TimeStamp.csv"

    $Data | Export-Csv $CSV -NoTypeInformation -Encoding UTF8

    Write-Host ""
    Write-Host "Report exported successfully." -ForegroundColor Green
    Write-Host $CSV -ForegroundColor Cyan
}