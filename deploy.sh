#!/bin/bash
jekyll build
rsync -av -e 'ssh -p 1022' _site/ pchaneyo@cyk-bretagne.synology.me:www/
rsync -av _site/ ../pchaneyo.github.io/
cd ../pchaneyo.github.io/
MESSAGE="$*"
git add --all
git commit -m "$*"
git push
