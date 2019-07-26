#!/bin/sh

printf '\nLinting...\n'

find public -name '*.html' -exec prettier --use-tabs --write {} \;
