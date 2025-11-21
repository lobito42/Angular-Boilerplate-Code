#!/bin/bash

echo "🚀 NUR Angular-Boilerplate zu GitHub hochladen"
echo "=============================================="
echo ""

# Zeige was hochgeladen wird
echo "📦 Folgende Dateien werden hochgeladen:"
echo ""
git status --short | wc -l | xargs echo "Anzahl Dateien:"
echo ""

# Commit erstellen
echo "[1/3] Erstelle Commit..."
git commit -m "Initial commit: Angular Full-Stack Boilerplate with fixed versions"

# Remote hinzufügen
echo ""
echo "[2/3] Verbinde mit GitHub Repository..."
echo ""
echo "⚠️  WICHTIG: Erstelle zuerst ein LEERES Repository auf GitHub:"
echo "   👉 https://github.com/new"
echo "   Name: z.B. 'angular-boilerplate'"
echo "   ❌ NICHTS anhaken (kein README, kein .gitignore)"
echo ""
read -p "Repository URL eingeben: " REPO_URL

if [ -z "$REPO_URL" ]; then
    echo "❌ Keine URL eingegeben!"
    exit 1
fi

git remote add origin "$REPO_URL"

# Hochladen
echo ""
echo "[3/3] Lade NUR dieses Projekt hoch..."
git push -u origin main

echo ""
echo "✅ Fertig! Nur das Angular-Boilerplate wurde hochgeladen!"
echo "   $REPO_URL"
echo ""
echo "📝 Hinweis: Beim ersten Push werden deine GitHub Credentials abgefragt:"
echo "   - Username: dein GitHub Username"
echo "   - Password: Personal Access Token (https://github.com/settings/tokens)"
echo ""

