# 🔗 Mit GitHub verbinden

## Option 1: Kommandozeile (Empfohlen)

### Schritt 1: Repository auf GitHub erstellen
1. Gehe zu https://github.com/new
2. Repository Name: z.B. `angular-boilerplate`
3. **WICHTIG:** Nichts anhaken (kein README, kein .gitignore)
4. Klicke "Create repository"

### Schritt 2: Lokalen Code hochladen

**Wichtig:** Ersetze `DEIN-USERNAME` mit deinem GitHub Benutzernamen!

```bash
# Im Projektverzeichnis (angular-bolier-plate/)
cd /Users/wolfgang/code/angular-bolier-plate

# Alle Änderungen hinzufügen
git add .

# Commit erstellen
git commit -m "Initial commit: Angular Full-Stack Boilerplate"

# Mit GitHub verbinden (ERSETZE DEIN-USERNAME!)
git remote add origin https://github.com/DEIN-USERNAME/angular-boilerplate.git

# Hochladen
git push -u origin main
```

### Schritt 3: GitHub Login
Beim ersten `git push` wirst du nach deinen GitHub Credentials gefragt:
- **Username:** Dein GitHub Username
- **Password:** Verwende einen **Personal Access Token** (siehe unten)

---

## Option 2: GitHub Desktop (Grafisch)

1. Lade **GitHub Desktop** herunter: https://desktop.github.com/
2. Installiere und logge dich ein
3. Klicke **"Add" → "Add Existing Repository"**
4. Wähle den Ordner: `/Users/wolfgang/code/angular-bolier-plate`
5. Klicke **"Publish repository"**
6. Wähle einen Namen und klicke **"Publish"**

---

## 🔑 Personal Access Token erstellen

GitHub benötigt seit 2021 einen **Personal Access Token** statt Passwort:

### Token erstellen:
1. Gehe zu https://github.com/settings/tokens
2. Klicke **"Generate new token" → "Generate new token (classic)"**
3. Name: z.B. "Angular Boilerplate"
4. Wähle Ablaufdatum: z.B. 90 Tage
5. **Wichtig:** Hake an: **`repo`** (alle Unterpunkte)
6. Klicke **"Generate token"**
7. **KOPIERE DEN TOKEN SOFORT** (wird nur einmal angezeigt!)

### Token verwenden:
Beim `git push` nach **Password** gefragt → Token einfügen (nicht dein GitHub Passwort!)

---

## 🔧 Häufige Probleme

### Problem: "remote origin already exists"
```bash
# Entferne altes remote und füge neues hinzu
git remote remove origin
git remote add origin https://github.com/DEIN-USERNAME/angular-boilerplate.git
git push -u origin main
```

### Problem: "src refspec main does not exist"
```bash
# Branch ist vielleicht "master" statt "main"
git branch -M main
git push -u origin main
```

### Problem: "Authentication failed"
- Verwende **Personal Access Token**, nicht dein Passwort
- Token erstellen: https://github.com/settings/tokens

---

## ✅ Erfolgreich hochgeladen?

Nach dem Push kannst du dein Repository sehen:
```
https://github.com/DEIN-USERNAME/angular-boilerplate
```

### Kollegen können jetzt clonen:
```bash
git clone https://github.com/DEIN-USERNAME/angular-boilerplate.git
cd angular-boilerplate
setup-windows.bat    # oder setup-mac-linux.sh
```

---

## 📝 Nächste Änderungen hochladen

Nach weiteren Änderungen:
```bash
git add .
git commit -m "Beschreibung der Änderungen"
git push
```

---

**Viel Erfolg! 🚀**

