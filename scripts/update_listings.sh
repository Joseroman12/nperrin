#!/bin/sh

process_path () {
	index_directory="$(dirname "$1")"
	sed -i.bak '/<.*>/d' "$1"
	find data -name '*.bak' -exec rm {} \;
	find data-es -name '*.bak' -exec rm {} \;
	./scripts/list_index.sh "$index_directory" >> "$1"
}

# en
find data -name 'index.md' |while read -r file_path; do process_path "$file_path"; done

# es
find data-es -name 'index.md' |while read -r file_path; do process_path "$file_path"; done
