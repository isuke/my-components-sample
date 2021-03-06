GEEEN="\e[0;32m"
RED="\e[0;31m"
RESET="\e[0m"
VERSION=$1

# Check version format
if [[ $VERSION =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] ; then
  printf "${GEEEN}Deploy version v$VERSION\n${RESET}"
else
  printf "${RED}VERSION format is 'x.x.x'. ($VERSION)\n${RESET}"
  exit 1
fi

# Check existing tag
git tag | grep v$VERSION > /dev/null
if [ $? -eq 0 ]; then
  printf "${RED}git tag 'v$VERSION' is existing\n${RESET}"
  exit 1
fi

printf "${GEEEN}Rewite src/index.js\n${RESET}"
gsed -r -i "s/VERSION = '[0-9]+\.[0-9]+\.[0-9]+'/VERSION = '$VERSION'/g" src/index.js
git add src/index.js

printf "${GEEEN}Rewite package.json\n${RESET}"
gsed -r -i "s/\"version\": \"[0-9]+\.[0-9]+\.[0-9]+\"/\"version\": \"$VERSION\"/g" package.json
git add package.json

printf "${GEEEN}Build\n${RESET}"
yarn run build
git add dist

printf "${GEEEN}git commit\n${RESET}"
git commit -m "Upgrade to v$VERSION"
git tag v$VERSION

printf "${GEEEN}Please command 'git push origin master && git push origin v$VERSION && yarn publish'\n${RESET}"
