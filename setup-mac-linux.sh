#!/bin/bash
# Mac/Linux Setup Script für Angular Boilerplate

set -e

echo "========================================"
echo "Angular Full-Stack Boilerplate Setup"
echo "========================================"
echo ""

# Prüfe Node.js Installation
echo "[1/5] Prüfe Node.js Installation..."
if ! command -v node &> /dev/null; then
    echo "FEHLER: Node.js ist nicht installiert!"
    echo "Bitte installiere Node.js 20.x von https://nodejs.org/"
    exit 1
fi

NODE_VERSION=$(node --version)
echo "Node.js gefunden: $NODE_VERSION"

# Prüfe Version (sollte 20.x sein)
if [[ ! $NODE_VERSION =~ ^v20\. ]]; then
    echo "WARNUNG: Node.js Version sollte 20.x sein!"
    echo "Aktuelle Version: $NODE_VERSION"
fi
echo ""

# Prüfe npm Installation
echo "[2/5] Prüfe npm Installation..."
if ! command -v npm &> /dev/null; then
    echo "FEHLER: npm ist nicht installiert!"
    exit 1
fi

NPM_VERSION=$(npm --version)
echo "npm gefunden: $NPM_VERSION"
echo ""

# Erstelle .env Datei falls nicht vorhanden
echo "[3/5] Erstelle .env Datei..."
if [ ! -f ".env" ]; then
    if [ -f ".env.example" ]; then
        cp .env.example .env
        echo ".env Datei erstellt"
    fi
else
    echo ".env Datei existiert bereits"
fi
echo ""

# Installiere Backend Dependencies
echo "[4/5] Installiere Backend Dependencies..."
cd backend
npm install --silent
cd ..
echo "Backend Dependencies installiert!"
echo ""

# Installiere Frontend Dependencies
echo "[5/5] Installiere Frontend Dependencies..."
cd frontend
npm install --silent
cd ..
echo "Frontend Dependencies installiert!"
echo ""

echo "========================================"
echo "Setup erfolgreich abgeschlossen!"
echo "========================================"
echo ""
echo "Projekt jetzt starten? (j/n)"
read -p "Eingabe: " START

if [[ "$START" == "j" || "$START" == "J" ]]; then
    echo ""
    echo "Starte Backend und Frontend..."
    echo "Backend: http://localhost:3000"
    echo "Frontend: http://localhost:4200"
    echo ""
    echo "Drücke Ctrl+C in beiden Terminals um zu beenden"
    echo ""
    
    # Starte Backend im Hintergrund
    cd backend
    npm run start:dev &
    BACKEND_PID=$!
    cd ..
    
    sleep 3
    
    # Starte Frontend
    cd frontend
    npm start &
    FRONTEND_PID=$!
    cd ..
    
    echo ""
    echo "✅ Beide Server laufen!"
    echo ""
    echo "Zum Beenden: Ctrl+C drücken"
    
    # Warte auf Benutzer-Interrupt
    trap "kill $BACKEND_PID $FRONTEND_PID 2>/dev/null; echo ''; echo 'Server gestoppt!'; exit" INT TERM
    wait
else
    echo ""
    echo "Zum Starten:"
    echo "1. Backend: cd backend && npm run start:dev"
    echo "2. Frontend: cd frontend && npm start"
    echo ""
fi
