#!/usr/bin/env bash

# script to auto update gh-pages branch of linux-essentials

# check if branch is valid and script running in gh-pages
BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [[ "$BRANCH" != "gh-pages" ]]; then
  echo 'Aborting script'
  exit 1
fi

# remove all files except these:
shopt -s extglob
rm -rv !(".gitignore"|"Sybex-LinuxEssentials2ED.pdf"|"CNAME"|".git"|".nojekyll"|".venv"|"updater.sh")
shopt -u extglob
# copy site.zip from master branch
git checkout master -- site.zip
# unzip build of site
unzip site.zip
# move files from site directory
mv site/* .
# remove unneeded files
rm -rfv site/ site.zip
# add files to git
git add .
# commit site update
COMMIT=$(git rev-parse --short HEAD)
git commit -m "Deployed ${COMMIT} with updater"
# push changes
git push -u origin gh-pages
