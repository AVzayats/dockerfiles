#!/usr/bin/env bash

_FORTUNE_ARGS="$1"
_COWSAY_ARGS="$2"

# default
[ -z "$_FORTUNE_ARGS" ] && _FORTUNE_ARGS='ru/fomenko ru/armenian'
[ -z "$_COWSAY_ARGS"  ] && _COWSAY_ARGS='-f docker'

fortune $_FORTUNE_ARGS | cowsay $_COWSAY_ARGS

