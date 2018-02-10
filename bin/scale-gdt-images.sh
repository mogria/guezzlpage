#!/usr/bin/env bash

source_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
drop_dir="$source_dir/img/posts/gdt-next"
mkdir -p "$drop_dir"

if [ "$#" -lt 1 ]; then
    echo "pass some images to convert" 
    echo "  eg: $0 img/posts/gdt-1/DSC_*";
fi

set -b
set -u

width_big=1000
width_small=500

rotate_image() {
    convert $rotate "$img" -resize ${width_big}x "$outfile_big" 
    feh "$outfile_big"
    rotate_degrees=0
    read -p "rotate by? (default: 0, 0=abort, x=drop_image) : " rotate_degrees
    rotate="-rotate $rotate_degrees>"
    if [ "$rotate_degrees" = "x" ]; then
        drop=1 # go on to the next image
    fi
} 


markdown_links="$(mktemp)"
baseurl="{{ site.baseurl }}/"
img_title="{{ site.title | sample }}"

x=1
for img in "$@"; do
    exiv2 rm "$img"
    outfile_big="$(realpath --relative-to=. "$(dirname "$img")/gsl-$x.jpg")"
    outfile_small="$(realpath --relative-to=. "$(dirname "$img")/gsl-$x-small.jpg")"

    rotate=
    rotate_degrees=
    drop=0
    rotate_image
    while [ "$rotate_degrees" -ne 0 ] && [ "$drop" -eq 0 ]; do
        rotate_image
    done

    if [ "$drop" -eq 1 ]; then
        echo "moving image into drop ... ";
        mv -v "$img" "$drop_dir"
        rm "$outfile_big"
    else
        convert -resize "${width_small}x" "$outfile_big" "$outfile_small"  

        echo "[![$img_title]($baseurl$outfile_small)]($baseurl$outfile_big){:.gdt-img}" >> "$markdown_links"

        x=$((x + 1))
    fi
done

echo "Here you have some markdown links, boyyy: "
echo ""
cat "$markdown_links"
echo ""
rm "$markdown_links"
