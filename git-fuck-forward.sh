#!/usr/bin/env sh
set -o errexit

usage() {
    echo "usage: git fuck-forward [ORIGIN] [BRANCH]"
}

version() {
    echo "fuck-forward git plugin v0.2.1"
}

main() {
    case $1 in
        "-h"|"--help")
            usage; exit 0
            ;;
        "-v"|"--version")
            version; exit 0
            ;;
    esac

    local ORIGIN=$1
    local BRANCH=$2

    if [ -z "$1" ]; then
        ORIGIN="origin"
    fi

    if [ -z "$2" ]; then
        BRANCH="master"
    fi

    git merge $ORIGIN/$BRANCH && \
    git push $ORIGIN $BRANCH --force
    echo "And not a single fuck was given..."
}

main "$@"
