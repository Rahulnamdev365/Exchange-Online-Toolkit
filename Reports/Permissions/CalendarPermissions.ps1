function Invoke-CalendarPermissionsReport
{
    Clear-Host

    Write-Host ""
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host "             CALENDAR PERMISSIONS REPORT" -ForegroundColor Green
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host ""

    try
    {
        $Results = foreach ($Mailbox in Get-EXOMailbox -ResultSize Unlimited)
        {
            $Calendar = "$($Mailbox.PrimarySmtpAddress):\Calendar"

            try
            {
                Get-MailboxFolderPermission -Identity $Calendar -ErrorAction Stop |
                Where-Object { $_.User -ne "Default" -and $_.User -ne "Anonymous" } |
                Select-Object @{
                    Name='Mailbox'
                    Expression={$Mailbox.DisplayName}
                },
                User,
                AccessRights
            }
            catch
            {
                # Skip mailboxes that cannot be queried
            }
        }

        if (-not $Results)
        {
            Write-Host ""
            Write-Host "No custom calendar permissions found." -ForegroundColor Yellow
            Read-Host "Press ENTER"
            return
        }

        $Results | Format-Table -AutoSize

        Write-Host ""
        Write-Host "1. Export to CSV"
        Write-Host "2. Return"

        $Choice = Read-Host "Select"

        if ($Choice -eq '1')
        {
            Export-ToolkitReport `
                -ReportName "CalendarPermissions" `
                -Data $Results

            Read-Host "Press ENTER to continue"
        }
    }
    catch
    {
        Write-Host ""
        Write-Host "Failed to retrieve calendar permissions." -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Yellow

        Read-Host "Press ENTER"
    }
}