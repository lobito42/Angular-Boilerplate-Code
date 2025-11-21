@echo off
REM Windows Start Script - Startet Backend und Frontend
REM Öffnet zwei Command Prompt Fenster

echo ========================================
echo Starte Angular Boilerplate...
echo ========================================
echo.

REM Prüfe ob Dependencies installiert sind
if not exist "backend\node_modules" (
    echo FEHLER: Backend Dependencies nicht installiert!
    echo Bitte führe zuerst setup-windows.bat aus!
    pause
    exit /b 1
)

if not exist "frontend\node_modules" (
    echo FEHLER: Frontend Dependencies nicht installiert!
    echo Bitte führe zuerst setup-windows.bat aus!
    pause
    exit /b 1
)

REM Starte Backend in neuem Fenster
echo Starte Backend...
start "Backend Server" cmd /k "cd backend && npm run start:dev"

REM Warte kurz
timeout /t 3 /nobreak >nul

REM Starte Frontend in neuem Fenster
echo Starte Frontend...
start "Frontend Server" cmd /k "cd frontend && npm start"

echo.
echo ========================================
echo Beide Server gestartet!
echo ========================================
echo.
echo Backend: http://localhost:3000
echo Frontend: http://localhost:4200
echo.
echo Druecke eine Taste zum Schliessen dieses Fensters...
echo (Die Server laufen weiter in den anderen Fenstern)
pause >nul

