#!/bin/bash
cd "$(dirname "$0")"
echo "Building site..."
mkdocs build

echo "Deploying to GitHub..."
mkdocs gh-deploy

echo "Deploying to Codeberg..."
git checkout pages
cp -r site/* .
git add .
git commit -m "deploy"
git push codeberg pages
git checkout main

echo "Done. Sites should be live at:"
echo "  https://continuitydrift.github.io/recycling-notes/"
echo "  https://continuitydrift.codeberg.page/recycling-notes"
