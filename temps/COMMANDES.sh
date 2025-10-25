#!/bin/bash

# 🚀 Guide de publication - Commandes à copier-coller
# ====================================================
# 
# Ce fichier contient toutes les commandes à exécuter
# dans l'ordre pour publier @synapxlab/tracking-npm
#
# ⚠️ Ne pas exécuter ce fichier directement !
# Copiez-collez les commandes une par une dans votre terminal.

echo "📦 Publication de @synapxlab/tracking-npm"
echo "=========================================="
echo ""

# ============================================================================
# ÉTAPE 1 : Extraire et naviguer vers le projet
# ============================================================================

echo "1️⃣ ÉTAPE 1 : Extraire et naviguer"
echo "-----------------------------------"
cat << 'CMD1'
# Télécharger l'archive depuis Claude
# Puis extraire :
tar -xzf tracking-npm-ready.tar.gz
cd tracking-npm

# Ou si vous avez le dossier directement :
cd tracking-npm
CMD1

# ============================================================================
# ÉTAPE 2 : Initialiser Git
# ============================================================================

echo ""
echo "2️⃣ ÉTAPE 2 : Initialiser Git"
echo "----------------------------"
cat << 'CMD2'
# Initialiser le repository Git
git init

# Ajouter tous les fichiers
git add .

# Premier commit
git commit -m "feat: initial release v1.0.0 - tracking-npm package"

# Ajouter le remote GitHub
git remote add origin git@github.com:synapxLab/tracking-npm.git

# Renommer la branche en main
git branch -M main

# Pousser vers GitHub
git push -u origin main
CMD2

# ============================================================================
# ÉTAPE 3 : Installer les dépendances
# ============================================================================

echo ""
echo "3️⃣ ÉTAPE 3 : Installer les dépendances"
echo "--------------------------------------"
cat << 'CMD3'
# Installer toutes les dépendances NPM
npm install

# Vérifier que tout est OK
ls -la node_modules/
CMD3

# ============================================================================
# ÉTAPE 4 : Builder le projet
# ============================================================================

echo ""
echo "4️⃣ ÉTAPE 4 : Builder le projet"
echo "------------------------------"
cat << 'CMD4'
# Compiler le projet TypeScript vers JavaScript
npm run build

# Vérifier les fichiers générés
ls -lah dist/

# Devrait afficher :
# - index.js (CommonJS)
# - index.esm.js (ES Modules)
# - index.min.js (UMD minifié)
# - index.d.ts (Types TypeScript)
# - *.map (Source maps)
CMD4

# ============================================================================
# ÉTAPE 5 : Tester le package localement
# ============================================================================

echo ""
echo "5️⃣ ÉTAPE 5 : Tests locaux (optionnel)"
echo "-------------------------------------"
cat << 'CMD5'
# Voir ce qui sera publié
npm pack --dry-run

# Créer un tarball local pour tester
npm pack

# Tester le package
node -e "const t = require('./dist/index.js'); console.log(t);"

# Devrait afficher :
# { trackingnpm: { init: [Function: init], abort: [Function: abort] } }
CMD5

# ============================================================================
# ÉTAPE 6 : Se connecter à NPM
# ============================================================================

echo ""
echo "6️⃣ ÉTAPE 6 : Se connecter à NPM"
echo "-------------------------------"
cat << 'CMD6'
# Se connecter à NPM (si pas déjà connecté)
npm login

# Entrer vos identifiants NPM :
# - Username
# - Password
# - Email
# - One-Time Password (si 2FA activé)

# Vérifier la connexion
npm whoami

# Devrait afficher votre username NPM
CMD6

# ============================================================================
# ÉTAPE 7 : Publier sur NPM
# ============================================================================

echo ""
echo "7️⃣ ÉTAPE 7 : Publier sur NPM"
echo "----------------------------"
cat << 'CMD7'
# OPTION A : Avec le script automatique (RECOMMANDÉ)
# --------------------------------------------------
./publish.sh

# Ce script fait automatiquement :
# - npm install
# - npm run build
# - npm version patch
# - npm publish --access public
# - git push origin main
# - git push --tags


# OPTION B : Manuellement
# ------------------------
# Si le script ne fonctionne pas, faire manuellement :

# 1. Vérifier la version actuelle
cat package.json | grep version

# 2. Publier
npm publish --access public

# 3. Créer un tag Git
git tag v1.0.0
git push origin v1.0.0

# La publication prend quelques minutes à se propager sur NPM
CMD7

