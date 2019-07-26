#!/bin/sh

output_rss='static/feed/index.xml'

list_dates () {
	date="$(grep '^date:' "$1"|sed -E 's/date: (.*)/\1/')"
	printf "%s %s\n" "$date" "$1"
}

find data -type f ! -name '404.md' ! -name 'index.md' |while read -r path; do list_dates "$path" >> .temp-rss; done
feed_list="$(sort -r .temp-rss |head -n 10)"
rm .temp-rss

printf '<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\"?>\n<rss version=\"2.0\" xmlns:atom=\"http://www.w3.org/2005/Atom\">\n\t<channel>\n\t\t<title>Norman Perrin</title>\n\t\t<link>https://nperrin.io</link>\n\t\t<docs>http://backend.userland.com/rss</docs>\n\t\t<description>Recent content from Norman Perrin</description>\n\t\t<language>en</language>\n\t\t<image>\n\t\t\t<url>https://nperrin.io/img/me.jpeg</url>\n\t\t\t<title>Norman Perrin</title>\n\t\t\t<link>https://nperrin.io</link>\n\t\t\t<width>140</width>\n\t\t\t<height>140</height>\n\t\t</image>\n\t\t<lastBuildDate>Thu, 25 Jul 2019 21:05:29 -0300</lastBuildDate>\n\t\t<atom:link href=\"https://nperrin.io/feed/index.xml\" rel=\"self\" type=\"application/rss+xml\"/>\n' > "$output_rss"

map_date () {
	timestamp="$(date -j -f '%Y/%m/%d %H:%M:%S' '+%s' "$1 00:00:00")"
	date -r "$timestamp" '+%a, %d %b %Y %H:%M:%S %z'
}

get_category () {
	capitalize "$(basename "$(dirname "$1")" |sed 's/data/Main/')"
}

rss_item () {
	path="$(echo "$1" |sed -E 's/.* (.*)/\1/')"
	compliant_date="$(map_date "$(grep '^date:' "$path" |sed -E 's/^date: (.*)/\1/')")"

	title="$(printf '\t\t\t<title>%s</title>' "$(grep '^title:' "$path" |sed -E 's/title: (.*)/\1/')")"
	link="$(printf '\t\t\t<link>https://nperrin.io%s</link>' "$(grep '^url:' "$path" |sed -E 's/url: (.*)/\1/')")"
	description="$(printf '\t\t\t<description>%s</description>' "$(grep '^description:' "$path" |sed -E 's/description: (.*)$/\1/')")"
	pubDate="$(printf '\t\t\t<pubDate>%s</pubDate>' "$compliant_date")"
	guid="$(printf '\t\t\t<guid>https://nperrin.io%s</guid>' "$(grep '^url:' "$path" |sed -E 's/url: (.*)/\1/')")"
	category="$(printf '\t\t\t<category>%s</category>' "$(get_category "$path")")"
	source="$(printf '\t\t\t<source url=\"https://nperrin.io/feed/index.xml\">nperrin</source>')"

	printf '\t\t<item>\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n\t\t</item>\n' "$title" "$link" "$description" "$category" "$pubDate" "$guid" "$source" >> "$output_rss"
}

printf '%s' "$feed_list" |while read -r line; do rss_item "$line"; done

printf '\t</channel>\n</rss>\n' >> "$output_rss"
