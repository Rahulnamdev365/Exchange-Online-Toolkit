function Invoke-SafeLinksReport
{
    Clear-Host

    Write-Host ""
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host "                 SAFE LINKS REPORT" -ForegroundColor Green
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host ""

    try
    {
        $Policies = Get-SafeLinksPolicy |
        Select-Object Name,
                      IsEnabled,
                      ScanUrls,
                      EnableSafeLinksForEmail

        $Policies | Format-Table -AutoSize

        Write-Host ""

        Write-Host "1. Export to CSV"
        Write-Host "2. Return"

        $Choice = Read-Host "Select"

        if ($Choice -eq '1')
        {
            Export-ToolkitReport `
                -ReportName "SafeLinksPolicies" `
                -Data $Policies

            Read-Host "Press ENTER"
        }
    }
    catch
    {
        Write-Host ""
        Write-Host "Unable to retrieve Safe Links policies." -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Yellow

        Read-Host "Press ENTER"
    }
}