#!/bin/sh

# --- pre build ---
rm -fr public && cp -R static public

build_from_path () {
	path="$(echo "$1" |sed 's/data/public/;s/\.md/\.html/')"
	echo "$path"
	mkdir -p "$(dirname "$path")"
	pandoc -s --toc --template nperrin.html5 -f markdown -t html -o "$path" "$1"
}

find data/* -name '*.md' |while read -r file; do build_from_path "$file"; done

