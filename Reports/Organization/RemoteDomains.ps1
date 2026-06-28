function Invoke-RemoteDomainsReport
{
    Clear-Host

    Write-Host ""
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host "                 REMOTE DOMAINS REPORT" -ForegroundColor Green
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host ""

    try
    {
        $RemoteDomains = Get-RemoteDomain |
            Select-Object Name,
                          DomainName,
                          AllowedOOFType,
                          AutoForwardEnabled,
                          AutoReplyEnabled

        if ($null -eq $RemoteDomains)
        {
            Write-Host "No Remote Domains found." -ForegroundColor Yellow
            Read-Host "Press ENTER to continue"
            return
        }

        $RemoteDomains | Format-Table -AutoSize

        Write-Host ""
        Write-Host "--------------------------------------------------------------"
        Write-Host "1. Export to CSV"
        Write-Host "2. Return"
        Write-Host "--------------------------------------------------------------"

        $Choice = Read-Host "Select an option"

        switch ($Choice)
        {
            '1'
            {
                Export-ToolkitReport `
                    -ReportName "RemoteDomains" `
                    -Data $RemoteDomains

                Read-Host "Press ENTER to continue"
            }

            default
            {
                return
            }
        }
    }
    catch
    {
        Write-Host ""
        Write-Host "Unable to retrieve Remote Domains." -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Yellow

        Read-Host "Press ENTER to continue"
    }
}