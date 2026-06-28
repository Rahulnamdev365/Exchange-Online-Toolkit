function Show-PermissionsMenu
{
    do
    {
        Clear-Host

        Write-Host ""
        Write-Host "==============================================================" -ForegroundColor Cyan
        Write-Host "                 PERMISSIONS REPORTS" -ForegroundColor Green
        Write-Host "==============================================================" -ForegroundColor Cyan
        Write-Host ""

        Write-Host "1. Full Access Permissions"
        Write-Host "2. Send As Permissions"
        Write-Host "3. Send On Behalf Permissions"
        Write-Host "4. Back"
        Write-Host ""

        $Choice = Read-Host "Select an option"

        switch ($Choice)
        {
            '1'
            {
                Invoke-FullAccessReport
            }

            '2'
            {
                Invoke-SendAsReport
            }

            '3'
            {
                Invoke-SendOnBehalfReport
            }

            '4'
            {
                Invoke-CalendarPermissionsReport
            }
            '5'
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