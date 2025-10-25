# 🛰️ @synapxlab/tracking-npm

[![npm version](https://img.shields.io/npm/v/@synapxlab/tracking-npm.svg)](https://www.npmjs.com/package/@synapxlab/tracking-npm)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Lightweight NPM package usage tracker with minimal performance impact.

## ✨ Features

- **⏱️ Delayed Execution**: Waits 10 seconds before running
- **🎯 Idle-Aware**: Uses `requestIdleCallback` (fallback to 1s timeout)
- **📊 Probabilistic Sampling**: 1% execution chance by default (configurable)
- **🪶 Zero Dependencies**: Lightweight and self-contained
- **🔒 Privacy-Focused**: Only tracks package version and host
- **⚡ Non-Blocking**: Never impacts your application performance

## 📦 Installation

### 1️⃣ Obtenir votre clé d'authentification

1. Connectez-vous sur **https://synapx.fr/OAuth/** via GitHub (gratuit & rapide)
2. Dans la section **"Tracking NPM"**, ajoutez le nom de votre package npm
3. Copiez le code JS généré avec votre clé d'authentification

### 2️⃣ Installer le package

```bash
npm install @synapxlab/tracking-npm
```

### 3️⃣ Ajouter à votre librairie

```javascript
import { trackingnpm } from '@synapxlab/tracking-npm';

// Configurez avec votre clé générée sur synapx.fr
trackingnpm.init({
  package_key: 'VOTRE_CLE_64_CARACTERES_ICI',
  version: '1.0.0'
});
```

## 🔑 Getting Your Package Key

1. Visit [Synapx OAuth](https://synapx.fr/OAuth/) and connect via GitHub (free & quick)
2. In the **"Tracking NPM"** section, add your npm package name
3. Copy the generated JS code with your authentication key (64 characters)

**Important**: This key is unique to your package and allows tracking statistics on your dashboard.

## 📖 Usage Examples

### React
```jsx
import { useEffect } from 'react';
import { trackingnpm } from '@synapxlab/tracking-npm';

function App() {
  useEffect(() => {
    trackingnpm.init({
      package_key: process.env.REACT_APP_SYNAPX_KEY,
      version: '1.0.0'
    });
  }, []);

  return <div>Your App</div>;
}
```

### Vue 3
```vue
<script setup>
import { onMounted } from 'vue';
import { trackingnpm } from '@synapxlab/tracking-npm';

onMounted(() => {
  trackingnpm.init({
    package_key: import.meta.env.VITE_SYNAPX_KEY,
    version: '1.0.0'
  });
});
</script>
```

### Next.js
```javascript
// pages/_app.js
import { useEffect } from 'react';
import { trackingnpm } from '@synapxlab/tracking-npm';

function MyApp({ Component, pageProps }) {
  useEffect(() => {
    trackingnpm.init({
      package_key: process.env.NEXT_PUBLIC_SYNAPX_KEY,
      version: '1.0.0'
    });
  }, []);

  return <Component {...pageProps} />;
}
```

## ⚙️ Configuration

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `package_key` | `string` | `null` | Your 64-character tracking key (get it on [synapx.fr/OAuth](https://synapx.fr/OAuth/)) |
| `version` | `string` | `null` | Your package version |
| `DELAY_MS` | `number` | `10000` | Delay before execution (ms) |
| `CHANCE` | `number` | `0.01` | Execution probability (0.01 = 1%) |

### Advanced Configuration

```javascript
trackingnpm.init({
  package_key: 'your-64-char-key',
  version: '1.0.0',
  DELAY_MS: 15000,  // Wait 15 seconds instead of 10
  CHANCE: 0.05      // 5% probability instead of 1%
});
```

## 🎯 How It Works

1. **Initialization**: Call `trackingnpm.init()` with your config
2. **Delay**: Waits 10 seconds (configurable)
3. **Idle Detection**: Uses `requestIdleCallback` for browser idle time
4. **Probabilistic**: Only runs 1% of the time (configurable)
5. **Tracking**: Sends lightweight POST to `https://npm.synapx.fr`

## 📊 What Gets Tracked?

```json
{
  "package_key": "your-64-char-key",
  "version": "1.2.3",
  "host": "example.com"
}
```

- **No personal data**
- **No user information**
- **Just package usage statistics**

## 🔒 Privacy & Security

- ✅ CORS-enabled endpoint
- ✅ No cookies or localStorage
- ✅ Open source
- ✅ Minimal data collection

## 📝 API Reference

### `trackingnpm.init(config)`

Initialize the tracking system.

**Parameters:**
- `config` (Object): Configuration object

**Returns:** `void`

### `trackingnpm.abort()`

Stop tracking (cleanup).

**Returns:** `void`

## 📄 License

MIT © [Synapx Lab](https://synapx.fr)

## 🔗 Links

- [Documentation](https://synapx.fr/sdk/Tracking_NPM/)
- [GitHub Repository](https://github.com/synapxLab/tracking-npm)
- [NPM Package](https://www.npmjs.com/package/@synapxlab/tracking-npm)

## 💬 Support

For support, email contact@synapx.fr

---

Made with ❤️ by [Synapx Lab](https://synapx.fr)
