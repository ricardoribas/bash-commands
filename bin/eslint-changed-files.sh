#!/usr/bin/env bash

set -o nounset
set -o errexit
set -o pipefail

CURRENT_BRANCH=$(git branch | grep '*' | awk '{print $2}')

FIRST_BRANCH_COMMIT=$(git log --reverse --oneline | grep 'into master' | tail -1 | awk '{ print $1 }')

FILES_CHANGED=$(git diff --name-only $FIRST_BRANCH_COMMIT)

VALID_FILES=()
for FILE in $FILES_CHANGED
do
    if [ -f "$FILE" ] && [[ $FILE =~ .*\.js$ ]]; then
        VALID_FILES+=("$FILE")
    fi
done

if [ "${#VALID_FILES[@]}" -gt 0 ]; then
    npx eslint ${VALID_FILES[@]}
else 
    echo "no files to validate"
fi
