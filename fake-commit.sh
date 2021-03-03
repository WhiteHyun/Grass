#!/bin/zsh

# echo hello world > b.txt
if [ $# -lt 1 ]; then
    echo "Usage: ./fake-commit [N]"
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

for day in {$N..1..1}
do
    N_DAYS_BEFORE=$(date -v -"$day"d +%Y-%m-%dT%H:%M:%S)
    echo $N_DAYS_BEFORE # For test
    
    if [ `expr $day % 2` -eq 1 ]; then
        echo hsh > fake-commit.txt
        git add fake-commit.txt
    else
        echo sej > fake-commit.txt
        git add fake-commit.txt
    fi

    # Must be in a single line.
    GIT_AUTHOR_DATE=$N_DAYS_BEFORE GIT_COMMITTER_DATE=$N_DAYS_BEFORE git commit $@

done

git push