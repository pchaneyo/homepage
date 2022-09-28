#!/bin/bash
rsync -av _site/ ../pchaneyo.github.io/
cd ../pchaneyo.github.io/
MESSAGE="$*"
git add --all
git commit -m "$*"
git push
