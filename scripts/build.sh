#!/bin/sh

# --- pre build ---
rm -fr public && cp -R static public

## -- build directories --
printf '\nCreating listing directories:\n\n'

add_file_item () {
	file_name="$(echo "$1" |sed 's/\.md$//')"
	file_url="$(echo "$2/$file_name\.html" |sed 's@\/\/@\/@')"
	date="$(grep '^date:' < "data$2/$1" |sed 's/date\: //')"
	echo "- [$date - $file_name]($file_url)"
}

create_listing_file () {
	file_path="$1/index.md"
	files_url="/$(echo "$1" |sed -E 's/data\/?//')"
	title="$(echo "$files_url" |sed -E 's@^\/@@')"
	
	if [ "x$title" = 'x' ]; then
		title=nperrin
	fi

	echo "---
pre-title: dir
title: $title
url: $files_url
description: 'Listing of files and directories for $files_url'
---

## Files
" > "$file_path"

	temp_file_name=".temp-$(echo "$1" |sed 's/\//-/')"
	touch "$temp_file_name"
	ls -p "$1" |grep -v \/ |grep -v index\.md |grep -v 404\.md |while read -r file_name; do add_file_item "$file_name" "$files_url" >> "$temp_file_name"; done
	sort -r "$temp_file_name" >> "$file_path"
	rm "$temp_file_name"

	echo '
## Directories
' >> "$file_path"

ls -rp "$1" |grep \/ |while read -r dir_name; do echo "- [$(echo "$dir_name" |sed 's@\/$@@')](/$(echo "$dir_name" |sed 's@\/$@@'))" >> "$file_path"; done

	printf '%s\n' "$file_path"
}

find data -type d |while read -r dir_path; do create_listing_file "$dir_path"; done

# --- build files ---
printf '\nConverting markdown to html files:\n\n'
build_from_path () {
	path="$(echo "$1" |sed 's/data/public/;s/\.md/\.html/')"
	echo "$path"
	mkdir -p "$(dirname "$path")"

	# md to html
	pandoc -s --toc --template nperrin.html5 -f markdown -t html -o "$path" "$1"

	# add url to navigation
	nav_url="$(echo "$path" |sed 's/public//' |sed 's@^\/@<a href="/">nperrin</a>@' |sed -E 's@<\/a>(.*)\/(.*)\.html$@<\/a><span> → <\/span><a href=\"\/\1\">\1<\/a><span> → <\/span><span>\2<\/span>@')"

	# I give up
	is_root="$(echo "$nav_url" |grep -v -E '\.html$')"
	if [ -z "$is_root" ]; then
		nav_url="<a href=\"\/\">nperrin<\/a><span> → <\/span><span>$(echo "$path" |sed -E 's@.*\/(.*)\.html$@\1@')<\/span>"
	fi
	
	sed -i -E 's@.*id=\"hierarchy\".*@		<nav id=\"hierarchy\" role=\"navigation\">'"$nav_url"'<\/nav>@' "$path"

}

find data/* -name '*.md' |while read -r file; do build_from_path "$file"; done

