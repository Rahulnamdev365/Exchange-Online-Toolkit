function Invoke-DKIMReport
{
    Clear-Host

    Write-Host ""
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host "                 DKIM CONFIGURATION REPORT" -ForegroundColor Green
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host ""

    try
    {
        $DKIM = Get-DkimSigningConfig |
        Select-Object Domain,
                      Enabled,
                      Status

        if (-not $DKIM)
        {
            Write-Host ""
            Write-Host "No DKIM configuration found." -ForegroundColor Yellow
            Read-Host "Press ENTER"
            return
        }

        $DKIM | Format-Table -AutoSize

        Write-Host ""
        Write-Host "1. Export to CSV"
        Write-Host "2. Return"

        $Choice = Read-Host "Select"

        if ($Choice -eq '1')
        {
            Export-ToolkitReport `
                -ReportName "DKIMConfiguration" `
                -Data $DKIM

            Read-Host "Press ENTER to continue"
        }
    }
    catch
    {
        Write-Host ""
        Write-Host "Unable to retrieve DKIM configuration." -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Yellow

        Read-Host "Press ENTER"
    }
}