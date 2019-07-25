#!/bin/sh

# don't know why... but there is some error on the pandoc build, so this script exists

find public -name 'index.html' -exec sed -i.bak 's@<p><\/nav><\/p>@<\/nav>@' {} \;
find public -name '*.bak' -exec rm {} \;

