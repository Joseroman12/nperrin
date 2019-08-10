#!/bin/sh
# <!-- Warning: looking at this code could  -->

# <!-- pre build -->
rm -fr public && cp -R static public

# <!-- build files -->
printf 'Mapping markdown to html:\n\n'
build_from_path () {
	path="$(echo "$1" |sed 's@data\-es@public/es@; s/data/public/; s/\.md/\.html/')"
	echo "$path"
	mkdir -p "$(dirname "$path")"

	# <!-- md to html -->
	is_es="$(echo "$path" |grep '^public\/es')"
	lang_actual_url="$(echo "$path" |sed 's/public//')"
	if [ -z "$is_es" ]; then
		pandoc -s --toc --template nperrin.html5 -f markdown -t html -o "$path" "$1"
		lang_alt_url="$(grep -w "$lang_actual_url" i18n_dir |sed -E 's/^.* (.*)$/\1/')"
		if [ -z "$lang_alt_url" ]; then
			sed -i.bak 's/i18n:lang_alt_url/#/; s/i18n:lang_alt_text/Castellano/; s/i18n:last_update/Last update/' "$path"
		else
			sanitized="$(echo "$lang_alt_url" |sed 's@\/@\\/@g')"
			sed -i.bak 's/i18n:lang_alt_url/'"$sanitized"'/; s/i18n:lang_alt_text/Castellano/; s/i18n:last_update/Last update/' "$path"
		fi
	else
		pandoc -M lang=es -s --toc --template nperrin.html5 -f markdown -t html -o "$path" "$1"
		lang_alt_url="$(grep -w "$lang_actual_url" i18n_dir |sed -E 's/^(.*) .*$/\1/')"
		if [ -z "$lang_alt_url" ]; then
			sed -i.bak 's/i18n:lang_alt_url/#/; s/i18n:lang_alt_text/English/; s/i18n:last_update/Última actualización/' "$path"
		else
			sanitized="$(echo "$lang_alt_url" |sed 's@\/@\\/@g')"
			sed -i.bak 's/i18n:lang_alt_url/'"$sanitized"'/; s/i18n:lang_alt_text/English/; s/i18n:last_update/Última actualización/' "$path"
		fi
	fi

	# <!-- add url to navigation -->
	if [ -z "$is_es" ]; then
		nav_url="$(echo "$path" |sed 's/public//' |sed 's@^\/@<a href="/">nperrin</a>@' |sed -E 's@<\/a>(.*)\/(.*)\.html$@<\/a><span> → <\/span><a href=\"\/\1\">\1<\/a><span> → <\/span><span>\2<\/span>@')"
		is_root="$(echo "$nav_url" |grep -v -E '\.html$')"
		if [ -z "$is_root" ]; then
			nav_url="<a href=\"\/\">nperrin<\/a><span> → <\/span><span>$(echo "$path" |sed -E 's@.*\/(.*)\.html$@\1@')<\/span>"
		fi
	else
		nav_url="$(echo "$path" |sed 's/public//; s/^\/es//' |sed 's@^\/@<a href="/es">nperrin</a>@' |sed -E 's@<\/a>(.*)\/(.*)\.html$@<\/a><span> → <\/span><a href=\"\/es\/\1\">\1<\/a><span> → <\/span><span>\2<\/span>@')"
		is_root="$(echo "$nav_url" |grep -v -E '\.html$')"
		if [ -z "$is_root" ]; then
			nav_url="<a href=\"\/es\">nperrin<\/a><span> → <\/span><span>$(echo "$path" |sed -E 's@.*\/(.*)\.html$@\1@')<\/span>"
		fi
	fi

	sed -i.bak -E 's@.*id=\"hierarchy\".*@		<nav id=\"hierarchy\" role=\"navigation\">'"$nav_url"'<\/nav>@' "$path"
	find public -name '*.bak' -exec rm {} \;
}

# <!-- en -->
printf 'en...\n'
find data/* -type f |while read -r file; do build_from_path "$file"; done

# <!-- es -->
printf '\nes...\n'
find data-es/* -type f |while read -r file; do build_from_path "$file"; done
