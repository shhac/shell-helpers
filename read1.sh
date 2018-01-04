#!/usr/bin/env bash

if [ -n "$ZSH_VERSION" ]; then
   read1 () {
       read -k 1 "$@"
   }
elif [ -n "$BASH_VERSION" ]; then
   read1 () {
       read -n 1 "$@"
   }
else
   read1 () {
       read -n 1 "$@"
   }
fi

if (
    [[ -n $ZSH_EVAL_CONTEXT && $ZSH_EVAL_CONTEXT =~ :file$ ]] \
    || [[ -n $KSH_VERSION && $(cd "$(dirname -- "$0")" \
        && printf '%s' "${PWD%/}/")$(basename -- "$0") != "${.sh.file}" ]] \
    || [[ -n $BASH_VERSION && $0 != "$BASH_SOURCE" ]] \
); then
    : noop
else
    read1 "$@"
    exit $?
fi
