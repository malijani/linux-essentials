#!/usr/bin/env bash

# script to auto update gh-pages branch of linux-essentials

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
git commit -m "Updated site"
# push changes
git push -u origin gh-pages
