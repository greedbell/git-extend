#!/bin/bash
#Author: Bell<bell@greedlab.com>
#
# git list branch
#

if [[ $# > 1 ]]; then
  echo
  echo "Usage: ${0##*/} [BRANCH]"
  echo
  echo "Example: ${0##*/} \"feature*\""
  echo
  exit 2
fi

target=$1

branches=$(git branch --format='%(refname:short)') || exit 1
for branch in ${branches}
do
  if [[ -z $target ]] || [[ $branch == $target ]];then
    echo ${branch}
  fi
done
exit 0
