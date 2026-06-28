function Show-TransportMenu
{
    do
    {
        Clear-Host

        Write-Host ""
        Write-Host "==============================================================" -ForegroundColor Cyan
        Write-Host "                  TRANSPORT REPORTS" -ForegroundColor Green
        Write-Host "==============================================================" -ForegroundColor Cyan
        Write-Host ""

        Write-Host "1. Mail Flow Rules"
        Write-Host "2. Transport Configuration"
        Write-Host "3. Back"
        Write-Host ""

        $Choice = Read-Host "Select an option"

        switch ($Choice)
        {
            '1'
            {
                Invoke-MailFlowRulesReport
            }

            '2'
            {
                Invoke-TransportConfigurationReport
            }

            '3'
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

    } while ($Choice -ne '3')
}