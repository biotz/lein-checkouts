#!/usr/bin/env bash

set -eu -o pipefail

CHECKOUTS_SOURCES='modules/'

rm -rf checkouts
mkdir checkouts

find "${CHECKOUTS_SOURCES}" -type f -name "project.clj" -print0 |
    while IFS= read -r -d '' MODULE_DIR; do
        MODULE_DIR=$(dirname "${MODULE_DIR}")
        echo "Installing and linking module from ${MODULE_DIR}"
        pushd "${MODULE_DIR}" > /dev/null
        lein install
        popd > /dev/null
        ln -s "${MODULE_DIR}" checkouts/
    done
