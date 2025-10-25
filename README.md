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
