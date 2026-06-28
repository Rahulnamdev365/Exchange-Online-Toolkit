function Show-MailboxMenu
{
    do
    {
        Clear-Host

        Write-Host ""
        Write-Host "==============================================================" -ForegroundColor Cyan
        Write-Host "                    MAILBOX REPORTS" -ForegroundColor Green
        Write-Host "==============================================================" -ForegroundColor Cyan
        Write-Host ""

        Write-Host "1. Mailbox Statistics"
        Write-Host "2. Shared Mailboxes"
        Write-Host "3. Room Mailboxes"
        Write-Host "4. Mailbox Forwarding"
        Write-Host "5. Back"
        Write-Host ""

        $Choice = Read-Host "Select an option"

        switch ($Choice)
        {
            '1'
            {
                Invoke-MailboxStatisticsReport
            }

            '2'
            {
                Invoke-SharedMailboxesReport
            }

            '3'
            {
                Invoke-RoomMailboxesReport
            }

            '4'
            {
                Invoke-MailboxForwardingReport
            }

            '5'
            {
                break
            }

            default
            {
                Write-Host ""
                Write-Host "Invalid selection." -ForegroundColor Red
                Start-Sleep 1
            }
        }

    } while ($Choice -ne '5')
}