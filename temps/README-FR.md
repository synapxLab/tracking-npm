
# 🛰️ @synapxlab/tracking-npm

[![npm version](https://img.shields.io/npm/v/@synapxlab/tracking-npm.svg)](https://www.npmjs.com/package/@synapxlab/tracking-npm) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Tracker l'utilisation réelle de votre package NPM en production.
Liste complète des  **domaines**  qui utilisant votre package.

## 📦 Installation

### 1️⃣ Obtenir votre clé d’instalation
1.  Connectez-vous sur **https://synapx.fr/OAuth/** via GitHub (gratuit & rapide)
2.  Dans la section **"Tracking NPM"**, ajoutez le nom de votre package npm
3.  Copiez le code JS généré avec votre clé (64 caractères hexadécimaux)

### 2️⃣ Le code JS et la clef d'instalation dispo en copier/collé
```bash
npm install @synapxlab/tracking-npm
```
### 3️⃣ A collé  à votre librairie.
Exemple de sortie
```javascript
import { trackingnpm } from '@synapxlab/tracking-npm';
trackingnpm.init({
  package_key: 'VOTRE_CLE_64_CARACTERES_ICI', // générée sur synapx.fr
  version: '1.0.0'
});
```
```
### Configuration avancée
```javascript
trackingnpm.init({
  package_key: 'votre-clé-64-caractères',
  version: '1.0.0',
  DELAY_MS: 15000,  // Attendre 15 secondes au lieu de 10
  CHANCE: 0.05      // 5% de probabilité au lieu de 1%
});
**Retour :** `void`

```

## 📝 Documentation à ajouter dans votre README

```
Informez vos utilisateurs que vous utilisez ce tracker :
```markdown
## Tracking
Ce package intègre @synapxlab/tracking-npm afin de collecter des 
statistiques anonymes sur `le nom de votre package`.
```

## ✨ Comment ça fonctionne ?

-   **⏱️ Exécution différée** : Attend 10 secondes avant de s'exécuter
-   **🎯 Détection d'inactivité** : Utilise `requestIdleCallback` (fallback à 1s)
-   **📊 Échantillonnage probabiliste** : 1% de chance d'exécution par défaut (configurable)
-   **🪶 Zéro dépendance** : Léger et autonome **1ko**.
-   **🔒 Respect de la vie privée** : Ne track que la version du package et le domaine
-   **⚡ Non-bloquant** : N'impacte jamais les performances de votre application
-   **⚡ Tracking** : Envoie un POST léger vers `https://npm.synapx.fr`  **< 20ms**


**Ce qui est tracké** :

-   ✅ Nom de domaine (host)

**Ce qui N'est PAS tracké** :
-   ❌ Aucune donnée personnelle
-   ❌ Aucune information utilisateur
-   ❌ Aucun historique de navigation
-   ❌ Aucune donnée sensible

## 🔒 Confidentialité et sécurité

-   ✅ Endpoint avec CORS activé
-   ✅ Pas de cookies
-   ✅ Pas de localStorage
-   ✅ Open source
-   ✅ Collecte minimale de données
-   ✅ Respecte la vie privée des utilisateurs

## 📊 Voir vos statistiques

1.  Connectez-vous sur **https://synapx.fr**
2.  Accédez à votre dashboard
3.  Consultez les statistiques de vos packages :
    -   📈 Nombre d'installations
    -   🌍 Domaines utilisant votre package et la version en production
 
  
## ❓ FAQ

### Le tracking ralentit-il mon application ?  Non !
-   Attend 10 secondes avant de s'exécuter
-   S'exécute pendant l'idle du navigateur
-   Ne s'exécute que dans 1% des cas
-   Échoue silencieusement sans impacter votre code

### Mes utilisateurs doivent-ils être informés ? Oui !
 par transparence, mentionnez l'utilisation du tracker dans votre README.

### Est-ce compatible avec tous les frameworks ? Oui !
-   ✅ React / Next.js / Remix
-   ✅ Vue / Nuxt
-   ✅ Angular
-   ✅ Svelte / SvelteKit
-   ✅ Vanilla JavaScript
-   ✅ Node.js (avec fallback)

### Combien ça coûte ?
C'est gratuit ! 🎉

## 🔧 Support

-   Dashboard : https://synapx.fr
-   Support : [contact@synapx.fr](mailto:contact@synapx.fr)

### Documentation FR
-   Guide complet : https://synapx.fr/sdk/Tracking_NPM/
-   NPM : https://www.npmjs.com/package/@synapxlab/tracking-npm
-   🐙 [Repository GitHub](https://github.com/synapxLab/tracking-npm)
-   📦 [Package NPM](https://www.npmjs.com/package/@synapxlab/tracking-npm)
-   🔑 [Obtenir une clé](https://synapx.fr/OAuth/)
-   📊 [Dashboard](https://synapx.fr/)
- 
## 📄 Licence

MIT © [Synapx Lab](https://synapx.fr/)