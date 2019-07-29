#!/bin/sh

if [ "x$1" = 'x' ]; then
	echo 'error: path needed.'
	exit 1
fi

title="$(capitalize "$(basename "$1" |sed 's/\.md$//')")"
base_path="$(dirname "$1")"

mkdir -p "data/$base_path"

echo "---
pre-title: $(capitalize "$(basename "$(dirname "$1")" |sed 's/data/Main/')")
title: $title
url: /$(echo "$1" |sed 's/\.md//')
date: $(date '+%Y/%m/%d')
lang: es
description: Awesome description
show-toc: true
toc-title: Table of contents
includes-code: true
---

" >"data/$1"

vi "data/$1"
