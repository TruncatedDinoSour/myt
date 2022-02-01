#!/usr/bin/env sh

[ "$DEBUG" ] && set -x
set -e

. "${SSPREFIX}scripts/source/logging.sh"

ask_y() {
    printf "%s? [y/n] " "$1"
    read -r yn

    [ "$yn" != 'y' ] && exit
    return 0
}

main() {
    ask_y 'If you are about to release, did you update the __version__ variable in src/myt'
    ask_y 'Did you update the dependencies in requirements.txt and/or requirements.dev.txt'
    ask_y 'Did you update the README.md if needed'
    ask_y 'Did you update the man page in doc/myt.1'
    ask_y 'Did you update SECURITY.md'

    log 'Running tests'
    sh "${SSPREFIX}scripts/test.sh"

    log 'Generating documentation'
    sh "${SSPREFIX}scripts/doc.sh"

    log 'Commiting changes and pushing'
    git add -A
    git commit -sa
    git push -u origin "$(git branch --show-current)"
}

main "$@"
