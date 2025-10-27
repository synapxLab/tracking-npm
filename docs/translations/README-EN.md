# 🛰️ @synapxlab/tracking-npm

[![npm version](https://img.shields.io/npm/v/@synapxlab/tracking-npm.svg)](https://www.npmjs.com/package/@synapxlab/tracking-npm) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Track the real-world usage of your NPM package in production.
Complete list of **domains** using your package.

## 📦 Installation

### 1️⃣ Get your installation key

1. Log in to **https://synapx.fr/OAuth/** via GitHub (free & quick)
2. In the **"Tracking NPM"** section, add your npm package name
3. Copy the generated JS code with your key (64 hexadecimal characters)

### 2️⃣ JS code and installation key available to copy/paste

```bash
npm install @synapxlab/tracking-npm
```

### 3️⃣ Paste into your library

Example output:

```javascript
import { trackingnpm } from '@synapxlab/tracking-npm';

trackingnpm.init({
  package_key: 'YOUR_64_CHAR_KEY_HERE', // generated on synapx.fr
  version: '1.0.0'
});
```

### Advanced configuration

```javascript
trackingnpm.init({
  package_key: 'your-64-char-key',
  version: '1.0.0',
  DELAY_MS: 15000,  // Wait 15 seconds instead of 10
  CHANCE: 0.05      // 5% probability instead of 1%
});
```

## 📝 Documentation to add to your README

Inform your users that you use this tracker:

```markdown
## Tracking
This package integrates @synapxlab/tracking-npm to collect 
anonymous statistics about `your package name`.
```

## ✨ How does it work?

- **⏱️ Delayed execution**: Waits 10 seconds before executing
- **🎯 Idle detection**: Uses `requestIdleCallback` (1s fallback)
- **📊 Probabilistic sampling**: 1% execution chance by default (configurable)
- **🪶 Zero dependencies**: Lightweight and standalone **1kb**
- **🔒 Privacy-focused**: Only tracks package version and domain
- **⚡ Non-blocking**: Never impacts your application performance
- **⚡ Tracking**: Sends a lightweight POST to `https://npm.synapx.fr` **< 20ms**

**What is tracked**:

- ✅ Domain name (host)

**What is NOT tracked**:

- ❌ No personal data
- ❌ No user information
- ❌ No browsing history
- ❌ No sensitive data

## 🔒 Privacy and security

- ✅ CORS-enabled endpoint
- ✅ No cookies
- ✅ No localStorage
- ✅ Open source
- ✅ Minimal data collection
- ✅ Respects user privacy

## 📊 View your statistics

1. Log in to **https://synapx.fr**
2. Access your dashboard
3. View your package statistics:
   - 📈 Number of installations
   - 🌍 Domains using your package and the production version


### 📦 Download
File name : `PakageName.json`
```json
{
  "package": "@synapxlab/cookie-consent",
  "sk_live": "8c0cf425d8bf3a7a5591d41916ba4357bf5f48d6ea5fe9e5e5c6ab98eb7cec7c",
  "total_hosts": 2,
  "hosts": [
    {
      "host": "example.com",
      "version": "2.1.3",
      "last_ping": "2025-10-27 09:12:00",
      "total_pings": 5
    },
    {
      "host": "another-site.fr",
      "version": "2.1.3",
      "last_ping": "2025-10-27 09:12:00",
      "total_pings": 15
    }
  ]
}

```
>    The fields last_ping and total_pings are essential for intelligently adjusting the ping frequency on the client side (scaling, delay, etc.).
>   The goal is to achieve a stable configuration with about one ping per week per domain — enough to ensure reliable statistics without creating unnecessary load.
> 
> ⏳ Data is automatically deleted after 90 days to comply with data minimization principles and GDPR requirements.



## ❓ FAQ

### Does tracking slow down my application?

No!

- Waits 10 seconds before executing
- Executes during browser idle time
- Only executes in 1% of cases
- Fails silently without impacting your code

### Should my users be informed?

Yes! For transparency, mention the use of the tracker in your README.

### Is it compatible with all frameworks?

Yes!

- ✅ React / Next.js / Remix
- ✅ Vue / Nuxt
- ✅ Angular
- ✅ Svelte / SvelteKit
- ✅ Vanilla JavaScript
- ✅ Node.js (with fallback)

### How much does it cost?

It's free! 🎉

## 🔧 Support

- Dashboard: https://synapx.fr
- Support: [contact@synapx.fr](mailto:contact@synapx.fr)

### Documentation

- Complete guide: https://synapx.fr/sdk/Tracking_NPM/
- NPM: https://www.npmjs.com/package/@synapxlab/tracking-npm
- 🐙 [GitHub Repository](https://github.com/synapxLab/tracking-npm)
- 📦 [NPM Package](https://www.npmjs.com/package/@synapxlab/tracking-npm)
- 🔑 [Get a key](https://synapx.fr/OAuth/)
- 📊 [Dashboard](https://synapx.fr/)

## 📄 License

MIT © [Synapx Lab](https://synapx.fr/)