# ============================================================================
# ÉTAPE 8 : Vérifications post-publication
# ============================================================================

echo ""
echo "8️⃣ ÉTAPE 8 : Vérifications"
echo "-------------------------"
cat << 'CMD8'
# Attendre 2-3 minutes pour la propagation, puis :

# 1. Vérifier sur NPM
open https://www.npmjs.com/package/@synapxlab/tracking-npm
# ou
curl https://registry.npmjs.org/@synapxlab/tracking-npm

# 2. Tester l'installation depuis NPM
cd /tmp
mkdir test-tracking-npm
cd test-tracking-npm
npm init -y
npm install @synapxlab/tracking-npm

# 3. Tester l'import
node -e "const { trackingnpm } = require('@synapxlab/tracking-npm'); console.log('✅ Package fonctionne !', trackingnpm);"

# 4. Vérifier GitHub
open https://github.com/synapxLab/tracking-npm

# 5. Vérifier les tags
git tag -l
CMD8

# ============================================================================
# ÉTAPE 9 : Configurer GitHub Actions (optionnel)
# ============================================================================

echo ""
echo "9️⃣ ÉTAPE 9 : Configurer GitHub Actions (optionnel)"
echo "--------------------------------------------------"
cat << 'CMD9'
# Pour activer la publication automatique via GitHub Actions :

# 1. Aller sur https://www.npmjs.com/settings/YOUR-USERNAME/tokens
# 2. Créer un nouveau token "Automation" avec permissions de publication
# 3. Copier le token

# 4. Aller sur https://github.com/synapxLab/tracking-npm/settings/secrets/actions
# 5. Cliquer "New repository secret"
# 6. Nom : NPM_TOKEN
# 7. Value : coller votre token NPM
# 8. Cliquer "Add secret"

# Maintenant, à chaque push sur main, GitHub Actions va :
# - Builder le projet
# - Vérifier que tout compile
# - Publier automatiquement si la version a changé

# Pour tester :
# - Modifier package.json version (1.0.0 → 1.0.1)
# - git add package.json
# - git commit -m "chore: bump version to 1.0.1"
# - git push origin main
# - Regarder l'onglet "Actions" sur GitHub
CMD9

# ============================================================================
# ÉTAPE 10 : Mettre à jour la documentation
# ============================================================================

echo ""
echo "🔟 ÉTAPE 10 : Mettre à jour la doc (recommandé)"
echo "----------------------------------------------"
cat << 'CMD10'
# Mettre à jour la page : https://synapx.fr/sdk/Tracking_NPM/

# Ajouter les informations :
# - Lien vers NPM : https://www.npmjs.com/package/@synapxlab/tracking-npm
# - Commande d'installation : npm install @synapxlab/tracking-npm
# - Exemples de code
# - Guide d'obtention de la clé
# - FAQ si nécessaire
CMD10

# ============================================================================
# 🎉 FÉLICITATIONS !
# ============================================================================

echo ""
echo "🎉 FÉLICITATIONS !"
echo "=================="
cat << 'SUCCESS'
Votre package est maintenant publié et disponible sur :

📦 NPM : https://www.npmjs.com/package/@synapxlab/tracking-npm
🐙 GitHub : https://github.com/synapxLab/tracking-npm
📚 Docs : https://synapx.fr/sdk/Tracking_NPM/

Les développeurs peuvent maintenant l'installer avec :
npm install @synapxlab/tracking-npm

Et l'utiliser dans leurs projets :
import { trackingnpm } from '@synapxlab/tracking-npm';

trackingnpm.init({
  package_key: 'votre-clé-64-caractères',
  version: '1.0.0'
});

🚀 Votre package est en ligne !
SUCCESS

echo ""
echo "============================================"
echo "📋 COMMANDES RÉCAPITULATIVES"
echo "============================================"
echo ""
echo "# Setup complet (à faire une seule fois)"
cat << 'RECAP'
cd tracking-npm
git init
git add .
git commit -m "feat: initial release v1.0.0"
git remote add origin git@github.com:synapxLab/tracking-npm.git
git branch -M main
git push -u origin main
npm install
npm run build
npm login
npm publish --access public
RECAP

echo ""
echo "# Pour les versions futures"
cat << 'FUTURE'
# Modifier le code dans src/index.ts
npm run build
./publish.sh        # ou npm version patch && npm publish
FUTURE

echo ""
echo "============================================"
echo "✅ Prêt à publier !"
echo "============================================"
