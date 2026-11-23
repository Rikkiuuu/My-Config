#!/usr/bin/env bash

config_file="/tmp/waybar_cava_config"
cat > "$config_file" <<INNER_EOF
[general]
bars = 10
framerate = 60

[input]
method = pulse
source = auto

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
INNER_EOF

trap 'kill $(jobs -p) 2>/dev/null' EXIT

cava -p "$config_file" | awk '
BEGIN {
    FS = ";";
    split("▁ ▂ ▃ ▄ ▅ ▆ ▇ █", chars, " ");
    silent = 0;
}
{
    out = "";
    all_zero = 1;
    for (i = 1; i <= 10; i++) {
        val = $i + 0;
        if (val > 0) all_zero = 0;
        out = out chars[val + 1];
    }
    if (all_zero) {
        silent++;
        if (silent == 45) {
            print "";
            fflush();
        } else if (silent < 45) {
            print out;
            fflush();
        }
    } else {
        silent = 0;
        print out;
        fflush();
    }
}' &
wait
