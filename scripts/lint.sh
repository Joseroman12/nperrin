#!/bin/sh

find public/ -name '*.html' -exec prettier --use-tabs --write {} \;
