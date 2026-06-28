function Show-SecurityMenu
{
    do
    {
        Clear-Host

        Write-Host ""
        Write-Host "==============================================================" -ForegroundColor Cyan
        Write-Host "                  SECURITY REPORTS" -ForegroundColor Green
        Write-Host "==============================================================" -ForegroundColor Cyan
        Write-Host ""

        Write-Host "1. DKIM Configuration"
        Write-Host "2. Anti-Spam Policies"
        Write-Host "3. Anti-Phishing Policies"
        Write-Host "4. Safe Links Policies"
        Write-Host "5. Safe Attachments Policies"
        Write-Host "6. Back"
        Write-Host ""

        $Choice = Read-Host "Select an option"

        switch ($Choice)
        {
            '1' { Invoke-DKIMReport }
            '2' { Invoke-AntiSpamPolicyReport }
            '3' { Invoke-AntiPhishingPolicyReport }
            '4' { Invoke-SafeLinksReport }
            '5' { Invoke-SafeAttachmentsReport }
            '6' { break }

            default
            {
                Write-Host ""
                Write-Host "Invalid selection." -ForegroundColor Red
                Start-Sleep 1
            }
        }

    } while ($Choice -ne '6')
}