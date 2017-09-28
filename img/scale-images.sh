#!/usr/bin/env bash

img_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
orig_img_dir="$img_dir/orig"

vertical_line_width=80
vertical_line_height=300

horizontal_line_width=400
horizontal_line_height=100

convert_xcf_image_to_target_size() {
    local xcffile="$1"
    local vertical_horizontal="$2"
    local width="$3"
    local height="$4"
    local gravity="$( [ -z "$5" ] && echo Center || echo "$5")"
    local outfile="$img_dir/$(echo "$xcffile" | sed -e 's@.*/\(.*\)@\1@' -e 's/.xcf/.png/')"
    local resize=
    if [ "v" = "$vertical_horizontal" ]; then
        resize="-resize x$height"
    elif [ "h" = "$vertical_horizontal" ]; then
        resize="-resize ${width}x"
    else
        resize="-resize $vertical_horizontal"
    fi

    echo "converting $xcffile"

    tmpfile="$(mktemp).png"
    convert -define png:exclude-chunks=date -gravity "$gravity" "$xcffile"[1] $resize  -size "100%x100%" canvas:none -composite "$tmpfile"
    pngcrush "$tmpfile" "$outfile" 2> /dev/null > /dev/null
}

# convert vertical line images
for vertical_line_xcf in "$orig_img_dir"/line-vertical-??.xcf; do
    convert_xcf_image_to_target_size "$vertical_line_xcf" v \
        "$vertical_line_width" "$vertical_line_height"
done

# convert horizonal line limages
for horizontal_line_xcf in "$orig_img_dir"/line-horizontal-??.xcf; do
    convert_xcf_image_to_target_size "$horizontal_line_xcf" h \
        "$horizontal_line_width" "$horizontal_line_height"
done

for xcf in "$orig_img_dir"/{icon,cover}-*.xcf ; do
    convert_xcf_image_to_target_size "$xcf" h \
        100 100
done

for xcf in "$orig_img_dir"/bandmember-*.xcf ; do
    convert_xcf_image_to_target_size "$xcf" v \
        100 100
done


convert_xcf_image_to_target_size "$orig_img_dir"/box-drawn.xcf h 160 160

for xcf in "$orig_img_dir"/song-*.xcf; do
    convert_xcf_image_to_target_size "$xcf" h \
        430 300
done

for xcf in "$orig_img_dir"/style-*.xcf; do
    convert_xcf_image_to_target_size "$xcf" h \
        300 300
done


for xcf in "$orig_img_dir"/logo-*.xcf; do
    convert_xcf_image_to_target_size "$xcf" h \
        350 200
done

convert_xcf_image_to_target_size "$orig_img_dir/header.xcf" h 1000 360 North
convert_xcf_image_to_target_size "$orig_img_dir/nav.xcf" h 1000 360 North
convert "$img_dir/nav.png" -define png:exclude-chunks=date -crop 550x360+450+0 "$img_dir/nav2.png"
convert_xcf_image_to_target_size "$orig_img_dir/footer.xcf" h 800 100
