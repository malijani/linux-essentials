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
rm -rv !(".gitignore"|"CNAME"|".git"|".nojekyll"|".venv"|"updater.sh"|"site")
shopt -u extglob

# copy site.zip from master branch
#git checkout master -- site.zip
## >> UPDATE : the site.zip add to gitignore! so it's in both branches by default.

# unzip build of site
#unzip site.zip
## >> UPDATE : no need to create zip file anymore

# move files from site directory
if [ -e "site" ]; then
    # move files from site directory into root of gh-pages
    mv site/* .
fi

# remove unneeded files
#rm -rfv site/ site.zip
## >> UPDATE : no need to delete the file that ignored by .gitignore

# add files to git
git add .

# commit site update
COMMIT=$(git rev-parse --short HEAD)
git commit -m "Deployed ${COMMIT} with updater"

# push changes
git push -u origin gh-pages
