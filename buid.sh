#!/bin/sh
# this ugly, very ugly

files_append_content='
    </ul>

    <h2>Directories</h2>
    <ul>
'
final_append_content='
    </ul>
</body>

</html>
'

# --- pre build ---
rm -fr ./public/ && mkdir public && cp -R ./static/* ./public

#  --- markdown to html ---
build_from_path () {
    path="$(echo "$1" |sed 's/data/public/;s/\.md/\.html/')"
    mkdir -p "$(dirname "$path")"
    ./markdown-to-html.js < "$1" > "$path"
}
find data/* -name '*.md' |while read -r file; do build_from_path "$file"; done

# --- create html files for directories ---
create_html_file_list () {
    item_date="$(echo "$1" |sed -E 's/(\-)?[a-z].*//')"
    item_name="$item_date - $(echo "$1" |sed -E 's/([0-9]*\-)*//' )"
    echo "        <li>
            <a href=\"./$1\">${item_name# - }</a>
        </li>"
}
create_html_dir_list () {
    echo "        <li>
            <a href=\"./$1\">$1</a>
        </li>"
}
create_html_from_directory () {
    html_list="$(ls -rp "$1" |grep -v / |grep -v 404 |while read -r file; do create_html_file_list "$file"; done)"
    dir_list="$(ls -rp "$1" |grep / |while read -r dir; do create_html_dir_list "$dir"; done)"
    cp directory.html "$1/index.html"
    append_content="$html_list$files_append_content$dir_list$final_append_content"
    echo "$append_content" >> "$1/index.html"
}
find public -type d |while read -r node; do create_html_from_directory "$node"; done
