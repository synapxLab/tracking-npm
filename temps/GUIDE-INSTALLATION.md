# 🚀 Guide d'Installation - @synapxlab/tracking-npm

## 📋 Vue d'ensemble

Ce package permet de tracker l'utilisation de vos packages NPM de manière légère et non-intrusive.

---

## 🔑 ÉTAPE 1 : Obtenir votre clé d'authentification

### Sur Synapx.fr :

1. **Connexion** : Allez sur https://synapx.fr/OAuth/
2. **Authentification** : Connectez-vous via GitHub (gratuit & rapide)
3. **Créer un tracking** :
   - Allez dans la section **"Tracking NPM"**
   - Cliquez sur **"Ajouter un package"**
   - Entrez le nom de votre package npm (ex: `mon-super-package`)
4. **Copier la clé** :
   - Le système génère automatiquement une clé de 64 caractères hexadécimaux
   - Copiez cette clé (elle ressemble à : `a1b2c3d4e5f6...`)

**Important** : Gardez cette clé en sécurité, vous en aurez besoin pour configurer le tracking.

---

## 📦 ÉTAPE 2 : Installation du package

### Dans votre projet NPM :

```bash
npm install @synapxlab/tracking-npm
```

Ou avec yarn :

```bash
yarn add @synapxlab/tracking-npm
```

---

## 💻 ÉTAPE 3 : Intégration dans votre code

### A. Si votre package est une librairie JavaScript/TypeScript

Ajoutez le tracking dans votre fichier principal (ex: `index.js`, `index.ts`) :

```javascript
import { trackingnpm } from '@synapxlab/tracking-npm';

// Votre code de librairie ici...
export function maFonction() {
  // ...
}

// Initialiser le tracking (de préférence à la fin du fichier)
trackingnpm.init({
  package_key: 'VOTRE_CLE_64_CARACTERES_ICI', // Récupérée sur synapx.fr
  version: '1.0.0'  // Version de votre package
});
```

### B. Si votre package est un composant React

```jsx
// MyComponent.jsx
import { useEffect } from 'react';
import { trackingnpm } from '@synapxlab/tracking-npm';

export function MyComponent() {
  useEffect(() => {
    trackingnpm.init({
      package_key: 'VOTRE_CLE_64_CARACTERES_ICI',
      version: '1.0.0'
    });
  }, []);

  return <div>Mon Composant</div>;
}
```

### C. Si votre package est un plugin Vue

```javascript
// plugin.js
import { trackingnpm } from '@synapxlab/tracking-npm';

export default {
  install(app) {
    // Votre logique de plugin...
    
    // Tracking
    trackingnpm.init({
      package_key: 'VOTRE_CLE_64_CARACTERES_ICI',
      version: '1.0.0'
    });
  }
};
```

---

## 🔧 ÉTAPE 4 : Configuration avancée (optionnel)

### Utiliser les variables d'environnement

**Recommandé** : Ne mettez jamais votre clé directement dans le code publié.

```javascript
// .env
VITE_SYNAPX_KEY=votre_cle_ici

// Votre code
trackingnpm.init({
  package_key: import.meta.env.VITE_SYNAPX_KEY, // Vite
  // ou
  package_key: process.env.REACT_APP_SYNAPX_KEY, // React
  // ou
  package_key: process.env.NEXT_PUBLIC_SYNAPX_KEY, // Next.js
  version: '1.0.0'
});
```

### Personnaliser le comportement

```javascript
trackingnpm.init({
  package_key: 'VOTRE_CLE',
  version: '1.0.0',
  DELAY_MS: 15000,  // Attendre 15s au lieu de 10s
  CHANCE: 0.05      // 5% de probabilité au lieu de 1%
});
```

---

## 📊 ÉTAPE 5 : Vérifier que ça fonctionne

### 1. Publier votre package

```bash
npm publish
```

### 2. Installer votre package dans un projet test

```bash
npm install votre-package
```

### 3. Utiliser votre package

Dans votre projet test, importez et utilisez votre package normalement.

### 4. Vérifier sur le dashboard

