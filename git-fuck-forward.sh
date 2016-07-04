#!/usr/bin/env sh
set -o errexit
set -o nounset

usage() {
    echo "usage: git fuck-forward <origin> <master>"
    echo
}

version() {
    echo "fuck-forward git plugin v0.1.0"
    echo
}

main() {
    if [ "$#" -lt 1 ]; then
        usage; exit 1
    fi

    local origin="$1"

    if [ -z "$1" ]; then
        $origin = "origin"
    fi

    local master="$2"

    if [ -z "$2" ]; then
        $master = "master"
    fi

    case $1 in
        "-h"|"--help")
            usage; exit 0
            ;;
        "-v"|"--version")
            version; exit 0
            ;;
    esac

    git merge $origin/$master && \
    git push $origin $master --force
}

main "$@"
