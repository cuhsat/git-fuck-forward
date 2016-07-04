#!/usr/bin/env sh
set -o errexit

usage() {
    echo "usage: git fuck-forward <origin> <master>"
}

version() {
    echo "fuck-forward git plugin v0.1.0"
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

    local $ORIGIN
    local $MASTER

    if [ -z "$1" ]; then
        ORIGIN="origin"
    else 
        ORIGIN="$1"
    fi

    if [ -z "$2" ]; then
        MASTER="master"
    else
        MASTER="$2"
    fi

    git merge $ORIGIN/$MASTER && \
    git push $ORIGIN $MASTER --force
}

main "$@"
