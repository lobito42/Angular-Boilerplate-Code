@echo off
REM Windows Setup Script für Angular Boilerplate
REM Dieses Script installiert alle Dependencies und startet das Projekt

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
        echo .env Datei erstellt von .env.example
    ) else (
        echo Warnung: .env.example nicht gefunden
    )
) else (
    echo .env Datei existiert bereits
)
echo.

REM Installiere Backend Dependencies
echo [4/5] Installiere Backend Dependencies...
cd backend
if %ERRORLEVEL% NEQ 0 (
    echo FEHLER: backend Ordner nicht gefunden!
    pause
    exit /b 1
)

call npm install
if %ERRORLEVEL% NEQ 0 (
    echo FEHLER: npm install im Backend fehlgeschlagen!
    pause
    exit /b 1
)
cd ..
echo Backend Dependencies installiert!
echo.

REM Installiere Frontend Dependencies
echo [5/5] Installiere Frontend Dependencies...
cd frontend
if %ERRORLEVEL% NEQ 0 (
    echo FEHLER: frontend Ordner nicht gefunden!
    pause
    exit /b 1
)

call npm install
if %ERRORLEVEL% NEQ 0 (
    echo FEHLER: npm install im Frontend fehlgeschlagen!
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
echo Naechste Schritte:
echo 1. Backend starten: cd backend ^&^& npm run start:dev
echo 2. Frontend starten: cd frontend ^&^& npm start
echo.
echo Oder verwende die start-windows.bat Datei!
echo.
pause

