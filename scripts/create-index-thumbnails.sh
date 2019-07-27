#!/bin/sh

create_thumbnail () {
	title="$(grep -E '^title:' "$1" |sed -E 's/title: (.*)/\1/')"
	out_path="$(dirname "$1" |sed 's/data/static\/img/')/$title.png"

	convert -background '#222222' -font Verdana -pointsize 80 -fill '#F3F3F3' label:"$title - nperrin" -gravity southeast -splice 120x120 -gravity northwest -splice 120x120 "$out_path"
}

find data -name 'index.md' |while read -r url; do create_thumbnail "$url"; done

