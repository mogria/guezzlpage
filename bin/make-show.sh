#!/usr/bin/env bash

set -e

d="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$d"

if [ "$#" -lt 2 ]; then
    echo "Usage: make-show.sh show-title show-date"
    exit 1
fi

date="$(date --rfc-3339=seconds)"
date_prefix="$(echo "$date" | cut -d' ' -f1)"
title="$1"
title_slug="$(echo "$title" | iconv -t ascii//TRANSLIT | sed -E 's/[^a-zA-Z0-9]+/-/g'  | sed -E 's/^-+\|-+$//g' | tr A-Z a-z)"
show_date="$2"

filename="$d/_posts/$date_prefix-$title_slug.md"

if [ ! -f "$filename" ]; then
    cat > "$filename" <<NEW_POST
---
author: mogria
layout: post
title:  $title
date:   $date
categories: uftritt
show_date: $show_date
---

NEW_POST
else
    echo "WARN: already exists"
fi

"$EDITOR" "$filename"
echo "$filename"
