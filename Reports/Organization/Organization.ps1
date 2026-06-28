function Show-OrganizationMenu
{
    do
    {
        Clear-Host

        Write-Host ""
        Write-Host "============================================================" -ForegroundColor Cyan
        Write-Host "              ORGANIZATION HEALTH CHECK" -ForegroundColor Green
        Write-Host "============================================================" -ForegroundColor Cyan
        Write-Host ""

        Write-Host "1. Organization Configuration"
        Write-Host "2. Accepted Domains"
        Write-Host "3. Remote Domains"
        Write-Host "4. Back"

        Write-Host ""

        $Choice = Read-Host "Select an option"

        switch ($Choice)
        {
            '1'
            {
                Invoke-OrganizationConfigurationReport
            }

            '2'
            {
                Invoke-AcceptedDomainsReport
            }

            '3'
            {
                Invoke-RemoteDomainsReport
            }

            '4'
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

    } while ($Choice -ne '4')
}