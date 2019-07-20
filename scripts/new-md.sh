#!/bin/sh

if [ "x$1" = 'x' ]; then
	echo 'error: path needed.'
	exit 1
fi

title="$(basename "$1" |sed 's/\.md$//')"
base_path="$(dirname "$1")"

mkdir -p "public/$base_path"

echo "---
title: 'Norman Perrin | $title'
url: '/$1'
date: $(date '+%Y-%m-%d')
lang: es
description: 'Awesome description'
show-toc: true
toc-title: 'Table of contents'
includes-code: true
thumbnail-url: '/img/doggy.jpeg'
---

" >"data/$1"