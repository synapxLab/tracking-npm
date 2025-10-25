# ✅ Checklist de Publication - @synapxlab/tracking-npm

## 📋 Avant de commencer

- [ ] Compte NPM créé et vérifié
- [ ] Accès au scope `@synapxlab` sur NPM
- [ ] Repository GitHub créé : `synapxLab/tracking-npm`
- [ ] Accès SSH configuré pour GitHub
- [ ] Node.js 16+ installé localement

## 🔧 Préparation du projet

- [ ] Cloner ou extraire les fichiers du package
- [ ] Vérifier que tous les fichiers sont présents
- [ ] Lire le README-FINAL.md

## 🚀 Étapes de publication

### 1. Setup Git & GitHub

```bash
cd tracking-npm
git init
git add .
git commit -m "feat: initial release v1.0.0"
git remote add origin git@github.com:synapxLab/tracking-npm.git
git branch -M main
git push -u origin main
```

- [ ] Repository initialisé
- [ ] Premier commit créé
- [ ] Remote GitHub ajouté
- [ ] Push vers GitHub réussi

### 2. Installation des dépendances

```bash
npm install
```

- [ ] `node_modules/` créé
- [ ] Aucune erreur de dépendances
- [ ] `package-lock.json` généré

### 3. Build du projet

```bash
npm run build
```

- [ ] Dossier `dist/` créé
- [ ] Fichiers générés :
  - [ ] `dist/index.js` (CommonJS)
  - [ ] `dist/index.esm.js` (ESM)
  - [ ] `dist/index.min.js` (UMD)
  - [ ] `dist/index.d.ts` (Types)
  - [ ] Source maps (*.map)

### 4. Tests locaux

```bash
# Tester le package
npm pack --dry-run

# Vérifier la taille
ls -lh dist/
```

- [ ] Preview du package OK
- [ ] Taille < 10KB
- [ ] Aucune erreur

### 5. Configuration NPM

```bash
# Se connecter à NPM
npm login

# Vérifier l'identité
npm whoami
```

- [ ] Connecté à NPM
- [ ] Username vérifié
- [ ] Email vérifié

### 6. Publication sur NPM

**Option A - Script automatique**
```bash
./publish.sh
```

**Option B - Manuel**
```bash
npm publish --access public
```

- [ ] Publication réussie
- [ ] Package visible sur npmjs.com
- [ ] Version 1.0.0 publiée

### 7. Vérification post-publication

```bash
# Installer depuis NPM
npm install @synapxlab/tracking-npm

# Tester l'import
node -e "const t = require('@synapxlab/tracking-npm'); console.log(t)"
```

- [ ] Installation depuis NPM fonctionne
- [ ] Import CommonJS fonctionne
- [ ] Import ESM fonctionne (si testé)

### 8. Documentation

- [ ] README visible sur npmjs.com
- [ ] Liens fonctionnels
- [ ] Badges affichés
- [ ] Exemples clairs

### 9. GitHub

- [ ] Tag v1.0.0 créé
- [ ] Release créée (optionnel)
- [ ] README visible
- [ ] Topics ajoutés (tracking, npm, analytics)

### 10. GitHub Actions (optionnel)

- [ ] Secret `NPM_TOKEN` ajouté
- [ ] Workflow CI/CD fonctionne
- [ ] Build automatique OK

## 🎯 Post-lancement

### Immédiat
- [ ] Tester l'installation : `npm install @synapxlab/tracking-npm`
- [ ] Vérifier la page NPM
- [ ] Vérifier la page GitHub
- [ ] Tester avec l'exemple HTML

### Documentation
- [ ] Mettre à jour https://synapx.fr/sdk/Tracking_NPM/
- [ ] Ajouter des exemples de code
- [ ] Documenter l'obtention de la clé

### Communication
- [ ] Annoncer sur vos canaux
- [ ] Informer les développeurs
- [ ] Partager sur les réseaux (optionnel)

### Monitoring
- [ ] Vérifier les stats NPM
- [ ] Surveiller les issues GitHub
- [ ] Vérifier les pings sur npm.synapx.fr

## 🔍 Vérifications finales

### Package NPM
- [ ] https://www.npmjs.com/package/@synapxlab/tracking-npm accessible
- [ ] Metadata correctes
- [ ] Downloads comptabilisés
- [ ] README affiché

### GitHub Repository
- [ ] https://github.com/synapxLab/tracking-npm accessible
- [ ] Code source visible
- [ ] Documentation complète
- [ ] Issues activées

### Endpoint serveur
- [ ] https://npm.synapx.fr répond
- [ ] CORS configuré
- [ ] Base de données connectée
- [ ] Logs serveur fonctionnels

### Tests d'intégration
- [ ] Test React
- [ ] Test Vue
- [ ] Test Vanilla JS
- [ ] Test navigateurs (Chrome, Firefox, Safari)

## 📊 Métriques de succès

Après 1 semaine :
- [ ] X downloads sur NPM
- [ ] X pings reçus sur le serveur
- [ ] 0 issues critiques
- [ ] Feedback positif

Après 1 mois :
- [ ] Package stable
- [ ] Documentation complète
- [ ] Communauté engagée
- [ ] Roadmap v1.1

## 🆘 En cas de problème

### Build échoue
```bash
rm -rf node_modules package-lock.json
npm install
npm run build
```

### Publication échoue
- Vérifier : `npm whoami`
- Vérifier les droits sur le scope
- Vérifier la connexion réseau
- Essayer : `npm logout && npm login`

### Package ne s'installe pas
- Attendre 5-10 minutes (propagation CDN)
- Vérifier le nom : `@synapxlab/tracking-npm`
- Essayer : `npm cache clean --force`

### Types TypeScript manquants
- Vérifier : `dist/index.d.ts` existe
- Vérifier : `package.json` → `"types": "dist/index.d.ts"`
- Rebuild : `npm run build`

## 📞 Support

- **Email** : contact@synapx.fr
- **GitHub Issues** : https://github.com/synapxLab/tracking-npm/issues
- **Documentation** : https://synapx.fr/sdk/Tracking_NPM/

---

## 🎉 Félicitations !

Une fois toutes les cases cochées, votre package est :
- ✅ Publié sur NPM
- ✅ Disponible mondialement
- ✅ Prêt à être utilisé
- ✅ Documenté
- ✅ Maintenu

**Bravo pour cette publication ! 🚀**
