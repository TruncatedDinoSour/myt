#!/usr/bin/env sh

[ "$DEBUG" ] && set -x
set -e

([ ! "$NO_COLOUR" ] && command -v tput >/dev/null) || tput() { printf ''; }

GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
RESET=$(tput sgr0)

log() {
    printf "${GREEN}**${RESET} %s\n" "$1"
}

warn() {
    printf "${YELLOW}**${RESET} %s\n" "$1"
}

main() {
    MAIN="${MAIN:-src/myt}"
    JOBS="${JOBS:-$(nproc --all)}"

    log 'Testing static typing'
    python3 -m mypy "$MAIN" --warn-redundant-casts --warn-unused-ignores \
        --no-warn-no-return --warn-unreachable --strict-equality \
        --ignore-missing-imports --warn-unused-configs \
        --disallow-untyped-calls --disallow-untyped-defs \
        --disallow-incomplete-defs --check-untyped-defs \
        --disallow-untyped-decorators --pretty --show-traceback \
        --no-warn-unused-ignores --follow-imports=error --namespace-packages \
        --python-version 3.9

    log 'Checking import sorting'
    python3 -m isort -c "$MAIN"

    log "Checking for unused imports ($JOBS jobs)"
    python3 -m flake8 --jobs "$JOBS" --select=F401 "$MAIN"

    log "Checking PEP8 rules ($JOBS jobs)"
    python3 -m flake8 --jobs "$JOBS" "$MAIN"

    log 'Checking code style'
    python3 -m pycodestyle --statistics -qq "$MAIN"

    log 'Checking formatting'
    python3 -m black --check "$MAIN"

    log "Checking complexity ($JOBS jobs)"
    python3 -m flake8 --jobs "$JOBS" --max-complexity 20 "$MAIN"

    log 'Checking for errors'
    pyflakes "$MAIN"

    log "Linting file ($JOBS jobs)"
    python3 -m pylint --enable-all-extensions --disable=C0301,R1260,W0717,W0149 -j "$(nproc --all)" "$MAIN"

    log 'Checking if can compile'
    python3 -c "import ast; ast.parse(open('$MAIN', 'r', encoding='utf-8').read())"

    log 'Trying to compile'
    python3 -m py_compile "$MAIN"

    log 'Checking if it runs'
    CHECK='run' "$MAIN" 'Hello, world' || warn 'Ignoring errors'

    log "$(tput bold)Congratulations, all tests passed"
}

main "$@"
