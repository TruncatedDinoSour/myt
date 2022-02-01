#!/usr/bin/env sh

[ "$DEBUG" ] && set -x
set -e

main() {
    command -v man-to-md >/dev/null || (echo 'Please install man-to-md: https://github.com/mle86/man-to-md or https://ari-web.xyz/gentooatom/app-misc/man-to-md' && exit 1)

    man-to-md <"${PREFIX}doc/myt.1" >"${PREFIX}doc/myt.1.md"

    git add -A
    git commit -sa
    git push -u origin "$(git branch --show-current)"
}

main "$@"
