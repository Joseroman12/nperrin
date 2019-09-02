#!/bin/sh

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
		pandoc -M url="$lang_actual_url" -s --toc --template nperrin.html5 -f markdown -t html -o "$path" "$1"
		lang_alt_url="$(grep -w "$lang_actual_url" i18n_dir |sed -E 's/^.* (.*)$/\1/')"
		if [ -z "$lang_alt_url" ]; then
			sed -i.bak 's/i18n@lang_alt_url@/#/g; s/i18n@lang_alt_text@/Castellano/g; s/i18n@last_update@/Last update/g; s/i18n@lang_alt_text_short@/ES/' "$path"
		else
			sanitized="$(echo "$lang_alt_url" |sed 's@\/@\\/@g')"
			sed -i.bak 's/i18n@lang_alt_url@/'"$sanitized"'/g; s/i18n@lang_alt_text@/Castellano/g; s/i18n@last_update@/Last update/g; s/i18n@lang_alt_text_short@/ES/g' "$path"
		fi
	else
		pandoc -M lang=es -M url="$lang_actual_url" -s --toc --template nperrin.html5 -f markdown -t html -o "$path" "$1"
		lang_alt_url="$(grep -w "$lang_actual_url" i18n_dir |sed -E 's/^(.*) .*$/\1/')"
		if [ -z "$lang_alt_url" ]; then
			sed -i.bak 's/i18n@lang_alt_url@/#/g; s/i18n@lang_alt_text@/English/g; s/i18n@last_update@/Última actualización/g; s/i18n@lang_alt_text_short@/EN/' "$path"
		else
			sanitized="$(echo "$lang_alt_url" |sed 's@\/@\\/@g')"
			sed -i.bak 's/i18n@lang_alt_url@/'"$sanitized"'/g; s/i18n@lang_alt_text@/English/g; s/i18n@last_update@/Última actualización/g; s/i18n@lang_alt_text_short@/EN/g' "$path"
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

# <!-- add h-card -->
echo '<footer>
	<div class="h-card p-author hcard vcard" style="display:none;">
		<img rel="me" class="u-photo" alt="Norman Perrin blurred" src="/img/me.jpeg">
		<br>
		<span>Name:</span>
		<a class="p-name u-url" rel="me" href="https://nperrin.io/">Norman Perrin</a>
		<br>
		<span>Twitter:</span>
		<a class="u-url" rel="me" href="https://twitter.com/normanperrinok">@NormanPerrinOK</a>
		<br>
		<span>Github:</span>
		<a class="u-url" rel="me" href="https://github.com/normanperrin">normanperrin</a>
		<br>
		<span>Jobs:</span>
		<span class="p-job-title">Developer, Freelancer, Consultant</span>
		<br>
		<span>PGP Key:</span>
		<a rel="pgpkey authn" href="/nperrin.asc" class="u-key">0xDD6DD4CB21147E87</a>
	</div>
</footer>' >> 'public/index.html'