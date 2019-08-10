#!/bin/sh

if [ "x$1" = 'x' ]; then
	echo 'Path needed.'
	exit 1
fi

pre_title="$(capitalize "$(basename "$(dirname "$1")" |sed 's/\-es//; s/data/Main/')")"
title="$(capitalize "$(basename "$1" |sed 's/\.md$//; s/-/ /g')")"

mkdir -p "$(dirname "$1")"

echo "---
pre-title: $pre_title
title: $title
url: /$(echo "$1" |sed 's/\.md//; s/data-es/es/; s/data\///')
date: $(get-date)
lang: es
description: Awesome description
show-toc: true
toc-title: Table of contents
includes-code: true
---

Remember to create the thumbnail!
" >"$1"

echo "$1"
