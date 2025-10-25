# 🔍 Tracking NPM

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![npm version](https://badge.fury.io/js/@synapxlab%2Ftracking-npm.svg)](https://www.npmjs.com/package/@synapxlab/tracking-npm)
[![Downloads](https://img.shields.io/npm/dm/@synapxlab/tracking-npm.svg)](https://www.npmjs.com/package/@synapxlab/tracking-npm)
[![RGPD Compliant](https://img.shields.io/badge/RGPD-Compliant-green.svg)](https://gdpr.eu/)

> Découvrez qui utilise réellement votre librairie JavaScript en production

**Tracking NPM** vous permet de savoir quels sites web utilisent votre package, avec quelle version, et depuis quand. Fini les statistiques de téléchargement NPM approximatives !

[🌐 Site officiel](https://synapx.fr/sdk/version-checker/) | [📚 Documentation](https://docs.synapx.fr/tracking-npm) | [🧪 Démo en ligne](https://version.synapx.fr/test.html)

---

## 🤷 Le problème

Vous publiez sur NPM. Vous avez des statistiques de téléchargements, mais **vous ne savez pas vraiment** :

- 🤷 **Qui utilise réellement votre package en production ?**
- 🌐 **Sur quels sites web il tourne ?**
- 📊 **Quelles versions sont déployées sur le terrain ?**
- ⚠️ **Combien de sites utilisent des versions obsolètes ?**

> **Les statistiques NPM ne montrent que les téléchargements, pas l'usage réel !**  
> Un `npm install` ne signifie pas que le code tourne en production. Les CI/CD, bots et installations de développement gonflent artificiellement les chiffres.

---

## ✅ La solution

**Tracking NPM** est un système léger et automatique qui vous donne une **visibilité complète** sur l'utilisation réelle de votre librairie JavaScript dans les navigateurs.

### 📦 Ce que vous obtenez

#### 📍 Tracking d'usage réel
- Liste complète des **domaines** utilisant votre librairie
- Logs basés sur l'origine (`REMOTE_ADDR`)
- Statistiques d'usage **réelles**, pas juste des téléchargements

#### 📊 Visibilité sur les versions
- Quelle version tourne sur quel site
- Dashboard centralisé de toutes les installations
- Détection automatique des versions obsolètes

#### 🎯 Gestion intelligente
- Notifications email automatiques sur nouveau domaine
- Alertes dans la console développeur
- Blocage conditionnel de fonctionnalités
- Adaptation comportementale du code

---

## 🚀 Installation rapide

### 1️⃣ Installer le package

```bash
npm install @synapxlab/tracking-npm
```

### 2️⃣ Ajouter à votre librairie

```javascript
import '@synapxlab/tracking-npm/version-checker.js';

// Configurez pour votre package
if (window.TrackingNPM) {
  window.TrackingNPM.version = '2.4.0';
  window.TrackingNPM.npm = '@votre-scope/votre-package';
}
```

### 3️⃣ C'est tout !

Le reste est automatique. Les sites utilisant votre librairie seront détectés et affichés dans votre dashboard.

> **Note :** Connectez-vous sur [synapx.fr](https://synapx.fr) pour accéder à votre dashboard et gérer vos packages trackés.

---

## 💼 Cas d'usage concrets

### 🎨 Librairie de composants UI
> "Je maintiens une librairie React avec 500+ sites en prod. Grâce à Tracking NPM, j'ai pu identifier que 35% utilisaient encore une version avec une faille de sécurité. Emails envoyés automatiquement, 95% ont migré en 2 semaines."

### 💳 SDK de paiement
> "Pour des raisons de conformité PCI-DSS, je dois forcer la mise à jour. Tracking NPM me permet de bloquer les vieilles versions et d'afficher un message de migration."

### 🍪 Widget embarqué
> "Mon package tourne sur 10,000+ sites. Les stats NPM sont inutiles (bots, CI/CD). Maintenant je sais exactement qui utilise quoi."

### 🌟 Librairie open-source
> "J'ai découvert que mon package tournait sur des sites gouvernementaux et Fortune 500 ! Parfait pour le portfolio et trouver des sponsors."

---

## 🔧 Comment ça marche ?

### Fonctionnement discret

- ⚡ **Non-bloquant** : s'exécute en idle time
- 🎲 **Échantillonnage** : seulement 10% des visiteurs (configurable)
- ⏱️ **Différé** : attend 10 secondes après le chargement
- 🚫 **Respectueux** : s'annule si l'onglet se ferme

### Backend intelligent

- 🔄 Récupère automatiquement la dernière version depuis **NPM Registry**
- 💾 Système de cache pour ne pas surcharger NPM
- 📊 Stockage en base de données
- 🎛️ Dashboard de visualisation

### Exemple de découverte

**Jour 1 :** Le site `example.com` installe votre librairie v2.4.0
- Le site reçoit 10,000 visiteurs
- 10% font le check (1,000 tentatives)
- ~30% annulés (page fermée rapidement) = 700 checks effectifs
- **Résultat : Le site est détecté en quelques minutes !**

**Jours suivants :** Pas besoin de re-détecter 700 fois/jour
- Le domaine est déjà en base de données
- Les pings occasionnels (10%) vérifient que le site est toujours actif

**Après 1 semaine sans ping :**
- Le site est marqué "inactif" ou "désinstallé"
- Votre dashboard affiche les sites vraiment actifs

---

## ⚡ Performance & Scalabilité

### Impact minimal

- **~3KB** gzippé pour le checker
- **0ms** de blocking time (idle execution)
- **10% sampling** par défaut = 90% des visiteurs non impactés
- **10 secondes** d'attente minimum avant le check
- **Impossible de faire planter ou ralentir votre package**

### Scalable

| Taille du site | Visiteurs/jour | Temps de découverte |
|----------------|----------------|---------------------|
| Petit blog     | 100            | < 1 heure           |
| Site moyen     | 1,000          | < 10 minutes        |
| Gros site      | 10,000         | < 1 minute          |
| Très gros site | 100,000+       | Instantané          |

---

## 🎯 Fonctionnalités avancées

### 1️⃣ Notifications email automatiques
- Email envoyé au propriétaire du site quand sa version est obsolète
- Rappels programmés (1x par semaine maximum)
- Messages personnalisables avec liens de migration

### 2️⃣ Alertes dans le code
- Warnings en console pour les développeurs
- Messages personnalisés selon le niveau de criticité
- Alertes visuelles dans l'interface (optionnel)

### 3️⃣ Blocage conditionnel
- Désactivez certaines fonctionnalités pour les vieilles versions
- Mode maintenance global
- Forcez la mise à jour pour des raisons de sécurité

---

## 🔒 Respect de la vie privée

### ✅ RGPD-friendly

- ❌ Pas de cookies
- ❌ Pas de tracking utilisateur
- ❌ Pas d'IP personnelle stockée
- ✅ Seulement le domaine du site (information publique)
- ✅ Données anonymes et agrégées

### 🔐 Sécurité

- ✅ HTTPS uniquement
- ✅ Headers CORS configurables
- ✅ Rate limiting côté serveur
- ✅ Pas d'exécution de code distant

> **Conformité légale :** Aucune donnée personnelle collectée. Le domaine d'un site web est une information publique (DNS). Pas besoin de consentement RGPD.

---

## ⚙️ Configuration avancée

### Personnaliser l'échantillonnage

```javascript
window.TrackingNPM = {
  version: '2.4.0',
  npm: '@votre/package',
  chance: 0.05,     // 5% au lieu de 10%
  delay: 15000,     // 15 secondes au lieu de 10
  enabled: true     // Activer/désactiver
};
```

### Adapter le comportement

```javascript
// Vérifier si une mise à jour est disponible
if (window.TrackingNPM.updateAvailable) {
  console.warn('Une nouvelle version est disponible !');
}

// Version détectée obsolète
if (window.TrackingNPM.isOutdated) {
  showUpdateBanner();
}
```

---

## 🛠️ Développement

### Cloner le projet

```bash
git clone https://github.com/synapxLab/tracking_npm.git
cd TrackingNPM
npm install
```

### Scripts disponibles

```bash
npm run dev      # Serveur de développement
npm run build    # Build de production
npm test         # Tests unitaires
```

### Structure du projet

```
tracking-npm/
├── src/
│   ├── version-checker.js    # Checker côté client
│   ├── index.php              # API serveur
│   └── dashboard/             # Interface web
├── examples/
│   └── integration.js         # Exemples d'intégration
├── tests/
└── README.md
```

---

## 📚 Documentation complète

- 🌐 [Site officiel](https://synapx.fr/sdk/version-checker/)
- 📖 [Documentation technique](https://docs.synapx.fr/tracking-npm)
- 🧪 [Démo interactive](https://version.synapx.fr/test.html)
- 💬 [Discord](https://discord.gg/synapxlab)

---

## ❓ FAQ

<details>
<summary><strong>Ça ralentit les sites ?</strong></summary>

Non. Exécution en idle time, après 10s, seulement 10% des visiteurs. Impact : ~0ms.
</details>

<details>
<summary><strong>C'est compatible avec tous les frameworks ?</strong></summary>

Oui. Vanilla JS, React, Vue, Angular, Svelte, Next.js, Nuxt, etc.
</details>

<details>
<summary><strong>Les utilisateurs peuvent désactiver ?</strong></summary>

Oui, via configuration ou bloqueurs de requêtes (mais c'est rare car la requête est discrète).
</details>

<details>
<summary><strong>Ça coûte combien ?</strong></summary>

Open source et gratuit. Self-hosted ou service gratuit jusqu'à 100K checks/mois.
</details>

<details>
<summary><strong>C'est légal / RGPD ?</strong></summary>

Oui. Pas de données personnelles, juste le domaine (information publique). Conforme RGPD.
</details>

---

## 🤝 Contribuer

Les contributions sont les bienvenues ! Voici comment participer :

1. Fork le projet
2. Créez votre branche (`git checkout -b feature/AmazingFeature`)
3. Commit vos changements (`git commit -m 'Add some AmazingFeature'`)
4. Push vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrez une Pull Request

Consultez [CONTRIBUTING.md](CONTRIBUTING.md) pour plus de détails.

---

## 📝 Licence

**MIT** – Utilisez, modifiez, redistribuez librement.

```
MIT License

Copyright (c) 2025 SynapxLab

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## 🌟 Remerciements

- Merci à tous les contributeurs qui ont participé au projet
- Inspiré par le besoin de transparence dans l'écosystème NPM
- Construit avec ❤️ pour la communauté open-source

---

## 📧 Support & Contact

- 📧 Email: [support@synapx.fr](mailto:support@synapx.fr)
- 💬 Discord: [discord.gg/synapxlab](https://discord.gg/synapxlab)
- 🐛 Issues: [GitHub Issues](https://github.com/synapxLab/tracking_npm/issues)
- 🌐 Site web: [synapx.fr](https://synapx.fr)

---

<div align="center">

**Créé avec ❤️ par [SynapxLab](https://synapx.fr)**

Si ce projet vous aide, donnez-lui une ⭐ !

[⭐ Star sur GitHub](https://github.com/synapxLab/tracking_npm) | [🐦 Suivez-nous sur Twitter](https://twitter.com/synapxlab) | [💼 LinkedIn](https://linkedin.com/company/synapxlab)

</div>

---

## 📊 Stats du projet

![GitHub stars](https://img.shields.io/github/stars/synapxLab/tracking_npm?style=social)
![GitHub forks](https://img.shields.io/github/forks/synapxLab/tracking_npm?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/synapxLab/tracking_npm?style=social)

![GitHub issues](https://img.shields.io/github/issues/synapxLab/tracking_npm)
![GitHub pull requests](https://img.shields.io/github/issues-pr/synapxLab/tracking_npm)
![GitHub last commit](https://img.shields.io/github/last-commit/synapxLab/tracking_npm)
![GitHub contributors](https://img.shields.io/github/contributors/synapxLab/tracking_npm)