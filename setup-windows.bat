@echo off
REM Windows Setup Script für Angular Boilerplate

echo ========================================
echo Angular Full-Stack Boilerplate Setup
echo ========================================
echo.

REM Prüfe Node.js Installation
echo [1/5] Pruefe Node.js Installation...
where node >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo FEHLER: Node.js ist nicht installiert!
    echo Bitte installiere Node.js 20.x von https://nodejs.org/
    pause
    exit /b 1
)

node --version
echo Node.js gefunden!
echo.

REM Prüfe npm Installation
echo [2/5] Pruefe npm Installation...
where npm >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo FEHLER: npm ist nicht installiert!
    pause
    exit /b 1
)

npm --version
echo npm gefunden!
echo.

REM Erstelle .env Datei falls nicht vorhanden
echo [3/5] Erstelle .env Datei...
if not exist .env (
    if exist .env.example (
        copy .env.example .env >nul
        echo .env Datei erstellt
    )
) else (
    echo .env Datei existiert bereits
)
echo.

REM Installiere Backend Dependencies
echo [4/5] Installiere Backend Dependencies...
cd backend
call npm install --silent
if %ERRORLEVEL% NEQ 0 (
    echo FEHLER: npm install im Backend fehlgeschlagen!
    cd ..
    pause
    exit /b 1
)
cd ..
echo Backend Dependencies installiert!
echo.

REM Installiere Frontend Dependencies
echo [5/5] Installiere Frontend Dependencies...
cd frontend
call npm install --silent
if %ERRORLEVEL% NEQ 0 (
    echo FEHLER: npm install im Frontend fehlgeschlagen!
    cd ..
    pause
    exit /b 1
)
cd ..
echo Frontend Dependencies installiert!
echo.

echo ========================================
echo Setup erfolgreich abgeschlossen!
echo ========================================
echo.
echo Projekt jetzt starten? (J/N)
set /p START="Eingabe: "

if /i "%START%"=="J" (
    echo.
    echo Starte Backend und Frontend...
    echo Backend: http://localhost:3000
    echo Frontend: http://localhost:4200
    echo.
    echo Druecke Ctrl+C um zu beenden
    echo.
    start "Backend" cmd /k "cd backend && npm run start:dev"
    timeout /t 2 >nul
    start "Frontend" cmd /k "cd frontend && npm start"
    echo.
    echo Beide Server wurden gestartet!
) else (
    echo.
    echo Zum Starten:
    echo 1. Backend: cd backend ^&^& npm run start:dev
    echo 2. Frontend: cd frontend ^&^& npm start
)
echo.
pause
