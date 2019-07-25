#!/bin/sh

find data -type d -exec ./scripts/build_index.sh {} \; -exec mv index.md {} \;
