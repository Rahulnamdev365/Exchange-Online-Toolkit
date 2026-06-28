function Show-MainMenu
{
    do
    {
        Write-Host ""
        Write-Host "==================== MAIN MENU ====================" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "1. Connect to Exchange Online"
        Write-Host "2. Organization Health Check"
        Write-Host "3. Mailbox Reports"
        Write-Host "4. Transport Reports"
        Write-Host "5. Security Reports"
        Write-Host "6. Permissions Reports"
        Write-Host "7. Run Complete Health Check"
        Write-Host "8. Exit"
        Write-Host ""

        $Choice = Read-Host "Select an option"

        switch ($Choice)
        {
            '1'
            {
            $Connected = Connect-ExchangeOnlineToolkit

            if ($Connected)
                {
                Write-Host ""
                Write-Host "Press ENTER to return to menu..." -ForegroundColor Yellow
                Read-Host | Out-Null
                }
            }

            '2'
            {
                Show-OrganizationMenu
            }

            '3'
            {
                Show-MailboxMenu
            }

            '4'
            {
                Show-TransportMenu
            }

            '5'
            {
                Write-Host ""
                Write-Host "Feature coming soon..." -ForegroundColor Yellow
            }

            '6'
            {
                Show-PermissionsMenu
            }

            '7'
            {
                Write-Host ""
                Write-Host "Feature coming soon..." -ForegroundColor Yellow
            }

            '8'
            {
                Write-Host ""
                Write-Host "Goodbye!" -ForegroundColor Green
                break
            }

            default
            {
                Write-Host ""
                Write-Host "Invalid selection." -ForegroundColor Red
            }
        }

    } while ($Choice -ne "8")
}