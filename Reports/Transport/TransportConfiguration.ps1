function Invoke-TransportConfigurationReport
{
    Clear-Host

    Write-Host ""
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host "              TRANSPORT CONFIGURATION REPORT" -ForegroundColor Green
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host ""

    try
    {
        $Transport = Get-TransportConfig

        $Result = [PSCustomObject]@{

            "Internal SMTP Servers"          = ($Transport.InternalSMTPServers -join ", ")

            "Max Receive Size"               = $Transport.MaxReceiveSize

            "Max Send Size"                  = $Transport.MaxSendSize

            "External Postmaster Address"    = $Transport.ExternalPostmasterAddress

            "Journaling Report NDR To"       = $Transport.JournalingReportNdrTo

            "Clear Categories"               = $Transport.ClearCategories

            "TLS Receive Domain Secure List" = ($Transport.TLSReceiveDomainSecureList -join ", ")

            "TLSSendDomainSecureList"        = ($Transport.TLSSendDomainSecureList -join ", ")

        }

        $Result | Format-List

        Write-Host ""
        Write-Host "1. Export to CSV"
        Write-Host "2. Return"

        $Choice = Read-Host "Select"

        if ($Choice -eq '1')
        {
            Export-ToolkitReport `
                -ReportName "TransportConfiguration" `
                -Data $Result

            Read-Host "Press ENTER to continue"
        }
    }
    catch
    {
        Write-Host ""
        Write-Host "Unable to retrieve Transport Configuration." -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Yellow

        Read-Host "Press ENTER"
    }
}