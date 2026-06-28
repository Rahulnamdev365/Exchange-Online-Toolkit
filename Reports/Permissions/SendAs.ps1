function Invoke-SendAsReport
{
    Clear-Host

    Write-Host ""
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host "                 SEND AS PERMISSIONS REPORT" -ForegroundColor Green
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host ""

    try
    {
        $Permissions = foreach ($Mailbox in Get-EXOMailbox -ResultSize Unlimited)
        {
            Get-RecipientPermission -Identity $Mailbox.UserPrincipalName |
            Where-Object {
                $_.Trustee -ne "NT AUTHORITY\SELF"
            } |
            Select-Object @{
                    Name='Mailbox'
                    Expression={$Mailbox.DisplayName}
                },
                Trustee,
                AccessRights
        }

        if (-not $Permissions)
        {
            Write-Host ""
            Write-Host "No Send As permissions found." -ForegroundColor Yellow
            Read-Host "Press ENTER to continue"
            return
        }

        $Permissions | Format-Table -AutoSize

        Write-Host ""
        Write-Host "1. Export to CSV"
        Write-Host "2. Return"

        $Choice = Read-Host "Select"

        if ($Choice -eq '1')
        {
            Export-ToolkitReport `
                -ReportName "SendAsPermissions" `
                -Data $Permissions

            Read-Host "Press ENTER to continue"
        }
    }
    catch
    {
        Write-Host ""
        Write-Host "Unable to retrieve Send As permissions." -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Yellow

        Read-Host "Press ENTER"
    }
}