#!/usr/bin/env sh

[ "$DEBUG" ] && set -x
set -e

. "${SSPREFIX}scripts/source/logging.sh"

main() {
    command -v man-to-md >/dev/null || (echo 'Please install man-to-md: https://github.com/mle86/man-to-md or https://ari-web.xyz/gentooatom/app-misc/man-to-md' && exit 1)
    python3 -m pydoc -h >/dev/null || (echo 'Install pydoc: https://docs.python.org/3/library/pydoc.html' && exit 2)

    mkdir -p doc/

    log 'Generating pydoc documentation'
    python3 -m pydoc -w "${SPREFIX}src/myt"
    mv myt.html doc/

    log 'Generating markdown from man page'
    man-to-md <"${DPREFIX}doc/myt.1" >"${DPREFIX}doc/myt.1.md"
}

main "$@"
