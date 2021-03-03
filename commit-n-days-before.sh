#!/bin/zsh

# Commit N days before

# At least one arg needed.
if [ $# -lt 1 ]; then
    echo "Usage: ./commit-n-days-before [N]"
    exit 1
fi

N=$1

# N must be a number.
if [ -n $N ] && [ $N -eq $N ] 2>/dev/null; then
    # OK. It is a number.
else
    echo "N must be a number."
    exit 1
fi

shift

N_DAYS_BEFORE=$(date -v -"$N"d +%Y-%m-%dT%H:%M:%S)

# Must be in a single line.
# GIT_AUTHOR_DATE=$N_DAYS_BEFORE GIT_COMMITTER_DATE=$N_DAYS_BEFORE git commit $@
echo $@