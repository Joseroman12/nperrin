#!/bin/sh

add_file_item () {
	file_name="$(echo "$1" |sed 's/md$/html/')"
	file_url="$(echo $2/$file_name |sed 's@\/\/@\/@')"
	date="$(grep '^date:' < "data$2/$1" |sed 's/date\: //')"
	echo "- [$date - $file_name]($file_url)"
}

create_listing_file () {
	file_path="$1/index.md"
	files_url="/$(echo "$1" |sed -E 's/data\/?//')"

	echo "---
pre-title: dir
title: $files_url
url: https://nperrin.io$files_url
description: 'Listing of files and directories for $files_url'
---

## Files
" > "$file_path"

	temp_file_name=".temp-$(echo "$1" |sed 's/\//-/')"
	touch "$temp_file_name"
	ls -p "$1" |grep -v \/ |grep -v index\.md |while read -r file_name; do add_file_item "$file_name" "$files_url" >> "$temp_file_name"; done
	sort -r "$temp_file_name" >> "$file_path"
	rm "$temp_file_name"

	echo '
## Directories
' >> "$file_path"

	ls -rp "$1" |grep \/ |while read -r dir_name; do echo "- [$dir_name](/$dir_name)" >> "$file_path"; done
}

find data -type d |while read -r dir_path; do create_listing_file "$dir_path"; done
