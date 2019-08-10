#!/bin/sh

out_path="$(echo "$1" |sed 's@data@static/img@; s@\/index\.md@@; s@\.md@@')/thumbnail.png"
text="$2"

convert -background '#222222' -font Georgia -pointsize 80 -fill '#F3F3F3' label:"$text" -gravity southeast -splice 500x300 -gravity northwest -splice 500x300 "$out_path"
