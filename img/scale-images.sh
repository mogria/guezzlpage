#!/usr/bin/env bash

img_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
orig_img_dir="$img_dir/orig"

vertical_line_width=80
vertical_line_height=300

horizontal_line_width=520
horizontal_line_height=60

processes=()

convert_xcf_image_to_target_size() {
    local xcffile="$1"
    local vertical_horizontal="$2"
    local width="$3"
    local height="$4"
    local gravity="$( [ -z "$5" ] && echo Center || echo "$5")"
    local outfile="$img_dir/$(echo "$xcffile" | sed -e 's@.*/\(.*\)@\1@' -e 's/.xcf/.png/')"
    local resize="$([ "v" = "$vertical_horizontal" ] && printf "%s" "-resize x$height" || printf "%s" "-resize ${width}x")"

    echo "converting $xcffile"

    # printf "%s " \
    convert -size "${width}x${height}" canvas:none -gravity "$gravity" "$xcffile"[1] $resize -composite "$outfile"
    processes[$!]="$xcffile"
    # echo
}

# convert vertical line images
for vertical_line_xcf in "$orig_img_dir"/line-vertical-??.xcf; do
    echo -n
    # convert_xcf_image_to_target_size "$vertical_line_xcf" \
        # "$vertical_line_width" "$vertical_line_height"
done

# convert horizonal line limages
for horizontal_line_xcf in "$orig_img_dir"/line-horizontal-??.xcf; do
    echo -n
    # convert_xcf_image_to_target_size "$horizontal_line_xcf" \
        # "$horizontal_line_width" "$horizontal_line_height"
done

convert_xcf_image_to_target_size "$orig_img_dir/header.xcf" h 1000 360 North
convert_xcf_image_to_target_size "$orig_img_dir/nav.xcf" h 1000 360 North
convert "$img_dir/nav.png" -crop 550x360+450+0 "$img_dir/nav2.png"
convert_xcf_image_to_target_size "$orig_img_dir/footer.xcf" h 800 100
