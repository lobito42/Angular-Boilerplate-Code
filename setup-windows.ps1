# PowerShell Setup Script für Angular Boilerplate
# Dieses Script installiert alle Dependencies und startet das Projekt

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Angular Full-Stack Boilerplate Setup" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Prüfe Node.js Installation
Write-Host "[1/5] Prüfe Node.js Installation..." -ForegroundColor Yellow
try {
    $nodeVersion = node --version
    Write-Host "Node.js gefunden: $nodeVersion" -ForegroundColor Green

    # Prüfe Version (sollte 20.x sein)
    if ($nodeVersion -notmatch "^v20\.") {
        Write-Host "WARNUNG: Node.js Version sollte 20.x sein!" -ForegroundColor Yellow
        Write-Host "Aktuelle Version: $nodeVersion" -ForegroundColor Yellow
    }
} catch {
    Write-Host "FEHLER: Node.js ist nicht installiert!" -ForegroundColor Red
    Write-Host "Bitte installiere Node.js 20.x von https://nodejs.org/" -ForegroundColor Red
    Read-Host "Drücke Enter zum Beenden"
    exit 1
}
Write-Host ""

# Prüfe npm Installation
Write-Host "[2/5] Prüfe npm Installation..." -ForegroundColor Yellow
try {
    $npmVersion = npm --version
    Write-Host "npm gefunden: $npmVersion" -ForegroundColor Green
} catch {
    Write-Host "FEHLER: npm ist nicht installiert!" -ForegroundColor Red
    Read-Host "Drücke Enter zum Beenden"
    exit 1
}
Write-Host ""

# Erstelle .env Datei falls nicht vorhanden
Write-Host "[3/5] Erstelle .env Datei..." -ForegroundColor Yellow
if (-not (Test-Path ".env")) {
    if (Test-Path ".env.example") {
        Copy-Item ".env.example" ".env"
        Write-Host ".env Datei erstellt von .env.example" -ForegroundColor Green
    } else {
        Write-Host "Warnung: .env.example nicht gefunden" -ForegroundColor Yellow
    }
} else {
    Write-Host ".env Datei existiert bereits" -ForegroundColor Green
}
Write-Host ""

# Installiere Backend Dependencies
Write-Host "[4/5] Installiere Backend Dependencies..." -ForegroundColor Yellow
if (-not (Test-Path "backend")) {
    Write-Host "FEHLER: backend Ordner nicht gefunden!" -ForegroundColor Red
    Read-Host "Drücke Enter zum Beenden"
    exit 1
}

Set-Location backend
npm install
if ($LASTEXITCODE -ne 0) {
    Write-Host "FEHLER: npm install im Backend fehlgeschlagen!" -ForegroundColor Red
    Set-Location ..
    Read-Host "Drücke Enter zum Beenden"
    exit 1
}
Set-Location ..
Write-Host "Backend Dependencies installiert!" -ForegroundColor Green
Write-Host ""

# Installiere Frontend Dependencies
Write-Host "[5/5] Installiere Frontend Dependencies..." -ForegroundColor Yellow
if (-not (Test-Path "frontend")) {
    Write-Host "FEHLER: frontend Ordner nicht gefunden!" -ForegroundColor Red
    Read-Host "Drücke Enter zum Beenden"
    exit 1
}

Set-Location frontend
npm install
if ($LASTEXITCODE -ne 0) {
    Write-Host "FEHLER: npm install im Frontend fehlgeschlagen!" -ForegroundColor Red
    Set-Location ..
    Read-Host "Drücke Enter zum Beenden"
    exit 1
}
Set-Location ..
Write-Host "Frontend Dependencies installiert!" -ForegroundColor Green
Write-Host ""

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Setup erfolgreich abgeschlossen!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Nächste Schritte:" -ForegroundColor Yellow
Write-Host "1. Backend starten: cd backend; npm run start:dev" -ForegroundColor White
Write-Host "2. Frontend starten: cd frontend; npm start" -ForegroundColor White
Write-Host ""
Write-Host "Oder verwende die start-windows.ps1 Datei!" -ForegroundColor Yellow
Write-Host ""
Read-Host "Drücke Enter zum Beenden"

