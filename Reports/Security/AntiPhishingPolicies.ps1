function Invoke-AntiPhishingPolicyReport
{
    Clear-Host

    Write-Host ""
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host "             ANTI-PHISHING POLICIES REPORT" -ForegroundColor Green
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host ""

    try
    {
        $Policies = Get-AntiPhishPolicy |
        Select-Object Name,
                      Enabled,
                      EnableMailboxIntelligence,
                      EnableSpoofIntelligence

        $Policies | Format-Table -AutoSize

        Write-Host ""
        Write-Host "1. Export to CSV"
        Write-Host "2. Return"

        $Choice = Read-Host "Select"

        if ($Choice -eq '1')
        {
            Export-ToolkitReport `
                -ReportName "AntiPhishingPolicies" `
                -Data $Policies

            Read-Host "Press ENTER"
        }
    }
    catch
    {
        Write-Host ""
        Write-Host "Unable to retrieve Anti-Phishing policies." -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Yellow

        Read-Host "Press ENTER"
    }
}