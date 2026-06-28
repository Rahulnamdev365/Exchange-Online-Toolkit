function Invoke-FullAccessReport
{
    Clear-Host

    Write-Host ""
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host "               FULL ACCESS PERMISSIONS REPORT" -ForegroundColor Green
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host ""

    try
    {
        $Permissions = foreach ($Mailbox in Get-EXOMailbox -ResultSize Unlimited)
        {
            Get-EXOMailboxPermission -Identity $Mailbox.UserPrincipalName |
            Where-Object {
                $_.User -ne "NT AUTHORITY\SELF" -and
                $_.AccessRights -contains "FullAccess"
            } |
            Select-Object @{
                Name='Mailbox'
                Expression={$Mailbox.DisplayName}
            },
            User,
            AccessRights,
            IsInherited
        }

        $Permissions | Format-Table -AutoSize

        Write-Host ""
        Write-Host "1. Export to CSV"
        Write-Host "2. Return"

        $Choice = Read-Host "Select"

        if ($Choice -eq '1')
        {
            Export-ToolkitReport `
                -ReportName "FullAccessPermissions" `
                -Data $Permissions

            Read-Host "Press ENTER to continue"
        }
    }
    catch
    {
        Write-Host ""
        Write-Host "Unable to retrieve mailbox permissions." -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Yellow

        Read-Host "Press ENTER"
    }
}