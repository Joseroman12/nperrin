#!/bin/sh

path="$1"
text="$2"

out_path="$(dirname "$path" |sed 's@data@static\/img@')/$(echo "$text" |sed 's/ /-/g').png"

convert -background '#222222' -font Verdana -pointsize 80 -fill '#F3F3F3' label:"$text" -gravity southeast -splice 120x120 -gravity northwest -splice 120x120 "$out_path"

