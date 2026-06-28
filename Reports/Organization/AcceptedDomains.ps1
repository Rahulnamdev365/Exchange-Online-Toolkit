function Invoke-AcceptedDomainsReport
{
    Clear-Host

    Write-Host ""
    Write-Host "Collecting Accepted Domains..." -ForegroundColor Cyan

    try
    {
        $Domains = Get-AcceptedDomain |
            Select-Object Name,
                          DomainName,
                          DomainType,
                          Default

        $Domains | Format-Table -AutoSize

        Write-Host ""
        Write-Host "1. Export to CSV"
        Write-Host "2. Return"

        $Choice = Read-Host "Select"

        switch ($Choice)
        {
            '1'
            {
                Export-ToolkitReport `
                    -ReportName "AcceptedDomains" `
                    -Data $Domains

                Read-Host "Press ENTER to continue"
            }

            '2'
            {
                return
            }

            default
            {
                Write-Host "Invalid selection." -ForegroundColor Yellow
                Read-Host "Press ENTER to continue"
            }
        }

    }   # <-- THIS closes the try block

    catch
    {
        Write-Host ""
        Write-Host "Failed to retrieve Accepted Domains." -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Yellow

        Read-Host "Press ENTER"
    }
}