# Angular Full-Stack Boilerplate

Stabiles Boilerplate mit fixierten Versionen für Code-Challenges.

## ⚡ Setup (2 Befehle)

**Windows:**
```cmd
setup-windows.bat
start-windows.bat
```

**Mac/Linux:**
```bash
chmod +x setup-mac-linux.sh && ./setup-mac-linux.sh
```

**Fertig!** Backend läuft auf http://localhost:3000, Frontend auf http://localhost:4200

## 📋 Voraussetzungen

- Node.js 20.x von https://nodejs.org/
- Sonst nichts!

## 🎯 Was ist enthalten?

- **Angular 18** mit AG Grid (fixierte Versionen)
- **NestJS 10** Backend (fixierte Versionen)
- **SQLite** Datenbank (keine Installation nötig)
- VS Code Konfiguration (Linting, Formatting)
- Setup-Scripts für Windows/Mac/Linux

## 🗄️ Datenbank wechseln (optional)

Standard ist SQLite. Für MongoDB oder PostgreSQL in `.env` ändern:
```env
DB_TYPE=mongodb    # oder postgresql
```

## 📦 Was passiert beim Setup?

1. Prüft Node.js Installation
2. Erstellt `.env` von `.env.example`
3. Installiert Dependencies (Backend + Frontend)
4. Fertig!

## 🐛 Probleme?

**Port bereits belegt:**
- Backend (3000): Anderes Programm beenden
- Frontend (4200): Anderes Programm beenden

**"Node.js nicht gefunden":**
- Node.js 20.x installieren von https://nodejs.org/

**Dependencies-Fehler:**
```bash
cd backend && rm -rf node_modules && npm install
cd frontend && rm -rf node_modules && npm install
```

## 📁 Struktur

```
├── frontend/          # Angular 18
├── backend/           # NestJS 10
├── .env.example       # Environment Template
├── setup-windows.bat  # Windows Setup
└── setup-mac-linux.sh # Mac/Linux Setup
```

## ✅ Warum fixierte Versionen?

Alle Pakete haben exakte Versionen (ohne `^` oder `~`).
**Ergebnis:** Jeder bekommt die gleiche Umgebung, keine Überraschungen!

---

**Viel Erfolg bei der Code-Challenge! 🚀**
