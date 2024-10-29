#!usr/bin/env bash

PACKAGES=/shared/packages.json

dnf update -y

dnf install -y $(jq -r .include[] ${PACKAGES})

if [ $(jq -r .exclude[] ${PACKAGES}) ]; then
  dnf remove -y $(jq -r .exclude[] ${PACKAGES})
fi

dnf clean all
