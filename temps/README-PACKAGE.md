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

```bash
npm install @synapxlab/tracking-npm
```

## 🚀 Quick Start

```javascript
import { trackingnpm } from '@synapxlab/tracking-npm';

trackingnpm.init({
  package_key: 'your-64-char-hex-key',
  version: '1.0.0'
});
```

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
| `package_key` | `string` | `null` | Your 64-character tracking key |
| `version` | `string` | `null` | Your package version |
| `DELAY_MS` | `number` | `10000` | Delay before execution (ms) |
| `CHANCE` | `number` | `0.01` | Execution probability (0.01 = 1%) |

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
