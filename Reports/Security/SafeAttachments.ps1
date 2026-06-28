function Invoke-SafeAttachmentsReport
{
    Clear-Host

    Write-Host ""
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host "              SAFE ATTACHMENTS REPORT" -ForegroundColor Green
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host ""

    try
    {
        $Policies = Get-SafeAttachmentPolicy |
        Select-Object Name,
                      Action,
                      Enable

        $Policies | Format-Table -AutoSize

        Write-Host ""

        Write-Host "1. Export to CSV"
        Write-Host "2. Return"

        $Choice = Read-Host "Select"

        if ($Choice -eq '1')
        {
            Export-ToolkitReport `
                -ReportName "SafeAttachmentsPolicies" `
                -Data $Policies

            Read-Host "Press ENTER"
        }
    }
    catch
    {
        Write-Host ""
        Write-Host "Unable to retrieve Safe Attachments policies." -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Yellow

        Read-Host "Press ENTER"
    }
}