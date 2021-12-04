#!/bin/sh

repodir="${1}"

git status --porcelain | grep '^[A|M]' | cut -c 4- | grep -e '.*\.js$' | while read f
do
    filename="${f}"
    npx eslint "$filename"
    if [ $? -ne 0 ]; then
        exit 1
    fi
done
