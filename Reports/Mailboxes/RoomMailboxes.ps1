function Invoke-RoomMailboxesReport
{
    Clear-Host

    Write-Host ""
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host "                   ROOM MAILBOXES REPORT" -ForegroundColor Green
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host ""

    try
    {
        $Rooms = Get-EXOMailbox -RecipientTypeDetails RoomMailbox -ResultSize Unlimited |
        Select-Object DisplayName,
                      PrimarySmtpAddress,
                      Office,
                      Capacity

        $Rooms | Format-Table -AutoSize

        Write-Host ""
        Write-Host "1. Export to CSV"
        Write-Host "2. Return"

        $Choice = Read-Host "Select"

        if ($Choice -eq '1')
        {
            Export-ToolkitReport `
                -ReportName "RoomMailboxes" `
                -Data $Rooms

            Read-Host "Press ENTER to continue"
        }
    }
    catch
    {
        Write-Host ""
        Write-Host "Unable to retrieve room mailboxes." -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Yellow

        Read-Host "Press ENTER"
    }
}