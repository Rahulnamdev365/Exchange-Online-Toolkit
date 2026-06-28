function Invoke-OrganizationConfigurationReport
{
    Clear-Host

    Write-Host ""
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host "             ORGANIZATION CONFIGURATION REPORT" -ForegroundColor Green
    Write-Host "==============================================================" -ForegroundColor Cyan
    Write-Host ""

    try
    {
        $Organization = Get-OrganizationConfig

        $Result = [PSCustomObject]@{
            "Organization Name"                    = $Organization.DisplayName
            "OAuth Enabled"                        = $Organization.OAuth2ClientProfileEnabled
            "Public Folders Enabled"               = $Organization.PublicFoldersEnabled
            "MailTips Enabled"                     = $Organization.MailTipsAllTipsEnabled
            "External MailTips Enabled"            = $Organization.MailTipsExternalRecipientsTipsEnabled
            "Large Audience Threshold"             = $Organization.MailTipsLargeAudienceThreshold
        }

        $Result | Format-List

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
                    -ReportName "OrganizationConfiguration" `
                    -Data $Result

                Read-Host "Press ENTER to continue"
            }

            '2'
            {
                return
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
        Write-Host "Unable to retrieve Organization Configuration." -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Yellow

        Read-Host "Press ENTER to continue"
    }
}