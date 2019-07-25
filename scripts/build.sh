#!/bin/sh

# --- pre build ---
rm -fr public && cp -R static public

# --- build files ---
printf 'Mapping markdown to html:\n\n'
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

	sed -i.bak -E 's@.*id=\"hierarchy\".*@		<nav id=\"hierarchy\" role=\"navigation\">'"$nav_url"'<\/nav>@' "$path"
	find public -name '*.bak' -exec rm {} \;
}

find data/* -name '*.md' |while read -r file; do build_from_path "$file"; done

