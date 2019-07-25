#!/bin/sh

dir_path="$1"

if [ "x$dir_path" = 'x' ]; then
	printf '\nListing directory required\n'
	exit 1
fi

printf '%s\npre-title: Index\ntitle: %s\nurl:\ndate: %s\ndescription:\n---\n\n' '---' "$(basename "$dir_path")" "$(date '+%Y-%m-%d')" > index.md

get_file_item () {
	file_title="$(basename "$1" |sed 's@\.md@@')"
	file_url="$(echo "$1" |sed 's/data//' |sed 's@\.md@@')"
	file_date="$(grep '^date:' < "$1" |sed 's/date\: //')"
	printf '\t\t<li>[%s - %s](%s)</li>\n' "$file_date" "$file_title" "$file_url"
}

printf '<nav id=\"file\">\n\t<ul>\n' >> index.md
find "$dir_path" ! -name 'index.md' ! -name '404.md' -type f -depth 1 |while read -r filename; do get_file_item "$filename" >> .temp-index.md; done
# <!--- would like to make this on a pipe, or at least in memory... not sure how --->
sort -r .temp-index.md >> index.md
rm .temp-index.md
printf '\t</ul>\n</nav>\n' >> index.md

get_dir_item () {
	dir_title="$(basename "$1")"
	dir_url="$(echo "$1" |sed 's/data//')"
	printf '\t\t<li>[%s](%s)</li>\n' "$dir_title" "$dir_url"
}

printf '<nav id=\"dir\">\n\t<ul>\n' >> index.md
find "$dir_path" -type d -depth 1 |while read -r dirname; do get_dir_item "$dirname" >> index.md; done
printf '\t</ul>\n</nav>\n' >> index.md

