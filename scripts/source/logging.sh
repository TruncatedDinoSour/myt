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
