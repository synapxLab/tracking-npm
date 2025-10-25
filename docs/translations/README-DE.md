# 🛰️ @synapxlab/tracking-npm

[![npm version](https://img.shields.io/npm/v/@synapxlab/tracking-npm.svg)](https://www.npmjs.com/package/@synapxlab/tracking-npm) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Verfolgen Sie die reale Nutzung Ihres NPM-Pakets in der Produktion.
Vollständige Liste der **Domains**, die Ihr Paket verwenden.

## 📦 Installation

### 1️⃣ Holen Sie sich Ihren Installationsschlüssel

1. Melden Sie sich bei **https://synapx.fr/OAuth/** über GitHub an (kostenlos & schnell)
2. Fügen Sie im Bereich **"Tracking NPM"** den Namen Ihres npm-Pakets hinzu
3. Kopieren Sie den generierten JS-Code mit Ihrem Schlüssel (64 Hexadezimalzeichen)

### 2️⃣ JS-Code und Installationsschlüssel zum Kopieren/Einfügen verfügbar

```bash
npm install @synapxlab/tracking-npm
```

### 3️⃣ In Ihre Bibliothek einfügen

Beispielausgabe:

```javascript
import { trackingnpm } from '@synapxlab/tracking-npm';

trackingnpm.init({
  package_key: 'IHR_64_ZEICHEN_SCHLÜSSEL_HIER', // generiert auf synapx.fr
  version: '1.0.0'
});
```

### Erweiterte Konfiguration

```javascript
trackingnpm.init({
  package_key: 'ihr-64-zeichen-schlüssel',
  version: '1.0.0',
  DELAY_MS: 15000,  // 15 Sekunden statt 10 warten
  CHANCE: 0.05      // 5% Wahrscheinlichkeit statt 1%
});
```

## 📝 Dokumentation für Ihre README

Informieren Sie Ihre Benutzer, dass Sie diesen Tracker verwenden:

```markdown
## Tracking
Dieses Paket integriert @synapxlab/tracking-npm zur Erfassung 
anonymer Statistiken über `Ihr Paketname`.
```

## ✨ Wie funktioniert es?

- **⏱️ Verzögerte Ausführung**: Wartet 10 Sekunden vor der Ausführung
- **🎯 Leerlauferkennung**: Verwendet `requestIdleCallback` (1s Fallback)
- **📊 Probabilistische Stichprobe**: 1% Ausführungswahrscheinlichkeit standardmäßig (konfigurierbar)
- **🪶 Keine Abhängigkeiten**: Leicht und eigenständig **1kb**
- **🔒 Datenschutzorientiert**: Verfolgt nur Paketversion und Domain
- **⚡ Nicht blockierend**: Beeinträchtigt niemals die Leistung Ihrer Anwendung
- **⚡ Tracking**: Sendet einen leichten POST an `https://npm.synapx.fr` **< 20ms**

**Was wird verfolgt**:

- ✅ Domainname (Host)

**Was wird NICHT verfolgt**:

- ❌ Keine persönlichen Daten
- ❌ Keine Benutzerinformationen
- ❌ Kein Browserverlauf
- ❌ Keine sensiblen Daten

## 🔒 Datenschutz und Sicherheit

- ✅ CORS-aktivierter Endpunkt
- ✅ Keine Cookies
- ✅ Kein localStorage
- ✅ Open Source
- ✅ Minimale Datenerfassung
- ✅ Respektiert die Privatsphäre der Benutzer

## 📊 Sehen Sie Ihre Statistiken

1. Melden Sie sich bei **https://synapx.fr** an
2. Greifen Sie auf Ihr Dashboard zu
3. Sehen Sie die Statistiken Ihrer Pakete ein:
   - 📈 Anzahl der Installationen
   - 🌍 Domains, die Ihr Paket verwenden, und die Produktionsversion

## ❓ FAQ

### Verlangsamt das Tracking meine Anwendung?

Nein!

- Wartet 10 Sekunden vor der Ausführung
- Wird während der Browser-Leerlaufzeit ausgeführt
- Wird nur in 1% der Fälle ausgeführt
- Schlägt stillschweigend fehl, ohne Ihren Code zu beeinträchtigen

### Sollten meine Benutzer informiert werden?

Ja! Aus Transparenzgründen erwähnen Sie die Verwendung des Trackers in Ihrer README.

### Ist es mit allen Frameworks kompatibel?

Ja!

- ✅ React / Next.js / Remix
- ✅ Vue / Nuxt
- ✅ Angular
- ✅ Svelte / SvelteKit
- ✅ Vanilla JavaScript
- ✅ Node.js (mit Fallback)

### Wie viel kostet es?

Es ist kostenlos! 🎉

## 🔧 Support

- Dashboard: https://synapx.fr
- Support: [contact@synapx.fr](mailto:contact@synapx.fr)

### Dokumentation

- Vollständige Anleitung: https://synapx.fr/sdk/Tracking_NPM/
- NPM: https://www.npmjs.com/package/@synapxlab/tracking-npm
- 🐙 [GitHub Repository](https://github.com/synapxLab/tracking-npm)
- 📦 [NPM-Paket](https://www.npmjs.com/package/@synapxlab/tracking-npm)
- 🔑 [Schlüssel erhalten](https://synapx.fr/OAuth/)
- 📊 [Dashboard](https://synapx.fr/)

## 📄 Lizenz

MIT © [Synapx Lab](https://synapx.fr/)
