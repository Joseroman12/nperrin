#!/bin/sh

./scripts/build.sh && ./scripts/lint.sh

cp -r public/* master/public/

cd master && git add -A && git commit -m 'new site build' && git push origin master

