#!/usr/bin/env bash
  
set -eu

rm -rf checkouts
mkdir checkouts/

for D in modules/*; do
  if [ -d "${D}" ]; then
    echo "Installing and linking module from ${D}"
    (cd "${D}" || exit; \
     lein install)
    ln -s "${D}" checkouts/
  fi
done
