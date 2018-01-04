#!/usr/bin/env bash
source read1.sh

yn () {
    local REPLY
    printf "$1 "
    read1 REPLY
    echo

    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
        return 0
    elif [[ "$REPLY" =~ ^[Nn]$ ]]; then
        return 1
    else
        return 2
    fi
} >&2

if (
    [[ -n $ZSH_EVAL_CONTEXT && $ZSH_EVAL_CONTEXT =~ :file$ ]] \
    || [[ -n $KSH_VERSION && $(cd "$(dirname -- "$0")" \
        && printf '%s' "${PWD%/}/")$(basename -- "$0") != "${.sh.file}" ]] \
    || [[ -n $BASH_VERSION && $0 != "$BASH_SOURCE" ]] \
); then
    : noop
else
    exit `yn "$@"`
fi
