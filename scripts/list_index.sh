#!/bin/sh

listing_path="$1"

if [ "x$listing_path" = 'x' ]; then
	printf 'Listing directory required\n'
	exit 1
fi

get_file_item () {
	file_title="$(basename "$1" |sed 's@\.md@@')"
	file_url="$(echo "$1" |sed 's/data//; s/\-es/\/es/; s@\.md@@')"
	file_date="$(grep '^date:' < "$1" |sed 's/date\: //')"
	printf '\t\t<li>[<span class="mobile-hide">%s - </span>%s](%s)</li>\n' "$(echo "$file_date" |sed 's/ .*//')" "$file_title" "$file_url"
}

printf '<nav id=\"file\">\n\t<ul>\n'
find "$listing_path" ! -name 'index.md' ! -name '404.md' -type f -depth 1 |while read -r filename; do get_file_item "$filename" >> .temp-index.md; done
sort -r .temp-index.md
rm .temp-index.md
printf '\t</ul>\n</nav>\n'

get_dir_item () {
	dir_title="$(basename "$1")"
	dir_url="$(echo "$1" |sed 's/data//; s/\-es/\/es/; s@\.md@@')"
	printf '\t\t<li>[%s](%s)</li>\n' "$dir_title" "$dir_url"
}

printf '<nav id=\"dir\">\n\t<ul>\n'
find "$listing_path" -type d -depth 1 |while read -r dirname; do get_dir_item "$dirname"; done
printf '\t</ul>\n</nav>\n'
