function Connect-ExchangeOnlineToolkit {

    Write-Host ""
    Write-Host "Checking Exchange Online module..." -ForegroundColor Cyan

    if (-not (Get-Module -ListAvailable ExchangeOnlineManagement)) {

        Write-Host "ExchangeOnlineManagement module is not installed." -ForegroundColor Red
        return $false
    }

    Write-Host "Module found." -ForegroundColor Green

    Write-Host ""
    Write-Host "Checking existing connection..." -ForegroundColor Cyan

    try {

        Get-EXOMailbox -ResultSize 1 -ErrorAction Stop | Out-Null

        Write-Host "Already connected to Exchange Online." -ForegroundColor Yellow

        return $true

    }
    catch {

        Write-Host "No active Exchange Online session." -ForegroundColor Yellow

    }

    Write-Host ""
    Write-Host "Connecting to Exchange Online..." -ForegroundColor Cyan

    try {

        Connect-ExchangeOnline -ShowBanner:$false

        Write-Host ""
        Write-Host "Connection successful." -ForegroundColor Green

        return $true

    }
    catch {

        Write-Host ""
        Write-Host "Connection failed." -ForegroundColor Red

        Write-Host $_.Exception.Message -ForegroundColor Red

        return $false
    }

}