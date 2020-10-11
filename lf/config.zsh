#!/bin/sh

# CTRL-O - Navigate and set folder to the command line
lfcd() {
    local tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

zle     -N   lfcd
bindkey '^O' lfcd