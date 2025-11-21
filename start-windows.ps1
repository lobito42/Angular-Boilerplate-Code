# PowerShell Start Script - Startet Backend und Frontend

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Starte Angular Boilerplate..." -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Prüfe ob Dependencies installiert sind
if (-not (Test-Path "backend\node_modules")) {
    Write-Host "FEHLER: Backend Dependencies nicht installiert!" -ForegroundColor Red
    Write-Host "Bitte führe zuerst setup-windows.ps1 aus!" -ForegroundColor Red
    Read-Host "Drücke Enter zum Beenden"
    exit 1
}

if (-not (Test-Path "frontend\node_modules")) {
    Write-Host "FEHLER: Frontend Dependencies nicht installiert!" -ForegroundColor Red
    Write-Host "Bitte führe zuerst setup-windows.ps1 aus!" -ForegroundColor Red
    Read-Host "Drücke Enter zum Beenden"
    exit 1
}

# Starte Backend im Hintergrund
Write-Host "Starte Backend..." -ForegroundColor Yellow
$backendJob = Start-Job -ScriptBlock {
    Set-Location $using:PWD
    Set-Location backend
    npm run start:dev
}

# Warte kurz
Start-Sleep -Seconds 3

# Starte Frontend im Hintergrund
Write-Host "Starte Frontend..." -ForegroundColor Yellow
$frontendJob = Start-Job -ScriptBlock {
    Set-Location $using:PWD
    Set-Location frontend
    npm start
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Beide Server gestartet!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Backend: http://localhost:3000" -ForegroundColor White
Write-Host "Frontend: http://localhost:4200" -ForegroundColor White
Write-Host ""
Write-Host "Drücke Ctrl+C zum Beenden beider Server" -ForegroundColor Yellow
Write-Host ""

# Warte auf Ctrl+C
try {
    while ($true) {
        Start-Sleep -Seconds 1
        # Prüfe ob Jobs noch laufen
        if ($backendJob.State -eq "Failed" -or $frontendJob.State -eq "Failed") {
            Write-Host "Ein Server ist fehlgeschlagen!" -ForegroundColor Red
            break
        }
    }
} catch {
    Write-Host "`nBeende Server..." -ForegroundColor Yellow
    Stop-Job $backendJob, $frontendJob
    Remove-Job $backendJob, $frontendJob
}

