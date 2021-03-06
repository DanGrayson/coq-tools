#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR/example_8"
PS4='$ '
set -x
python ../../find-bug.py example_8.v bug_8.v --minimize-before-inlining || exit $?
LINES="$(cat bug_8.v | wc -l)"
if [ "$LINES" -ne 11 ]
then
    echo "Expected 11 lines"
    cat bug_8.v
    exit 1
fi
exit 0
