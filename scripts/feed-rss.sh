#!/bin/sh

output_rss_en='static/feed/index.xml'
output_rss_es='static/feed/es/index.xml'

list_dates () {
	date="$(grep '^date:' "$1"|sed -E 's/date: (.*)/\1/')"
	printf "%s %s\n" "$date" "$1"
}

map_date () {
	timestamp="$(date -j -f '%Y/%m/%d %H:%M:%S' '+%s' "$1")"
	date -r "$timestamp" '+%a, %d %b %Y %H:%M:%S %z'
}

rss_item () {
	path="$(echo "$1" |sed -E 's/.* (.*)/\1/')"
	compliant_date="$(map_date "$(grep '^date:' "$path" |sed -E 's/^date: (.*)/\1/')")"
	category="$(capitalize "$(basename "$(dirname "$path")" |sed 's/\-es//; s/data/Main/')")"
	if [ "$2" = 'es' ]; then
		url="$(echo "$path" |sed 's/data-es/\/es/; s/\.md/.html/')"
		feed_src='https://nperrin.io/feed/es/index.xml'
	else
		url="$(echo "$path" |sed 's/data//; s/\.md/.html/')"
		feed_src='https://nperrin.io/feed/index.xml'
	fi

	title="$(printf '\t\t\t<title>%s</title>' "$(grep '^title:' "$path" |sed -E 's/title: (.*)/\1/')")"
	link="$(printf '\t\t\t<link>https://nperrin.io%s</link>' "$url")"
	description="$(printf '\t\t\t<description>%s</description>' "$(grep '^description:' "$path" |sed -E 's/description: (.*)$/\1/')")"
	pubDate="$(printf '\t\t\t<pubDate>%s</pubDate>' "$compliant_date")"
	guid="$(printf '\t\t\t<guid>https://nperrin.io%s</guid>' "$url")"
	category="$(printf '\t\t\t<category>%s</category>' "$category")"
	source="$(printf '\t\t\t<source url=\"%s\">nperrin</source>' "$feed_src")"

	printf '\t\t<item>\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n\t\t</item>\n' "$title" "$link" "$description" "$category" "$pubDate" "$guid" "$source"
}

create_output () {
	path="$1"
	lang="$2"
	description="$3"
	if [ "$lang" = 'es' ]; then
		feed_src='https://nperrin.io/feed/es/index.xml'
	else
		feed_src='https://nperrin.io/feed/index.xml'
	fi

	mkdir -p "$(dirname "$path")"
	printf '<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\"?>\n<rss version=\"2.0\" xmlns:atom=\"http://www.w3.org/2005/Atom\">\n\t<channel>\n\t\t<title>Norman Perrin</title>\n\t\t<link>https://nperrin.io</link>\n\t\t<docs>http://backend.userland.com/rss</docs>\n\t\t<description>%s</description>\n\t\t<language>%s</language>\n\t\t<image>\n\t\t\t<url>https://nperrin.io/img/me.jpeg</url>\n\t\t\t<title>Norman Perrin</title>\n\t\t\t<link>https://nperrin.io</link>\n\t\t\t<width>140</width>\n\t\t\t<height>140</height>\n\t\t</image>\n\t\t<lastBuildDate>%s</lastBuildDate>\n\t\t<atom:link href=\"%s\" rel=\"self\" type=\"application/rss+xml\"/>\n' "$description" "$lang" "$(rss-create-pubDate)" "$feed_src" > "$path"
}

# <!-- en -->
create_output "$output_rss_en" 'en' 'Recent content from Norman Perrin'
find data -type f ! -name '404.md' ! -name 'index.md' |while read -r path; do list_dates "$path" >> .temp-rss; done
feed_list="$(sort -r .temp-rss |head -n 10)"
rm .temp-rss
printf '%s' "$feed_list" |while read -r line; do rss_item "$line" >> "$output_rss_en"; done
printf '\t</channel>\n</rss>\n' >> "$output_rss_en"

# <!-- es -->
create_output "$output_rss_es" 'es' 'Contenido reciente de Norman Perrin'
find data-es -type f ! -name '404.md' ! -name 'index.md' |while read -r path; do list_dates "$path" >> .temp-rss; done
feed_list="$(sort -r .temp-rss |head -n 10)"
rm .temp-rss
printf '%s' "$feed_list" |while read -r line; do rss_item "$line" 'es' >> "$output_rss_es"; done
printf '\t</channel>\n</rss>\n' >> "$output_rss_es"
