# 🛰️ @synapxlab/tracking-npm

[![npm version](https://img.shields.io/npm/v/@synapxlab/tracking-npm.svg)](https://www.npmjs.com/package/@synapxlab/tracking-npm) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Traccia l'utilizzo reale del tuo pacchetto NPM in produzione.
Elenco completo dei **domini** che utilizzano il tuo pacchetto.

## 📦 Installazione

### 1️⃣ Ottieni la tua chiave di installazione

1. Accedi a **https://synapx.fr/OAuth/** tramite GitHub (gratuito e veloce)
2. Nella sezione **"Tracking NPM"**, aggiungi il nome del tuo pacchetto npm
3. Copia il codice JS generato con la tua chiave (64 caratteri esadecimali)

### 2️⃣ Codice JS e chiave di installazione disponibili per copia/incolla

```bash
npm install @synapxlab/tracking-npm
```

### 3️⃣ Incolla nella tua libreria

Esempio di output:

```javascript
import { trackingnpm } from '@synapxlab/tracking-npm';

trackingnpm.init({
  package_key: 'TUA_CHIAVE_64_CARATTERI_QUI', // generata su synapx.fr
  version: '1.0.0'
});
```

### Configurazione avanzata

```javascript
trackingnpm.init({
  package_key: 'tua-chiave-64-caratteri',
  version: '1.0.0',
  DELAY_MS: 15000,  // Aspetta 15 secondi invece di 10
  CHANCE: 0.05      // 5% di probabilità invece di 1%
});
```

## 📝 Documentazione da aggiungere al tuo README

Informa i tuoi utenti che utilizzi questo tracker:

```markdown
## Tracking
Questo pacchetto integra @synapxlab/tracking-npm per raccogliere 
statistiche anonime su `il nome del tuo pacchetto`.
```

## ✨ Come funziona?

- **⏱️ Esecuzione ritardata**: Aspetta 10 secondi prima di eseguire
- **🎯 Rilevamento inattività**: Usa `requestIdleCallback` (fallback a 1s)
- **📊 Campionamento probabilistico**: 1% di probabilità di esecuzione per impostazione predefinita (configurabile)
- **🪶 Zero dipendenze**: Leggero e autonomo **1kb**
- **🔒 Focalizzato sulla privacy**: Traccia solo la versione del pacchetto e il dominio
- **⚡ Non bloccante**: Non impatta mai le prestazioni della tua applicazione
- **⚡ Tracking**: Invia un POST leggero a `https://npm.synapx.fr` **< 20ms**

**Cosa viene tracciato**:

- ✅ Nome del dominio (host)

**Cosa NON viene tracciato**:

- ❌ Nessun dato personale
- ❌ Nessuna informazione utente
- ❌ Nessuna cronologia di navigazione
- ❌ Nessun dato sensibile

## 🔒 Privacy e sicurezza

- ✅ Endpoint con CORS abilitato
- ✅ Nessun cookie
- ✅ Nessun localStorage
- ✅ Open source
- ✅ Raccolta minima di dati
- ✅ Rispetta la privacy dell'utente

## 📊 Visualizza le tue statistiche

1. Accedi a **https://synapx.fr**
2. Accedi al tuo pannello di controllo
3. Consulta le statistiche dei tuoi pacchetti:
   - 📈 Numero di installazioni
   - 🌍 Domini che utilizzano il tuo pacchetto e la versione in produzione

## ❓ FAQ

### Il tracking rallenta la mia applicazione?

No!

- Aspetta 10 secondi prima di eseguire
- Esegue durante il tempo di inattività del browser
- Esegue solo nell'1% dei casi
- Fallisce silenziosamente senza impattare il tuo codice

### I miei utenti devono essere informati?

Sì! Per trasparenza, menziona l'uso del tracker nel tuo README.

### È compatibile con tutti i framework?

Sì!

- ✅ React / Next.js / Remix
- ✅ Vue / Nuxt
- ✅ Angular
- ✅ Svelte / SvelteKit
- ✅ Vanilla JavaScript
- ✅ Node.js (con fallback)

### Quanto costa?

È gratis! 🎉

## 🔧 Supporto

- Dashboard: https://synapx.fr
- Supporto: [contact@synapx.fr](mailto:contact@synapx.fr)

### Documentazione

- Guida completa: https://synapx.fr/sdk/Tracking_NPM/
- NPM: https://www.npmjs.com/package/@synapxlab/tracking-npm
- 🐙 [Repository GitHub](https://github.com/synapxLab/tracking-npm)
- 📦 [Pacchetto NPM](https://www.npmjs.com/package/@synapxlab/tracking-npm)
- 🔑 [Ottieni una chiave](https://synapx.fr/OAuth/)
- 📊 [Dashboard](https://synapx.fr/)

## 📄 Licenza

MIT © [Synapx Lab](https://synapx.fr/)
