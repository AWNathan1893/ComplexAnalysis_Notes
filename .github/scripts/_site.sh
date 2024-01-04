#!/bin/bash

echo "Creating _site/"
mkdir _site

echo "Add time for last update: $(date +'%A, %b %d %Y, %I:%M %p')"
echo -e "\n_Last updated: $(TZ='Asia/Kolkata' date +'%A, %b %d %Y, %I:%M %p') IST_" >>".github/index.md"

echo "Compiling .github/index.md to _site/index.html"
pandoc --katex .github/index.md -s -o _site/index.html

echo "Copying sitemap"
cp .github/sitemap.xml _site/sitemap.xml

echo "Zipping pdfs to ComplexAnalysis_Notes_all_pdfs.zip"
zip -r _site/ComplexAnalysis_Notes_all_pdfs.zip pdfs/*

echo "Copying pdfs to _site/pdfs"
cp -r pdfs _site/pdfs
