#!/bin/bash

FLIST=./flist.f
TMP=$(mktemp)

find ../Full_pipeline -name "*.v" | sort > "$TMP"

{
    echo "# Auto RTL list"
    cat "$TMP"
    echo "../tb/tb.v"
} > "$FLIST"

rm -f "$TMP"

echo "Generated $FLIST:"
cat "$FLIST"




