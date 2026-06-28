function Invoke-MailFlowRulesReport
{
    Clear-Host

    Write-Host ""
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host "                  MAIL FLOW RULES REPORT" -ForegroundColor Green
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host ""

    try
    {
        $Rules = Get-TransportRule |
        Select-Object Name,
                      State,
                      Mode,
                      Priority

        if (-not $Rules)
        {
            Write-Host ""
            Write-Host "No transport rules found." -ForegroundColor Yellow
            Read-Host "Press ENTER"
            return
        }

        $Rules | Format-Table -AutoSize

        Write-Host ""
        Write-Host "1. Export to CSV"
        Write-Host "2. Return"

        $Choice = Read-Host "Select"

        if ($Choice -eq '1')
        {
            Export-ToolkitReport `
                -ReportName "MailFlowRules" `
                -Data $Rules

            Read-Host "Press ENTER to continue"
        }
    }
    catch
    {
        Write-Host ""
        Write-Host "Unable to retrieve Mail Flow Rules." -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Yellow

        Read-Host "Press ENTER"
    }
}