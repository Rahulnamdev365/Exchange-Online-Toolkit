function Invoke-MailboxStatisticsReport
{
    Clear-Host

    Write-Host ""
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host "                  MAILBOX STATISTICS REPORT" -ForegroundColor Green
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host ""

    try
    {
        Write-Host "Collecting mailbox statistics..." -ForegroundColor Cyan
        Write-Host ""

        $Results = foreach ($Mailbox in Get-EXOMailbox -ResultSize Unlimited)
        {
            $Stats = Get-EXOMailboxStatistics -Identity $Mailbox.UserPrincipalName

            [PSCustomObject]@{
                DisplayName = $Mailbox.DisplayName
                EmailAddress = $Mailbox.PrimarySmtpAddress
                MailboxSize = $Stats.TotalItemSize
                ItemCount = $Stats.ItemCount
                LastLogon = $Stats.LastLogonTime
            }
        }

        $Results | Format-Table -AutoSize

        Write-Host ""
        Write-Host "--------------------------------------------------------------"
        Write-Host "1. Export to CSV"
        Write-Host "2. Return"
        Write-Host "--------------------------------------------------------------"

        $Choice = Read-Host "Select an option"

        if ($Choice -eq '1')
        {
            Export-ToolkitReport `
                -ReportName "MailboxStatistics" `
                -Data $Results

            Read-Host "Press ENTER to continue"
        }

    }
    catch
    {
        Write-Host ""
        Write-Host "Unable to retrieve mailbox statistics." -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Yellow

        Read-Host "Press ENTER"
    }
}