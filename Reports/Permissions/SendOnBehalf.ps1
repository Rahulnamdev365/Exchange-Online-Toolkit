function Invoke-SendOnBehalfReport
{
    Clear-Host

    Write-Host ""
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host "             SEND ON BEHALF PERMISSIONS REPORT" -ForegroundColor Green
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host ""

    try
    {
        $Permissions = Get-EXOMailbox -ResultSize Unlimited |
        Where-Object {
            $_.GrantSendOnBehalfTo.Count -gt 0
        } |
        Select-Object DisplayName,
                      PrimarySmtpAddress,
                      GrantSendOnBehalfTo

        if (-not $Permissions)
        {
            Write-Host ""
            Write-Host "No Send On Behalf permissions found." -ForegroundColor Yellow
            Read-Host "Press ENTER to continue"
            return
        }

        $Permissions | Format-Table -Wrap -AutoSize

        Write-Host ""
        Write-Host "1. Export to CSV"
        Write-Host "2. Return"

        $Choice = Read-Host "Select"

        if ($Choice -eq '1')
        {
            Export-ToolkitReport `
                -ReportName "SendOnBehalfPermissions" `
                -Data $Permissions

            Read-Host "Press ENTER to continue"
        }
    }
    catch
    {
        Write-Host ""
        Write-Host "Unable to retrieve Send On Behalf permissions." -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Yellow

        Read-Host "Press ENTER"
    }
}