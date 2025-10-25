#!/bin/bash

# 🚀 Script de publication pour @synapxlab/tracking-npm

set -e

echo "🛰️ @synapxlab/tracking-npm - Script de publication"
echo "=================================================="

# Couleurs
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Vérifier qu'on est sur la branche main
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "main" ]; then
    echo -e "${RED}❌ Erreur: Vous devez être sur la branche 'main' pour publier${NC}"
    exit 1
fi

# Vérifier qu'il n'y a pas de changements non commités
if [ -n "$(git status --porcelain)" ]; then
    echo -e "${RED}❌ Erreur: Il y a des changements non commités${NC}"
    git status --short
    exit 1
fi

# Type de version (patch par défaut)
VERSION_TYPE=${1:-patch}

echo -e "${YELLOW}📦 Installation des dépendances...${NC}"
npm install

echo -e "${YELLOW}🔨 Build du projet...${NC}"
npm run build

if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Erreur lors du build${NC}"
    exit 1
fi

echo -e "${YELLOW}📋 Aperçu des fichiers à publier:${NC}"
npm pack --dry-run

echo -e "${YELLOW}🔢 Incrémentation de la version ($VERSION_TYPE)...${NC}"
NEW_VERSION=$(npm version $VERSION_TYPE --no-git-tag-version)

echo -e "${GREEN}✅ Nouvelle version: $NEW_VERSION${NC}"

# Commit et tag
git add package.json
git commit -m "chore: release $NEW_VERSION"
git tag -a "$NEW_VERSION" -m "Release $NEW_VERSION"

echo -e "${YELLOW}📤 Publication sur NPM...${NC}"
npm publish --access public

if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Erreur lors de la publication NPM${NC}"
    exit 1
fi

echo -e "${YELLOW}🔄 Push vers GitHub...${NC}"
git push origin main
git push origin --tags

echo ""
echo -e "${GREEN}✅ Publication réussie!${NC}"
echo -e "${GREEN}📦 Package: @synapxlab/tracking-npm@$NEW_VERSION${NC}"
echo -e "${GREEN}🔗 NPM: https://www.npmjs.com/package/@synapxlab/tracking-npm${NC}"
echo ""
