#!/bin/sh

./scripts/build.sh && ./scripts/lint.sh

rm -fr master/public/* && cp -r public/* master/public/

cd master && git add -A && git commit -m 'new site build' && git push origin master

