# 🛰️ @synapxlab/tracking-npm

[![npm version](https://img.shields.io/npm/v/@synapxlab/tracking-npm.svg)](https://www.npmjs.com/package/@synapxlab/tracking-npm) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Rastrea el uso real de tu paquete NPM en producción.
Lista completa de **dominios** que utilizan tu paquete.

## 📦 Instalación

### 1️⃣ Obtén tu clave de instalación

1. Inicia sesión en **https://synapx.fr/OAuth/** via GitHub (gratis y rápido)
2. En la sección **"Tracking NPM"**, añade el nombre de tu paquete npm
3. Copia el código JS generado con tu clave (64 caracteres hexadecimales)

### 2️⃣ Código JS y clave de instalación disponible para copiar/pegar

```bash
npm install @synapxlab/tracking-npm
```

### 3️⃣ Pega en tu librería

Ejemplo de salida:

```javascript
import { trackingnpm } from '@synapxlab/tracking-npm';

trackingnpm.init({
  package_key: 'TU_CLAVE_64_CARACTERES_AQUI', // generada en synapx.fr
  version: '1.0.0'
});
```

### Configuración avanzada

```javascript
trackingnpm.init({
  package_key: 'tu-clave-64-caracteres',
  version: '1.0.0',
  DELAY_MS: 15000,  // Esperar 15 segundos en lugar de 10
  CHANCE: 0.05      // 5% de probabilidad en lugar de 1%
});
```

## 📝 Documentación para añadir a tu README

Informa a tus usuarios que utilizas este rastreador:

```markdown
## Tracking
Este paquete integra @synapxlab/tracking-npm para recopilar 
estadísticas anónimas sobre `el nombre de tu paquete`.
```

## ✨ ¿Cómo funciona?

- **⏱️ Ejecución retrasada**: Espera 10 segundos antes de ejecutarse
- **🎯 Detección de inactividad**: Usa `requestIdleCallback` (fallback a 1s)
- **📊 Muestreo probabilístico**: 1% de probabilidad de ejecución por defecto (configurable)
- **🪶 Cero dependencias**: Ligero y autónomo **1kb**
- **🔒 Enfocado en la privacidad**: Solo rastrea la versión del paquete y el dominio
- **⚡ No bloqueante**: Nunca impacta el rendimiento de tu aplicación
- **⚡ Tracking**: Envía un POST ligero a `https://npm.synapx.fr` **< 20ms**

**Lo que se rastrea**:

- ✅ Nombre de dominio (host)

**Lo que NO se rastrea**:

- ❌ Ningún dato personal
- ❌ Ninguna información de usuario
- ❌ Ningún historial de navegación
- ❌ Ningún dato sensible

## 🔒 Privacidad y seguridad

- ✅ Endpoint con CORS activado
- ✅ Sin cookies
- ✅ Sin localStorage
- ✅ Código abierto
- ✅ Recopilación mínima de datos
- ✅ Respeta la privacidad del usuario

## 📊 Ver tus estadísticas

1. Inicia sesión en **https://synapx.fr**
2. Accede a tu panel de control
3. Consulta las estadísticas de tus paquetes:
   - 📈 Número de instalaciones
   - 🌍 Dominios que utilizan tu paquete y la versión en producción

## ❓ FAQ

### ¿El tracking ralentiza mi aplicación?

¡No!

- Espera 10 segundos antes de ejecutarse
- Se ejecuta durante el tiempo de inactividad del navegador
- Solo se ejecuta en el 1% de los casos
- Falla silenciosamente sin impactar tu código

### ¿Deben ser informados mis usuarios?

¡Sí! Por transparencia, menciona el uso del rastreador en tu README.

### ¿Es compatible con todos los frameworks?

¡Sí!

- ✅ React / Next.js / Remix
- ✅ Vue / Nuxt
- ✅ Angular
- ✅ Svelte / SvelteKit
- ✅ Vanilla JavaScript
- ✅ Node.js (con fallback)

### ¿Cuánto cuesta?

¡Es gratis! 🎉

## 🔧 Soporte

- Panel de control: https://synapx.fr
- Soporte: [contact@synapx.fr](mailto:contact@synapx.fr)

### Documentación

- Guía completa: https://synapx.fr/sdk/Tracking_NPM/
- NPM: https://www.npmjs.com/package/@synapxlab/tracking-npm
- 🐙 [Repositorio GitHub](https://github.com/synapxLab/tracking-npm)
- 📦 [Paquete NPM](https://www.npmjs.com/package/@synapxlab/tracking-npm)
- 🔑 [Obtener una clave](https://synapx.fr/OAuth/)
- 📊 [Panel de control](https://synapx.fr/)

## 📄 Licencia

MIT © [Synapx Lab](https://synapx.fr/)
