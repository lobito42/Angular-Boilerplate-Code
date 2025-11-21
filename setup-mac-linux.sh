#!/bin/bash
# Mac/Linux Setup Script für Angular Boilerplate
# Dieses Script installiert alle Dependencies und startet das Projekt

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
        echo ".env Datei erstellt von .env.example"
    else
        echo "Warnung: .env.example nicht gefunden"
    fi
else
    echo ".env Datei existiert bereits"
fi
echo ""

# Installiere Backend Dependencies
echo "[4/5] Installiere Backend Dependencies..."
if [ ! -d "backend" ]; then
    echo "FEHLER: backend Ordner nicht gefunden!"
    exit 1
fi

cd backend
npm install
if [ $? -ne 0 ]; then
    echo "FEHLER: npm install im Backend fehlgeschlagen!"
    exit 1
fi
cd ..
echo "Backend Dependencies installiert!"
echo ""

# Installiere Frontend Dependencies
echo "[5/5] Installiere Frontend Dependencies..."
if [ ! -d "frontend" ]; then
    echo "FEHLER: frontend Ordner nicht gefunden!"
    exit 1
fi

cd frontend
npm install
if [ $? -ne 0 ]; then
    echo "FEHLER: npm install im Frontend fehlgeschlagen!"
    exit 1
fi
cd ..
echo "Frontend Dependencies installiert!"
echo ""

echo "========================================"
echo "Setup erfolgreich abgeschlossen!"
echo "========================================"
echo ""
echo "Nächste Schritte:"
echo "1. Backend starten: cd backend && npm run start:dev"
echo "2. Frontend starten: cd frontend && npm start"
echo ""
echo "Oder verwende die start-mac-linux.sh Datei!"
echo ""

