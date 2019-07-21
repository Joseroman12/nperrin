#!/bin/sh

./scripts/b_files.sh && ./scripts/b_dir.sh && ./scripts/lint.sh

cp -r public/* master/public/

cd master && git add -A && git commit -m 'new site build' && git push origin master

