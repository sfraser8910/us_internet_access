#!/bin/bash
echo "Rendering site..."
quarto render

echo "Cleaning up intermediate files..."
rm -f *.rmarkdown *.knit.md

echo "Publishing to GitHub Pages..."
quarto publish gh-pages

echo "Done! Intermediate files cleaned up."

