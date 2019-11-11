#!/bin/bash

VERSION=$1

if [ -z "$VERSION" ]; then
  echo ''
  echo 'Please run with VERSION parameter. '
  echo ''
  echo 'Ex) $ npm run release 1.0.0'
  echo ''
  exit 2
fi

git checkout --detach

npm run build

git add ./dist
git commit -m v$VERSION

git tag v$VERSION
git push --tags

git checkout master