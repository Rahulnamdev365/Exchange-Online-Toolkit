function Invoke-AntiSpamPolicyReport
{
    Clear-Host

    Write-Host ""
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host "                ANTI-SPAM POLICIES REPORT" -ForegroundColor Green
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host ""

    try
    {
        $Policies = Get-HostedContentFilterPolicy |
        Select-Object Name,
                      SpamAction,
                      HighConfidenceSpamAction,
                      PhishSpamAction,
                      BulkSpamAction

        if (-not $Policies)
        {
            Write-Host ""
            Write-Host "No Anti-Spam policies found." -ForegroundColor Yellow
            Read-Host "Press ENTER"
            return
        }

        $Policies | Format-Table -AutoSize

        Write-Host ""
        Write-Host "1. Export to CSV"
        Write-Host "2. Return"

        $Choice = Read-Host "Select"

        if ($Choice -eq '1')
        {
            Export-ToolkitReport `
                -ReportName "AntiSpamPolicies" `
                -Data $Policies

            Read-Host "Press ENTER to continue"
        }
    }
    catch
    {
        Write-Host ""
        Write-Host "Unable to retrieve Anti-Spam policies." -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Yellow

        Read-Host "Press ENTER"
    }
}