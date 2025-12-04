#!/usr/bin/env bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
CYAN=$(tput setaf 6)
BOLD=$(tput bold)
RESET=$(tput sgr0)
TERM_WIDTH=$(tput cols)

echo -e "${BOLD}${CYAN}Checking out master branch...${RESET}"
git checkout master

if [[ -n $(git status --porcelain) ]]; then
    echo -e "${BOLD}${RED}Uncommitted changes detected on master. Aborting...${RESET}"
    exit 1
fi

if [ ! -d ".venv" ]; then
    echo -e "${BOLD}${RED}Virtual environment '.venv' not found. Aborting...${RESET}"
    exit 1
fi

if [ -z "$VIRTUAL_ENV" ]; then
    echo -e "${BOLD}${CYAN}Activating virtual environment...${RESET}"
    source ./.venv/bin/activate
    if [ $? -ne 0 ]; then
        echo -e "${BOLD}${RED}Failed to activate virtual environment. Aborting...${RESET}"
        exit 1
    fi
else
    echo -e "${BOLD}${GREEN}Virtual environment already active: ${VIRTUAL_ENV}${RESET}"
fi

echo -e "${BOLD}${CYAN}Cleaning old site directory...${RESET}"
rm -rf site/

echo -e "${BOLD}${CYAN}Building site with MkDocs...${RESET}"
mkdocs build --verbose

echo -e "${BOLD}${CYAN}Packaging site into site.zip...${RESET}"
zip -r site.zip site/

echo -e "${BOLD}${CYAN}Checking out gh-pages branch...${RESET}"
git checkout gh-pages

BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [[ "$BRANCH" != "gh-pages" ]]; then
  echo -e "${BOLD}${RED}Not on gh-pages branch. Aborting...${RESET}"
  exit 1
fi

shopt -s extglob
echo -e "${BOLD}${CYAN}Cleaning old files in gh-pages branch...${RESET}"
rm -rv !(".gitignore"|"CNAME"|".git"|".nojekyll"|".venv"|"updater.sh"|"site")
shopt -u extglob

echo -e "${BOLD}${CYAN}Copying site.zip from master branch...${RESET}"
git checkout master -- site.zip

echo -e "${BOLD}${CYAN}Extracting site.zip...${RESET}"
unzip site.zip

if [ ! -e "site" ]; then
    echo -e "${BOLD}${RED}Site directory doesn't exist. Aborting...${RESET}"
    exit 1
fi

echo -e "${BOLD}${CYAN}Moving site contents to root...${RESET}"
mv site/* .

echo -e "${BOLD}${CYAN}Cleaning up temporary files...${RESET}"
rm -rfv site/ site.zip

echo -e "${BOLD}${CYAN}Adding changes to git...${RESET}"
git add .

COMMIT=$(git rev-parse --short HEAD)
PREV_COMMIT=$(git rev-parse --short HEAD~1)

REPO_URL=$(git config --get remote.origin.url \
  | sed -e 's/git@github.com:/https:\/\/github.com\//' \
        -e 's/\.git$//')

COMMIT_URL="${REPO_URL}/commit/${COMMIT}"
COMPARE_URL="${REPO_URL}/compare/${PREV_COMMIT}...${COMMIT}"

echo -e "${BOLD}${CYAN}Committing changes...${RESET}"
git commit -m "deploy: ${COMMIT}"

echo -e "${BOLD}${CYAN}Pushing to gh-pages branch...${RESET}"
git push -u origin gh-pages

echo -e "${BOLD}${CYAN}Switching back to master branch...${RESET}"
git checkout master

rm -rf site/ site.zip

# Full-width deployment banner
draw_line() {
    printf "${BOLD}${GREEN}╔"; for ((i=2;i<TERM_WIDTH;i++)); do printf "═"; done; printf "╗${RESET}\n"
}

draw_middle() {
    local left="$1"
    local right="$2"
    local padding=$((TERM_WIDTH - ${#left} - ${#right} - 4))
    printf "${BOLD}${GREEN}║${RESET} ${BOLD}%s${RESET}%*s ${BOLD}${GREEN}║${RESET}\n" "$left" "$padding" "$right"
}

draw_line
draw_middle "Deployment Status" ""
draw_line
draw_middle "View changes:" "${COMMIT_URL}"
draw_middle "Compare previous:" "${COMPARE_URL}"

printf "${BOLD}${GREEN}╚"; for ((i=2;i<TERM_WIDTH;i++)); do printf "═"; done; printf "╝${RESET}\n"
