#!/bin/bash

set -o errexit

_GIT='https://github.com/larvs/dockerfiles.git'
_BRANCH='master'

_HEAD="$(git rev-parse --verify HEAD)"

git fetch -q "$_GIT" "refs/heads/$_BRANCH"
_UPSTREAM="$(git rev-parse --verify FETCH_HEAD)"

_COMMIT_DIFF="$_UPSTREAM...$_HEAD"

validate_diff() {
	if [ "$_UPSTREAM" != "$_HEAD" ]; then
		git diff "$_COMMIT_DIFF" "$@"
	else
		git diff HEAD~ "$@"
	fi
}

# dockerfiles changed

IFS=$'\n'
files=( $(validate_diff --name-only -- '*Dockerfile') )
unset IFS

# build
for f in "${files[@]}"; do
	image=${f%Dockerfile}
	base=${image%%\/*}
	suite=${image##*\/}
	path=$(dirname $f)

	if [[ -z "$suite" ]]; then
		suite=latest
	fi

	(
	set -o xtrace
	docker build -t ${base}:${suite} ${path}
	)

	echo "                       ---                                   "
	echo "Successfully built ${base}:${suite} with context ${path}"
	echo "                       ---                                   "
done