1. Retournez sur https://synapx.fr
2. Allez dans votre dashboard
3. Vous devriez voir les statistiques d'utilisation après quelques minutes

**Note** : Seul 1% des installations envoient des données (par défaut), donc il faut plusieurs utilisations pour voir les premières données.

---

## 🎯 Comment ça marche ?

### Timeline d'exécution :

```
[Installation]
    ↓
[Import du package]
    ↓
[Attente 10 secondes] ← Configurable avec DELAY_MS
    ↓
[Vérification idle browser]
    ↓
[Probabilité 1%] ← Configurable avec CHANCE
    ↓
[Envoi des données] ← Si toutes les conditions sont OK
```

### Données envoyées :

```json
{
  "package_key": "votre_cle_64_caracteres",
  "version": "1.0.0",
  "host": "example.com"
}
```

**Ce qui N'est PAS tracké** :
- ❌ Aucune donnée personnelle
- ❌ Aucune information utilisateur
- ❌ Aucun historique de navigation
- ❌ Aucune donnée sensible

---

## 🔒 Sécurité et confidentialité

### La clé est-elle sécurisée ?

Oui et non :
- ✅ La clé ne permet QUE d'envoyer des données de tracking
- ✅ Elle ne permet PAS d'accéder à votre compte Synapx
- ✅ Elle ne permet PAS de modifier vos paramètres
- ⚠️ Elle est visible côté client (c'est normal et voulu)

### Puis-je la mettre dans mon code public ?

Oui ! La clé est conçue pour être incluse dans le code client. Elle fonctionne comme une clé publique qui permet uniquement de tracker l'utilisation.

### Comment révoquer une clé ?

Sur https://synapx.fr, vous pouvez :
1. Désactiver le tracking
2. Générer une nouvelle clé
3. Supprimer un package

---

## 📈 Voir les statistiques

### Sur votre dashboard Synapx :

Vous verrez :
- 📊 Nombre d'installations
- 🌍 Domaines utilisant votre package
- 📦 Versions déployées
- 📅 Historique d'utilisation

---

## ❓ FAQ

### Q: Est-ce obligatoire pour publier mon package ?
**R:** Non, c'est complètement optionnel. Vous pouvez publier sur NPM sans tracking.

### Q: Mes utilisateurs seront-ils informés ?
**R:** Oui, indiquez-le dans votre README. La transparence est importante.

### Q: Ça ralentit mon package ?
**R:** Non, le tracking :
- Attend 10 secondes avant de s'exécuter
- S'exécute pendant l'idle du navigateur
- Ne s'exécute que 1% du temps
- Échoue silencieusement en cas d'erreur

### Q: Ça fonctionne en Node.js côté serveur ?
**R:** Oui, mais c'est surtout conçu pour le navigateur. Côté serveur, `requestIdleCallback` n'existe pas, donc ça utilise `setTimeout` comme fallback.

### Q: Je peux désactiver le tracking ?
**R:** Oui, il suffit de ne pas appeler `trackingnpm.init()` ou de retirer le package.

### Q: Combien ça coûte ?
**R:** C'est gratuit ! 🎉

---

## 🆘 Support

### Problèmes d'installation :
- Email : contact@synapx.fr
- GitHub Issues : https://github.com/synapxLab/tracking-npm/issues

### Problèmes de clé :
- Dashboard : https://synapx.fr
- Support : contact@synapx.fr

### Documentation :
- Guide complet : https://synapx.fr/sdk/Tracking_NPM/
- NPM : https://www.npmjs.com/package/@synapxlab/tracking-npm

---

## ✅ Checklist finale

Avant de publier votre package avec le tracking :

- [ ] Clé obtenue sur synapx.fr
- [ ] Package `@synapxlab/tracking-npm` installé
- [ ] Code de tracking ajouté dans votre package
- [ ] Clé configurée (via variable d'environnement de préférence)
- [ ] Version du package configurée
- [ ] Testé en local
- [ ] Mentionné dans le README de votre package (transparence)
- [ ] Publié sur NPM

---

🎉 **Félicitations !** Votre package est maintenant prêt avec le tracking Synapx !

---

Fait avec ❤️ par [Synapx Lab](https://synapx.fr)
